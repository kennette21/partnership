import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';

class EditableProjSkillRatingWidget extends StatefulWidget {
  const EditableProjSkillRatingWidget({
    Key? key,
    this.skillDoc,
    this.project,
  }) : super(key: key);

  final SkillsRecord? skillDoc;
  final ProjectsRecord? project;

  @override
  _EditableProjSkillRatingWidgetState createState() =>
      _EditableProjSkillRatingWidgetState();
}

class _EditableProjSkillRatingWidgetState
    extends State<EditableProjSkillRatingWidget> {
  double? skillRatingValue;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<RatingsRecord>>(
      stream: queryRatingsRecord(
        queryBuilder: (ratingsRecord) => ratingsRecord
            .where('skill', isEqualTo: widget.skillDoc!.reference)
            .where('project', isEqualTo: widget.project!.reference),
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
                color: FlutterFlowTheme.of(context).primaryColor,
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
                  setState(() => skillRatingValue = newValue);
                  logFirebaseEvent('EDITABLE_PROJ_SKILL_RATING_SkillRating_O');
                  if (skillRatingContainerRatingsRecord != null) {
                    logFirebaseEvent('SkillRating_backend_call');

                    final ratingsUpdateData = createRatingsRecordData(
                      value: skillRatingValue?.round(),
                    );
                    await skillRatingContainerRatingsRecord!.reference
                        .update(ratingsUpdateData);
                  } else {
                    logFirebaseEvent('SkillRating_backend_call');

                    final ratingsCreateData = createRatingsRecordData(
                      skill: widget.skillDoc!.reference,
                      value: skillRatingValue?.round(),
                      project: widget.project!.reference,
                    );
                    await RatingsRecord.collection.doc().set(ratingsCreateData);
                  }
                },
                itemBuilder: (context, index) => Icon(
                  Icons.star_rounded,
                  color: FlutterFlowTheme.of(context).secondaryColor,
                ),
                direction: Axis.horizontal,
                initialRating: skillRatingValue ??=
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
