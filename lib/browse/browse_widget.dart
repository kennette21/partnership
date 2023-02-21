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
import 'browse_model.dart';
export 'browse_model.dart';

class BrowseWidget extends StatefulWidget {
  const BrowseWidget({Key? key}) : super(key: key);

  @override
  _BrowseWidgetState createState() => _BrowseWidgetState();
}

class _BrowseWidgetState extends State<BrowseWidget> {
  late BrowseModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BrowseModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Browse'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('BROWSE_PAGE_Browse_ON_PAGE_LOAD');
      if (valueOrDefault(currentUserDocument?.bio, '') == null ||
          valueOrDefault(currentUserDocument?.bio, '') == '') {
        logFirebaseEvent('Browse_bottom_sheet');
        await showModalBottomSheet(
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          context: context,
          builder: (context) {
            return Padding(
              padding: MediaQuery.of(context).viewInsets,
              child: EditProfilePromptWidget(),
            );
          },
        ).then((value) => setState(() {}));

        return;
      } else {
        return;
      }
    });

    _model.searchFieldController ??= TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Title(
        title: 'Browse',
        color: FlutterFlowTheme.of(context).primaryColor,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          floatingActionButton: Visibility(
            visible:
                valueOrDefault<bool>(currentUserDocument?.isFounder, false),
            child: AuthUserStreamWidget(
              builder: (context) => FloatingActionButton(
                onPressed: () async {
                  logFirebaseEvent('BROWSE_FloatingActionButton_i6jsit4h_ON_');
                  logFirebaseEvent('FloatingActionButton_backend_call');

                  final projectsCreateData = createProjectsRecordData(
                    founder: currentUserReference,
                  );
                  var projectsRecordReference = ProjectsRecord.collection.doc();
                  await projectsRecordReference.set(projectsCreateData);
                  _model.newProjectRef = ProjectsRecord.getDocumentFromData(
                      projectsCreateData, projectsRecordReference);
                  logFirebaseEvent('FloatingActionButton_navigate_to');
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CreateProjectWidget(
                        projectRef: _model.newProjectRef!.reference,
                      ),
                    ),
                  );

                  setState(() {});
                },
                backgroundColor: FlutterFlowTheme.of(context).primaryColor,
                elevation: 8,
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 36,
                ),
              ),
            ),
          ),
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            automaticallyImplyLeading: false,
            title: Text(
              'Projects',
              style: FlutterFlowTheme.of(context).title1.override(
                    fontFamily: 'Lexend Deca',
                    color: FlutterFlowTheme.of(context).primaryText,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            actions: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(6, 10, 6, 10),
                child: FFButtonWidget(
                  onPressed: () async {
                    logFirebaseEvent('BROWSE_PAGE_STREAMS_BTN_ON_TAP');
                    logFirebaseEvent('Button_navigate_to');
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => StreamsPageWidget(),
                      ),
                    );
                  },
                  text: 'Streams',
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
            ],
            centerTitle: false,
            elevation: 0,
          ),
          body: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Material(
                      color: Colors.transparent,
                      elevation: 0,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 60,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 5,
                              color: Color(0x430F1113),
                              offset: Offset(0, 2),
                            )
                          ],
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(20, 4, 20, 0),
                          child: TextFormField(
                            controller: _model.searchFieldController,
                            onChanged: (_) => EasyDebounce.debounce(
                              '_model.searchFieldController',
                              Duration(milliseconds: 500),
                              () => setState(() {}),
                            ),
                            obscureText: false,
                            decoration: InputDecoration(
                              hintText: 'Search for classes here...',
                              hintStyle: FlutterFlowTheme.of(context)
                                  .bodyText2
                                  .override(
                                    fontFamily: 'Lexend Deca',
                                    color: Color(0xFF95A1AC),
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                  ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFFF1F4F8),
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
                              prefixIcon: Icon(
                                Icons.search_rounded,
                                color: Color(0xFF95A1AC),
                                size: 24,
                              ),
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyText1
                                .override(
                                  fontFamily: 'Lexend Deca',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                ),
                            validator: _model.searchFieldControllerValidator
                                .asValidator(context),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 12, 20, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'Skill Tags',
                        style: FlutterFlowTheme.of(context).bodyText2.override(
                              fontFamily: 'Lexend Deca',
                              color: Color(0xFF95A1AC),
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                      ),
                    ],
                  ),
                ),
                Wrap(
                  spacing: 0,
                  runSpacing: 0,
                  alignment: WrapAlignment.start,
                  crossAxisAlignment: WrapCrossAlignment.start,
                  direction: Axis.horizontal,
                  runAlignment: WrapAlignment.start,
                  verticalDirection: VerticalDirection.down,
                  clipBehavior: Clip.none,
                  children: [
                    FutureBuilder<List<SkillsRecord>>(
                      future: querySkillsRecordOnce(),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 50,
                              height: 50,
                              child: SpinKitCubeGrid(
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                                size: 50,
                              ),
                            ),
                          );
                        }
                        List<SkillsRecord> skillChoicesSkillsRecordList =
                            snapshot.data!;
                        return FlutterFlowChoiceChips(
                          options: skillChoicesSkillsRecordList
                              .map((e) => e.name)
                              .withoutNulls
                              .toList()
                              .map((label) => ChipData(label))
                              .toList(),
                          onChanged: (val) =>
                              setState(() => _model.skillChoicesValues = val),
                          selectedChipStyle: ChipStyle(
                            backgroundColor:
                                FlutterFlowTheme.of(context).tertiaryColor,
                            textStyle: FlutterFlowTheme.of(context)
                                .bodyText1
                                .override(
                                  fontFamily: 'Poppins',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                ),
                            iconColor: Colors.white,
                            iconSize: 18,
                            elevation: 4,
                          ),
                          unselectedChipStyle: ChipStyle(
                            backgroundColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            textStyle:
                                FlutterFlowTheme.of(context).bodyText2.override(
                                      fontFamily: 'Poppins',
                                      color: FlutterFlowTheme.of(context)
                                          .tertiaryColor,
                                    ),
                            iconColor:
                                FlutterFlowTheme.of(context).secondaryText,
                            iconSize: 18,
                            elevation: 4,
                          ),
                          chipSpacing: 8,
                          multiselect: true,
                          initialized: _model.skillChoicesValues != null,
                          alignment: WrapAlignment.start,
                        );
                      },
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 8, 20, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'Projects',
                        style: FlutterFlowTheme.of(context).bodyText2.override(
                              fontFamily: 'Lexend Deca',
                              color: Color(0xFF95A1AC),
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                      ),
                    ],
                  ),
                ),
                if (_model.searchFieldController.text == null ||
                    _model.searchFieldController.text == '')
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 50),
                    child: StreamBuilder<List<ProjectsRecord>>(
                      stream: queryProjectsRecord(
                        queryBuilder: (projectsRecord) =>
                            projectsRecord.whereArrayContainsAny(
                                'keywords',
                                _model.skillChoicesValues != ''
                                    ? _model.skillChoicesValues
                                    : null),
                        limit: 10,
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 50,
                              height: 50,
                              child: SpinKitCubeGrid(
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                                size: 50,
                              ),
                            ),
                          );
                        }
                        List<ProjectsRecord> rowProjectsProjectsRecordList =
                            snapshot.data!;
                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          primary: false,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: rowProjectsProjectsRecordList.length,
                          itemBuilder: (context, rowProjectsIndex) {
                            final rowProjectsProjectsRecord =
                                rowProjectsProjectsRecordList[rowProjectsIndex];
                            return Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(4, 0, 4, 6),
                              child: InkWell(
                                onTap: () async {
                                  logFirebaseEvent(
                                      'BROWSE_PAGE_ProjectCar_ON_TAP');
                                  logFirebaseEvent('ProjectCar_navigate_to');
                                  await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ProjectWidget(
                                        projectRef:
                                            rowProjectsProjectsRecord.reference,
                                      ),
                                    ),
                                  );
                                },
                                child: Card(
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8, 12, 8, 12),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        StreamBuilder<UsersRecord>(
                                          stream: UsersRecord.getDocument(
                                              rowProjectsProjectsRecord
                                                  .founder!),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: SizedBox(
                                                  width: 50,
                                                  height: 50,
                                                  child: SpinKitCubeGrid(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryColor,
                                                    size: 50,
                                                  ),
                                                ),
                                              );
                                            }
                                            final circleImageUsersRecord =
                                                snapshot.data!;
                                            return Container(
                                              width: 40,
                                              height: 40,
                                              clipBehavior: Clip.antiAlias,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                              ),
                                              child: Image.network(
                                                circleImageUsersRecord
                                                    .photoUrl!,
                                                fit: BoxFit.cover,
                                              ),
                                            );
                                          },
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12, 0, 0, 0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  rowProjectsProjectsRecord
                                                      .title!,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .subtitle2
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        color:
                                                            Color(0xFF4B39EF),
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                                ),
                                                if (rowProjectsProjectsRecord
                                                        .keywords!
                                                        .toList()
                                                        .length >
                                                    0)
                                                  Builder(
                                                    builder: (context) {
                                                      final keyword =
                                                          rowProjectsProjectsRecord
                                                              .keywords!
                                                              .toList()
                                                              .take(4)
                                                              .toList();
                                                      return Wrap(
                                                        spacing: 0,
                                                        runSpacing: 0,
                                                        alignment:
                                                            WrapAlignment.start,
                                                        crossAxisAlignment:
                                                            WrapCrossAlignment
                                                                .start,
                                                        direction:
                                                            Axis.horizontal,
                                                        runAlignment:
                                                            WrapAlignment.start,
                                                        verticalDirection:
                                                            VerticalDirection
                                                                .down,
                                                        clipBehavior: Clip.none,
                                                        children: List.generate(
                                                            keyword.length,
                                                            (keywordIndex) {
                                                          final keywordItem =
                                                              keyword[
                                                                  keywordIndex];
                                                          return Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0,
                                                                        0,
                                                                        4,
                                                                        0),
                                                            child: Container(
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            4,
                                                                            2,
                                                                            4,
                                                                            2),
                                                                child: Text(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    keywordItem,
                                                                    'fun',
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText2
                                                                      .override(
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        color: Color(
                                                                            0xFF6E60EE),
                                                                        fontSize:
                                                                            10,
                                                                        fontWeight:
                                                                            FontWeight.w300,
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        }),
                                                      );
                                                    },
                                                  ),
                                                StreamBuilder<
                                                    List<RatingsRecord>>(
                                                  stream: queryRatingsRecord(
                                                    queryBuilder: (ratingsRecord) =>
                                                        ratingsRecord.where(
                                                            'project',
                                                            isEqualTo:
                                                                rowProjectsProjectsRecord
                                                                    .reference),
                                                    limit: 6,
                                                  ),
                                                  builder: (context, snapshot) {
                                                    // Customize what your widget looks like when it's loading.
                                                    if (!snapshot.hasData) {
                                                      return Center(
                                                        child: SizedBox(
                                                          width: 50,
                                                          height: 50,
                                                          child:
                                                              SpinKitCubeGrid(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryColor,
                                                            size: 50,
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                    List<RatingsRecord>
                                                        wrapRatingsRecordList =
                                                        snapshot.data!;
                                                    return Wrap(
                                                      spacing: 0,
                                                      runSpacing: 0,
                                                      alignment:
                                                          WrapAlignment.start,
                                                      crossAxisAlignment:
                                                          WrapCrossAlignment
                                                              .start,
                                                      direction:
                                                          Axis.horizontal,
                                                      runAlignment:
                                                          WrapAlignment.start,
                                                      verticalDirection:
                                                          VerticalDirection
                                                              .down,
                                                      clipBehavior: Clip.none,
                                                      children: List.generate(
                                                          wrapRatingsRecordList
                                                              .length,
                                                          (wrapIndex) {
                                                        final wrapRatingsRecord =
                                                            wrapRatingsRecordList[
                                                                wrapIndex];
                                                        return Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(4,
                                                                      2, 4, 2),
                                                          child: Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          4),
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          4,
                                                                          2,
                                                                          4,
                                                                          2),
                                                              child: StreamBuilder<
                                                                  SkillsRecord>(
                                                                stream: SkillsRecord
                                                                    .getDocument(
                                                                        wrapRatingsRecord
                                                                            .skill!),
                                                                builder: (context,
                                                                    snapshot) {
                                                                  // Customize what your widget looks like when it's loading.
                                                                  if (!snapshot
                                                                      .hasData) {
                                                                    return Center(
                                                                      child:
                                                                          SizedBox(
                                                                        width:
                                                                            50,
                                                                        height:
                                                                            50,
                                                                        child:
                                                                            SpinKitCubeGrid(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryColor,
                                                                          size:
                                                                              50,
                                                                        ),
                                                                      ),
                                                                    );
                                                                  }
                                                                  final textSkillsRecord =
                                                                      snapshot
                                                                          .data!;
                                                                  return Text(
                                                                    textSkillsRecord
                                                                        .name!,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyText1
                                                                        .override(
                                                                          fontFamily:
                                                                              'Poppins',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).tertiaryColor,
                                                                          fontSize:
                                                                              12,
                                                                          fontWeight:
                                                                              FontWeight.normal,
                                                                        ),
                                                                  );
                                                                },
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      }),
                                                    );
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                if (_model.searchFieldController.text != null &&
                    _model.searchFieldController.text != '')
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 50),
                    child: FutureBuilder<List<ProjectsRecord>>(
                      future: (_model.algoliaRequestCompleter ??=
                              Completer<List<ProjectsRecord>>()
                                ..complete(ProjectsRecord.search(
                                  term: _model.searchFieldController.text,
                                )))
                          .future,
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 50,
                              height: 50,
                              child: SpinKitCubeGrid(
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                                size: 50,
                              ),
                            ),
                          );
                        }
                        List<ProjectsRecord>
                            rowSearchProjectsProjectsRecordList =
                            snapshot.data!;
                        // Customize what your widget looks like with no search results.
                        if (snapshot.data!.isEmpty) {
                          return Container(
                            height: 100,
                            child: Center(
                              child: Text('No results.'),
                            ),
                          );
                        }
                        return RefreshIndicator(
                          onRefresh: () async {
                            logFirebaseEvent(
                                'BROWSE_Row-SearchProjects_ON_PULL_TO_REF');
                            logFirebaseEvent(
                                'Row-SearchProjects_refresh_database_requ');
                            setState(
                                () => _model.algoliaRequestCompleter = null);
                            await _model.waitForAlgoliaRequestCompleter();
                          },
                          child: ListView.builder(
                            padding: EdgeInsets.zero,
                            primary: false,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount:
                                rowSearchProjectsProjectsRecordList.length,
                            itemBuilder: (context, rowSearchProjectsIndex) {
                              final rowSearchProjectsProjectsRecord =
                                  rowSearchProjectsProjectsRecordList[
                                      rowSearchProjectsIndex];
                              return Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(4, 0, 4, 6),
                                child: InkWell(
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'BROWSE_PAGE_ProjectCar_ON_TAP');
                                    logFirebaseEvent('ProjectCar_navigate_to');
                                    await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ProjectWidget(
                                          projectRef:
                                              rowSearchProjectsProjectsRecord
                                                  .reference,
                                        ),
                                      ),
                                    );
                                  },
                                  child: Card(
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8, 12, 8, 12),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          StreamBuilder<UsersRecord>(
                                            stream: UsersRecord.getDocument(
                                                rowSearchProjectsProjectsRecord
                                                    .founder!),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child: SizedBox(
                                                    width: 50,
                                                    height: 50,
                                                    child: SpinKitCubeGrid(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryColor,
                                                      size: 50,
                                                    ),
                                                  ),
                                                );
                                              }
                                              final circleImageUsersRecord =
                                                  snapshot.data!;
                                              return Container(
                                                width: 40,
                                                height: 40,
                                                clipBehavior: Clip.antiAlias,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Image.network(
                                                  circleImageUsersRecord
                                                      .photoUrl!,
                                                  fit: BoxFit.cover,
                                                ),
                                              );
                                            },
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(12, 0, 0, 0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    rowSearchProjectsProjectsRecord
                                                        .title!,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .subtitle2
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          color:
                                                              Color(0xFF4B39EF),
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                  ),
                                                  if (rowSearchProjectsProjectsRecord
                                                          .keywords!
                                                          .toList()
                                                          .length >
                                                      0)
                                                    Builder(
                                                      builder: (context) {
                                                        if (rowSearchProjectsProjectsRecord
                                                                .keywords!
                                                                .toList() ==
                                                            null) {
                                                          return Center(
                                                            child: SizedBox(
                                                              width: 50,
                                                              height: 50,
                                                              child:
                                                                  SpinKitCubeGrid(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryColor,
                                                                size: 50,
                                                              ),
                                                            ),
                                                          );
                                                        }
                                                        final keyword =
                                                            rowSearchProjectsProjectsRecord
                                                                .keywords!
                                                                .toList()
                                                                .take(4)
                                                                .toList();
                                                        return Wrap(
                                                          spacing: 0,
                                                          runSpacing: 0,
                                                          alignment:
                                                              WrapAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              WrapCrossAlignment
                                                                  .start,
                                                          direction:
                                                              Axis.horizontal,
                                                          runAlignment:
                                                              WrapAlignment
                                                                  .start,
                                                          verticalDirection:
                                                              VerticalDirection
                                                                  .down,
                                                          clipBehavior:
                                                              Clip.none,
                                                          children: List.generate(
                                                              keyword.length,
                                                              (keywordIndex) {
                                                            final keywordItem =
                                                                keyword[
                                                                    keywordIndex];
                                                            return Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          0,
                                                                          4,
                                                                          0),
                                                              child: Container(
                                                                decoration:
                                                                    BoxDecoration(),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          4,
                                                                          2,
                                                                          4,
                                                                          2),
                                                                  child: Text(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      keywordItem,
                                                                      'fun',
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyText2
                                                                        .override(
                                                                          fontFamily:
                                                                              'Poppins',
                                                                          color:
                                                                              Color(0xFF6E60EE),
                                                                          fontSize:
                                                                              10,
                                                                          fontWeight:
                                                                              FontWeight.w300,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                            );
                                                          }),
                                                        );
                                                      },
                                                    ),
                                                  StreamBuilder<
                                                      List<RatingsRecord>>(
                                                    stream: queryRatingsRecord(
                                                      queryBuilder: (ratingsRecord) =>
                                                          ratingsRecord.where(
                                                              'project',
                                                              isEqualTo:
                                                                  rowSearchProjectsProjectsRecord
                                                                      .reference),
                                                    ),
                                                    builder:
                                                        (context, snapshot) {
                                                      // Customize what your widget looks like when it's loading.
                                                      if (!snapshot.hasData) {
                                                        return Center(
                                                          child: SizedBox(
                                                            width: 50,
                                                            height: 50,
                                                            child:
                                                                SpinKitCubeGrid(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryColor,
                                                              size: 50,
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                      List<RatingsRecord>
                                                          wrapRatingsRecordList =
                                                          snapshot.data!;
                                                      return Wrap(
                                                        spacing: 0,
                                                        runSpacing: 0,
                                                        alignment:
                                                            WrapAlignment.start,
                                                        crossAxisAlignment:
                                                            WrapCrossAlignment
                                                                .start,
                                                        direction:
                                                            Axis.horizontal,
                                                        runAlignment:
                                                            WrapAlignment.start,
                                                        verticalDirection:
                                                            VerticalDirection
                                                                .down,
                                                        clipBehavior: Clip.none,
                                                        children: List.generate(
                                                            wrapRatingsRecordList
                                                                .length,
                                                            (wrapIndex) {
                                                          final wrapRatingsRecord =
                                                              wrapRatingsRecordList[
                                                                  wrapIndex];
                                                          return Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        4,
                                                                        2,
                                                                        4,
                                                                        2),
                                                            child: Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            4),
                                                              ),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            4,
                                                                            2,
                                                                            4,
                                                                            2),
                                                                child: StreamBuilder<
                                                                    SkillsRecord>(
                                                                  stream: SkillsRecord
                                                                      .getDocument(
                                                                          wrapRatingsRecord
                                                                              .skill!),
                                                                  builder: (context,
                                                                      snapshot) {
                                                                    // Customize what your widget looks like when it's loading.
                                                                    if (!snapshot
                                                                        .hasData) {
                                                                      return Center(
                                                                        child:
                                                                            SizedBox(
                                                                          width:
                                                                              50,
                                                                          height:
                                                                              50,
                                                                          child:
                                                                              SpinKitCubeGrid(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryColor,
                                                                            size:
                                                                                50,
                                                                          ),
                                                                        ),
                                                                      );
                                                                    }
                                                                    final textSkillsRecord =
                                                                        snapshot
                                                                            .data!;
                                                                    return Text(
                                                                      textSkillsRecord
                                                                          .name!,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyText1
                                                                          .override(
                                                                            fontFamily:
                                                                                'Poppins',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).tertiaryColor,
                                                                            fontSize:
                                                                                12,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                          ),
                                                                    );
                                                                  },
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        }),
                                                      );
                                                    },
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ),
              ],
            ),
          ),
        ));
  }
}
