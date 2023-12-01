import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/genertaed_art_widget.dart';
import '/components/revenue_cat_subsription_paywall_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import '/flutter_flow/upload_data.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/revenue_cat_util.dart' as revenue_cat;
import 'home_page_widget.dart' show HomePageWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Custom Action - checkInternetConnection] action in HomePage widget.
  bool? internetEnabledOnPageLoad1st;
  // Stores action output result for [Custom Action - checkInternetConnection] action in HomePage widget.
  bool? internetEnabledCopy1;
  // Stores action output result for [Custom Action - checkInternetConnection] action in Container widget.
  bool? internetEnabled;
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Custom Action - convertImageFileToBase64] action in Container widget.
  String? base64outputCopy;
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  SampleDataRecord? resampleOutput;
  // Stores action output result for [Custom Action - checkInternetConnection] action in Container widget.
  bool? internetEnabledphoto2;
  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Custom Action - convertImageFileToBase64] action in Container widget.
  String? base64outputCopyCopy;
  // Stores action output result for [Custom Action - checkInternetConnection] action in Container widget.
  bool? internetEnabledClose3rd;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Custom Action - checkInternetConnection] action in Button widget.
  bool? internetEnabledCopy3;
  // Stores action output result for [Backend Call - API (Create Prediction)] action in Button widget.
  ApiCallResponse? createPredictionResult;
  InstantTimer? instantTimer;
  // Stores action output result for [Backend Call - API (Get Prediction)] action in Button widget.
  ApiCallResponse? getPrediction;
  // Stores action output result for [Custom Action - checkInternetConnection] action in Button widget.
  bool? internetEnabledOnPageClose1st;
  // Stores action output result for [Custom Action - checkInternetConnection] action in Button widget.
  bool? internetEnabledClose2nd;
  // Stores action output result for [Custom Action - checkInternetConnection] action in Container widget.
  bool? interEnabledSubscribeHomePage;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    instantTimer?.cancel();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
