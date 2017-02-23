#!/bin/bash

# JSON and CSV versions
source $HOME/dap-1.env
$HOME/bin/analytics --publish --frequency=daily --slim --verbose --write-to-database
$HOME/bin/analytics --publish --frequency=daily --slim --verbose --csv

# Department of Education
source $HOME/dap-1.env
source $HOME/deploy/envs/education.env
$HOME/bin/analytics --publish --frequency=daily --slim --verbose --write-to-database --agency=$AGENCY_NAME
$HOME/bin/analytics --publish --frequency=daily --slim --verbose --csv

# Department of Veterans Affairs
source $HOME/dap-1.env
source $HOME/deploy/envs/veterans-affairs.env
$HOME/bin/analytics --publish --frequency=daily --slim --verbose --write-to-database --agency=$AGENCY_NAME
$HOME/bin/analytics --publish --frequency=daily --slim --verbose --csv

# National Aeronautics and Space Administration
source $HOME/dap-1.env
source $HOME/deploy/envs/national-aeronautics-space-administration.env
$HOME/bin/analytics --publish --frequency=daily --slim --verbose --write-to-database --agency=$AGENCY_NAME
$HOME/bin/analytics --publish --frequency=daily --slim --verbose --csv

# Department of Justice
source $HOME/dap-1.env
source $HOME/deploy/envs/justice.env
$HOME/bin/analytics --publish --frequency=daily --slim --verbose --write-to-database --agency=$AGENCY_NAME
$HOME/bin/analytics --publish --frequency=daily --slim --verbose --csv

# Department of Commerce
source $HOME/dap-1.env
source $HOME/deploy/envs/commerce.env
$HOME/bin/analytics --publish --frequency=daily --slim --verbose --write-to-database --agency=$AGENCY_NAME
$HOME/bin/analytics --publish --frequency=daily --slim --verbose --csv

# Environmental Protection Agency
source $HOME/dap-1.env
source $HOME/deploy/envs/environmental-protection-agency.env
$HOME/bin/analytics --publish --frequency=daily --slim --verbose --write-to-database --agency=$AGENCY_NAME
$HOME/bin/analytics --publish --frequency=daily --slim --verbose --csv

# Small Business Administration
source $HOME/dap-1.env
source $HOME/deploy/envs/small-business-administration.env
$HOME/bin/analytics --publish --frequency=daily --slim --verbose --write-to-database --agency=$AGENCY_NAME
$HOME/bin/analytics --publish --frequency=daily --slim --verbose --csv

# Department of Energy
source $HOME/dap-1.env
source $HOME/deploy/envs/energy.env
$HOME/bin/analytics --publish --frequency=daily --slim --verbose --write-to-database --agency=$AGENCY_NAME
$HOME/bin/analytics --publish --frequency=daily --slim --verbose --csv

# Department of the Interior
source $HOME/dap-1.env
source $HOME/deploy/envs/interior.env
$HOME/bin/analytics --publish --frequency=daily --slim --verbose --write-to-database --agency=$AGENCY_NAME
$HOME/bin/analytics --publish --frequency=daily --slim --verbose --csv

# National Archives and Records Administration
source $HOME/dap-1.env
source $HOME/deploy/envs/national-archives-records-administration.env
$HOME/bin/analytics --publish --frequency=daily --slim --verbose --write-to-database --agency=$AGENCY_NAME
$HOME/bin/analytics --publish --frequency=daily --slim --verbose --csv

# Department of Agriculture
source $HOME/dap-1.env
source $HOME/deploy/envs/agriculture.env
$HOME/bin/analytics --publish --frequency=daily --slim --verbose --write-to-database --agency=$AGENCY_NAME
$HOME/bin/analytics --publish --frequency=daily --slim --verbose --csv

# Department of Defense
source $HOME/dap-1.env
source $HOME/deploy/envs/defense.env
$HOME/bin/analytics --publish --frequency=daily --slim --verbose --write-to-database --agency=$AGENCY_NAME
$HOME/bin/analytics --publish --frequency=daily --slim --verbose --csv

# Department of Health and Human Services
source $HOME/dap-2.env
source $HOME/deploy/envs/health-human-services.env
$HOME/bin/analytics --publish --frequency=daily --slim --verbose --write-to-database --agency=$AGENCY_NAME
$HOME/bin/analytics --publish --frequency=daily --slim --verbose --csv

# Department of Housing and Urban Development
source $HOME/dap-2.env
source $HOME/deploy/envs/housing-urban-development.env
$HOME/bin/analytics --publish --frequency=daily --slim --verbose --write-to-database --agency=$AGENCY_NAME
$HOME/bin/analytics --publish --frequency=daily --slim --verbose --csv

# Department of Homeland Security
source $HOME/dap-2.env
source $HOME/deploy/envs/homeland-security.env
$HOME/bin/analytics --publish --frequency=daily --slim --verbose --write-to-database --agency=$AGENCY_NAME
$HOME/bin/analytics --publish --frequency=daily --slim --verbose --csv

# Department of Labor
source $HOME/dap-2.env
source $HOME/deploy/envs/labor.env
$HOME/bin/analytics --publish --frequency=daily --slim --verbose --write-to-database --agency=$AGENCY_NAME
$HOME/bin/analytics --publish --frequency=daily --slim --verbose --csv

# Department of State
source $HOME/dap-2.env
source $HOME/deploy/envs/state.env
$HOME/bin/analytics --publish --frequency=daily --slim --verbose --write-to-database --agency=$AGENCY_NAME
$HOME/bin/analytics --publish --frequency=daily --slim --verbose --csv

# Department of Transportation
source $HOME/dap-2.env
source $HOME/deploy/envs/transportation.env
$HOME/bin/analytics --publish --frequency=daily --slim --verbose --write-to-database --agency=$AGENCY_NAME
$HOME/bin/analytics --publish --frequency=daily --slim --verbose --csv

# Department of the Treasury
source $HOME/dap-2.env
source $HOME/deploy/envs/treasury.env
$HOME/bin/analytics --publish --frequency=daily --slim --verbose --write-to-database --agency=$AGENCY_NAME
$HOME/bin/analytics --publish --frequency=daily --slim --verbose --csv

# Agency for International Development
source $HOME/dap-2.env
source $HOME/deploy/envs/agency-international-development.env
$HOME/bin/analytics --publish --frequency=daily --slim --verbose --write-to-database --agency=$AGENCY_NAME
$HOME/bin/analytics --publish --frequency=daily --slim --verbose --csv

# General Services Administration
source $HOME/dap-2.env
source $HOME/deploy/envs/general-services-administration.env
$HOME/bin/analytics --publish --frequency=daily --slim --verbose --write-to-database --agency=$AGENCY_NAME
$HOME/bin/analytics --publish --frequency=daily --slim --verbose --csv

# National Science Foundation
source $HOME/dap-2.env
source $HOME/deploy/envs/national-science-foundation.env
$HOME/bin/analytics --publish --frequency=daily --slim --verbose --write-to-database --agency=$AGENCY_NAME
$HOME/bin/analytics --publish --frequency=daily --slim --verbose --csv

# Nuclear Regulatory Commission
source $HOME/dap-2.env
source $HOME/deploy/envs/nuclear-regulatory-commission.env
$HOME/bin/analytics --publish --frequency=daily --slim --verbose --write-to-database --agency=$AGENCY_NAME
$HOME/bin/analytics --publish --frequency=daily --slim --verbose --csv

# Office of Personnel Management
source $HOME/dap-2.env
source $HOME/deploy/envs/office-personnel-management.env
$HOME/bin/analytics --publish --frequency=daily --slim --verbose --write-to-database --agency=$AGENCY_NAME
$HOME/bin/analytics --publish --frequency=daily --slim --verbose --csv

# Social Security Administration
source $HOME/dap-2.env
source $HOME/deploy/envs/social-security-administration.env
$HOME/bin/analytics --publish --frequency=daily --slim --verbose --write-to-database --agency=$AGENCY_NAME
$HOME/bin/analytics --publish --frequency=daily --slim --verbose --csv

# Postal Service
source $HOME/dap-2.env
source $HOME/deploy/envs/postal-service.env
$HOME/bin/analytics --publish --frequency=daily --slim --verbose --write-to-database --agency=$AGENCY_NAME
$HOME/bin/analytics --publish --frequency=daily --slim --verbose --csv

# Executive Office of the President
source $HOME/dap-2.env
source $HOME/deploy/envs/executive-office-president.env
$HOME/bin/analytics --publish --frequency=daily --slim --verbose --write-to-database --agency=$AGENCY_NAME
$HOME/bin/analytics --publish --frequency=daily --slim --verbose --csv
