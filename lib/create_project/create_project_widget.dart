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
import 'create_project_model.dart';
export 'create_project_model.dart';

class CreateProjectWidget extends StatefulWidget {
  const CreateProjectWidget({
    Key? key,
    this.projectRef,
  }) : super(key: key);

  final DocumentReference? projectRef;

  @override
  _CreateProjectWidgetState createState() => _CreateProjectWidgetState();
}

class _CreateProjectWidgetState extends State<CreateProjectWidget> {
  late CreateProjectModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreateProjectModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'CreateProject'});
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
    return StreamBuilder<ProjectsRecord>(
      stream: ProjectsRecord.getDocument(widget.projectRef!),
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
        final createProjectProjectsRecord = snapshot.data!;
        return Title(
            title: 'CreateProject',
            color: FlutterFlowTheme.of(context).primaryColor,
            child: Scaffold(
              key: scaffoldKey,
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
              appBar: AppBar(
                backgroundColor: FlutterFlowTheme.of(context).primaryColor,
                automaticallyImplyLeading: false,
                title: Text(
                  'Edit Project',
                  style: FlutterFlowTheme.of(context).title2.override(
                        fontFamily: 'Poppins',
                        color: Colors.white,
                        fontSize: 22,
                      ),
                ),
                actions: [],
                centerTitle: false,
                elevation: 2,
              ),
              body: SafeArea(
                child: GestureDetector(
                  onTap: () =>
                      FocusScope.of(context).requestFocus(_unfocusNode),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'Details',
                                style: FlutterFlowTheme.of(context).subtitle1,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(20, 0, 20, 16),
                          child: TextFormField(
                            controller: _model.titleController ??=
                                TextEditingController(
                              text: createProjectProjectsRecord.title,
                            ),
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'Title',
                              labelStyle:
                                  FlutterFlowTheme.of(context).bodyText2,
                              hintStyle: FlutterFlowTheme.of(context).bodyText2,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
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
                              filled: true,
                              fillColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              contentPadding:
                                  EdgeInsetsDirectional.fromSTEB(20, 24, 0, 24),
                            ),
                            style: FlutterFlowTheme.of(context).bodyText1,
                            validator: _model.titleControllerValidator
                                .asValidator(context),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 8),
                          child: FutureBuilder<List<DefaultsRecord>>(
                            future: queryDefaultsRecordOnce(
                              queryBuilder: (defaultsRecord) =>
                                  defaultsRecord.where('type',
                                      isEqualTo: 'project-description'),
                              singleRecord: true,
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 50,
                                    height: 50,
                                    child: SpinKitCubeGrid(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryColor,
                                      size: 50,
                                    ),
                                  ),
                                );
                              }
                              List<DefaultsRecord>
                                  descriptionDefaultsRecordList =
                                  snapshot.data!;
                              final descriptionDefaultsRecord =
                                  descriptionDefaultsRecordList.isNotEmpty
                                      ? descriptionDefaultsRecordList.first
                                      : null;
                              return TextFormField(
                                controller: _model.descriptionController ??=
                                    TextEditingController(
                                  text: createProjectProjectsRecord
                                                  .description !=
                                              null &&
                                          createProjectProjectsRecord
                                                  .description !=
                                              ''
                                      ? createProjectProjectsRecord.description
                                      : descriptionDefaultsRecord!.value,
                                ),
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'Description',
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .bodyText2
                                      .override(
                                        fontFamily: 'Poppins',
                                        fontSize: 14,
                                      ),
                                  hintStyle:
                                      FlutterFlowTheme.of(context).bodyText2,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
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
                                  filled: true,
                                  fillColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  contentPadding:
                                      EdgeInsetsDirectional.fromSTEB(
                                          20, 24, 0, 24),
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Poppins',
                                      fontSize: 12,
                                    ),
                                maxLines: 7,
                                keyboardType: TextInputType.multiline,
                                validator: _model.descriptionControllerValidator
                                    .asValidator(context),
                              );
                            },
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(20, 0, 20, 16),
                          child: TextFormField(
                            controller: _model.keywordsController ??=
                                TextEditingController(
                              text: functions.getStringFromKeywordArray(
                                  createProjectProjectsRecord.keywords!
                                      .toList()),
                            ),
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'Keywords',
                              labelStyle:
                                  FlutterFlowTheme.of(context).bodyText2,
                              hintStyle: FlutterFlowTheme.of(context).bodyText2,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
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
                              filled: true,
                              fillColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              contentPadding:
                                  EdgeInsetsDirectional.fromSTEB(20, 24, 0, 24),
                            ),
                            style: FlutterFlowTheme.of(context).bodyText1,
                            validator: _model.keywordsControllerValidator
                                .asValidator(context),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'Completeness',
                                style: FlutterFlowTheme.of(context).subtitle1,
                              ),
                            ],
                          ),
                        ),
                        Slider(
                          activeColor:
                              FlutterFlowTheme.of(context).primaryColor,
                          inactiveColor: Color(0xFF9E9E9E),
                          min: 0,
                          max: 100,
                          value: _model.sliderValue ??= valueOrDefault<double>(
                            createProjectProjectsRecord.completeness,
                            0.0,
                          ),
                          label: _model.sliderValue.toString(),
                          divisions: 20,
                          onChanged: (newValue) {
                            setState(() => _model.sliderValue = newValue);
                          },
                        ),
                        wrapWithModel(
                          model: _model.projectCompletenessModel,
                          updateCallback: () => setState(() {}),
                          child: ProjectCompletenessWidget(
                            completeness: _model.sliderValue,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'Stream Details',
                                style: FlutterFlowTheme.of(context).subtitle1,
                              ),
                            ],
                          ),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                              child: InkWell(
                                onTap: () async {
                                  logFirebaseEvent(
                                      'CREATE_PROJECT_StreamJustification_ON_TA');
                                  logFirebaseEvent(
                                      'StreamJustification_navigate_to');
                                  await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => StreamHelpWidget(),
                                    ),
                                  );
                                },
                                child: Text(
                                  'The easiest way to connect with potential partners is to setup a reccuring stream for your project. Tap to learn more.',
                                  textAlign: TextAlign.start,
                                  style: FlutterFlowTheme.of(context).bodyText2,
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(20, 0, 20, 16),
                              child: TextFormField(
                                controller: _model.streamLinkController ??=
                                    TextEditingController(
                                  text: createProjectProjectsRecord.stream,
                                ),
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'Link to Stream',
                                  labelStyle:
                                      FlutterFlowTheme.of(context).bodyText2,
                                  hintStyle:
                                      FlutterFlowTheme.of(context).bodyText2,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
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
                                  filled: true,
                                  fillColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  contentPadding:
                                      EdgeInsetsDirectional.fromSTEB(
                                          20, 24, 0, 24),
                                ),
                                style: FlutterFlowTheme.of(context).bodyText1,
                                validator: _model.streamLinkControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'Relevant Skills',
                                style: FlutterFlowTheme.of(context).subtitle1,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(4, 4, 4, 0),
                          child: FutureBuilder<List<SkillsRecord>>(
                            future: querySkillsRecordOnce(),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 50,
                                    height: 50,
                                    child: SpinKitCubeGrid(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryColor,
                                      size: 50,
                                    ),
                                  ),
                                );
                              }
                              List<SkillsRecord>
                                  listViewSkillsSkillsRecordList =
                                  snapshot.data!;
                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount:
                                    listViewSkillsSkillsRecordList.length,
                                itemBuilder: (context, listViewSkillsIndex) {
                                  final listViewSkillsSkillsRecord =
                                      listViewSkillsSkillsRecordList[
                                          listViewSkillsIndex];
                                  return EditableProjSkillRatingWidget(
                                    key: Key(
                                        'Key75d_${listViewSkillsIndex}_of_${listViewSkillsSkillsRecordList.length}'),
                                    skillDoc: listViewSkillsSkillsRecord,
                                    project: createProjectProjectsRecord,
                                  );
                                },
                              );
                            },
                          ),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 12, 0, 6),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  logFirebaseEvent(
                                      'CREATE_PROJECT_PAGE_DELETE_BTN_ON_TAP');
                                  logFirebaseEvent('Button_backend_call');
                                  await createProjectProjectsRecord.reference
                                      .delete();
                                  logFirebaseEvent('Button_navigate_to');
                                  await Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          NavBarPage(initialPage: 'Browse'),
                                    ),
                                    (r) => false,
                                  );
                                },
                                text: 'Delete',
                                options: FFButtonOptions(
                                  width: 130,
                                  height: 40,
                                  color: FlutterFlowTheme.of(context).alternate,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .subtitle2
                                      .override(
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
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(20, 0, 20, 10),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  logFirebaseEvent(
                                      'CREATE_PROJECT_PAGE_DoneButton_ON_TAP');
                                  logFirebaseEvent('DoneButton_backend_call');

                                  final projectsUpdateData = {
                                    ...createProjectsRecordData(
                                      description:
                                          _model.descriptionController.text,
                                      title: _model.titleController.text,
                                      stream: _model.streamLinkController.text,
                                      completeness: _model.sliderValue,
                                    ),
                                    'keywords':
                                        functions.getArrayFromKeywordString(
                                            valueOrDefault<String>(
                                      _model.keywordsController.text,
                                      'fun',
                                    )),
                                  };
                                  await widget.projectRef!
                                      .update(projectsUpdateData);
                                  logFirebaseEvent('DoneButton_navigate_to');
                                  await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          NavBarPage(initialPage: 'Browse'),
                                    ),
                                  );
                                },
                                text: 'Done',
                                options: FFButtonOptions(
                                  width: double.infinity,
                                  height: 60,
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .subtitle2
                                      .override(
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
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ));
      },
    );
  }
}
