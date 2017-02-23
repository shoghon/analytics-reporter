const expect = require("chai").expect
const knex = require("knex")
const moment = require("moment-timezone")
const proxyquire = require("proxyquire")
const database = require("./support/database")
const resultsFixture = require("./fixtures/results")

proxyquire.noCallThru()

const config = {
  postgres: database.connection,
  timezone: "US/Eastern",
}

const writeResultsToDatabase = proxyquire("../src/write-results-to-db", {
  "./config": config,
})

const databaseClient = knex({ client: "pg", connection: database.connection })

describe(".writeResultsToDatabase(results)", () => {
  let results

  beforeEach(done => {
    results = Object.assign({}, resultsFixture)

    database.resetSchema().then(() => {
      done()
    }).catch(done)
  })

  context("when the report is not realtime", () => {
    it("should insert a record for each results.data element", done => {
      results.name = "report-name"
      results.data = [
        {
          date: "2017-02-11",
          name: "abc",
        },
        {
          date: "2017-02-12",
          name: "def",
        },
      ]

      writeResultsToDatabase(results).then(() => {
        return databaseClient.select().table("analytics_data")
      }).then(rows => {
        expect(rows).to.have.length(2)
        rows.forEach((row, index) => {
          const data = results.data[index]
          expect(row.report_name).to.equal("report-name")
          expect(row.data.name).to.equal(data.name)
          expect(row.data.date).to.be.undefined

          const date = moment.tz(data.date, config.timezone).toDate()
          expect(row.date_time.getTime()).to.equal(date.getTime())
        })
        done()
      }).catch(done)
    })

    it("should use the ga:hour dimension in the date if it is present", done => {
      results.data = [{
        date: "2017-02-15",
        hour: "12",
      }]
      const date = moment.tz("2017-02-15T12:00:00", config.timezone).toDate()

      writeResultsToDatabase(results).then(() => {
        return databaseClient.select().table("analytics_data")
      }).then(rows => {
        const row = rows[0]
        expect(row.date_time.getTime()).to.equal(date.getTime())
        done()
      }).catch(done)
    })

    it("should ignore reports that don't have a ga:date dimension", done => {
      results.query = { dimensions: "ga:something,ga:somethingElse" }

      writeResultsToDatabase(results).then(() => {
        return databaseClient.select().table("analytics_data")
      }).then(rows => {
        expect(rows).to.have.length(0)
        done()
      }).catch(done)
    })

    it("should ignore data points that have already been inserted", done => {
      firstResults = Object.assign({}, results)
      secondResults = Object.assign({}, results)

      firstResults.data = [
        {
          date: "2017-02-11",
          visits: "123",
          browser: "Chrome",
        },
        {
          date: "2017-02-11",
          visits: "456",
          browser: "Safari"
        },
      ]
      secondResults.data = [
        {
          date: "2017-02-11",
          visits: "456",
          browser: "Safari",
        },
        {
          date: "2017-02-11",
          visits: "789",
          browser: "Internet Explorer"
        },
      ]

      writeResultsToDatabase(firstResults).then(() => {
        return writeResultsToDatabase(secondResults)
      }).then(() => {
        return databaseClient.select().table("analytics_data")
      }).then(rows => {
        expect(rows).to.have.length(3)
        done()
      }).catch(done)
    })

    it("should not not insert a record if the date is invalid", done => {
      results.data = [
        {
          date: "(other)",
          visits: "123",
        },
        {
          date: "2017-02-16",
          visits: "456",
        },
      ]

      writeResultsToDatabase(results).then(() => {
        return databaseClient.select().table("analytics_data")
      }).then(rows => {
        expect(rows).to.have.length(1)
        expect(rows[0].data.visits).to.equal("456")
        done()
      }).catch(done)
    })
  })

  context("when the report is realtime", () => {
    it("should insert a record for each results.data element with the current date", done => {
      const currentDateTime = new Date()

      results.name = "report-name"
      results.data = [
        {
          "city": "Washington DC",
          "active_visitors": 123,
        },
        {
          "city": "Baton Rouge",
          "active_visitors": 456,
        }
      ]

      writeResultsToDatabase(results, { realtime: true }).then(() => {
        return databaseClient.select().table("analytics_data")
      }).then(rows => {
        expect(rows).to.have.length(2)
        rows.forEach((row, index) => {
          const data = results.data[index]
          expect(row.report_name).to.equal("report-name")
          expect(row.date_time - currentDateTime).to.be.below(1000)
          expect(row.data.city).to.equal(data.city)
          expect(row.data.active_visitors).to.equal(data.active_visitors)
        })
        done()
      }).catch(done)
    })
  })
})
