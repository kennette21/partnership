import '../components/skilltag_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'simple_project_view_skills_with_founder_model.dart';
export 'simple_project_view_skills_with_founder_model.dart';

class SimpleProjectViewSkillsWithFounderWidget extends StatefulWidget {
  const SimpleProjectViewSkillsWithFounderWidget({Key? key}) : super(key: key);

  @override
  _SimpleProjectViewSkillsWithFounderWidgetState createState() =>
      _SimpleProjectViewSkillsWithFounderWidgetState();
}

class _SimpleProjectViewSkillsWithFounderWidgetState
    extends State<SimpleProjectViewSkillsWithFounderWidget> {
  late SimpleProjectViewSkillsWithFounderModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model =
        createModel(context, () => SimpleProjectViewSkillsWithFounderModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RatingBarIndicator(
          itemBuilder: (context, index) => Icon(
            Icons.star_rounded,
            color: FlutterFlowTheme.of(context).tertiaryColor,
          ),
          direction: Axis.horizontal,
          rating: 0,
          unratedColor: Color(0xFF9E9E9E),
          itemCount: 3,
          itemSize: 40,
        ),
        wrapWithModel(
          model: _model.skilltagModel,
          updateCallback: () => setState(() {}),
          child: SkilltagWidget(
            value: 'Set from Var later',
            selected: true,
          ),
        ),
        RatingBarIndicator(
          itemBuilder: (context, index) => Icon(
            Icons.star_rounded,
            color: FlutterFlowTheme.of(context).secondaryColor,
          ),
          direction: Axis.horizontal,
          rating: 0,
          unratedColor: Color(0xFF9E9E9E),
          itemCount: 3,
          itemSize: 40,
        ),
      ],
    );
  }
}
