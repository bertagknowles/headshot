import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/revenue_cat_util.dart' as revenue_cat;
import 'paywall_page_widget.dart' show PaywallPageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PaywallPageModel extends FlutterFlowModel<PaywallPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  InstantTimer? instantTimerPaywallPage;
  // Stores action output result for [Custom Action - checkInternetConnection] action in paywallPage widget.
  bool? internetEnabledpaywallPage;
  // Stores action output result for [Custom Action - checkInternetConnection] action in Button widget.
  bool? internetEnabledpaywallPageCopy;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    instantTimerPaywallPage?.cancel();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
