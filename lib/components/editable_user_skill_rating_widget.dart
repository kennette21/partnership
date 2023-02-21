import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'editable_user_skill_rating_model.dart';
export 'editable_user_skill_rating_model.dart';

class EditableUserSkillRatingWidget extends StatefulWidget {
  const EditableUserSkillRatingWidget({
    Key? key,
    this.skillDoc,
  }) : super(key: key);

  final SkillsRecord? skillDoc;

  @override
  _EditableUserSkillRatingWidgetState createState() =>
      _EditableUserSkillRatingWidgetState();
}

class _EditableUserSkillRatingWidgetState
    extends State<EditableUserSkillRatingWidget> {
  late EditableUserSkillRatingModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditableUserSkillRatingModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<RatingsRecord>>(
      stream: queryRatingsRecord(
        queryBuilder: (ratingsRecord) => ratingsRecord
            .where('skill', isEqualTo: widget.skillDoc!.reference)
            .where('user', isEqualTo: currentUserReference),
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
                color: FlutterFlowTheme.of(context).primaryColor,
                size: 50,
              ),
            ),
          );
        }
        List<RatingsRecord> skillRatingContainerRatingsRecordList =
            snapshot.data!;
        final skillRatingContainerRatingsRecord =
            skillRatingContainerRatingsRecordList.isNotEmpty
                ? skillRatingContainerRatingsRecordList.first
                : null;
        return Container(
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).primaryBackground,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.skillDoc!.name!,
                style: FlutterFlowTheme.of(context).bodyText1,
              ),
              RatingBar.builder(
                onRatingUpdate: (newValue) async {
                  setState(() => _model.skillRatingValue = newValue);
                  logFirebaseEvent('EDITABLE_USER_SKILL_RATING_SkillRating_O');
                  if (skillRatingContainerRatingsRecord != null) {
                    logFirebaseEvent('SkillRating_backend_call');

                    final ratingsUpdateData = createRatingsRecordData(
                      value: _model.skillRatingValue?.round(),
                    );
                    await skillRatingContainerRatingsRecord!.reference
                        .update(ratingsUpdateData);
                  } else {
                    logFirebaseEvent('SkillRating_backend_call');

                    final ratingsCreateData = createRatingsRecordData(
                      skill: widget.skillDoc!.reference,
                      user: currentUserReference,
                      value: _model.skillRatingValue?.round(),
                    );
                    await RatingsRecord.collection.doc().set(ratingsCreateData);
                  }
                },
                itemBuilder: (context, index) => Icon(
                  Icons.star_rounded,
                  color: FlutterFlowTheme.of(context).secondaryColor,
                ),
                direction: Axis.horizontal,
                initialRating: _model.skillRatingValue ??=
                    skillRatingContainerRatingsRecord != null
                        ? skillRatingContainerRatingsRecord!.value!.toDouble()
                        : 0.0,
                unratedColor: Color(0xFF9E9E9E),
                itemCount: 3,
                itemSize: 40,
                glowColor: FlutterFlowTheme.of(context).secondaryColor,
              ),
            ],
          ),
        );
      },
    );
  }
}
