// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:url_launcher/url_launcher.dart';

class MarkdownRenderer extends StatefulWidget {
  const MarkdownRenderer({
    Key? key,
    this.width,
    this.height,
    required this.data,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String data;

  @override
  _MarkdownRendererState createState() => _MarkdownRendererState();
}

class _MarkdownRendererState extends State<MarkdownRenderer> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: MarkdownBody(
            data: widget.data,
            onTapLink: (text, url, title) {
              final Uri parsedUrl = Uri.parse(url!);
              launchUrl(parsedUrl);
            },
            styleSheet: MarkdownStyleSheet.fromTheme(Theme.of(context))));
  }
}
