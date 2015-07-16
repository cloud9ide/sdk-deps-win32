#!/bin/bash -ex


set -ex
has() {
  type "$1" > /dev/null 2>&1
  return $?
}

C9_DIR="$HOME/.c9"

if has "wget"; then
  DOWNLOAD="wget --no-check-certificate -nc"
elif has "curl"; then
  DOWNLOAD="curl -sSOLk"
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
# tar can not remove exe files when they are used
rm -rf "$C9_DIR/msys"
rm -rf "$C9_DIR/node.exe"
rm -rf "$C9_DIR/node_modules/pty.js"
rm -rf "$C9_DIR/node_modules/sqlite3"
getTar node.tar.gz
getTar msys.tar.gz

echo "1" > "$C9_DIR/installed"
