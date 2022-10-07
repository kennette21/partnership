import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../edit_profile/edit_profile_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../login/login_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileWidget extends StatefulWidget {
  const ProfileWidget({Key? key}) : super(key: key);

  @override
  _ProfileWidgetState createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Profile'});
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<UsersRecord>(
      stream: UsersRecord.getDocument(currentUserReference!),
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
        final profileUsersRecord = snapshot.data!;
        return Title(
            title: 'Profile',
            color: FlutterFlowTheme.of(context).primaryColor,
            child: Scaffold(
              key: scaffoldKey,
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
              body: SafeArea(
                child: GestureDetector(
                  onTap: () => FocusScope.of(context).unfocus(),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              if (Theme.of(context).brightness ==
                                  Brightness.dark)
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 20, 0),
                                  child: FlutterFlowIconButton(
                                    borderColor: Colors.transparent,
                                    borderRadius: 30,
                                    borderWidth: 1,
                                    buttonSize: 60,
                                    icon: Icon(
                                      Icons.nightlight_round,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 30,
                                    ),
                                    onPressed: () async {
                                      logFirebaseEvent(
                                          'PROFILE_PAGE_DarkIcon_ON_TAP');
                                      logFirebaseEvent(
                                          'DarkIcon_Set-Dark-Mode-Settings');
                                      setDarkModeSetting(
                                          context, ThemeMode.light);
                                    },
                                  ),
                                ),
                              if (Theme.of(context).brightness ==
                                  Brightness.light)
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 20, 0),
                                  child: FlutterFlowIconButton(
                                    borderColor: Colors.transparent,
                                    borderRadius: 30,
                                    borderWidth: 1,
                                    buttonSize: 60,
                                    icon: Icon(
                                      Icons.wb_sunny,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 30,
                                    ),
                                    onPressed: () async {
                                      logFirebaseEvent(
                                          'PROFILE_PAGE_LightIcon_ON_TAP');
                                      logFirebaseEvent(
                                          'LightIcon_Set-Dark-Mode-Settings');
                                      setDarkModeSetting(
                                          context, ThemeMode.dark);
                                    },
                                  ),
                                ),
                            ],
                          ),
                          Container(
                            width: 120,
                            height: 120,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: Image.network(
                              profileUsersRecord.photoUrl!,
                            ),
                          ),
                          Text(
                            valueOrDefault<String>(
                              profileUsersRecord.displayName,
                              'Anonymous Anteater',
                            ),
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context).title3,
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(20, 4, 20, 4),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  'Bio',
                                  style: FlutterFlowTheme.of(context).bodyText2,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(4, 2, 4, 2),
                            child: Container(
                              width: double.infinity,
                              height: 100,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(4, 2, 4, 2),
                                child: Text(
                                  profileUsersRecord.bio!,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Poppins',
                                        fontSize: 12,
                                      ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(20, 4, 20, 4),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  'Skills',
                                  style: FlutterFlowTheme.of(context).bodyText2,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(4, 4, 4, 0),
                            child: StreamBuilder<List<RatingsRecord>>(
                              stream: queryRatingsRecord(
                                queryBuilder: (ratingsRecord) =>
                                    ratingsRecord.where('user',
                                        isEqualTo: currentUserReference),
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
                                List<RatingsRecord>
                                    listViewSkillsRatingsRecordList =
                                    snapshot.data!;
                                return ListView.builder(
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount:
                                      listViewSkillsRatingsRecordList.length,
                                  itemBuilder: (context, listViewSkillsIndex) {
                                    final listViewSkillsRatingsRecord =
                                        listViewSkillsRatingsRecordList[
                                            listViewSkillsIndex];
                                    return StreamBuilder<SkillsRecord>(
                                      stream: SkillsRecord.getDocument(
                                          listViewSkillsRatingsRecord.skill!),
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
                                        final rowSkillsRecord = snapshot.data!;
                                        return Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              rowSkillsRecord.name!,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1,
                                            ),
                                            RatingBarIndicator(
                                              itemBuilder: (context, index) =>
                                                  Icon(
                                                Icons.star_rounded,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryColor,
                                              ),
                                              direction: Axis.horizontal,
                                              rating:
                                                  listViewSkillsRatingsRecord
                                                      .value!
                                                      .toDouble(),
                                              unratedColor: Color(0xFF9E9E9E),
                                              itemCount: 3,
                                              itemSize: 40,
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(20, 4, 20, 4),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  'Contact',
                                  style: FlutterFlowTheme.of(context).bodyText2,
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              FlutterFlowIconButton(
                                borderColor:
                                    FlutterFlowTheme.of(context).primaryText,
                                borderRadius: 30,
                                borderWidth: 3,
                                buttonSize: 60,
                                icon: Icon(
                                  Icons.event,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 30,
                                ),
                                onPressed: () async {
                                  logFirebaseEvent(
                                      'PROFILE_PAGE_CalendlyButton_ON_TAP');
                                  logFirebaseEvent(
                                      'CalendlyButton_Launch-U-R-L');
                                  await launchURL(profileUsersRecord.calendar!);
                                },
                              ),
                              FlutterFlowIconButton(
                                borderColor:
                                    FlutterFlowTheme.of(context).primaryText,
                                borderRadius: 30,
                                borderWidth: 3,
                                buttonSize: 60,
                                icon: Icon(
                                  Icons.mail_outlined,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 30,
                                ),
                                onPressed: () {
                                  print('EmailButton pressed ...');
                                },
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                if (!valueOrDefault<bool>(
                                    currentUserDocument?.isFounder, false))
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 8),
                                    child: AuthUserStreamWidget(
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          logFirebaseEvent(
                                              'PROFILE_PAGE_BecomeFounder_ON_TAP');
                                          logFirebaseEvent(
                                              'BecomeFounder_Launch-U-R-L');
                                          await launchURL(
                                              'https://docs.google.com/forms/d/e/1FAIpQLSdYpCgpIC7tzy8ziUxZ45aw_Z9OlJlymeh_SLA_7vaRla0tlQ/viewform?usp=sf_link');
                                        },
                                        text: 'Be a Founder',
                                        options: FFButtonOptions(
                                          width: 130,
                                          height: 40,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryColor,
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
                                  ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 8),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      logFirebaseEvent(
                                          'PROFILE_PAGE_EditProfileButton_ON_TAP');
                                      logFirebaseEvent(
                                          'EditProfileButton_Navigate-To');
                                      await Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              EditProfileWidget(),
                                        ),
                                      );
                                    },
                                    text: 'Edit Profile',
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
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                ),
                                FFButtonWidget(
                                  onPressed: () async {
                                    logFirebaseEvent(
                                        'PROFILE_PAGE_LogoutButton_ON_TAP');
                                    logFirebaseEvent('LogoutButton_Auth');
                                    await signOut();
                                    await Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => LoginWidget(),
                                      ),
                                      (r) => false,
                                    );
                                  },
                                  text: 'Logout',
                                  options: FFButtonOptions(
                                    width: 130,
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
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ));
      },
    );
  }
}
