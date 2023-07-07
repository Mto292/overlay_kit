# device_info_plus

[![Flutter Community: device_info_plus](https://fluttercommunity.dev/_github/header/device_info_plus)](https://github.com/fluttercommunity/community)

[![pub package](https://img.shields.io/pub/v/device_info_plus.svg)](https://pub.dev/packages/device_info_plus)
[![pub points](https://img.shields.io/pub/points/device_info_plus?color=2E8B57&label=pub%20points)](https://pub.dev/packages/device_info_plus/score)
[![device_info_plus](https://github.com/fluttercommunity/plus_plugins/actions/workflows/device_info_plus.yaml/badge.svg)](https://github.com/fluttercommunity/plus_plugins/actions/workflows/device_info_plus.yaml)

<p class="center">
<center><a href="https://flutter.dev/docs/development/packages-and-plugins/favorites" target="_blank" rel="noreferrer noopener"><img src="../../../website/static/img/flutter-favorite-badge.png" width="100" alt="build"></a></center>
</p>
Get current device information from within the Flutter application.

## Platform Support

| Android | iOS | MacOS | Web | Linux | Windows |
| :-----: | :-: | :---: | :-: | :---: | :-----: |
|   ✔️    | ✔️  |  ✔️   | ✔️  |  ✔️   |   ✔️    |

# Usage

Import `package:device_info_plus/device_info_plus.dart`, instantiate `DeviceInfoPlugin`
and use the Android and iOS, Web getters to get platform-specific device
information.

Example:

```dart
import 'package:device_info_plus/device_info_plus.dart';

DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
print('Running on ${androidInfo.model}');  // e.g. "Moto G (4)"

IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
print('Running on ${iosInfo.utsname.machine}');  // e.g. "iPod7,1"

WebBrowserInfo webBrowserInfo = await deviceInfo.webBrowserInfo;
print('Running on ${webBrowserInfo.userAgent}');  // e.g. "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:61.0) Gecko/20100101 Firefox/61.0"
```

The plugin provides a `data` method that returns platform-specific device
information in a generic way, which can be used for crash-reporting purposes.

However, the data provided by this `data` method is currently not serializable
(i.e. it is not 100% JSON compatible) and shouldn't be treated as such.

```dart
import 'package:device_info_plus/device_info_plus.dart';

final deviceInfoPlugin = DeviceInfoPlugin();
final deviceInfo = await deviceInfoPlugin.deviceInfo;
final allInfo = deviceInfo.data;
```

You will find links to the API docs on the [pub page](https://pub.dev/documentation/device_info_plus/latest/).

Check out our documentation website to learn more. [Plus plugins documentation](https://plus.fluttercommunity.dev/docs/overview)
