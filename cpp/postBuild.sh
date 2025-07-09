#!/bin/bash

echo "Running post build script"
wget -O cmake/CPM.cmake https://github.com/cpm-cmake/CPM.cmake/releases/latest/download/get_cpm.cmake


INCLUDE_DIR="$(pwd)/inc"
COMPILATION_DB="$(pwd)"

cat > .clangd <<EOF
CompileFlags:
  Add:
    - -I$INCLUDE_DIR
  CompilationDatabase: "$COMPILATION_DB"
EOF
