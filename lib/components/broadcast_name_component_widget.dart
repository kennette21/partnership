import '../broadcast_page/broadcast_page_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'broadcast_name_component_model.dart';
export 'broadcast_name_component_model.dart';

class BroadcastNameComponentWidget extends StatefulWidget {
  const BroadcastNameComponentWidget({Key? key}) : super(key: key);

  @override
  _BroadcastNameComponentWidgetState createState() =>
      _BroadcastNameComponentWidgetState();
}

class _BroadcastNameComponentWidgetState
    extends State<BroadcastNameComponentWidget> {
  late BroadcastNameComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BroadcastNameComponentModel());

    _model.textController ??= TextEditingController();
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
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16, 24, 16, 24),
            child: TextFormField(
              controller: _model.textController,
              autofocus: true,
              obscureText: false,
              decoration: InputDecoration(
                labelText: 'Stream Name',
                hintText: 'Enter the name for the stream',
                hintStyle: FlutterFlowTheme.of(context).bodyText2,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).primaryText,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0x00000000),
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0x00000000),
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0x00000000),
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              style: FlutterFlowTheme.of(context).bodyText1,
              validator: _model.textControllerValidator.asValidator(context),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
              child: FFButtonWidget(
                onPressed: () async {
                  logFirebaseEvent('BROADCAST_NAME_COMPONENT_CONTINUE_BTN_ON');
                  logFirebaseEvent('Button_navigate_to');
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BroadcastPageWidget(
                        videoName: _model.textController.text,
                      ),
                    ),
                  );
                },
                text: 'Continue',
                options: FFButtonOptions(
                  width: 130,
                  height: 40,
                  color: FlutterFlowTheme.of(context).primaryColor,
                  textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                        fontFamily: 'Poppins',
                        color: Colors.white,
                      ),
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
