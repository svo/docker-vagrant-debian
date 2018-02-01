#! /bin/sh

set -xe
cd `dirname $0`/..

exec docker build -t docker-vagrant-debian .
