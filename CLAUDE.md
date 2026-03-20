# MyVehicles - Development Notes

## Build & Release Workflow

### Version Numbering
- **iOS**: Version number in `pubspec.yaml` (e.g., `1.0.4`), Codemagic auto-increments build number
- **Android**: Full version+build in `pubspec.yaml` (e.g., `1.0.4+5`), manually incremented here

### Release Process

**iOS (via Codemagic):**
1. Update version in `pubspec.yaml` (e.g., `1.0.4` - no build number)
2. Commit and push to GitHub
3. Codemagic automatically builds and deploys to TestFlight
4. Codemagic manages build number incrementation

**Android (local build):**
1. Update version+build in `pubspec.yaml` (e.g., `1.0.4+5`)
2. Build AAB locally
3. Upload to Play Console manually

### Build Number History
- 1.0.0+1 - Initial release
- 1.0.1+2 - Android release signing setup
- 1.0.2+3 - Navigation UI updates
- 1.0.3+4 - iOS file persistence attributes (failed to fix data loss)
- 1.0.4+5 - Relative path fix for iOS container relocation
- 1.0.5+6 - Android NDK 27 upgrade, simplified vehicle details navigation
- 1.0.6+7 - Fix documents/photos not displaying due to unresolved relative paths
- 1.0.7+8 - Fix licence photos and remaining unresolved path issues (full sweep)
- 1.0.8+9 - DVLA registration lookup, MOT/tax status from DVLA, ownership default fix
- 1.0.9+10 - App Store submission, namespaced IAP product IDs, Android debug symbols, iOS/Android version sync
- 1.0.10+11 - Fix vehicle photo not updating immediately after change

## Recent Issues & Fixes

### iOS File Loss During TestFlight Updates (Feb 2026)

**Problem:**
Document files and photos disappeared after updating from 1.0.2 to 1.0.3 via TestFlight. Database records remained but files appeared missing.

**Root Cause:**
iOS changes app container UUID during app updates, breaking absolute file paths stored in database:
- Old path: `/var/mobile/.../OLD-UUID/my_vehicles_docs/file.pdf`
- New path: `/var/mobile/.../NEW-UUID/my_vehicles_docs/file.pdf`
- Files were still present but database paths pointed to old container

**Solution (v1.0.4):**
Implemented MyHolidays pattern - store relative paths instead of absolute:
- Database now stores: `my_vehicles_docs/file.pdf`
- Runtime resolution: Join with `getApplicationDocumentsDirectory()`
- Database migration (schema v12) converts existing absolute paths
- All file operations updated to save/resolve relative paths
- Backup service normalizes paths to relative during restore

**Key Files Modified:**
- `lib/services/document_service.dart` - Added path caching and resolution
- `lib/database/database.dart` - Schema v12 migration for path conversion
- `lib/main.dart` - Initialize DocumentService at startup
- All screens/widgets - Use `DocumentService.resolvePathSync()` for file access

**Testing:**
1. Check File System Status in Settings before update
2. Update via TestFlight
3. Migration runs automatically on first launch
4. File System Status should show same counts
5. Data Integrity Check should pass

## Architecture Notes

### File Storage
- Documents folder: `my_vehicles_docs/` (in app documents directory)
- Photos folder: `vehicle_photos/` (in app documents directory)
- Database: `my_vehicles.sqlite` (in app documents directory root)
- Auto-backup: `my_vehicles_autobackup.zip` (in app documents directory root)

### Database Schema
Current version: 12 (incremented for path migration)

Tables:
- `vehicles` - Vehicle records with photo_path
- `service_entries` - Service history
- `mot_records` - MOT test history
- `document_refs` - Document attachments with local_path
- `driver_profiles` - Driver info with photo_path, licence_photo_front, licence_photo_back
- `app_settings` - App configuration

### Path Resolution
- **Storage**: Always store relative paths (e.g., `vehicle_photos/car.jpg`)
- **Display**: Resolve at runtime using `DocumentService.resolvePathSync()`
- **Caching**: App directory cached at startup in `DocumentService.init()`
- **Legacy support**: Path resolver handles both absolute and relative paths

### Auto-Backup
- Frequency: Every 4 hours when app goes to background
- Location: `my_vehicles_autobackup.zip` in app directory
- Contents: Database + all document/photo folders
- Restore: Accessible from Settings, automatically normalizes paths to relative

## Development Rules

### Cross-Cutting Changes Require Full Sweep
When making a change that affects a pattern used across multiple files (e.g. path resolution, theme changes, API changes), you MUST:
1. Use `grep`/search to find EVERY occurrence of the old pattern across the entire codebase
2. Fix ALL occurrences, not just the ones you're currently looking at
3. Verify with a follow-up search that zero instances of the old pattern remain
4. List every file changed in your summary so the user can verify coverage

### Always Run Analyze Before Committing
Codemagic runs `flutter analyze` and fails the build on warnings (e.g. unused imports). Always run `flutter analyze` locally before pushing to catch these issues early.

### File Path Rules (CRITICAL - iOS breaks without this)
- NEVER use `File(path).existsSync()` directly on database paths — they are relative
- ALWAYS use `DocumentService.fileExistsSync(path)` to check file existence
- ALWAYS use `DocumentService.resolvePathSync(path)` before passing to `File()`, `Image.file()`, etc.
- If you see bare `File(somePath)` on a database-sourced path anywhere in the codebase, it is a bug — fix it

## Git Workflow
- Main branch: `main`
- Owner: bradymd
- Repo: https://github.com/bradymd/myvehicles.git
- Public repo (for support docs/issues, not for general contributions)

## Common Commands

Build Android AAB:
```bash
flutter build appbundle --release
```

Check database schema version:
```dart
// In database.dart
int get schemaVersion => 12;
```

Run integrity check (in Settings & Tools):
- Verifies all file references in database point to existing files
- Resolves relative paths before checking existence
