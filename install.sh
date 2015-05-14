#!/bin/bash -ex


set -e
has() {
  type "$1" > /dev/null 2>&1
  return $?
}

C9_DIR="$HOME/.c9"

if has "wget"; then
  DOWNLOAD="wget --no-check-certificate -nc"
elif has "curl"; then
  DOWNLOAD="curl -sSOL"
else
  echo "Error: you need curl or wget to proceed" >&2;
  exit 1
fi

URL="https://github.com/cloud9ide/sdk-deps-win32/releases/download/v0.0.1"
getTar() {
    cd "$C9_DIR"
    $DOWNLOAD $URL/$1
    tar --overwrite -zxf $1
    rm -f $1
}
mkdir -p "$C9_DIR"
echo "*" > "$C9_DIR/.gitignore"
getTar node.tar.gz
getTar msys.tar.gz