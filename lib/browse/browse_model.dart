import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/edit_profile_prompt_widget.dart';
import '../create_project/create_project_widget.dart';
import '../flutter_flow/flutter_flow_choice_chips.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../project/project_widget.dart';
import '../streams_page/streams_page_widget.dart';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BrowseModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // State field(s) for searchField widget.
  TextEditingController? searchFieldController;
  String? Function(BuildContext, String?)? searchFieldControllerValidator;
  // State field(s) for SkillChoices widget.
  List<String>? skillChoicesValues;
  Completer<List<ProjectsRecord>>? algoliaRequestCompleter;
  // Stores action output result for [Backend Call - Create Document] action in FloatingActionButton widget.
  ProjectsRecord? newProjectRef;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    searchFieldController?.dispose();
  }

  /// Additional helper methods are added here.

  Future waitForAlgoliaRequestCompleter({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = algoliaRequestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
