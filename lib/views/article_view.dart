import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleView extends StatefulWidget {
  final String postUrl;
  ArticleView({required this.postUrl});

  @override
  State<ArticleView> createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {
  final Completer<WebViewController>_controller= Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("News",style: TextStyle(color: Colors.black87,fontWeight: FontWeight.w600),),
            Text("Trove",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.w600),),
          ],
        ),
        actions: <Widget>[
          Opacity(
            opacity: 0,
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Icon(Icons.share,)),
          )
        ],
        centerTitle: true,
        elevation: 0.0 ,
        backgroundColor: Colors.transparent,
      ),
        body :Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: WebView(
            initialUrl:widget.postUrl ,
            onWebViewCreated: (WebViewController webViewController){
              _controller.complete(webViewController);
            },
          ),
        )
    );

  }
}
