#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o xtrace

SCRIPT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" > /dev/null 2>&1 && pwd)"
#shellcheck source=utils.sh
source "${SCRIPT_ROOT}/utils.sh"

ensureSet "${RUBY_VERSION}" "RUBY_VERSION" || exit 1

command curl -sSL https://rvm.io/mpapis.asc | gpg2 --import -
command curl -sSL https://rvm.io/pkuczynski.asc | gpg2 --import -
command curl -sSL https://get.rvm.io | bash -s stable
source /usr/local/rvm/scripts/rvm

rvm install $RUBY_VERSION
rvm use $RUBY_VERSION --default

gem install bundler
