import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'stream_help_model.dart';
export 'stream_help_model.dart';

class StreamHelpWidget extends StatefulWidget {
  const StreamHelpWidget({Key? key}) : super(key: key);

  @override
  _StreamHelpWidgetState createState() => _StreamHelpWidgetState();
}

class _StreamHelpWidgetState extends State<StreamHelpWidget> {
  late StreamHelpModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StreamHelpModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'StreamHelp'});
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Title(
        title: 'StreamHelp',
        color: FlutterFlowTheme.of(context).primaryColor,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).primaryColor,
            automaticallyImplyLeading: false,
            leading: FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30,
              borderWidth: 1,
              buttonSize: 60,
              icon: Icon(
                Icons.arrow_back_rounded,
                color: Colors.white,
                size: 30,
              ),
              onPressed: () async {
                logFirebaseEvent('STREAM_HELP_arrow_back_rounded_ICN_ON_TA');
                logFirebaseEvent('IconButton_navigate_back');
                Navigator.pop(context);
              },
            ),
            title: Text(
              'Why Stream',
              style: FlutterFlowTheme.of(context).title2.override(
                    fontFamily: 'Poppins',
                    color: Colors.white,
                    fontSize: 22,
                  ),
            ),
            actions: [],
            centerTitle: true,
            elevation: 2,
          ),
          body: SafeArea(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    'Why Stream?',
                    style: FlutterFlowTheme.of(context).title3,
                  ),
                  Text(
                    'Justification why streaming is good?\n\nWrite a How To for creating a twitch stream and copying google calendar link etc etc',
                    style: FlutterFlowTheme.of(context).bodyText1,
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
