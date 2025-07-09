#!/bin/bash

collect_prams(){
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

  if [ -z "$author" ]; then
    read -p "Enter author name (-a): " author
  fi
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
  echo "  Aurhor: $author"
  echo "  Name: $name"
  echo "  Template: $template"
  echo "  License: $license"
}

copy_repo_template() {
mkdir .temp
git clone git@github.com:EzraKirn/mkprj.git .temp
cp -r .temp/$template/* .
cp -r .temp/clangFormats/$template ./.clang-format
cp -r .temp/ignores/$template ./.gitignore
cp -r .temp/licenses/$license ./LICENSE
sed -i "s/$(date +%Y)/2025/g; s/<OWNER>/$author/g" LICENSE

rm -rf .temp
rm ./**/.gitkeep
}

main(){
  collect_prams "$@"
  log_prams

  mkdir $name
  cd $name
  copy_repo_template
  ./postBuild.sh
  rm postBuild.sh
}

main "$@"

