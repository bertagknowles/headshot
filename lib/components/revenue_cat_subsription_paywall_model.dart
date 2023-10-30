import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/revenue_cat_util.dart' as revenue_cat;
import 'revenue_cat_subsription_paywall_widget.dart'
    show RevenueCatSubsriptionPaywallWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RevenueCatSubsriptionPaywallModel
    extends FlutterFlowModel<RevenueCatSubsriptionPaywallWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Custom Action - checkInternetConnection] action in Button widget.
  bool? interEnabledBuy1Button;
  // Stores action output result for [RevenueCat - Purchase] action in Button widget.
  bool? weekly;
  // Stores action output result for [Custom Action - checkInternetConnection] action in Button widget.
  bool? interEnabledBuy2Button;
  // Stores action output result for [RevenueCat - Purchase] action in Button widget.
  bool? monthly;
  // Stores action output result for [Custom Action - checkInternetConnection] action in RestorePurchases widget.
  bool? interEnabledRestoreButton;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
