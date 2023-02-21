import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../backend/cloud_functions/cloud_functions.dart';
import '../flutter_flow/flutter_flow_mux_broadcast.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'dart:io' show Platform;
import 'package:apivideo_live_stream/apivideo_live_stream.dart';
import 'package:flutter/services.dart';
import 'package:wakelock/wakelock.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BroadcastPageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Create Document] action in MuxBroadcast widget.
  StreamsRecord? muxStreamOutput;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {}

  /// Additional helper methods are added here.

}
