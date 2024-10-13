#!/usr/bin/env bash
# exit on error
set -o errexit

bundle install
bundle exec puma -t 5:5 -p ${PORT:-3000} -e ${RACK_ENV:-production}
