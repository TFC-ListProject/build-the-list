#!/bin/bash

set -euo pipefail

R="\x1B[1;31m"
G="\x1B[1;32m"
W="\x1B[0m"

function output {
  echo -e "${G}${1}${W}"
}

function error {
  echo -e "${R}${1}${W}"
}

function go_extract_pdf {
  output "extracting PDF"
  PDF=unset
  OUTPUT_FLAG=false

  while getopts ":f:o" opt; do
     case $opt in
       f)
         PDF=$OPTARG
         ;;
       o)
         OUTPUT_FLAG=true
         ;;
     esac
  done

  if [ "$OUTPUT_FLAG" = true ] ; then
      python build_the_list/pdf_extract.py -f "$PDF" -o
  else
      python build_the_list/pdf_extract.py -f "$PDF"
  fi
}

function go_help {
  output "Usage: ./go <command> [sub-command]"
  output ""
  output "Available commands are:"
  output "    extract_pdf Extract text from PDF"
  output "      -f        Path to file"
  output "      -o        Output PDF as indexed list"
  output "    help        Describes usage"
  output "    install     Installs required software"
  output "    migrate     Runs database migration"
  output "      -e        Environment [development (default)|production]"
  output "      -d        Drops database in environment"
  output "      -n        Create new migration with given string"
  output "    test        Runs automated tests"
  output "      -w        Run tests continuously"
  output "    update      Updates Python dependencies"
}

function go_install {
  output "running install"
  ./bin/install
}

function go_migrate {
  ENVIRONMENT=development
  DROP_DB=false
  NEW_MIGRATION_TITLE=false

  while getopts ":e:dn:" opt; do
     case $opt in
       e)
         ENVIRONMENT=$OPTARG
         ;;
       d)
         DROP_DB=true
         ;;
       n)
         NEW_MIGRATION_TITLE=$OPTARG
         ;;
     esac
  done

  if [ "$DROP_DB" = true ] ; then
    output "dropping database on $ENVIRONMENT"
    flyway clean -configFile=./config/flyway."$ENVIRONMENT".conf
  elif [ ! "$NEW_MIGRATION_TITLE" = false ] ; then
    output "creating new migration"
    ./bin/migration "$NEW_MIGRATION_TITLE"
  else
    output "running migration on $ENVIRONMENT"
    flyway migrate -locations=filesystem:./resources/sql/ -configFile=./config/flyway."$ENVIRONMENT".conf
  fi
}

function go_test {
  output "running tests"

  IS_WATCHING=false
  while getopts ":w" opt; do
     case $opt in
       w)
         IS_WATCHING=true
    esac
  done

  if [ "$IS_WATCHING" = true ] ; then
    ptw
  else
      pytest tests/
  fi
}

function go_update {
  output "running update"
  pip install -qr requirements.txt
}

CMD=${1:-help}

case "$CMD" in
  extract_pdf)
    shift
    go_extract_pdf "$@"
    ;;
  help)
    go_help
    ;;
  install)
    go_install
    ;;
  migrate)
    shift
    go_migrate "$@"
    ;;
  test)
    shift
    go_test "$@"
    ;;
  update)
    go_update
    ;;
  *)
    go_help
    ;;
esac
