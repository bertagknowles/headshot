import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/revenue_cat_util.dart' as revenue_cat;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'paywall_page_model.dart';
export 'paywall_page_model.dart';

class PaywallPageWidget extends StatefulWidget {
  const PaywallPageWidget({Key? key}) : super(key: key);

  @override
  _PaywallPageWidgetState createState() => _PaywallPageWidgetState();
}

class _PaywallPageWidgetState extends State<PaywallPageWidget> {
  late PaywallPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PaywallPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.instantTimerPaywallPage = InstantTimer.periodic(
        duration: Duration(milliseconds: 10000),
        callback: (timer) async {
          _model.internetEnabledpaywallPage =
              await actions.checkInternetConnection();
          if (_model.internetEnabledpaywallPage == true) {
            _model.instantTimerPaywallPage?.cancel();
            final isEntitled = await revenue_cat.isEntitled('Premium') ?? false;
            if (!isEntitled) {
              await revenue_cat.loadOfferings();
            }

            if (isEntitled) {
              FFAppState().creditsEnabled = false;

              context.goNamed('HomePage');
            }
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'Internet not connected! This app requires an active internet connection.',
                  style: FlutterFlowTheme.of(context).titleMedium.override(
                        fontFamily: 'Readex Pro',
                        color: FlutterFlowTheme.of(context).error,
                      ),
                ),
                duration: Duration(milliseconds: 4000),
                backgroundColor: Color(0xFF0C0F13),
              ),
            );
            return;
          }
        },
        startImmediately: true,
      );
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFF011323),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Align(
                alignment: AlignmentDirectional(0.00, 0.00),
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(30.0, 30.0, 30.0, 30.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      var _shouldSetState = false;
                      _model.internetEnabledpaywallPageCopy =
                          await actions.checkInternetConnection();
                      _shouldSetState = true;
                      if (_model.internetEnabledpaywallPage == true) {
                        final isEntitled =
                            await revenue_cat.isEntitled('Premium') ?? false;
                        if (!isEntitled) {
                          await revenue_cat.loadOfferings();
                        }

                        if (isEntitled) {
                          FFAppState().creditsEnabled = false;

                          context.goNamed('HomePage');
                        } else {
                          context.goNamed('HomePage');
                        }
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Internet not connected! This app requires an active internet connection.',
                              style: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    color: FlutterFlowTheme.of(context).error,
                                  ),
                            ),
                            duration: Duration(milliseconds: 4000),
                            backgroundColor: Color(0xFF0C0F13),
                          ),
                        );
                        if (_shouldSetState) setState(() {});
                        return;
                      }

                      if (_shouldSetState) setState(() {});
                    },
                    text: FFLocalizations.of(context).getText(
                      '74idqw0x' /* Continue with limited access */,
                    ),
                    options: FFButtonOptions(
                      height: 30.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: Color(0xFF5F7190),
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Readex Pro',
                                color: Color(0xFF7EADF4),
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal,
                              ),
                      elevation: 3.0,
                      borderSide: BorderSide(
                        color: Color(0xFF7EADF4),
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
