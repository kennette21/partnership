import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/editable_proj_skill_rating_widget.dart';
import '../components/project_completeness_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../main.dart';
import '../stream_help/stream_help_widget.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CreateProjectModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Title widget.
  TextEditingController? titleController;
  String? Function(BuildContext, String?)? titleControllerValidator;
  // State field(s) for Description widget.
  TextEditingController? descriptionController;
  String? Function(BuildContext, String?)? descriptionControllerValidator;
  // State field(s) for Keywords widget.
  TextEditingController? keywordsController;
  String? Function(BuildContext, String?)? keywordsControllerValidator;
  // State field(s) for Slider widget.
  double? sliderValue;
  // Model for ProjectCompleteness component.
  late ProjectCompletenessModel projectCompletenessModel;
  // State field(s) for StreamLink widget.
  TextEditingController? streamLinkController;
  String? Function(BuildContext, String?)? streamLinkControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    projectCompletenessModel =
        createModel(context, () => ProjectCompletenessModel());
  }

  void dispose() {
    titleController?.dispose();
    descriptionController?.dispose();
    keywordsController?.dispose();
    projectCompletenessModel.dispose();
    streamLinkController?.dispose();
  }

  /// Additional helper methods are added here.

}
