# Android 12 Circular Splash Screen - Configuration Guide

## 📁 Files Modified/Created
1. ✅ **Created**: `android/app/src/main/res/values-v31/splash_screen.xml` (NEW)
2. ✅ **Updated**: `android/app/src/main/res/values-v31/styles.xml`
3. ✅ **Created**: `BACKUP_splash_screen_config.txt` (Rollback reference)

---

## 🎯 Current Configuration

| Setting | Value | File |
|---------|-------|------|
| Logo Image | `@drawable/android12splash` | splash_screen.xml |
| Circle Diameter | `120dp` (width & height) | splash_screen.xml |
| Circle Background | `#E0F2F1` (light teal) | styles.xml |
| Positioning | Center | splash_screen.xml |

---

## 🔧 How to Customize the Circular Diameter

### **Edit This File:**
```
android/app/src/main/res/values-v31/splash_screen.xml
```

### **Find These Lines:**
```xml
<brand-image
    android:src="@drawable/android12splash"
    android:gravity="center"
    android:width="120dp"          ← CHANGE THIS
    android:height="120dp"         ← CHANGE THIS
    android:scaleType="centerInside" />
```

### **Size Presets to Try:**

| Size | Width | Height | Use Case |
|------|-------|--------|----------|
| Extra Small | 80dp | 80dp | Minimal logo |
| Small | 100dp | 100dp | Compact view |
| **Default System** | **108dp** | **108dp** | Android standard |
| Medium ✅ (CURRENT) | **120dp** | **120dp** | Balanced |
| Large | 150dp | 150dp | Prominent logo |
| Extra Large | 180dp | 180dp | Bold statement |

### **Example: Change to 150dp**
```xml
<brand-image
    android:src="@drawable/android12splash"
    android:gravity="center"
    android:width="150dp"          ← Changed
    android:height="150dp"         ← Changed
    android:scaleType="centerInside" />
```

---

## ⚙️ How It Works

### **The Circular Mask Flow:**

```
1. Android 12 System reads splash_screen.xml
   ↓
2. Creates circular canvas with specified dimensions (width/height)
   ↓
3. Applies background color (#E0F2F1)
   ↓
4. Renders your logo inside the circle
   ↓
5. Shows on app startup until Flutter UI loads
```

### **Key XML Attributes:**

| Attribute | Purpose | Example |
|-----------|---------|---------|
| `android:src` | Image to display | `@drawable/android12splash` |
| `android:width` | Circle diameter (horizontal) | `120dp` |
| `android:height` | Circle diameter (vertical) | `120dp` |
| `android:gravity` | Logo position in circle | `center` |
| `android:scaleType` | How image fits in circle | `centerInside` |

---

## 🔄 Rollback Instructions

### **If You Want to Revert:**

**Option 1: Reset to Default (108dp)**
Edit `splash_screen.xml` and change:
```xml
android:width="108dp"
android:height="108dp"
```

**Option 2: Delete Custom Splash (System Default)**
```bash
# Windows PowerShell
Remove-Item "android\app\src\main\res\values-v31\splash_screen.xml"
```

**Option 3: Restore from Backup**
- Reference file: `BACKUP_splash_screen_config.txt`
- Revert `styles.xml` to previous state if needed

---

## 📱 Testing Your Changes

1. **Clean build:**
   ```bash
   flutter clean
   flutter pub get
   ```

2. **Rebuild APK:**
   ```bash
   flutter build apk
   ```

3. **Test on device/emulator:**
   - Look for the circular logo on app startup
   - Verify it fits properly in the circle
   - Check color background is visible

---

## 🎨 Pro Tips

### **Make Logo Fit Better:**
- Image should be **square** (e.g., 512x512px)
- Use **PNG with transparency** for best results
- Add padding around your logo (20% margin recommended)

### **Adjust Color:**
Edit `styles.xml`:
```xml
<item name="android:windowSplashScreenBackground">#E0F2F1</item>
<!-- Change hex color: #E0F2F1 -->

<item name="android:windowSplashScreenIconBackgroundColor">#E0F2F1</item>
<!-- Keep synchronized with background for consistency -->
```

### **Multiple Densities:**
For better scaling across devices, create images in:
```
drawable-mdpi/android12splash.png    (108x108)
drawable-hdpi/android12splash.png    (162x162)
drawable-xhdpi/android12splash.png   (216x216)
drawable-xxhdpi/android12splash.png  (324x324)
drawable-xxxhdpi/android12splash.png (432x432)
```

---

## 📋 Backup Files Created

✅ **BACKUP_splash_screen_config.txt** - Located in `values-v31/` folder
- Contains original configuration
- Reference for rollback
- Timestamps and original values documented

---

## ❓ FAQ

**Q: Will this affect iOS?**
A: No, this only affects Android 12+. iOS splash screens are configured separately in `ios/Runner/`.

**Q: Can I animate the splash?**
A: Yes, set `android:windowSplashScreenAnimatedIcon` to an animated drawable.

**Q: What's the maximum diameter?**
A: Practically up to 40% of screen width, but 100-150dp is recommended.

**Q: Do I need to regenerate splash after these changes?**
A: No, these changes override the auto-generated settings.

---

## ✨ Next Steps

1. ✅ Build and test: `flutter build apk`
2. ✅ Adjust diameter if needed (edit splash_screen.xml)
3. ✅ Test on Android 12+ device
4. ✅ Keep BACKUP file for future reference

---

**Last Updated:** 2025-12-23
**Status:** ✅ Applied & Ready for Testing
