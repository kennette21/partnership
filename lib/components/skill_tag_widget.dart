import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SkillTagWidget extends StatefulWidget {
  const SkillTagWidget({Key? key}) : super(key: key);

  @override
  _SkillTagWidgetState createState() => _SkillTagWidgetState();
}

class _SkillTagWidgetState extends State<SkillTagWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 4, 0),
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFFE6E6E6),
          borderRadius: BorderRadius.circular(2),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(4, 2, 4, 2),
          child: Text(
            'Tag',
            style: TextStyle(
              color: Color(0xFF607D8B),
              fontWeight: FontWeight.w300,
              fontSize: 13,
            ),
          ),
        ),
      ),
    );
  }
}
