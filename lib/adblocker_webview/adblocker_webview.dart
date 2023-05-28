import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class AdBlockerWebView extends StatefulWidget {
  final String url;

  AdBlockerWebView({required this.url});

  @override
  _AdBlockerWebViewState createState() => _AdBlockerWebViewState();
}

class _AdBlockerWebViewState extends State<AdBlockerWebView> {
  late InAppWebViewController _webViewController;
  bool _isLoading = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ad Blocker WebView'),
      ),
      body: Stack(
        children: [
          InAppWebView(
            initialUrlRequest: URLRequest(url: Uri.parse(widget.url)),
            initialOptions: InAppWebViewGroupOptions(
              crossPlatform: InAppWebViewOptions(),
            ),
            onWebViewCreated: (InAppWebViewController controller) {
              _webViewController = controller;
            },
            onLoadStart: (InAppWebViewController controller, Uri? url) {
              setState(() {
                _isLoading = true;
              });
            },
            onLoadStop: (InAppWebViewController controller, Uri? url) {
              setState(() {
                _isLoading = false;
              });
            },
          ),
          if (_isLoading)
            Center(
              child: CircularProgressIndicator(),
            ),
        ],
      ),
    );
  }
}
