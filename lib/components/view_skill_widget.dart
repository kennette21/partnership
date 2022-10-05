import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';

class ViewSkillWidget extends StatefulWidget {
  const ViewSkillWidget({
    Key? key,
    this.skillDoc,
    this.ratingDoc,
  }) : super(key: key);

  final SkillsRecord? skillDoc;
  final RatingsRecord? ratingDoc;

  @override
  _ViewSkillWidgetState createState() => _ViewSkillWidgetState();
}

class _ViewSkillWidgetState extends State<ViewSkillWidget> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          widget.skillDoc!.name!,
          style: FlutterFlowTheme.of(context).bodyText1,
        ),
        RatingBarIndicator(
          itemBuilder: (context, index) => Icon(
            Icons.star_rounded,
            color: FlutterFlowTheme.of(context).secondaryColor,
          ),
          direction: Axis.horizontal,
          rating: widget.ratingDoc!.value!.toDouble(),
          unratedColor: Color(0xFF9E9E9E),
          itemCount: 3,
          itemSize: 40,
        ),
      ],
    );
  }
}
