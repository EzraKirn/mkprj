#!/bin/bash

echo "Running post build script"
wget -O cmake/CPM.cmake https://github.com/cpm-cmake/CPM.cmake/releases/latest/download/get_cpm.cmake

cat > .clangd <<EOF
CompileFlags:
  Add:
    - -I"$(pwd)/inc"
    - -I"$(pwd)/lib"
  CompilationDatabase: "$(pwd)"
EOF

sed -i "s/<NAME>/$name/g" CMakeLists.txt
