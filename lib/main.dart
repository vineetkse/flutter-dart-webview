import 'package:flutter/material.dart';
import 'dart:async';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/foundation.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Webview',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: HomePage() //MyHomePage(title: 'Flutter Demo Home Page'),
        );
  }
}

class HomePage extends StatelessWidget {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('APP->()'),
          // This drop down menu demonstrates that Flutter widgets can be shown over the web view.
          actions: <Widget>[],
        ),
        body: WebView(
          initialUrl: 'https://github.com',
          javascriptMode: JavascriptMode.unrestricted,
          gestureRecognizers: Set()
            ..add(Factory<LongPressGestureRecognizer>(
                () => LongPressGestureRecognizer())),
          onWebViewCreated: (WebViewController webViewController) {
            _controller.complete(webViewController);
          },
        ));
  }
}

