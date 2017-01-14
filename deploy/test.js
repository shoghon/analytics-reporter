const exec = require("child_process").exec;

var test_run = function(){
  console.log("about to run test.sh");
  exec("./deploy/test.sh", (error,stdout,stderr) => {
    if (error){
      console.error(`exec error: ${error}`);
      return;
    }
    console.log(`${stdout}`);
    console.log(`stderr: ${stderr}`);
  });
}

console.log("starting test.js");
test_run();

// set to run daily, needs something to keep the app alive
setInterval(test_run, 1000 * 60 * 60 * 24);
