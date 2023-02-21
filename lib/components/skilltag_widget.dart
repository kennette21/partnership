import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'skilltag_model.dart';
export 'skilltag_model.dart';

class SkilltagWidget extends StatefulWidget {
  const SkilltagWidget({
    Key? key,
    this.value,
    this.selected,
  }) : super(key: key);

  final String? value;
  final bool? selected;

  @override
  _SkilltagWidgetState createState() => _SkilltagWidgetState();
}

class _SkilltagWidgetState extends State<SkilltagWidget> {
  late SkilltagModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SkilltagModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 4, 4),
      child: Container(
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primaryBackground,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(4, 2, 4, 2),
          child: Text(
            widget.value!,
            textAlign: TextAlign.center,
            style: FlutterFlowTheme.of(context).bodyText2.override(
                  fontFamily: 'Poppins',
                  color: FlutterFlowTheme.of(context).tertiaryColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w300,
                ),
          ),
        ),
      ),
    );
  }
}
