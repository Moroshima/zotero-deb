i#!/bin/bash

srcdir=$(pwd)

git clone https://github.com/zotero/zotero.git zotero-client
git clone https://github.com/zotero/zotero-build.git zotero-build
git clone https://github.com/zotero/zotero-standalone-build.git zotero-standalone-build
git clone https://github.com/zotero/translators.git zotero-translators
git clone https://github.com/zotero/bundled-styles.git zotero-styles
git clone https://github.com/zotero/pdf-worker.git zotero-pdf-worker
git clone https://github.com/zotero/note-editor.git zotero-note-editor
git clone https://github.com/zotero/pdf-reader.git zotero-pdf-reader
git clone https://github.com/zotero/zotero-schema.git zotero-schema
git clone https://github.com/gildas-lormeau/SingleFile.git zotero-SingleFile
git clone https://github.com/zotero/utilities.git zotero-utilities
git clone https://github.com/zotero/translate.git zotero-translate
git clone https://github.com/citation-style-language/locales.git zotero-csl
git clone https://github.com/egh/zotero-transfw.git zotero-transfw
git clone https://github.com/zotero/zotero-libreoffice-integration.git zotero-libreoffice-integration
git clone https://github.com/zotero/pdf.js.git zotero-pdf-js

cd "$srcdir/zotero-build"
git submodule init
git config submodule.xpi/zotero-transfw.url "$srcdir/zotero-transfw"
git -c protocol.file.allow=always submodule update

cd "$srcdir/zotero-client"
git checkout 6.0.26
git submodule init
git config submodule.translators.url "$srcdir/zotero-translators"
git config submodule.styles.url "$srcdir/zotero-styles"
git config submodule.pdf-worker.url "$srcdir/zotero-pdf-worker"
git config submodule.note-editor.url "$srcdir/zotero-note-editor"
git config submodule.pdf-reader.url "$srcdir/zotero-pdf-reader"
git config submodule.resource/schema/global.url "$srcdir/zotero-schema"
git config submodule.resource/SingleFile.url "$srcdir/zotero-SingleFile"
git config submodule.chrome/content/zotero/xpcom/utilities.url "$srcdir/zotero-utilities"
git config submodule.chrome/content/zotero/xpcom/translate.url "$srcdir/zotero-translate"
git config submodule.chrome/content/zotero/locale/csl.url "$srcdir/zotero-csl"
git -c protocol.file.allow=always submodule update

cd pdf-reader
git submodule init
git config submodule.pdf.js.url "$srcdir/zotero-pdf-js"
git -c protocol.file.allow=always submodule update
cd ..

cd pdf-worker
git submodule init
git config submodule.pdf.js.url "$srcdir/zotero-pdf-js"
git -c protocol.file.allow=always submodule update
cd ..

npm i --legacy-peer-deps

cd "$srcdir/zotero-standalone-build"
git checkout 6.0.23
git submodule init
git config submodule.modules/zotero-libreoffice-integration.url "$srcdir/zotero-libreoffice-integration"
git -c protocol.file.allow=always submodule update

./fetch_xulrunner.sh -p l
./fetch_pdftools

cd "$srcdir/zotero-client"
NODE_OPTIONS=--openssl-legacy-provider npm run build

cd "$srcdir/zotero-standalone-build"
scripts/dir_build -p l
