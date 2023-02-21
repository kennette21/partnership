import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'project_completeness_model.dart';
export 'project_completeness_model.dart';

class ProjectCompletenessWidget extends StatefulWidget {
  const ProjectCompletenessWidget({
    Key? key,
    this.completeness,
  }) : super(key: key);

  final double? completeness;

  @override
  _ProjectCompletenessWidgetState createState() =>
      _ProjectCompletenessWidgetState();
}

class _ProjectCompletenessWidgetState extends State<ProjectCompletenessWidget> {
  late ProjectCompletenessModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProjectCompletenessModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 30,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: FlutterFlowTheme.of(context).primaryColor,
        ),
      ),
      alignment: AlignmentDirectional(0, 0.10000000000000009),
      child: SelectionArea(
          child: Text(
        valueOrDefault<String>(
          functions.getCompletenessStringFromNumber(widget.completeness!),
          '0',
        ),
        textAlign: TextAlign.center,
        style: FlutterFlowTheme.of(context).bodyText1.override(
              fontFamily: 'Poppins',
              color: FlutterFlowTheme.of(context).primaryColor,
            ),
      )),
    );
  }
}
