# FulltimeForce Test

This is a test application for the FulltimeForce company, which consists of showing a list of cards with a commits information, like author, message, date and other data with pagination and pull refresh.
## How to Use

**Step 1:**

Download or clone this repo by using the link below:

```
git@github.com:hmmunioz/fulltimeForceTest.git
```

**Step 2:**

if you want to changing a repo you need modify 2 values in constants.dart file
```
  static const owner = 'hmmunioz';
  static const repo = 'fulltimeForceTest';
```


Go to project root and execute the following command in console to get the required dependencies:

```
flutter clean
flutter pub upgade
flutter pub get


Run:
flutter run
```

## FulltimeForce Features:

- Commits
- Detail Commits
- Detail Profile


### Libraries & Tools Used

- [fvm flutter version v3.0.0] Use this Flutter version to execute the project (use fvm for flutter versions managment)
- [fvm](https://fvm.app/es/docs/guides/global_version/)
- [equatable](https://pub.dev/packages/equatable)
- [shimmer](https://pub.dev/packages/shimmer)
- [flutter_bloc](https://pub.dev/packages/flutter_bloc)
- [http](https://pub.dev/packages/http)
- [cached_network_image](https://pub.dev/packages/cached_network_image)
- [flutter_translate](https://pub.dev/packages/flutter_translate)
- [google_fonts](https://pub.dev/packages/google_fonts)'
- [cupertino_icons](https://pub.dev/packages/cupertino_icons)
- [animate_do](https://pub.dev/packages/animate_do)
- [country_code_picker](https://pub.dev/packages/country_code_picker)
- [shared_preferences](https://pub.dev/packages/shared_preferences)
- [provider](https://pub.dev/packages/provider)
- [bloc_test](https://pub.dev/packages/bloc_test)
- [responsive_framework](https://pub.dev/packages/responsive_framework)


### Folder Structure

Here is the core folder structure which flutter provides.

```
FulltimeForce_test/
|- android
|- assets
|- build
|- ios
|- lib
|- test
```

Here is the folder structure we have been using in this project

```
lib/
|- app/
  |- _childrens/
     |- commits/
       |- bloc
       |- pages
       |- widgets
  |- common_widgets/
  |- constants/
  |- models/
  |- repository/
  |- router/
  |- theme/
  |- utils/
|- main.dart
```


