#!/bin/bash

collect_prams(){
  OPTIND=1
  while getopts "n:t:l:" opt; do
    case $opt in
      n) name="$OPTARG" ;;
      t) template="$OPTARG" ;;
      l) license="$OPTARG" ;;
      \?)
        echo "Usage: $0 -n <name> -t <template> -l <license>"
        exit 1
        ;;
      :)
        echo "Option -$OPTARG requires an argument."
        echo "Usage: $0 -n <name> -t <template> -l <license>"
        exit 1
        ;;
    esac
  done

  if [ -z "$name" ]; then
    read -p "Enter project name (-n): " name
  fi
  if [ -z "$template" ]; then
    read -p "Enter template (-t): " template
  fi
  if [ -z "$license" ]; then
    read -p "Enter license (-l): " license
  fi
}

log_prams(){
  echo "Building project using:"
  echo "  Name: $name"
  echo "  Template: $template"
  echo "  License: $license"
}

copy_repo_template() {
}

main(){
  collect_prams "$@"
  log_prams
}

main "$@"

