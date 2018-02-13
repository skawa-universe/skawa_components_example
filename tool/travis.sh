#!/bin/bash

# Fast fail the script on failures.
set -ev

dartfmt lib/ --line-length=120 --set-exit-if-changed -n

