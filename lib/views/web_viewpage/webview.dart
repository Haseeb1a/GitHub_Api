import 'dart:async';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../helpers/colors.dart';

class ArticleScreen extends StatelessWidget {
  ArticleScreen({super.key, required this.blogUrl});

  final String blogUrl;

  final Completer<WebViewController> _completer =
      Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.black,
        title: const Text.rich(TextSpan(children: <InlineSpan>[
          TextSpan(
            text: 'GIT ',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colorss.white),
          ),
          TextSpan(
            text: 'HUB',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colorss.green),
          )
        ])),
        actions: [
          CircleAvatar(
            radius: 50,
            child: Image.network(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRlVvaUaLaNpixP_VC6ZkFfa44mDqvDK7-qH7SGhiLIalxqeJTjFz2isCd1lH8_kPmKqNI&usqp=CAU'),
          )
        ],
      ),
      body: Container(
        child: WebView(
          initialUrl: blogUrl,
          onWebViewCreated: (controller) {
            _completer.complete(controller);
          },
        ),
      ),
    );
  }
}
