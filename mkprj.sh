#!/bin/bash

set -euo pipefail

available_licenses=("MIT")
available_templates=("cpp")

collect_params() {
  OPTIND=1
  while getopts "a:n:t:l:" opt; do
    case $opt in
      a) author="$OPTARG" ;;
      n) name="$OPTARG" ;;
      t) template="$OPTARG" ;;
      l) license="$OPTARG" ;;
      \?)
        echo "Usage: $0 -a <author> -n <name> -t <template> -l <license>"
        exit 1
        ;;
      :)
        echo "Option -$OPTARG requires an argument."
        echo "Usage: $0 -a <author> -n <name> -t <template> -l <license>"
        exit 1
        ;;
    esac
  done
}

get_a() {
  read -p "Enter author name (-a): " author
}
get_n() {
  read -p "Enter project name (-n): " name
}
get_t() {
  echo "Available templates: ${available_templates[*]}"
  read -p "Enter template (-t): " template
}
get_l() {
  echo "Available licenses: ${available_licenses[*]}"
  read -p "Enter license (-l): " license
}

check_params() {
  if [ -z "${author:-}" ]; then
    get_a
  fi

  # Directory existence check
  if [ -z "${name:-}" ]; then
    get_n
  fi
  if [ -d "$name" ]; then
    echo "Error: Directory '$name' already exists. Please choose a different project name."
    exit 1
  fi

  # Validate template
  if [ -z "${template:-}" ]; then
    get_t
  fi
  while true; do
    is_valid_template=false
    for t in "${available_templates[@]}"; do
      if [ "$template" == "$t" ]; then
        is_valid_template=true
        break
      fi
    done
    if [ "$is_valid_template" = true ]; then
      break
    else
      echo "Invalid template: '$template'"
      echo "Available templates are: ${available_templates[*]}"
      get_t
    fi
  done

  # Validate license
  if [ -z "${license:-}" ]; then
    get_l
  fi
  while true; do
    is_valid_license=false
    for lic in "${available_licenses[@]}"; do
      if [ "$license" == "$lic" ]; then
        is_valid_license=true
        break
      fi
    done
    if [ "$is_valid_license" = true ]; then
      break
    else
      echo "Invalid license: '$license'"
      echo "Available licenses are: ${available_licenses[*]}"
      get_l
    fi
  done
}

log_params() {
  echo "Building project using:"
  echo "  Author: $author"
  echo "  Name: $name"
  echo "  Template: $template"
  echo "  License: $license"
}

create_prj_dir() {
  mkdir "$name"
  cd "$name"
}

copy_templates() {
  mkdir .temp
  git clone git@github.com:EzraKirn/mkprj.git .temp
  if [ $? -ne 0 ]; then
    echo "Error: Failed to clone template repository."
    exit 1
  fi
  cp -r ".temp/$template/"* .
  cp -r ".temp/clangFormats/$template" ./.clang-format
  cp -r ".temp/ignores/$template" ./.gitignore
}

copy_license() {
  cp -r ".temp/licenses/$license" ./LICENSE
  sed -i "s/<YEAR>/$(date +%Y)/g; s/<OWNER>/$author/g" LICENSE
}

copy_readme() {
  wget -O README.md https://raw.githubusercontent.com/othneildrew/Best-README-Template/main/BLANK_README.md
}

cleanup() {
  rm -rf .temp
  find . -name ".gitkeep" -type f -delete
  rm -f postBuild.sh
}

main() {
  collect_params "$@"
  check_params
  log_params
  create_prj_dir
  copy_templates
  copy_license
  copy_readme
  if [ -f ./postBuild.sh ]; then
    source ./postBuild.sh
  fi
  cleanup
}

main "$@"
