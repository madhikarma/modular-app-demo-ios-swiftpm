#!/bin/bash
# fail if any commands fails
set -e
# debug log
set -x

ls SourcePackages/checkouts
ls SourcePackages/repositories
ls SourcePackages/artifacts

git status
ls -l
