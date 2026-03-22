#!/bin/bash

script_dir=$(dirname "$0")

script_dir=$(cd "$script_dir" && pwd)

parent_dir=$(dirname "$script_dir")

cd $parent_dir

rm -rf ./package/include/
rm -rf ./package/libs/
rm -rf ./package/cmake/

export COPYFILE_DISABLE=true

archs=(arm64-v8a armeabi-v7a x86_64)

cp -r "./prelude/arm64-v8a/include" "./package/"
cp -r "./prelude/arm64-v8a/lib/cmake" "./package/"

for arch in "${archs[@]}"; do
  src="./prelude/${arch}"
  dst="./package/libs/${arch}"

  mkdir -p "${dst}"
  cp "${src}/lib/libcrypto.a" "${dst}/libcrypto.a"
  cp "${src}/lib/libcrypto.so" "${dst}/libcrypto.so"
  cp "${src}/lib/libssl.a" "${dst}/libssl.a"
  cp "${src}/lib/libssl.so" "${dst}/libssl.so"
done

tar -zcvf package.har package/