import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class TestWebview extends StatefulWidget {
  const TestWebview({Key? key}) : super(key: key);

  @override
  State<TestWebview> createState() => _TestWebviewState();
}

class _TestWebviewState extends State<TestWebview> {
  @override
  void initState() {
    super.initState();
    // Enable virtual display.
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return const WebView(
      debuggingEnabled: true,
      initialUrl: "https://flutter.dev",
    );
  }
}
