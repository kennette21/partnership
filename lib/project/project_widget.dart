import '../auth/auth_util.dart';
import '../backend/backend.dart';
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
import 'package:google_fonts/google_fonts.dart';

class ProjectWidget extends StatefulWidget {
  const ProjectWidget({
    Key? key,
    this.projectRef,
  }) : super(key: key);

  final DocumentReference? projectRef;

  @override
  _ProjectWidgetState createState() => _ProjectWidgetState();
}

class _ProjectWidgetState extends State<ProjectWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Project'});
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
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
              child: CircularProgressIndicator(
                color: FlutterFlowTheme.of(context).primaryColor,
              ),
            ),
          );
        }
        final projectProjectsRecord = snapshot.data!;
        return Title(
            title: 'Project',
            color: FlutterFlowTheme.of(context).primaryColor,
            child: Scaffold(
              key: scaffoldKey,
              backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
              floatingActionButton: Visibility(
                visible: projectProjectsRecord.founder == currentUserReference,
                child: FloatingActionButton(
                  onPressed: () async {
                    logFirebaseEvent(
                        'PROJECT_FloatingActionButton_hoc7lr47_ON');
                    logFirebaseEvent('FloatingActionButton_Navigate-To');
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CreateProjectWidget(
                          projectRef: widget.projectRef,
                        ),
                      ),
                    );
                  },
                  backgroundColor: FlutterFlowTheme.of(context).primaryColor,
                  elevation: 8,
                  child: Icon(
                    Icons.edit_sharp,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
              ),
              appBar: AppBar(
                backgroundColor: FlutterFlowTheme.of(context).primaryColor,
                automaticallyImplyLeading: true,
                title: Text(
                  projectProjectsRecord.title!,
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
                  onTap: () => FocusScope.of(context).unfocus(),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        StreamBuilder<List<SubscriptionsRecord>>(
                          stream: querySubscriptionsRecord(
                            queryBuilder: (subscriptionsRecord) =>
                                subscriptionsRecord
                                    .where('follower',
                                        isEqualTo: currentUserReference)
                                    .where('project',
                                        isEqualTo: widget.projectRef),
                            singleRecord: true,
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 50,
                                  height: 50,
                                  child: CircularProgressIndicator(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                  ),
                                ),
                              );
                            }
                            List<SubscriptionsRecord>
                                rowFollowSubscriptionsRecordList =
                                snapshot.data!;
                            final rowFollowSubscriptionsRecord =
                                rowFollowSubscriptionsRecordList.isNotEmpty
                                    ? rowFollowSubscriptionsRecordList.first
                                    : null;
                            return Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                if ((rowFollowSubscriptionsRecord != null) ==
                                    true)
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 10, 20, 10),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        logFirebaseEvent(
                                            'PROJECT_PAGE_Following_ON_TAP');
                                        logFirebaseEvent(
                                            'Following_Backend-Call');
                                        await rowFollowSubscriptionsRecord!
                                            .reference
                                            .delete();
                                      },
                                      text: 'Following',
                                      icon: Icon(
                                        Icons.check,
                                        size: 15,
                                      ),
                                      options: FFButtonOptions(
                                        width: 140,
                                        height: 40,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .subtitle2
                                            .override(
                                              fontFamily: 'Poppins',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryColor,
                                            ),
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryColor,
                                          width: 3,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                  ),
                                if ((rowFollowSubscriptionsRecord != null) ==
                                    false)
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 10, 20, 10),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        logFirebaseEvent(
                                            'PROJECT_PAGE_Follow_ON_TAP');
                                        logFirebaseEvent('Follow_Backend-Call');

                                        final subscriptionsCreateData =
                                            createSubscriptionsRecordData(
                                          follower: currentUserReference,
                                          project: widget.projectRef,
                                        );
                                        await SubscriptionsRecord.collection
                                            .doc()
                                            .set(subscriptionsCreateData);
                                      },
                                      text: 'Follow',
                                      icon: Icon(
                                        Icons.add,
                                        size: 15,
                                      ),
                                      options: FFButtonOptions(
                                        width: 130,
                                        height: 40,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryColor,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .subtitle2
                                            .override(
                                              fontFamily: 'Poppins',
                                              color: Colors.white,
                                            ),
                                        elevation: 3,
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                  ),
                              ],
                            );
                          },
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(20, 4, 20, 4),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'Description',
                                style: FlutterFlowTheme.of(context).subtitle2,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          constraints: BoxConstraints(
                            maxHeight: 700,
                          ),
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Container(
                            width: double.infinity,
                            height: 500,
                            child: custom_widgets.MarkdownRenderer(
                              width: double.infinity,
                              height: 500,
                              data: projectProjectsRecord.description!,
                            ),
                          ),
                        ),
                        Divider(
                          thickness: 2,
                          indent: 12,
                          endIndent: 12,
                          color: FlutterFlowTheme.of(context).primaryBackground,
                        ),
                        StreamBuilder<UsersRecord>(
                          stream: UsersRecord.getDocument(
                              projectProjectsRecord.founder!),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 50,
                                  height: 50,
                                  child: CircularProgressIndicator(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                  ),
                                ),
                              );
                            }
                            final columnUsersRecord = snapshot.data!;
                            return Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20, 4, 20, 4),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Founder',
                                        style: FlutterFlowTheme.of(context)
                                            .subtitle2,
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8, 0, 8, 0),
                                  child: InkWell(
                                    onTap: () async {
                                      logFirebaseEvent(
                                          'PROJECT_PAGE_Row_x5k6zunm_ON_TAP');
                                      logFirebaseEvent('Row_Navigate-To');
                                      await Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              ProfileViewWidget(
                                            user: projectProjectsRecord.founder,
                                          ),
                                        ),
                                      );
                                    },
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          columnUsersRecord.displayName!,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1,
                                        ),
                                        Container(
                                          width: 90,
                                          height: 90,
                                          clipBehavior: Clip.antiAlias,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                          ),
                                          child: Image.network(
                                            columnUsersRecord.photoUrl!,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20, 4, 20, 4),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Skills',
                                        style: FlutterFlowTheme.of(context)
                                            .subtitle2,
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      4, 4, 4, 0),
                                  child: FutureBuilder<List<RatingsRecord>>(
                                    future: queryRatingsRecordOnce(
                                      queryBuilder: (ratingsRecord) =>
                                          ratingsRecord
                                              .where('project',
                                                  isEqualTo: widget.projectRef)
                                              .orderBy('value',
                                                  descending: true),
                                    ),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 50,
                                            height: 50,
                                            child: CircularProgressIndicator(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                            ),
                                          ),
                                        );
                                      }
                                      List<RatingsRecord>
                                          listViewSkillsRatingsRecordList =
                                          snapshot.data!;
                                      return ListView.builder(
                                        padding: EdgeInsets.zero,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount:
                                            listViewSkillsRatingsRecordList
                                                .length,
                                        itemBuilder:
                                            (context, listViewSkillsIndex) {
                                          final listViewSkillsRatingsRecord =
                                              listViewSkillsRatingsRecordList[
                                                  listViewSkillsIndex];
                                          return StreamBuilder<SkillsRecord>(
                                            stream: SkillsRecord.getDocument(
                                                listViewSkillsRatingsRecord
                                                    .skill!),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child: SizedBox(
                                                    width: 50,
                                                    height: 50,
                                                    child:
                                                        CircularProgressIndicator(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryColor,
                                                    ),
                                                  ),
                                                );
                                              }
                                              final containerSkillsRecord =
                                                  snapshot.data!;
                                              return Container(
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                ),
                                                child: StreamBuilder<
                                                    List<RatingsRecord>>(
                                                  stream: queryRatingsRecord(
                                                    queryBuilder: (ratingsRecord) =>
                                                        ratingsRecord
                                                            .where('user',
                                                                isEqualTo:
                                                                    projectProjectsRecord
                                                                        .founder)
                                                            .where('skill',
                                                                isEqualTo:
                                                                    containerSkillsRecord
                                                                        .reference),
                                                    singleRecord: true,
                                                  ),
                                                  builder: (context, snapshot) {
                                                    // Customize what your widget looks like when it's loading.
                                                    if (!snapshot.hasData) {
                                                      return Center(
                                                        child: SizedBox(
                                                          width: 50,
                                                          height: 50,
                                                          child:
                                                              CircularProgressIndicator(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryColor,
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                    List<RatingsRecord>
                                                        containerRatingsRecordList =
                                                        snapshot.data!;
                                                    // Return an empty Container when the document does not exist.
                                                    if (snapshot
                                                        .data!.isEmpty) {
                                                      return Container();
                                                    }
                                                    final containerRatingsRecord =
                                                        containerRatingsRecordList
                                                                .isNotEmpty
                                                            ? containerRatingsRecordList
                                                                .first
                                                            : null;
                                                    return Container(
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                      ),
                                                      child: Container(
                                                        width: double.infinity,
                                                        color: Colors.white,
                                                        child:
                                                            ExpandableNotifier(
                                                          initialExpanded:
                                                              false,
                                                          child:
                                                              ExpandablePanel(
                                                            header: Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0, 0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Text(
                                                                    'Project',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyText2,
                                                                  ),
                                                                  SkilltagWidget(
                                                                    value:
                                                                        containerSkillsRecord
                                                                            .name,
                                                                    selected:
                                                                        false,
                                                                  ),
                                                                  Text(
                                                                    'Founder',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyText2,
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            collapsed:
                                                                Container(
                                                              width:
                                                                  MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width,
                                                              height: 40,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                              ),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .min,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  RatingBarIndicator(
                                                                    itemBuilder:
                                                                        (context,
                                                                                index) =>
                                                                            Icon(
                                                                      Icons
                                                                          .star_rounded,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .tertiaryColor,
                                                                    ),
                                                                    direction: Axis
                                                                        .horizontal,
                                                                    rating: listViewSkillsRatingsRecord
                                                                        .value!
                                                                        .toDouble(),
                                                                    unratedColor:
                                                                        Color(
                                                                            0xFF9E9E9E),
                                                                    itemCount:
                                                                        3,
                                                                    itemSize:
                                                                        40,
                                                                  ),
                                                                  RatingBarIndicator(
                                                                    itemBuilder:
                                                                        (context,
                                                                                index) =>
                                                                            Icon(
                                                                      Icons
                                                                          .star_rounded,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryColor,
                                                                    ),
                                                                    direction: Axis
                                                                        .horizontal,
                                                                    rating: containerRatingsRecord!
                                                                        .value!
                                                                        .toDouble(),
                                                                    unratedColor:
                                                                        Color(
                                                                            0xFF9E9E9E),
                                                                    itemCount:
                                                                        3,
                                                                    itemSize:
                                                                        40,
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            expanded: StreamBuilder<
                                                                List<
                                                                    RatingsRecord>>(
                                                              stream:
                                                                  queryRatingsRecord(
                                                                queryBuilder: (ratingsRecord) => ratingsRecord
                                                                    .where(
                                                                        'user',
                                                                        isEqualTo:
                                                                            currentUserReference)
                                                                    .where(
                                                                        'skill',
                                                                        isEqualTo:
                                                                            containerSkillsRecord.reference),
                                                                singleRecord:
                                                                    true,
                                                              ),
                                                              builder: (context,
                                                                  snapshot) {
                                                                // Customize what your widget looks like when it's loading.
                                                                if (!snapshot
                                                                    .hasData) {
                                                                  return Center(
                                                                    child:
                                                                        SizedBox(
                                                                      width: 50,
                                                                      height:
                                                                          50,
                                                                      child:
                                                                          CircularProgressIndicator(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryColor,
                                                                      ),
                                                                    ),
                                                                  );
                                                                }
                                                                List<RatingsRecord>
                                                                    columnRatingsRecordList =
                                                                    snapshot
                                                                        .data!;
                                                                // Return an empty Container when the document does not exist.
                                                                if (snapshot
                                                                    .data!
                                                                    .isEmpty) {
                                                                  return Container();
                                                                }
                                                                final columnRatingsRecord =
                                                                    columnRatingsRecordList
                                                                            .isNotEmpty
                                                                        ? columnRatingsRecordList
                                                                            .first
                                                                        : null;
                                                                return Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      children: [
                                                                        RatingBarIndicator(
                                                                          itemBuilder: (context, index) =>
                                                                              Icon(
                                                                            Icons.star_rounded,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).tertiaryColor,
                                                                          ),
                                                                          direction:
                                                                              Axis.horizontal,
                                                                          rating: listViewSkillsRatingsRecord
                                                                              .value!
                                                                              .toDouble(),
                                                                          unratedColor:
                                                                              Color(0xFF9E9E9E),
                                                                          itemCount:
                                                                              3,
                                                                          itemSize:
                                                                              40,
                                                                        ),
                                                                        RatingBarIndicator(
                                                                          itemBuilder: (context, index) =>
                                                                              Icon(
                                                                            Icons.star_rounded,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryColor,
                                                                          ),
                                                                          direction:
                                                                              Axis.horizontal,
                                                                          rating: containerRatingsRecord!
                                                                              .value!
                                                                              .toDouble(),
                                                                          unratedColor:
                                                                              Color(0xFF9E9E9E),
                                                                          itemCount:
                                                                              3,
                                                                          itemSize:
                                                                              40,
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0,
                                                                              0),
                                                                      child:
                                                                          Text(
                                                                        'Yours',
                                                                        textAlign:
                                                                            TextAlign.start,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyText2,
                                                                      ),
                                                                    ),
                                                                    RatingBarIndicator(
                                                                      itemBuilder:
                                                                          (context, index) =>
                                                                              Icon(
                                                                        Icons
                                                                            .star_rounded,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryColor,
                                                                      ),
                                                                      direction:
                                                                          Axis.horizontal,
                                                                      rating: columnRatingsRecord!
                                                                          .value!
                                                                          .toDouble(),
                                                                      unratedColor:
                                                                          Color(
                                                                              0xFF9E9E9E),
                                                                      itemCount:
                                                                          3,
                                                                      itemSize:
                                                                          40,
                                                                    ),
                                                                    Text(
                                                                      'Potential roles based on skill ratings:',
                                                                      textAlign:
                                                                          TextAlign
                                                                              .start,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyText2
                                                                          .override(
                                                                            fontFamily:
                                                                                'Poppins',
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                          ),
                                                                    ),
                                                                    Builder(
                                                                      builder:
                                                                          (context) {
                                                                        final partnerTypes = functions
                                                                            .getPartnerTypesFromRatings(
                                                                                listViewSkillsRatingsRecord.value!,
                                                                                columnRatingsRecord!.value,
                                                                                containerRatingsRecord!.value)
                                                                            .toList();
                                                                        return Wrap(
                                                                          spacing:
                                                                              10,
                                                                          runSpacing:
                                                                              0,
                                                                          alignment:
                                                                              WrapAlignment.start,
                                                                          crossAxisAlignment:
                                                                              WrapCrossAlignment.start,
                                                                          direction:
                                                                              Axis.horizontal,
                                                                          runAlignment:
                                                                              WrapAlignment.start,
                                                                          verticalDirection:
                                                                              VerticalDirection.down,
                                                                          clipBehavior:
                                                                              Clip.none,
                                                                          children: List.generate(
                                                                              partnerTypes.length,
                                                                              (partnerTypesIndex) {
                                                                            final partnerTypesItem =
                                                                                partnerTypes[partnerTypesIndex];
                                                                            return Text(
                                                                              partnerTypesItem,
                                                                              textAlign: TextAlign.center,
                                                                              style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                    fontFamily: 'Poppins',
                                                                                    color: FlutterFlowTheme.of(context).secondaryColor,
                                                                                  ),
                                                                            );
                                                                          }),
                                                                        );
                                                                      },
                                                                    ),
                                                                    Divider(
                                                                      thickness:
                                                                          1,
                                                                      indent:
                                                                          10,
                                                                      endIndent:
                                                                          10,
                                                                    ),
                                                                  ],
                                                                );
                                                              },
                                                            ),
                                                            theme:
                                                                ExpandableThemeData(
                                                              tapHeaderToExpand:
                                                                  true,
                                                              tapBodyToExpand:
                                                                  false,
                                                              tapBodyToCollapse:
                                                                  false,
                                                              headerAlignment:
                                                                  ExpandablePanelHeaderAlignment
                                                                      .center,
                                                              hasIcon: false,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              );
                                            },
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ),
                                Divider(
                                  thickness: 2,
                                  indent: 12,
                                  endIndent: 12,
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                ),
                                if (projectProjectsRecord.stream != null &&
                                    projectProjectsRecord.stream != '')
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20, 4, 20, 4),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              'StreamDetails',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText2,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20, 0, 0, 0),
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            logFirebaseEvent(
                                                'PROJECT_PAGE_VIEW_STREAM_BTN_ON_TAP');
                                            logFirebaseEvent(
                                                'Button_Launch-U-R-L');
                                            await launchURL(
                                                projectProjectsRecord.stream!);
                                          },
                                          text: 'View stream',
                                          options: FFButtonOptions(
                                            width: 160,
                                            height: 40,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryColor,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .subtitle2
                                                    .override(
                                                      fontFamily: 'Poppins',
                                                      color: Colors.white,
                                                    ),
                                            borderSide: BorderSide(
                                              color: Colors.transparent,
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                        ),
                                      ),
                                      Divider(
                                        thickness: 2,
                                        indent: 12,
                                        endIndent: 12,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                      ),
                                    ],
                                  ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20, 20, 20, 20),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      logFirebaseEvent(
                                          'PROJECT_PAGE_JOIN_PROJECT_BTN_ON_TAP');
                                      logFirebaseEvent('Button_Launch-U-R-L');
                                      await launchURL(
                                          projectProjectsRecord.stream!);
                                    },
                                    text: 'Join Project',
                                    options: FFButtonOptions(
                                      width: double.infinity,
                                      height: 40,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryColor,
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
                            );
                          },
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
