import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'rating_popup_model.dart';
export 'rating_popup_model.dart';

class RatingPopupWidget extends StatefulWidget {
  const RatingPopupWidget({Key? key}) : super(key: key);

  @override
  _RatingPopupWidgetState createState() => _RatingPopupWidgetState();
}

class _RatingPopupWidgetState extends State<RatingPopupWidget> {
  late RatingPopupModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RatingPopupModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(30.0, 30.0, 0.0, 10.0),
          child: FlutterFlowIconButton(
            borderColor: FlutterFlowTheme.of(context).warning,
            borderRadius: 20.0,
            borderWidth: 2.0,
            buttonSize: 40.0,
            fillColor: Color(0xCC000000),
            icon: Icon(
              Icons.close_rounded,
              color: FlutterFlowTheme.of(context).warning,
              size: 24.0,
            ),
            onPressed: () async {
              Navigator.pop(context);
            },
          ),
        ),
        Expanded(
          child: InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              await launchURL(
                  'https://apps.apple.com/app/id6467383492?action=write-review');
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                'assets/images/Rate_App.jpg',
                width: MediaQuery.sizeOf(context).width * 1.0,
                height: MediaQuery.sizeOf(context).height * 1.0,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
