import '../backend/backend.dart';
import '../components/broadcast_name_component_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../live_video_page/live_video_page_widget.dart';
import '../recorded_video_page/recorded_video_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'streams_page_model.dart';
export 'streams_page_model.dart';

class StreamsPageWidget extends StatefulWidget {
  const StreamsPageWidget({Key? key}) : super(key: key);

  @override
  _StreamsPageWidgetState createState() => _StreamsPageWidgetState();
}

class _StreamsPageWidgetState extends State<StreamsPageWidget> {
  late StreamsPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StreamsPageModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'StreamsPage'});
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
        title: 'StreamsPage',
        color: FlutterFlowTheme.of(context).primaryColor,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          floatingActionButton: FloatingActionButton(
            onPressed: () async {
              logFirebaseEvent('STREAMS_FloatingActionButton_8veui42d_ON');
              logFirebaseEvent('FloatingActionButton_bottom_sheet');
              await showModalBottomSheet(
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                context: context,
                builder: (context) {
                  return Padding(
                    padding: MediaQuery.of(context).viewInsets,
                    child: BroadcastNameComponentWidget(),
                  );
                },
              ).then((value) => setState(() {}));
            },
            backgroundColor: FlutterFlowTheme.of(context).primaryColor,
            elevation: 8,
            child: Icon(
              Icons.add,
              color: Colors.white,
              size: 32,
            ),
          ),
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            iconTheme:
                IconThemeData(color: FlutterFlowTheme.of(context).primaryText),
            automaticallyImplyLeading: true,
            title: Text(
              'Streams',
              style: FlutterFlowTheme.of(context).title2.override(
                    fontFamily: 'Poppins',
                    color: FlutterFlowTheme.of(context).primaryText,
                    fontSize: 22,
                  ),
            ),
            actions: [],
            centerTitle: false,
            elevation: 2,
          ),
          body: SafeArea(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  StreamBuilder<List<StreamsRecord>>(
                    stream: queryStreamsRecord(
                      queryBuilder: (streamsRecord) =>
                          streamsRecord.orderBy('timestamp', descending: true),
                    ),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 50,
                            height: 50,
                            child: SpinKitCubeGrid(
                              color: FlutterFlowTheme.of(context).primaryColor,
                              size: 50,
                            ),
                          ),
                        );
                      }
                      List<StreamsRecord> listViewStreamsRecordList =
                          snapshot.data!;
                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: listViewStreamsRecordList.length,
                        itemBuilder: (context, listViewIndex) {
                          final listViewStreamsRecord =
                              listViewStreamsRecordList[listViewIndex];
                          return Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(12, 6, 12, 6),
                            child: InkWell(
                              onTap: () async {
                                logFirebaseEvent(
                                    'STREAMS_PAGE_PAGE_Card_gdz9yjy4_ON_TAP');
                                if (listViewStreamsRecord.isLive!) {
                                  logFirebaseEvent('Card_navigate_to');
                                  await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => LiveVideoPageWidget(
                                        streamData: listViewStreamsRecord,
                                      ),
                                    ),
                                  );
                                } else {
                                  logFirebaseEvent('Card_show_snack_bar');
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'This live stream has ended (historical stream playback is coming soon)',
                                        style: TextStyle(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                      ),
                                      duration: Duration(milliseconds: 4000),
                                      backgroundColor: Color(0x00000000),
                                    ),
                                  );
                                }
                              },
                              child: Card(
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          6, 0, 0, 0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            listViewStreamsRecord.playbackName!,
                                            style: FlutterFlowTheme.of(context)
                                                .subtitle1,
                                          ),
                                          Text(
                                            dateTimeFormat(
                                                'relative',
                                                listViewStreamsRecord
                                                    .timestamp!),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText2,
                                          ),
                                        ],
                                      ),
                                    ),
                                    if (listViewStreamsRecord.isLive ?? true)
                                      FlutterFlowIconButton(
                                        borderColor: Colors.transparent,
                                        borderRadius: 30,
                                        borderWidth: 1,
                                        buttonSize: 60,
                                        icon: Icon(
                                          Icons.play_arrow,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 30,
                                        ),
                                        onPressed: () {
                                          print('IconButton pressed ...');
                                        },
                                      ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                  FFButtonWidget(
                    onPressed: () async {
                      logFirebaseEvent('STREAMS_TEST_REC_VID_BTN_ON_TAP');
                      logFirebaseEvent('Button_navigate_to');
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RecordedVideoPageWidget(),
                        ),
                      );
                    },
                    text: 'Test Rec Vid',
                    options: FFButtonOptions(
                      width: 130,
                      height: 40,
                      color: FlutterFlowTheme.of(context).primaryColor,
                      textStyle:
                          FlutterFlowTheme.of(context).subtitle2.override(
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
                ],
              ),
            ),
          ),
        ));
  }
}
