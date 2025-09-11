#!/bin/sh

set -ex

sudo apt-get update 
sudo apt-get install clang cmake libdeflate-dev musl-dev musl-tools -y

rustup target add wasm32-unknown-unknown wasm32-wasip1 wasm32-wasip2

# npm uninstall -g @bytecodealliance/jco @bytecodealliance/componentize-js @bytecodealliance/preview2-shim commander
npm install -g @bytecodealliance/jco@1.14.0 @bytecodealliance/componentize-js@0.19.0 @bytecodealliance/preview2-shim@0.17.4 commander@14.0.0

mkdir -p $HOME/.local/bin
cd $HOME/.local/bin

echo "🔐 Setting up GitHub CLI authentication..."

# Check if GITHUB_TOKEN is set
if [ -z "$GITHUB_TOKEN" ]; then
  echo "❌ GITHUB_TOKEN is not set. Please add it to .devcontainer/.env"
  exit 1
fi

# Create gh config directory
mkdir -p ~/.config/gh

# 👇 CRITICAL: Temporarily clear GITHUB_TOKEN so gh doesn't complain
# Save it to a temp var, then unset
TEMP_GITHUB_TOKEN="$GITHUB_TOKEN"
unset GITHUB_TOKEN

# Authenticate gh cli using token (non-interactive)
echo "$TEMP_GITHUB_TOKEN" | gh auth login --with-token

# Optional: Restore GITHUB_TOKEN if needed later in script
export GITHUB_TOKEN="$TEMP_GITHUB_TOKEN"

echo "✅ GitHub CLI authenticated successfully."

# Optional: Show current auth status
gh auth status


## Install Just (`just`)
CURRENT_REPO="casey/just"
CURRENT_VERSION=$(gh --repo $CURRENT_REPO release view --json tagName --jq .tagName)
DOWNLOADED_FILE=$(gh --repo $CURRENT_REPO release view --json assets --jq '.assets[] | select(.name | contains("x86_64") and contains("linux") and contains("musl")) .name')
gh --repo $CURRENT_REPO --pattern "$DOWNLOADED_FILE" release download $CURRENT_VERSION
tar zxvf $DOWNLOADED_FILE just
rm $DOWNLOADED_FILE

## Install wasmtime (`wasmtime`)
CURRENT_REPO="bytecodealliance/wasmtime"
CURRENT_VERSION=$(gh --repo $CURRENT_REPO release view --json tagName --jq .tagName)
DOWNLOADED_FILE=$(gh --repo $CURRENT_REPO release view --json assets --jq '.assets[] | select(.name | contains("x86_64") and contains("linux") and (contains("c-api") | not)  and endswith(".tar.xz")) .name')
DOWNLOADED_FILE_WITHOUT_EXTENSION=$(basename $DOWNLOADED_FILE .tar.xz)
gh --repo $CURRENT_REPO --pattern "$DOWNLOADED_FILE" release download $CURRENT_VERSION
tar -xvf $DOWNLOADED_FILE $DOWNLOADED_FILE_WITHOUT_EXTENSION/wasmtime $DOWNLOADED_FILE_WITHOUT_EXTENSION/wasmtime-min
mv -v ${DOWNLOADED_FILE_WITHOUT_EXTENSION}/* ./
rm -rfv $DOWNLOADED_FILE $DOWNLOADED_FILE_WITHOUT_EXTENSION

## Install wasm-pack (`wasm-pack`)
CURRENT_REPO="rustwasm/wasm-pack"
CURRENT_VERSION=$(gh --repo $CURRENT_REPO release view --json tagName --jq .tagName)
DOWNLOADED_FILE=$(gh --repo $CURRENT_REPO release view --json assets --jq '.assets[] | select(.name | contains("x86_64") and contains("linux") and contains("musl") and endswith(".tar.gz")) .name')
TMP_FOLDER=$(basename $DOWNLOADED_FILE .tar.gz)
gh --repo $CURRENT_REPO --pattern "$DOWNLOADED_FILE" release download $CURRENT_VERSION
tar -xvf $DOWNLOADED_FILE
mv ${TMP_FOLDER}/wasm-pack ./
rm -rf $DOWNLOADED_FILE $TMP_FOLDER

## Install wasm-tools (`wasm-tools`)
CURRENT_REPO="bytecodealliance/wasm-tools"
CURRENT_VERSION=$(gh --repo $CURRENT_REPO release view --json tagName --jq .tagName)
DOWNLOADED_FILE=$(gh --repo $CURRENT_REPO release view --json assets --jq '.assets[] | select(.name | contains("x86_64") and contains("linux") and endswith(".tar.gz")) .name')
TMP_FOLDER=$(basename $DOWNLOADED_FILE .tar.gz)
gh --repo $CURRENT_REPO --pattern "$DOWNLOADED_FILE" release download $CURRENT_VERSION
tar -xvf $DOWNLOADED_FILE
mv ${TMP_FOLDER}/wasm-tools ./
rm -rf $DOWNLOADED_FILE $TMP_FOLDER

## Install wasm-bindgen (`wasm-bindgen`)
CURRENT_REPO="rustwasm/wasm-bindgen"
CURRENT_VERSION=$(gh --repo $CURRENT_REPO release view --json tagName --jq .tagName)
DOWNLOADED_FILE=$(gh --repo $CURRENT_REPO release view --json assets --jq '.assets[] | select(.name | contains("x86_64") and contains("linux") and contains("musl") and endswith(".tar.gz")) .name')
TMP_FOLDER=$(basename $DOWNLOADED_FILE .tar.gz)
gh --repo $CURRENT_REPO --pattern "$DOWNLOADED_FILE" release download $CURRENT_VERSION
tar -xvf $DOWNLOADED_FILE
mv ${TMP_FOLDER}/wasm-bindgen ./
mv ${TMP_FOLDER}/wasm-bindgen-test-runner ./
mv ${TMP_FOLDER}/wasm2es6js ./
rm -rf $DOWNLOADED_FILE $TMP_FOLDER

## Install wit-bindgen (`wit-bindgen`)
CURRENT_REPO="bytecodealliance/wit-bindgen"
CURRENT_VERSION=$(gh --repo $CURRENT_REPO release view --json tagName --jq .tagName)
DOWNLOADED_FILE=$(gh --repo $CURRENT_REPO release view --json assets --jq '.assets[] | select(.name | contains("x86_64") and contains("linux") and endswith(".tar.gz")) .name')
TMP_FOLDER=$(basename $DOWNLOADED_FILE .tar.gz)
gh --repo $CURRENT_REPO --pattern "$DOWNLOADED_FILE" release download $CURRENT_VERSION
tar -xvf $DOWNLOADED_FILE
mv ${TMP_FOLDER}/wit-bindgen ./
rm -rf $DOWNLOADED_FILE $TMP_FOLDER

## Install wac (`wac`)
CURRENT_REPO="bytecodealliance/wac"
CURRENT_VERSION=$(gh --repo $CURRENT_REPO release view --json tagName --jq .tagName)
DOWNLOADED_FILE=$(gh --repo $CURRENT_REPO release view --json assets --jq '.assets[] | select(.name | contains("x86_64") and contains("linux") and endswith("musl")) .name')
gh --repo $CURRENT_REPO --pattern "$DOWNLOADED_FILE" release download $CURRENT_VERSION
chmod +x $DOWNLOADED_FILE 
mv $DOWNLOADED_FILE  ./wac

## Install wit-deps (`wit-deps`)
CURRENT_REPO="bytecodealliance/wit-deps"
CURRENT_VERSION=$(gh --repo $CURRENT_REPO release view --json tagName --jq .tagName)
DOWNLOADED_FILE=$(gh --repo $CURRENT_REPO release view --json assets --jq '.assets[] | select(.name | contains("x86_64") and contains("linux") and endswith("musl")) .name')
gh --repo $CURRENT_REPO --pattern "$DOWNLOADED_FILE" release download $CURRENT_VERSION
chmod +x $DOWNLOADED_FILE 
mv -v $DOWNLOADED_FILE ./wit-deps

## Install wasi-sdk (`wasi-sdk`)
CURRENT_REPO="WebAssembly/wasi-sdk"
CURRENT_VERSION=$(gh --repo $CURRENT_REPO release view --json tagName --jq .tagName)
DOWNLOADED_FILE=$(gh --repo $CURRENT_REPO release view --json assets --jq '.assets[] | select(.name | contains("x86_64") and contains("linux") and endswith(".deb")) .name')
gh --repo $CURRENT_REPO --pattern "$DOWNLOADED_FILE" release download $CURRENT_VERSION
sudo dpkg -i $DOWNLOADED_FILE
rm -f $DOWNLOADED_FILE

## Install cargo-component (`cargo-component`)
# CURRENT_REPO="bytecodealliance/cargo-component"
# CURRENT_VERSION=$(gh --repo $CURRENT_REPO release view --json tagName --jq .tagName)
# DOWNLOADED_FILE=$(gh --repo $CURRENT_REPO release view --json assets --jq '.assets[] | select(.name | contains("x86_64") and contains("linux") and endswith("gnu")) .name')
# gh --repo $CURRENT_REPO --pattern "$DOWNLOADED_FILE" release download $CURRENT_VERSION
# mv -v $DOWNLOADED_FILE ./cargo-component

# Install only the latest cargo-component compiled version
CURRENT_REPO="JADSN1894/carginstall"
CURRENT_VERSION=$(gh --repo "$CURRENT_REPO" release view --json tagName --jq .tagName)
# Download only the file named 'cago-component'
gh --repo "$CURRENT_REPO" release download "$CURRENT_VERSION" --pattern "cargo-component"
chmod +x cargo-component
