# FarmDirect Mobile App - Complete Build Guide

## Prerequisites
- Android Studio (latest version)
- Java JDK 11+
- Node.js 16+
- Android SDK 34
- Build Tools 34.0.0

## Android Studio Setup

1. **Import Project**
   - Open Android Studio
   - Select "Open an Existing Project"
   - Navigate to your project's `android` directory
   - Click "OK"

2. **Build the APK**
   - Wait for Gradle sync to complete
   - Select "Build" > "Build Bundle(s) / APK(s)" > "Build APK"
   - Wait for build to finish (check Build Output window)

3. **Locate the APK**
   - After successful build, find the APK at:
     `android/app/build/outputs/apk/debug/app-debug.apk`

## Generate QR Code

1. Upload APK to file hosting (Google Drive, GitHub, etc.)
2. Get shareable download link
3. Update QR code in `www/download.html`:
```html
<img src="https://api.qrserver.com/v1/create-qr-code/?size=200x200&data=YOUR_DOWNLOAD_LINK">
<a href="YOUR_DOWNLOAD_LINK" download>
```

## Test Installation
- Transfer APK to Android device
- Enable "Install Unknown Apps" in settings
- Open and install the APK

## Complete Distribution Guide

### 1. Package the Source Code
```bash
# Make script executable
chmod +x package.sh

# Create ZIP archive (excludes node_modules, git files, and build artifacts)
./package.sh
```

### 2. Build the APK
1. Open Android Studio
2. Select "Build" > "Build Bundle(s) / APK(s)" > "Build APK(s)"
3. Locate built APK at:
   ```
   android/app/build/outputs/apk/debug/app-debug.apk
   ```

### 3. Host Your Files
**Recommended Options:**
1. **GitHub Releases** (Best for versioning)
   ```bash
   git tag v1.0
   git push origin v1.0
   ```
   - Go to Repository > Releases
   - Create new release for the tag
   - Upload both files:
     - APK: `app-debug.apk`
     - Source: `farmdirect-v[date].zip`

2. **Alternative Hosting** (For quick sharing)
   ```bash
   # Using Python HTTP server (temporary)
   python3 -m http.server 8000
   ```
   - Access files at:
     - APK: `http://[your-ip]:8000/android/app/build/outputs/apk/debug/app-debug.apk`
     - Source: `http://[your-ip]:8000/farmdirect-v[date].zip`

### 4. Update Download Page
Edit `www/download.html`:
```html
<!-- APK Section -->
<img src="https://api.qrserver.com/v1/create-qr-code/?size=200x200&data=YOUR_APK_URL">
<a href="YOUR_APK_URL" download>

<!-- Source Code Section -->  
<img src="https://api.qrserver.com/v1/create-qr-code/?size=200x200&data=YOUR_SOURCE_URL">
<a href="YOUR_SOURCE_URL" download>
```

### 5. Test Installation
1. Transfer APK to Android device
2. Enable "Install Unknown Apps" in settings
3. Install and verify all features
