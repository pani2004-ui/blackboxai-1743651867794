#!/bin/bash
# Package FarmDirect app code for distribution
VERSION=$(date +%Y%m%d)
OUTPUT="farmdirect-v${VERSION}.zip"

echo "Packaging FarmDirect app code..."
zip -r "${OUTPUT}" . \
  -x "node_modules/*" \
  -x "*.git/*" \
  -x "android/app/build/*" \
  -x "*.DS_Store" \
  -x "package.sh"

echo "Created ${OUTPUT}"
echo "Upload this file to your hosting provider and update the QR code URL in www/download.html"