#!/bin/bash

# testing dap-1.env
source $HOME/dap-1.env
$HOME/bin/analytics --only=realtime --slim --verbose

# testing dap-2.env
source $HOME/dap-1.env
$HOME/bin/analytics --only=realtime --slim --verbose
