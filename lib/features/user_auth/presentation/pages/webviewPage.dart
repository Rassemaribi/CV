import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class WebViewScreen extends StatelessWidget {
  final String url;
  final String pageTitle; // Ajoutez une variable pour stocker le titre de la page

  WebViewScreen({required this.url, required this.pageTitle});

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: url,
      appBar: AppBar(
        title: Text(pageTitle, style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.teal,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              final webViewPlugin = FlutterWebviewPlugin();
              webViewPlugin.reload();
            },
          ),
        ],
      ),
      withZoom: true,
      withLocalStorage: true,
      initialChild: Center(child: CircularProgressIndicator()),
    );
  }
}
