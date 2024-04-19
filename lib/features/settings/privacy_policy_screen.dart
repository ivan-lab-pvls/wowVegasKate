import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:vegas/app/main.dart';

@RoutePage()
class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Privacy Policy'),
      ),
      child: SafeArea(
        bottom: false,
        child: InAppWebView(
          initialUrlRequest: URLRequest(
            url: WebUri(
                'https://docs.google.com/document/d/1k2022E9FgDkBCIhk_GhhLy6ZfTQXP5cP8AkQOZCLn0I/edit?usp=sharing'),
          ),
        ),
      ),
    );
  }
}
