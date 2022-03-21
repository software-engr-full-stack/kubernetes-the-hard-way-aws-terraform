#!/usr/bin/env bash

run() {
  local this_dir="$(dirname "$(readlink -f "$BASH_SOURCE")")"
  local modules_dir="$this_dir/modules"

  local test_data_file="$this_dir/expected.yml"

  declare -a test_files=(
    # '01_networking'
    '02_firewall_rules'
  )

  local test_file=
  for test_file in "${test_files[@]}"; do
    printf "$test_file: "
    python "$modules_dir/$test_file.py" "$test_data_file" && ok
  done
}

ok() {
  echo 'ok'
}

set -o errexit
set -o pipefail
set -o nounset
run