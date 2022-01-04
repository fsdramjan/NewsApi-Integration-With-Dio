import 'dart:io';

import 'package:flutter/material.dart';
import 'package:news_api/src/configs/appColors.dart';
import 'package:news_api/src/widgets/kText.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewContent extends StatefulWidget {
  final String url;
  final String title;
  WebViewContent({
    required this.url,
    required this.title,
  });
  @override
  WebViewContentState createState() => WebViewContentState();
}

class WebViewContentState extends State<WebViewContent> {
  @override
  void initState() {
    super.initState();
    // Enable virtual display.
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: KText(
          text: widget.title,
          color: black,
          fontFamily: medium,
        ),
      ),
      body: WebView(
        initialUrl: widget.url,
      ),
    );
  }
}
