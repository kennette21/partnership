import '../components/skilltag_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SimpleProjectViewSkillsWithFounderModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  // Model for skilltag component.
  late SkilltagModel skilltagModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    skilltagModel = createModel(context, () => SkilltagModel());
  }

  void dispose() {
    skilltagModel.dispose();
  }

  /// Additional helper methods are added here.

}
