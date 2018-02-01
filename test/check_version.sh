#! /bin/sh

set -xe
cd `dirname $0`/..

expected_version=`awk -F: '/^FROM / {print($2)}' Dockerfile`

cd test
vagrant up
vagrant ssh -- 'sudo apt-get update && sudo apt-get install -y lsb-release'
actual_version=`vagrant ssh -- 'lsb_release --short --release'`

test "$expected_version" = "$actual_version"
echo "Test OK!"
