# FulltimeForce Test

This is a test application for the FulltimeForce company, which consists of showing a card with the information of a commits, in addition to showing its seasons, chapters and details of each chapter. It also has a search engine to choose other commits.
## How to Use

**Step 1:**

Download or clone this repo by using the link below:

```
git@github.com:hmmunioz/DaCodeTest.git
```

**Step 2:**
Make sure that the .env file is at the root of the project since it has the api key


Go to project root and execute the following command in console to get the required dependencies:

```
flutter clean
flutter pub upgade
flutter pub get


Run:
flutter run
```

## FulltimeForce Features:

- Serie
- Season
- Episode


### Libraries & Tools Used

- [fvm flutter version v3.0.0] Use this Flutter version to execute the project (use fvm for flutter versions managment)
- [fvm](https://fvm.app/es/docs/guides/global_version/)
- [equatable](https://pub.dev/packages/equatable)
- [shimmer](https://pub.dev/packages/shimmer)
- [flutter_bloc](https://pub.dev/packages/flutter_bloc)
- [http](https://pub.dev/packages/http)
- [cached_network_image](https://pub.dev/packages/cached_network_image)
- [flutter_dotenv](https://pub.dev/packages/flutter_dotenv)
- [flutter_translate](https://pub.dev/packages/flutter_translate)
- [google_fonts](https://pub.dev/packages/google_fonts)'
- [carousel_slider](https://pub.dev/packages/carousel_slider)
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
     |- serie/
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
|- .env
```


