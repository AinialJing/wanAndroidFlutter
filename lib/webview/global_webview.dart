import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class GlobalWebView extends StatelessWidget {
  const GlobalWebView({super.key});

  @override
  Widget build(BuildContext context) {
    String url = ModalRoute.of(context)?.settings.arguments as String;
    WebViewController webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(url));
    return Scaffold(
      body: WebViewWidget(controller: webViewController),
    );
  }
}
