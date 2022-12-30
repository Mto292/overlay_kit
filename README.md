# overlay_loading_progress
A flutter package of overlay kit.

## Content
1. Loading Progress
2. Toast Message
3. Future Extension

## Usage

1- add this line to pubspec.yaml

```yaml
   dependencies:
     overlay_kit: ^1.0.0
```

2- import package

```dart
import 'package:overlay_kit/overlay_kit.dart';
```

3- Wrap your MaterialApp  with OverlayKit

```dart
  @override
  Widget build(BuildContext context) {
    return OverlayKit(
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
```

## 1. Loading Progress
[overlay_loading_progress](https://pub.dev/packages/overlay_loading_progress "overlay_loading_progress") package is being use.


Start it with
```dart
OverlayLoadingProgress.start();
```

Stop it with
```dart
OverlayLoadingProgress.stop();
```

#### Complete Example
```dart
OverlayLoadingProgress.start();
await Future.delayed(const Duration(seconds: 3));
OverlayLoadingProgress.stop();
```

 <img src="https://user-images.githubusercontent.com/49743631/167276311-b96b6f22-adda-489b-a2a6-f1c467dccb60.gif" alt="drawing" width="200"/>


#### Use With Gif
```dart
OverlayLoadingProgress.start(gifOrImagePath: 'assets/loading.gif');
await Future.delayed(const Duration(seconds: 3));
OverlayLoadingProgress.stop();
```

 <img src="https://user-images.githubusercontent.com/49743631/167276327-6b83530c-f361-4850-9162-c46e0d006164.gif" alt="drawing" width="200"/>


#### Use With Custom Widget
```dart
OverlayLoadingProgress.start(
  widget: Container(
    width: MediaQuery.of(context).size.width / 4,
    padding: EdgeInsets.all(MediaQuery.of(context).size.width / 13),
    child: const AspectRatio(
    aspectRatio: 1,
    child: const CircularProgressIndicator(),
    ),
  ),
);
await Future.delayed(const Duration(seconds: 3));
OverlayLoadingProgress.stop();
```

## 2- Toast Message
[overlay_toast_message](https://pub.dev/packages/overlay_toast_message "overlay_toast_message") package is being use.


Show it with
```dart
OverlayToastMessage.show(textMessage: 'Dismiss All And Show Toast');
```

<img src="https://user-images.githubusercontent.com/49743631/209962853-b3c3df90-5818-46d2-92ab-e5eb8f7c1c01.png" alt="drawing" width="200"/>


#### Use With Custom Widget

```dart
OverlayToastMessage.show(
  widget: yourWidget,
);
```

 <img src="https://user-images.githubusercontent.com/49743631/209962926-35836d32-f649-420a-9300-338cd3c11bdb.png" alt="drawing" width="200"/>


## 2- Future Extension
Show Loading Progress with Extension.

```dart
Future.delayed(const Duration(seconds: 5)).callWithProgress();
```





