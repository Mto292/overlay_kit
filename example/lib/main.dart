import 'package:flutter/material.dart';
import 'package:overlay_kit/overlay_kit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: onTapStartBtn,
              child: const Text('Start Loading Progress'),
            ),
            ElevatedButton(
              onPressed: onTapStartGifLoadingProgressBtn,
              child: const Text('Start Gif Loading Progress'),
            ),
            ElevatedButton(
              onPressed: onTapStartCustomLoadingProgressBtn,
              child: const Text('Start Custom Loading Progress'),
            ),
            ElevatedButton(
              onPressed: onTapStartWithExtensionBtn,
              child: const Text('Start Loading Progress With Extension'),
            ),
            ElevatedButton(
              onPressed: onTapCustomBtn,
              child: const Text('Show Custom Toast'),
            ),
            ElevatedButton(
              onPressed: onTapShowToastBtn,
              child: const Text('Show Toast'),
            ),
            ElevatedButton(
              onPressed: onTapDismissAllAndShowToastBtn,
              child: const Text('Dismiss All And Show Toast'),
            ),
          ],
        ),
      ),
    );
  }

  onTapStartBtn() async {
    OverlayLoadingProgress.start();
    await Future.delayed(const Duration(seconds: 5));
    OverlayLoadingProgress.stop();
  }

  onTapStartWithExtensionBtn() async {
    Future.delayed(const Duration(seconds: 5)).callWithProgress();
  }

  onTapStartGifLoadingProgressBtn() async {
    OverlayLoadingProgress.start(
      gifOrImagePath: 'assets/loading.gif',
      loadingWidth: 50,
    );
    await Future.delayed(const Duration(seconds: 3));
    OverlayLoadingProgress.stop();
  }

  onTapStartCustomLoadingProgressBtn() async {
    OverlayLoadingProgress.start(
      widget: Container(
        height: 100,
        width: 100,
        color: Colors.black38,
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
    await Future.delayed(const Duration(seconds: 8));
    OverlayLoadingProgress.stop();
  }

  void onTapShowToastBtn() {
    OverlayToastMessage.show(
      textMessage: 'Toast Message',
    );
  }

  void onTapDismissAllAndShowToastBtn() {
    OverlayToastMessage.show(
      dismissAll: true,
      textMessage: 'Dismiss All And Show Toast Message',
    );
  }

  void onTapCustomBtn() {
    OverlayToastMessage.show(
      widget: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Container(
          decoration: BoxDecoration(boxShadow: const [
            BoxShadow(
              spreadRadius: 3,
              blurRadius: 10,
              offset: Offset(0, 5),
              color: Colors.black12,
            )
          ], borderRadius: BorderRadius.circular(15), color: Colors.white),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Icon(Icons.ac_unit),
                SizedBox(width: 15),
                Expanded(
                  child: Text(
                    'Custom Toast',
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                    textAlign: TextAlign.start,
                    maxLines: 2,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
