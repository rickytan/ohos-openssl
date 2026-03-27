# `@rickytan/openssl`

## Install

use`ohpm` to install package.

```shell
ohpm install @rickytan/openssl --save-dev
```

## Usage

```txt
# CMakeLists.txt

set(OPENSSL_ROOT_PATH ${CMAKE_CURRENT_SOURCE_DIR}/../../../oh_modules/@rickytan/openssl)
set(CMAKE_MODULE_PATH ${OPENSSL_ROOT_PATH})

find_package(OpenSSL REQUIRED)

target_link_libraries(entry PRIVATE OpenSSL::Crypto OpenSSL::SSL)
```