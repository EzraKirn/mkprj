#!/bin/bash

echo "Running post build script"
wget -q -O cmake/CPM.cmake https://github.com/cpm-cmake/CPM.cmake/releases/latest/download/get_cpm.cmake

cat > .clangd <<EOF
CompileFlags:
  Add:
    - -I"$(pwd)/inc"
    - -I"$(pwd)/lib"
  CompilationDatabase: "$(pwd)"
EOF

sed -i "s/<NAME>/$name/g" CMakeLists.txt

git submodule add https://github.com/google/googletest.git submodules/googletest
git submodule update --init --recursive
