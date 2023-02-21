import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/project_completeness_widget.dart';
import '../components/skilltag_widget.dart';
import '../create_project/create_project_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../profile_view/profile_view_widget.dart';
import '../custom_code/widgets/index.dart' as custom_widgets;
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProjectModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Model for ProjectCompleteness component.
  late ProjectCompletenessModel projectCompletenessModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    projectCompletenessModel =
        createModel(context, () => ProjectCompletenessModel());
  }

  void dispose() {
    projectCompletenessModel.dispose();
  }

  /// Additional helper methods are added here.

}
