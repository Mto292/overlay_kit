import 'dart:async';
import 'dart:math';

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
      appPrimaryColor: Colors.red,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(primaryColor: Colors.black),
        home: const MyHomePage(
          title: 'Flutter Demo Home Page',
        ),
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
      backgroundColor: Color.fromRGBO(Random().nextInt(250), Random().nextInt(250), Random().nextInt(250), 1),
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
            ElevatedButton(
              onPressed: onTapShowToastWithButtonBtn,
              child: const Text('Dismiss All And Show Toast'),
            ),
            ElevatedButton(
              onPressed: onTapNewPageBtn,
              child: const Text('New Page'),
            ),
          ],
        ),
      ),
    );
  }

  onTapStartBtn() async {
    OverlayLoadingProgress.start();
    await Future.delayed(const Duration(seconds: 10));
    OverlayLoadingProgress.stop();
  }

  onTapStartWithExtensionBtn() async {
    Future.delayed(const Duration(seconds: 5)).callWithProgress(
      circularProgressColor: Colors.red,
    );
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
          child: CircularProgressIndicator(
            color: Colors.green,
          ),
        ),
      ),
    );
    await Future.delayed(const Duration(seconds: 8));
    OverlayLoadingProgress.stop();
  }

  void onTapShowToastBtn() {
    OverlayToastMessage.show(
      ignoring: false,
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
          child: const Padding(
            padding: EdgeInsets.all(15),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
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

  void onTapNewPageBtn() {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (_) => const MyHomePage(
              title: '',
            )));
  }

  void onTapShowToastWithButtonBtn() {
    OverlayToastMessage.show(
      ignoring: false,
      duration: const Duration(seconds: 5),
      widget: const _ToastWithButtonWidget(
        textMessage: 'Toast Message',
        backgroundColor: Colors.white,
        primaryColor: Colors.purple,
        duration: 5,
      ),
    );
  }
}

class _ToastWithButtonWidget extends StatefulWidget {
  final String textMessage;
  final Color backgroundColor;
  final Color primaryColor;
  final int duration;

  const _ToastWithButtonWidget({
    required this.textMessage,
    required this.backgroundColor,
    required this.primaryColor,
    required this.duration,
  });

  @override
  State<_ToastWithButtonWidget> createState() => _ToastWithButtonWidgetState();
}

class _ToastWithButtonWidgetState extends State<_ToastWithButtonWidget> {
  double progress = 0;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((temp) {
      final durationInMillisecond = widget.duration * 1000;
      timer = Timer.periodic(const Duration(milliseconds: 1), (time) {
        progress = (timer!.tick + 200) / durationInMillisecond;
        debugPrint(timer!.tick.toString());
        debugPrint(progress.toString());
        setState(() {});
      });
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Card(
        color: widget.backgroundColor,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      widget.textMessage,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(width: 8),
                  SizedBox(
                    height: 40,
                    width: 4,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      overlayColor: Colors.grey,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    child: const Text(
                      'Ekle',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                    ),
                    onPressed: () {
                      debugPrint('Button Taped');
                    },
                  ),
                  const SizedBox(width: 8),
                ],
              ),
            ),
            ColoredBox(
              color: Colors.red,
              child: LinearProgressIndicator(
                value: progress,
                minHeight: 3,
                valueColor: AlwaysStoppedAnimation<Color?>(
                  widget.primaryColor,
                ),
                color: widget.primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
