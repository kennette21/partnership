// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
import 'package:flutter_markdown/flutter_markdown.dart';

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
        child: Markdown(
            data: widget.data,
            styleSheet: MarkdownStyleSheet.fromTheme(Theme.of(context))));
  }
}
