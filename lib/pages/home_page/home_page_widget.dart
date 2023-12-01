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
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget>
    with TickerProviderStateMixin {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'textOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.0, -50.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(100.0, 0.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(-100.0, 0.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'buttonOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(100.0, 0.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'buttonOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(100.0, 0.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().update(() {
        FFAppState().isAnalyzing = false;
        FFAppState().analyzeButton = true;
        FFAppState().generateCaptions = true;
        FFAppState().clearImage = true;
        FFAppState().captionsGeneratedTxtMsg = false;
        FFAppState().viewCaptionsButton = false;
        FFAppState().generatingCaptionsTextMsg = false;
        FFAppState().analysisCompleteTxtMsg = false;
        FFAppState().languageSelection = 'English';
        FFAppState().imageString = '';
        FFAppState().imageString2 = '';
      });
      FFAppState().currentTimeStamp = getCurrentTimestamp;
      setState(() {
        _model.isDataUploading1 = false;
        _model.uploadedLocalFile1 =
            FFUploadedFile(bytes: Uint8List.fromList([]));
      });

      _model.internetEnabledOnPageLoad1st =
          await actions.checkInternetConnection();
      if (_model.internetEnabledOnPageLoad1st != true) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              valueOrDefault<String>(
                FFLocalizations.of(context).getVariableText(
                  enText:
                      'Internet not connected! This app requires an active internet connection.',
                  deText:
                      'Internet nicht verbunden! Diese App erfordert eine aktive Internetverbindung.',
                  esText:
                      'A Internet não está ligada! Esta aplicação requer uma ligação ativa à Internet.',
                  nlText:
                      'Internet no está conectado. Esta aplicación requiere una conexión activa a Internet.',
                  frText:
                      'Internett er ikke tilkoblet! Denne appen krever en aktiv internettforbindelse.',
                  itText:
                      'Internet ei ole yhteydessä! Tämä sovellus vaatii aktiivisen internetyhteyden.',
                  ptText:
                      'Internet non connecté ! Cette application nécessite une connexion internet active.',
                  ruText:
                      'Internet niet verbonden! Deze app vereist een actieve internetverbinding.',
                  plText:
                      'Internet nie jest połączony! Ta aplikacja wymaga aktywnego połączenia z Internetem.',
                ),
                'Internet not connected! This app requires an active internet connection.',
              ),
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
      if (FFAppState().subscriptionCheckOnPageLoad == false) {
        final isEntitled = await revenue_cat.isEntitled('Premium') ?? false;
        if (!isEntitled) {
          await revenue_cat.loadOfferings();
        }

        if (isEntitled) {
          setState(() {
            FFAppState().creditsEnabled = false;
            FFAppState().subscriptionCheckOnPageLoad = true;
          });
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                valueOrDefault<String>(
                  FFLocalizations.of(context).getVariableText(
                    enText: 'Limited access. No active subscription!',
                    deText: 'Begrenzter Zugang. Kein aktives Abonnement!',
                    esText: 'Acesso limitado. Sem subscrição ativa!',
                    nlText: 'Acceso limitado. Sin suscripción activa.',
                    frText: 'Begrenset tilgang. Ikke noe aktivt abonnement!',
                    itText: 'Rajoitettu pääsy. Ei aktiivista tilausta!',
                    ptText: 'Accès limité. Pas d\'abonnement actif !',
                    ruText: 'Beperkte toegang. Geen actief abonnement!',
                    plText: 'Ograniczony dostęp. Brak aktywnej subskrypcji!',
                  ),
                  'Limited access. No active subscription!',
                ),
                style: TextStyle(
                  color: FlutterFlowTheme.of(context).primaryText,
                ),
              ),
              duration: Duration(milliseconds: 4000),
              backgroundColor: FlutterFlowTheme.of(context).secondary,
            ),
          );
        }
      }
      if (FFAppState().creditsEnabled == true) {
        if (FFAppState().creditsCount < 1) {
          if (FFAppState().currentTimeStamp!.millisecondsSinceEpoch -
                  FFAppState().lastActionDate!.millisecondsSinceEpoch >
              86400000) {
            FFAppState().creditsCount = 3;
            FFAppState().lastActionDate = getCurrentTimestamp;
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  valueOrDefault<String>(
                    FFLocalizations.of(context).getVariableText(
                      enText: 'Out of Credits!',
                      deText: 'Keine Credits mehr!',
                      esText: 'Sem créditos!',
                      nlText: '¡Sin créditos!',
                      frText: 'Slutt på studiepoeng!',
                      itText: 'Luotot loppu!',
                      ptText: 'Plus de crédits !',
                      ruText: 'Geen credits meer!',
                      plText: 'Brak kredytów!',
                    ),
                    'Out of Credits!',
                  ),
                  style: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Readex Pro',
                        color: FlutterFlowTheme.of(context).error,
                      ),
                ),
                duration: Duration(milliseconds: 4000),
                backgroundColor: Color(0xFF011323),
              ),
            );
            return;
          }
        } else {
          if (FFAppState().creditsCount > 3) {
            FFAppState().creditsCount = 3;
          }
        }
      }
      _model.internetEnabledCopy1 = await actions.checkInternetConnection();
      if (_model.internetEnabledCopy1 == true) {
        if (FFAppState().ratingCount == 2) {
          await actions.requestRating();
        }
        if (FFAppState().ratingCount > 50) {
          FFAppState().ratingCount = 0;
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              valueOrDefault<String>(
                FFLocalizations.of(context).getVariableText(
                  enText:
                      'Internet not connected! This app requires an active internet connection.',
                  deText:
                      'Internet nicht verbunden! Diese App erfordert eine aktive Internetverbindung.',
                  esText:
                      'A Internet não está ligada! Esta aplicação requer uma ligação ativa à Internet.',
                  nlText:
                      'Internet no está conectado. Esta aplicación requiere una conexión activa a Internet.',
                  frText:
                      'Internett er ikke tilkoblet! Denne appen krever en aktiv internettforbindelse.',
                  itText:
                      'Internet ei ole yhteydessä! Tämä sovellus vaatii aktiivisen internetyhteyden.',
                  ptText:
                      'Internet non connecté ! Cette application nécessite une connexion internet active.',
                  ruText:
                      'Internet niet verbonden! Deze app vereist een actieve internetverbinding.',
                  plText:
                      'Internet nie jest połączony! Ta aplikacja wymaga aktywnego połączenia z Internetem.',
                ),
                'Internet not connected! This app requires an active internet connection.',
              ),
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
    });

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {
          _model.textController?.text = FFLocalizations.of(context).getText(
            'jquywzjb' /* a portrait of a man wearing a ... */,
          );
        }));
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
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          appBar: PreferredSize(
            preferredSize:
                Size.fromHeight(MediaQuery.sizeOf(context).height * 0.03),
            child: AppBar(
              backgroundColor: Color(0xFF011323),
              automaticallyImplyLeading: false,
              title: Container(
                width: double.infinity,
                height: MediaQuery.sizeOf(context).height * 0.05,
                decoration: BoxDecoration(),
                child: Align(
                  alignment: AlignmentDirectional(0.00, 0.00),
                  child: AutoSizeText(
                    FFLocalizations.of(context).getText(
                      'zxfqn9tc' /* AI Headshot Generator */,
                    ),
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).headlineMedium.override(
                          fontFamily: 'Outfit',
                          color: Color(0xFF7EADF4),
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500,
                        ),
                  ).animateOnPageLoad(
                      animationsMap['textOnPageLoadAnimation']!),
                ),
              ),
              actions: [],
              centerTitle: true,
              elevation: 2.0,
            ),
          ),
          body: SafeArea(
            top: true,
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF011323), Color(0xFF35155D)],
                  stops: [0.0, 1.0],
                  begin: AlignmentDirectional(0.0, -1.0),
                  end: AlignmentDirectional(0, 1.0),
                ),
                shape: BoxShape.rectangle,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 5,
                            child: Align(
                              alignment: AlignmentDirectional(0.00, 0.00),
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 0.5,
                                height: MediaQuery.sizeOf(context).height * 0.4,
                                child: Stack(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  children: [
                                    if (_model.uploadedLocalFile1 != null &&
                                        (_model.uploadedLocalFile1.bytes
                                                ?.isNotEmpty ??
                                            false))
                                      Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.5,
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                0.3,
                                        child: custom_widgets.Base64Image(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.5,
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              0.3,
                                          base64: FFAppState().imageString,
                                        ),
                                      ),
                                    if (_model.uploadedLocalFile1 == null ||
                                        (_model.uploadedLocalFile1.bytes
                                                ?.isEmpty ??
                                            true))
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.00, 0.00),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            var _shouldSetState = false;
                                            if (FFAppState().creditsEnabled ==
                                                true) {
                                              if (FFAppState().creditsCount <
                                                  1) {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                      valueOrDefault<String>(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getVariableText(
                                                          enText:
                                                              'Out of Credits!',
                                                          deText:
                                                              'Keine Credits mehr!',
                                                          esText:
                                                              'Sem créditos!',
                                                          nlText:
                                                              '¡Sin créditos!',
                                                          frText:
                                                              'Slutt på studiepoeng!',
                                                          itText:
                                                              'Luotot loppu!',
                                                          ptText:
                                                              'Plus de crédits !',
                                                          ruText:
                                                              'Geen credits meer!',
                                                          plText:
                                                              'Brak kredytów!',
                                                        ),
                                                        'Out of Credits!',
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                fontFamily:
                                                                    'Readex Pro',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                              ),
                                                    ),
                                                    duration: Duration(
                                                        milliseconds: 4000),
                                                    backgroundColor:
                                                        Color(0xFF011323),
                                                  ),
                                                );
                                                if (_shouldSetState)
                                                  setState(() {});
                                                return;
                                              }
                                            }
                                            _model.internetEnabled =
                                                await actions
                                                    .checkInternetConnection();
                                            _shouldSetState = true;
                                            if (_model.internetEnabled ==
                                                true) {
                                              setState(() {
                                                _model.isDataUploading1 = false;
                                                _model.uploadedLocalFile1 =
                                                    FFUploadedFile(
                                                        bytes:
                                                            Uint8List.fromList(
                                                                []));
                                              });

                                              FFAppState().imageString = '';
                                            } else {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    valueOrDefault<String>(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getVariableText(
                                                        enText:
                                                            'Internet not connected! This app requires an active internet connection.',
                                                        deText:
                                                            'Internet nicht verbunden! Diese App erfordert eine aktive Internetverbindung.',
                                                        esText:
                                                            'A Internet não está ligada! Esta aplicação requer uma ligação ativa à Internet.',
                                                        nlText:
                                                            'Internet no está conectado. Esta aplicación requiere una conexión activa a Internet.',
                                                        frText:
                                                            'Internett er ikke tilkoblet! Denne appen krever en aktiv internettforbindelse.',
                                                        itText:
                                                            'Internet ei ole yhteydessä! Tämä sovellus vaatii aktiivisen internetyhteyden.',
                                                        ptText:
                                                            'Internet non connecté ! Cette application nécessite une connexion internet active.',
                                                        ruText:
                                                            'Internet niet verbonden! Deze app vereist een actieve internetverbinding.',
                                                        plText:
                                                            'Internet nie jest połączony! Ta aplikacja wymaga aktywnego połączenia z Internetem.',
                                                      ),
                                                      'Internet not connected! This app requires an active internet connection.',
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .titleMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                        ),
                                                  ),
                                                  duration: Duration(
                                                      milliseconds: 4000),
                                                  backgroundColor:
                                                      Color(0xFF0C0F13),
                                                ),
                                              );
                                              if (_shouldSetState)
                                                setState(() {});
                                              return;
                                            }

                                            final selectedMedia =
                                                await selectMedia(
                                              maxWidth: 600.00,
                                              maxHeight: 600.00,
                                              imageQuality: 80,
                                              mediaSource:
                                                  MediaSource.photoGallery,
                                              multiImage: false,
                                            );
                                            if (selectedMedia != null &&
                                                selectedMedia.every((m) =>
                                                    validateFileFormat(
                                                        m.storagePath,
                                                        context))) {
                                              setState(() => _model
                                                  .isDataUploading1 = true);
                                              var selectedUploadedFiles =
                                                  <FFUploadedFile>[];

                                              try {
                                                selectedUploadedFiles =
                                                    selectedMedia
                                                        .map((m) =>
                                                            FFUploadedFile(
                                                              name: m
                                                                  .storagePath
                                                                  .split('/')
                                                                  .last,
                                                              bytes: m.bytes,
                                                              height: m
                                                                  .dimensions
                                                                  ?.height,
                                                              width: m
                                                                  .dimensions
                                                                  ?.width,
                                                              blurHash:
                                                                  m.blurHash,
                                                            ))
                                                        .toList();
                                              } finally {
                                                _model.isDataUploading1 = false;
                                              }
                                              if (selectedUploadedFiles
                                                      .length ==
                                                  selectedMedia.length) {
                                                setState(() {
                                                  _model.uploadedLocalFile1 =
                                                      selectedUploadedFiles
                                                          .first;
                                                });
                                              } else {
                                                setState(() {});
                                                return;
                                              }
                                            }

                                            _model.base64outputCopy =
                                                await actions
                                                    .convertImageFileToBase64(
                                              _model.uploadedLocalFile1,
                                            );
                                            _shouldSetState = true;
                                            FFAppState().imageString =
                                                _model.base64outputCopy!;
                                            if (_model.uploadedLocalFile1 ==
                                                    null ||
                                                (_model.uploadedLocalFile1.bytes
                                                        ?.isEmpty ??
                                                    true)) {
                                              if (_shouldSetState)
                                                setState(() {});
                                              return;
                                            }
                                            FFAppState().clearImage = false;
                                            _model.resampleOutput =
                                                await querySampleDataRecordOnce(
                                              queryBuilder:
                                                  (sampleDataRecord) =>
                                                      sampleDataRecord.where(
                                                'operation01',
                                                isEqualTo: 'resample',
                                              ),
                                              singleRecord: true,
                                            ).then((s) => s.firstOrNull);
                                            _shouldSetState = true;
                                            FFAppState().tokRe = _model
                                                .resampleOutput!.results01;
                                            if (_shouldSetState)
                                              setState(() {});
                                          },
                                          child: Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.5,
                                            height: MediaQuery.sizeOf(context)
                                                    .height *
                                                0.5,
                                            decoration: BoxDecoration(
                                              color: Color(0xFFBEB9FF),
                                              image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: Image.asset(
                                                  'assets/images/4475f_copy.jpg',
                                                ).image,
                                              ),
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  Icons.add_photo_alternate,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .accent4,
                                                  size: 50.0,
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          10.0, 0.0, 10.0, 0.0),
                                                  child: Container(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        0.5,
                                                    height: MediaQuery.sizeOf(
                                                                context)
                                                            .height *
                                                        0.1,
                                                    decoration: BoxDecoration(),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Expanded(
                                                          child: Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.00, 0.00),
                                                            child: AutoSizeText(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                '2fk1obt1' /* Add Selfie/Source Image with C... */,
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelLarge
                                                                  .override(
                                                                    fontFamily:
                                                                        'Readex Pro',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .accent4,
                                                                    fontSize:
                                                                        32.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.00,
                                                                    -1.00),
                                                            child: AutoSizeText(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                'gh1hdu1h' /* (Only .jpg, jpeg accepted) */,
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Readex Pro',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .accent4,
                                                                    fontStyle:
                                                                        FontStyle
                                                                            .italic,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ).animateOnPageLoad(animationsMap[
                                            'containerOnPageLoadAnimation1']!),
                                      ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 5,
                            child: Align(
                              alignment: AlignmentDirectional(0.00, 0.00),
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 0.5,
                                height: MediaQuery.sizeOf(context).height * 0.4,
                                child: Stack(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  children: [
                                    if (FFAppState().imageString2 != null &&
                                        FFAppState().imageString2 != '')
                                      Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.5,
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                0.3,
                                        child: custom_widgets.Base64Image(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.5,
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              0.3,
                                          base64: FFAppState().imageString2,
                                        ),
                                      ),
                                    if (FFAppState().imageString2 == null ||
                                        FFAppState().imageString2 == '')
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.00, 0.00),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            var _shouldSetState = false;
                                            if (FFAppState().creditsEnabled ==
                                                true) {
                                              if (FFAppState().creditsCount <
                                                  1) {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                      valueOrDefault<String>(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getVariableText(
                                                          enText:
                                                              'Out of Credits!',
                                                          deText:
                                                              'Keine Credits mehr!',
                                                          esText:
                                                              'Sem créditos!',
                                                          nlText:
                                                              '¡Sin créditos!',
                                                          frText:
                                                              'Slutt på studiepoeng!',
                                                          itText:
                                                              'Luotot loppu!',
                                                          ptText:
                                                              'Plus de crédits !',
                                                          ruText:
                                                              'Geen credits meer!',
                                                          plText:
                                                              'Brak kredytów!',
                                                        ),
                                                        'Out of Credits!',
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                fontFamily:
                                                                    'Readex Pro',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                              ),
                                                    ),
                                                    duration: Duration(
                                                        milliseconds: 4000),
                                                    backgroundColor:
                                                        Color(0xFF011323),
                                                  ),
                                                );
                                                if (_shouldSetState)
                                                  setState(() {});
                                                return;
                                              }
                                            }
                                            _model.internetEnabledphoto2 =
                                                await actions
                                                    .checkInternetConnection();
                                            _shouldSetState = true;
                                            if (_model.internetEnabledphoto2 ==
                                                true) {
                                              FFAppState().imageString2 = '';
                                              if (FFAppState().imageString ==
                                                      null ||
                                                  FFAppState().imageString ==
                                                      '') {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                      valueOrDefault<String>(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getVariableText(
                                                          enText:
                                                              'Source image not set. Add source image first. ',
                                                          deText:
                                                              'Quellbild nicht eingestellt. Fügen Sie zuerst das Quellbild hinzu. ',
                                                          esText:
                                                              'Imagen de origen no configurada. Añada primero la imagen de origen. ',
                                                          nlText:
                                                              'Bronafbeelding niet ingesteld. Voeg eerst de bronafbeelding toe. ',
                                                          frText:
                                                              'L\'image source n\'est pas définie. Ajouter d\'abord l\'image source. ',
                                                          itText:
                                                              'Immagine sorgente non impostata. Aggiungere prima l\'immagine di origine. ',
                                                          ptText:
                                                              'Imagem de origem não definida. Adicionar primeiro a imagem de origem. ',
                                                          ruText:
                                                              'Исходное изображение не установлено. Сначала добавьте исходное изображение. ',
                                                          plText:
                                                              'Obraz źródłowy nie został ustawiony. Najpierw dodaj obraz źródłowy. ',
                                                        ),
                                                        'Source image not set. Add source image first. ',
                                                      ),
                                                      style: TextStyle(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                      ),
                                                    ),
                                                    duration: Duration(
                                                        milliseconds: 4000),
                                                    backgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondary,
                                                  ),
                                                );
                                                if (_shouldSetState)
                                                  setState(() {});
                                                return;
                                              }
                                              setState(() {
                                                _model.isDataUploading2 = false;
                                                _model.uploadedLocalFile2 =
                                                    FFUploadedFile(
                                                        bytes:
                                                            Uint8List.fromList(
                                                                []));
                                              });

                                              FFAppState().imageString2 = '';
                                              final selectedMedia =
                                                  await selectMedia(
                                                maxWidth: 600.00,
                                                maxHeight: 600.00,
                                                imageQuality: 80,
                                                mediaSource:
                                                    MediaSource.photoGallery,
                                                multiImage: false,
                                              );
                                              if (selectedMedia != null &&
                                                  selectedMedia.every((m) =>
                                                      validateFileFormat(
                                                          m.storagePath,
                                                          context))) {
                                                setState(() => _model
                                                    .isDataUploading2 = true);
                                                var selectedUploadedFiles =
                                                    <FFUploadedFile>[];

                                                try {
                                                  selectedUploadedFiles =
                                                      selectedMedia
                                                          .map((m) =>
                                                              FFUploadedFile(
                                                                name: m
                                                                    .storagePath
                                                                    .split('/')
                                                                    .last,
                                                                bytes: m.bytes,
                                                                height: m
                                                                    .dimensions
                                                                    ?.height,
                                                                width: m
                                                                    .dimensions
                                                                    ?.width,
                                                                blurHash:
                                                                    m.blurHash,
                                                              ))
                                                          .toList();
                                                } finally {
                                                  _model.isDataUploading2 =
                                                      false;
                                                }
                                                if (selectedUploadedFiles
                                                        .length ==
                                                    selectedMedia.length) {
                                                  setState(() {
                                                    _model.uploadedLocalFile2 =
                                                        selectedUploadedFiles
                                                            .first;
                                                  });
                                                } else {
                                                  setState(() {});
                                                  return;
                                                }
                                              }

                                              _model.base64outputCopyCopy =
                                                  await actions
                                                      .convertImageFileToBase64(
                                                _model.uploadedLocalFile2,
                                              );
                                              _shouldSetState = true;
                                              FFAppState().imageString2 =
                                                  _model.base64outputCopyCopy!;
                                              if (FFAppState().imageString2 ==
                                                      null ||
                                                  FFAppState().imageString2 ==
                                                      '') {
                                                if (_shouldSetState)
                                                  setState(() {});
                                                return;
                                              }
                                              FFAppState().clearImage = false;
                                              FFAppState().analyzeButton =
                                                  false;
                                              _model.internetEnabledClose3rd =
                                                  await actions
                                                      .checkInternetConnection();
                                              _shouldSetState = true;
                                              if (_model
                                                      .internetEnabledClose3rd ==
                                                  true) {
                                                if (FFAppState().ratingCount ==
                                                    2) {
                                                  await actions.requestRating();
                                                }
                                                if (FFAppState().ratingCount >
                                                    50) {
                                                  FFAppState().ratingCount = 0;
                                                }
                                              } else {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                      valueOrDefault<String>(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getVariableText(
                                                          enText:
                                                              'Internet not connected! This app requires an active internet connection.',
                                                          deText:
                                                              'Internet nicht verbunden! Diese App erfordert eine aktive Internetverbindung.',
                                                          esText:
                                                              'A Internet não está ligada! Esta aplicação requer uma ligação ativa à Internet.',
                                                          nlText:
                                                              'Internet no está conectado. Esta aplicación requiere una conexión activa a Internet.',
                                                          frText:
                                                              'Internett er ikke tilkoblet! Denne appen krever en aktiv internettforbindelse.',
                                                          itText:
                                                              'Internet ei ole yhteydessä! Tämä sovellus vaatii aktiivisen internetyhteyden.',
                                                          ptText:
                                                              'Internet non connecté ! Cette application nécessite une connexion internet active.',
                                                          ruText:
                                                              'Internet niet verbonden! Deze app vereist een actieve internetverbinding.',
                                                          plText:
                                                              'Internet nie jest połączony! Ta aplikacja wymaga aktywnego połączenia z Internetem.',
                                                        ),
                                                        'Internet not connected! This app requires an active internet connection.',
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Readex Pro',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                              ),
                                                    ),
                                                    duration: Duration(
                                                        milliseconds: 4000),
                                                    backgroundColor:
                                                        Color(0xFF0C0F13),
                                                  ),
                                                );
                                                if (_shouldSetState)
                                                  setState(() {});
                                                return;
                                              }
                                            } else {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    valueOrDefault<String>(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getVariableText(
                                                        enText:
                                                            'Internet not connected! This app requires an active internet connection.',
                                                        deText:
                                                            'Internet nicht verbunden! Diese App erfordert eine aktive Internetverbindung.',
                                                        esText:
                                                            'A Internet não está ligada! Esta aplicação requer uma ligação ativa à Internet.',
                                                        nlText:
                                                            'Internet no está conectado. Esta aplicación requiere una conexión activa a Internet.',
                                                        frText:
                                                            'Internett er ikke tilkoblet! Denne appen krever en aktiv internettforbindelse.',
                                                        itText:
                                                            'Internet ei ole yhteydessä! Tämä sovellus vaatii aktiivisen internetyhteyden.',
                                                        ptText:
                                                            'Internet non connecté ! Cette application nécessite une connexion internet active.',
                                                        ruText:
                                                            'Internet niet verbonden! Deze app vereist een actieve internetverbinding.',
                                                        plText:
                                                            'Internet nie jest połączony! Ta aplikacja wymaga aktywnego połączenia z Internetem.',
                                                      ),
                                                      'Internet not connected! This app requires an active internet connection.',
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .titleMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                        ),
                                                  ),
                                                  duration: Duration(
                                                      milliseconds: 4000),
                                                  backgroundColor:
                                                      Color(0xFF0C0F13),
                                                ),
                                              );
                                              if (_shouldSetState)
                                                setState(() {});
                                              return;
                                            }

                                            if (_shouldSetState)
                                              setState(() {});
                                          },
                                          child: Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.5,
                                            height: MediaQuery.sizeOf(context)
                                                    .height *
                                                0.5,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: Image.asset(
                                                  'assets/images/7a7c8d303c21d794f23042dbd074475f_copy.jpg',
                                                ).image,
                                              ),
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Expanded(
                                                  child: Container(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        0.5,
                                                    height: MediaQuery.sizeOf(
                                                                context)
                                                            .height *
                                                        0.1,
                                                    decoration: BoxDecoration(
                                                      color: Color(0xA7000000),
                                                    ),
                                                    child: Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.00, 0.00),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    20.0,
                                                                    50.0,
                                                                    20.0,
                                                                    50.0),
                                                        child: AutoSizeText(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'ud5i66ne' /* Add Pose Image */,
                                                          ),
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelLarge
                                                              .override(
                                                                fontFamily:
                                                                    'Readex Pro',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .accent4,
                                                                fontSize: 22.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ).animateOnPageLoad(animationsMap[
                                            'containerOnPageLoadAnimation2']!),
                                      ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ].divide(SizedBox(width: 20.0)),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 10.0, 20.0, 0.0),
                    child: TextFormField(
                      controller: _model.textController,
                      focusNode: _model.textFieldFocusNode,
                      onChanged: (_) => EasyDebounce.debounce(
                        '_model.textController',
                        Duration(milliseconds: 2000),
                        () => setState(() {}),
                      ),
                      autofocus: true,
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: FFLocalizations.of(context).getText(
                          'fjpxjd4v' /* Enter prompt */,
                        ),
                        labelStyle: FlutterFlowTheme.of(context).labelMedium,
                        hintStyle: FlutterFlowTheme.of(context).labelMedium,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).alternate,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).warning,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).error,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).error,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        filled: true,
                        fillColor: Color(0xC4000000),
                        suffixIcon: _model.textController!.text.isNotEmpty
                            ? InkWell(
                                onTap: () async {
                                  _model.textController?.clear();
                                  setState(() {});
                                },
                                child: Icon(
                                  Icons.clear,
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  size: 22.0,
                                ),
                              )
                            : null,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Readex Pro',
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                          ),
                      textAlign: TextAlign.start,
                      maxLines: 2,
                      maxLength: 50,
                      maxLengthEnforcement: MaxLengthEnforcement.enforced,
                      cursorColor: FlutterFlowTheme.of(context).accent4,
                      validator:
                          _model.textControllerValidator.asValidator(context),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.00, 0.00),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                      child: AutoSizeText(
                        FFLocalizations.of(context).getText(
                          'g6qxjodl' /* AI processing may take 1 to 5 ... */,
                        ),
                        textAlign: TextAlign.center,
                        style:
                            FlutterFlowTheme.of(context).labelMedium.override(
                                  fontFamily: 'Readex Pro',
                                  color: Color(0xFF8CABFF),
                                ),
                      ),
                    ),
                  ),
                  Stack(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    children: [
                      if (FFAppState().isAnalyzing)
                        Align(
                          alignment: AlignmentDirectional(0.00, 0.00),
                          child: AutoSizeText(
                            FFLocalizations.of(context).getText(
                              '4lhkpvc2' /* Processing Images.... */,
                            ),
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context).titleSmall,
                          ),
                        ),
                      if (FFAppState().errorGetPrediction != null &&
                          FFAppState().errorGetPrediction != '')
                        Align(
                          alignment: AlignmentDirectional(0.00, 0.00),
                          child: AutoSizeText(
                            FFAppState().errorGetPrediction,
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context).titleSmall,
                          ),
                        ),
                    ],
                  ),
                  FFButtonWidget(
                    onPressed: FFAppState().analyzeButton
                        ? null
                        : () async {
                            var _shouldSetState = false;
                            if (FFAppState().imageString2 == null ||
                                FFAppState().imageString2 == '') {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    valueOrDefault<String>(
                                      FFLocalizations.of(context)
                                          .getVariableText(
                                        enText:
                                            'Pose image not set. Add pose image first. ',
                                        deText:
                                            'Posenbild nicht eingestellt. Fügen Sie zuerst das Posenbild hinzu. ',
                                        esText:
                                            'Imagen de pose no configurada. Añada primero la imagen de pose. ',
                                        nlText:
                                            'Poseerafbeelding niet ingesteld. Voeg eerst de poseerafbeelding toe. ',
                                        frText:
                                            'L\'image de pose n\'est pas définie. Ajoutez d\'abord l\'image de pose. ',
                                        itText:
                                            'Immagine della posa non impostata. Aggiungere prima l\'immagine della posa. ',
                                        ptText:
                                            'Imagem de pose não definida. Adicionar primeiro a imagem de pose. ',
                                        ruText:
                                            'Изображение позы не установлено. Сначала добавьте изображение позы. ',
                                        plText:
                                            'Obraz pozy nie został ustawiony. Najpierw dodaj obraz pozy. ',
                                      ),
                                      'Pose image not set. Add pose image first. ',
                                    ),
                                    style: TextStyle(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                    ),
                                  ),
                                  duration: Duration(milliseconds: 4000),
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).secondary,
                                ),
                              );
                              if (_shouldSetState) setState(() {});
                              return;
                            }
                            _model.internetEnabledCopy3 =
                                await actions.checkInternetConnection();
                            _shouldSetState = true;
                            if (_model.internetEnabledCopy3 != true) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    valueOrDefault<String>(
                                      FFLocalizations.of(context)
                                          .getVariableText(
                                        enText:
                                            'Internet not connected! This app requires an active internet connection.',
                                        deText:
                                            'Internet nicht verbunden! Diese App erfordert eine aktive Internetverbindung.',
                                        esText:
                                            'A Internet não está ligada! Esta aplicação requer uma ligação ativa à Internet.',
                                        nlText:
                                            'Internet no está conectado. Esta aplicación requiere una conexión activa a Internet.',
                                        frText:
                                            'Internett er ikke tilkoblet! Denne appen krever en aktiv internettforbindelse.',
                                        itText:
                                            'Internet ei ole yhteydessä! Tämä sovellus vaatii aktiivisen internetyhteyden.',
                                        ptText:
                                            'Internet non connecté ! Cette application nécessite une connexion internet active.',
                                        ruText:
                                            'Internet niet verbonden! Deze app vereist een actieve internetverbinding.',
                                        plText:
                                            'Internet nie jest połączony! Ta aplikacja wymaga aktywnego połączenia z Internetem.',
                                      ),
                                      'Internet not connected! This app requires an active internet connection.',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                        ),
                                  ),
                                  duration: Duration(milliseconds: 4000),
                                  backgroundColor: Color(0xFF0C0F13),
                                ),
                              );
                              if (_shouldSetState) setState(() {});
                              return;
                            }
                            FFAppState().isAnalyzing = true;
                            FFAppState().analyzeButton = true;
                            FFAppState().clearImage = true;
                            FFAppState().errorGetPrediction = '';
                            _model.createPredictionResult =
                                await ReplicateAPIGroup.createPredictionCall
                                    .call(
                              imageURL: FFAppState().imageString,
                              tokReCreate: FFAppState().tokRe,
                              imageURL2: FFAppState().imageString2,
                              prompt: _model.textController.text,
                            );
                            _shouldSetState = true;
                            if ((_model.createPredictionResult?.succeeded ??
                                true)) {
                              _model.instantTimer = InstantTimer.periodic(
                                duration: Duration(milliseconds: 2000),
                                callback: (timer) async {
                                  _model.getPrediction = await ReplicateAPIGroup
                                      .getPredictionCall
                                      .call(
                                    id: ReplicateAPIGroup.createPredictionCall
                                        .id(
                                          (_model.createPredictionResult
                                                  ?.jsonBody ??
                                              ''),
                                        )
                                        .toString(),
                                    tokReGet: FFAppState().tokRe,
                                  );
                                  _shouldSetState = true;
                                  if ((_model.getPrediction?.succeeded ??
                                      true)) {
                                    if ((String status) {
                                      return status == "succeeded";
                                    }(ReplicateAPIGroup.getPredictionCall
                                        .status(
                                          (_model.getPrediction?.jsonBody ??
                                              ''),
                                        )
                                        .toString())) {
                                      if (ReplicateAPIGroup.getPredictionCall
                                              .output(
                                                (_model.getPrediction
                                                        ?.jsonBody ??
                                                    ''),
                                              )
                                              .toString() ==
                                          'null') {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              valueOrDefault<String>(
                                                FFLocalizations.of(context)
                                                    .getVariableText(
                                                  enText:
                                                      'Processing error.  Potential NSFW content. Try another prompt or another image.',
                                                  deText:
                                                      'Verarbeitungsfehler.  Möglicherweise NSFW-Inhalt. Versuchen Sie einen anderen Prompt oder ein anderes Bild.',
                                                  esText:
                                                      'Error de procesamiento.  Posible contenido NSFW. Prueba con otro mensaje u otra imagen.',
                                                  nlText:
                                                      'Verwerkingsfout.  Mogelijk NSFW-inhoud. Probeer een andere prompt of een andere afbeelding.',
                                                  frText:
                                                      'Erreur de traitement.  Contenu NSFW potentiel. Essayez un autre message ou une autre image.',
                                                  itText:
                                                      'Errore di elaborazione.  Potenziale contenuto NSFW. Provare con un\'altra richiesta o un\'altra immagine.',
                                                  ptText:
                                                      'Erro de processamento.  Potencial conteúdo NSFW. Tente outro prompt ou outra imagem.',
                                                  ruText:
                                                      'Ошибка обработки.  Потенциальный NSFW-контент. Попробуйте другую подсказку или другое изображение.',
                                                  plText:
                                                      'Błąd przetwarzania.  Potencjalna zawartość NSFW. Wypróbuj inną podpowiedź lub inny obraz.',
                                                ),
                                                'Processing error.  Potential NSFW content. Try another prompt or another image.',
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Readex Pro',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                            ),
                                            duration:
                                                Duration(milliseconds: 4000),
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondary,
                                          ),
                                        );
                                        FFAppState().isAnalyzing = false;
                                        FFAppState().clearImage = false;
                                        FFAppState().errorGetPrediction =
                                            ReplicateAPIGroup.getPredictionCall
                                                .error(
                                                  (_model.getPrediction
                                                          ?.jsonBody ??
                                                      ''),
                                                )
                                                .toString();
                                        _model.instantTimer?.cancel();
                                        if (_shouldSetState) setState(() {});
                                        return;
                                      }
                                      FFAppState().isAnalyzing = false;
                                      FFAppState().outputimage =
                                          ReplicateAPIGroup.getPredictionCall
                                              .output(
                                        (_model.getPrediction?.jsonBody ?? ''),
                                      );
                                      FFAppState().outputimagestring =
                                          ReplicateAPIGroup.getPredictionCall
                                              .output(
                                                (_model.getPrediction
                                                        ?.jsonBody ??
                                                    ''),
                                              )
                                              .toString();
                                      FFAppState().clearImage = false;
                                      FFAppState().ratingCount =
                                          FFAppState().ratingCount + 1;
                                      if (FFAppState().creditsEnabled != true) {
                                        _model.instantTimer?.cancel();
                                        await showModalBottomSheet(
                                          isScrollControlled: true,
                                          backgroundColor: Colors.transparent,
                                          enableDrag: false,
                                          context: context,
                                          builder: (context) {
                                            return GestureDetector(
                                              onTap: () => _model.unfocusNode
                                                      .canRequestFocus
                                                  ? FocusScope.of(context)
                                                      .requestFocus(
                                                          _model.unfocusNode)
                                                  : FocusScope.of(context)
                                                      .unfocus(),
                                              child: Padding(
                                                padding:
                                                    MediaQuery.viewInsetsOf(
                                                        context),
                                                child: Container(
                                                  height:
                                                      MediaQuery.sizeOf(context)
                                                              .height *
                                                          0.9,
                                                  child: GenertaedArtWidget(),
                                                ),
                                              ),
                                            );
                                          },
                                        ).then((value) => safeSetState(() {}));

                                        if (_shouldSetState) setState(() {});
                                        return;
                                      }
                                      if (FFAppState().creditsCount >= 1) {
                                        FFAppState().creditsCount =
                                            FFAppState().creditsCount + -1;
                                      }
                                      _model.instantTimer?.cancel();
                                      await showModalBottomSheet(
                                        isScrollControlled: true,
                                        backgroundColor: Colors.transparent,
                                        enableDrag: false,
                                        context: context,
                                        builder: (context) {
                                          return GestureDetector(
                                            onTap: () => _model
                                                    .unfocusNode.canRequestFocus
                                                ? FocusScope.of(context)
                                                    .requestFocus(
                                                        _model.unfocusNode)
                                                : FocusScope.of(context)
                                                    .unfocus(),
                                            child: Padding(
                                              padding: MediaQuery.viewInsetsOf(
                                                  context),
                                              child: Container(
                                                height:
                                                    MediaQuery.sizeOf(context)
                                                            .height *
                                                        0.9,
                                                child: GenertaedArtWidget(),
                                              ),
                                            ),
                                          );
                                        },
                                      ).then((value) => safeSetState(() {}));

                                      if (_shouldSetState) setState(() {});
                                      return;
                                    } else {
                                      if ((String status) {
                                        return status == "failed";
                                      }(ReplicateAPIGroup.getPredictionCall
                                          .status(
                                            (_model.getPrediction?.jsonBody ??
                                                ''),
                                          )
                                          .toString())) {
                                        FFAppState().isAnalyzing = false;
                                        FFAppState().clearImage = false;
                                        FFAppState().errorGetPrediction =
                                            ReplicateAPIGroup.getPredictionCall
                                                .error(
                                                  (_model.getPrediction
                                                          ?.jsonBody ??
                                                      ''),
                                                )
                                                .toString();
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              valueOrDefault<String>(
                                                FFLocalizations.of(context)
                                                    .getVariableText(
                                                  enText:
                                                      'Processing error.  Potential NSFW content. Try another prompt or another image.',
                                                  deText:
                                                      'Verarbeitungsfehler.  Möglicherweise NSFW-Inhalt. Versuchen Sie einen anderen Prompt oder ein anderes Bild.',
                                                  esText:
                                                      'Error de procesamiento.  Posible contenido NSFW. Prueba con otro mensaje u otra imagen.',
                                                  nlText:
                                                      'Verwerkingsfout.  Mogelijk NSFW-inhoud. Probeer een andere prompt of een andere afbeelding.',
                                                  frText:
                                                      'Erreur de traitement.  Contenu NSFW potentiel. Essayez un autre message ou une autre image.',
                                                  itText:
                                                      'Errore di elaborazione.  Potenziale contenuto NSFW. Provare con un\'altra richiesta o un\'altra immagine.',
                                                  ptText:
                                                      'Erro de processamento.  Potencial conteúdo NSFW. Tente outro prompt ou outra imagem.',
                                                  ruText:
                                                      'Ошибка обработки.  Потенциальный NSFW-контент. Попробуйте другую подсказку или другое изображение.',
                                                  plText:
                                                      'Błąd przetwarzania.  Potencjalna zawartość NSFW. Wypróbuj inną podpowiedź lub inny obraz.',
                                                ),
                                                'Processing error.  Potential NSFW content. Try another prompt or another image.',
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Readex Pro',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                            ),
                                            duration:
                                                Duration(milliseconds: 4000),
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondary,
                                          ),
                                        );
                                        _model.instantTimer?.cancel();
                                        if (_shouldSetState) setState(() {});
                                        return;
                                      }
                                    }
                                  }
                                },
                                startImmediately: false,
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Create prediction failed. If error persists, contact support.',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                  duration: Duration(milliseconds: 4000),
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).secondary,
                                ),
                              );
                              FFAppState().isAnalyzing = false;
                              FFAppState().clearImage = false;
                              if (_shouldSetState) setState(() {});
                              return;
                            }

                            if (_shouldSetState) setState(() {});
                          },
                    text: FFLocalizations.of(context).getText(
                      'oi9xgmw6' /* Generate */,
                    ),
                    options: FFButtonOptions(
                      width: MediaQuery.sizeOf(context).width * 0.7,
                      height: 40.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle: FlutterFlowTheme.of(context).titleMedium,
                      elevation: 10.0,
                      borderSide: BorderSide(
                        color: Color(0xFF8CABFF),
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                      disabledColor: Color(0xFF5F7190),
                      disabledTextColor: Color(0xFF9EACCC),
                    ),
                  ).animateOnPageLoad(
                      animationsMap['buttonOnPageLoadAnimation1']!),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                    child: FFButtonWidget(
                      onPressed: FFAppState().clearImage
                          ? null
                          : () async {
                              var _shouldSetState = false;
                              setState(() {
                                _model.isDataUploading1 = false;
                                _model.uploadedLocalFile1 = FFUploadedFile(
                                    bytes: Uint8List.fromList([]));
                              });

                              setState(() {
                                _model.isDataUploading2 = false;
                                _model.uploadedLocalFile2 = FFUploadedFile(
                                    bytes: Uint8List.fromList([]));
                              });

                              setState(() {
                                FFAppState().isAnalyzing = false;
                                FFAppState().analyzeButton = true;
                                FFAppState().generateCaptions = true;
                                FFAppState().clearImage = true;
                                FFAppState().persistimageURL = '';
                                FFAppState().analysisCompleteTxtMsg = false;
                                FFAppState().captionsGeneratedTxtMsg = false;
                                FFAppState().imageString = '';
                                FFAppState().imageString2 = '';
                                FFAppState().errorGetPrediction = '';
                              });
                              FFAppState().currentTimeStamp =
                                  getCurrentTimestamp;
                              _model.internetEnabledOnPageClose1st =
                                  await actions.checkInternetConnection();
                              _shouldSetState = true;
                              if (_model.internetEnabledOnPageClose1st !=
                                  true) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      valueOrDefault<String>(
                                        FFLocalizations.of(context)
                                            .getVariableText(
                                          enText:
                                              'Internet not connected! This app requires an active internet connection.',
                                          deText:
                                              'Internet nicht verbunden! Diese App erfordert eine aktive Internetverbindung.',
                                          esText:
                                              'A Internet não está ligada! Esta aplicação requer uma ligação ativa à Internet.',
                                          nlText:
                                              'Internet no está conectado. Esta aplicación requiere una conexión activa a Internet.',
                                          frText:
                                              'Internett er ikke tilkoblet! Denne appen krever en aktiv internettforbindelse.',
                                          itText:
                                              'Internet ei ole yhteydessä! Tämä sovellus vaatii aktiivisen internetyhteyden.',
                                          ptText:
                                              'Internet non connecté ! Cette application nécessite une connexion internet active.',
                                          ruText:
                                              'Internet niet verbonden! Deze app vereist een actieve internetverbinding.',
                                          plText:
                                              'Internet nie jest połączony! Ta aplikacja wymaga aktywnego połączenia z Internetem.',
                                        ),
                                        'Internet not connected! This app requires an active internet connection.',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                          ),
                                    ),
                                    duration: Duration(milliseconds: 4000),
                                    backgroundColor: Color(0xFF0C0F13),
                                  ),
                                );
                                if (_shouldSetState) setState(() {});
                                return;
                              }
                              if (FFAppState().subscriptionCheckOnPageLoad ==
                                  false) {
                                final isEntitled =
                                    await revenue_cat.isEntitled('Premium') ??
                                        false;
                                if (!isEntitled) {
                                  await revenue_cat.loadOfferings();
                                }

                                if (isEntitled) {
                                  setState(() {
                                    FFAppState().creditsEnabled = false;
                                    FFAppState().subscriptionCheckOnPageLoad =
                                        true;
                                  });
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        valueOrDefault<String>(
                                          FFLocalizations.of(context)
                                              .getVariableText(
                                            enText:
                                                'Limited access. No active subscription!',
                                            deText:
                                                'Begrenzter Zugang. Kein aktives Abonnement!',
                                            esText:
                                                'Acesso limitado. Sem subscrição ativa!',
                                            nlText:
                                                'Acceso limitado. Sin suscripción activa.',
                                            frText:
                                                'Begrenset tilgang. Ikke noe aktivt abonnement!',
                                            itText:
                                                'Rajoitettu pääsy. Ei aktiivista tilausta!',
                                            ptText:
                                                'Accès limité. Pas d\'abonnement actif !',
                                            ruText:
                                                'Beperkte toegang. Geen actief abonnement!',
                                            plText:
                                                'Ograniczony dostęp. Brak aktywnej subskrypcji!',
                                          ),
                                          'Limited access. No active subscription!',
                                        ),
                                        style: TextStyle(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                      ),
                                      duration: Duration(milliseconds: 4000),
                                      backgroundColor:
                                          FlutterFlowTheme.of(context)
                                              .secondary,
                                    ),
                                  );
                                }
                              }
                              if (FFAppState().creditsEnabled == true) {
                                if (FFAppState().creditsCount < 1) {
                                  if (FFAppState()
                                              .currentTimeStamp!
                                              .millisecondsSinceEpoch -
                                          FFAppState()
                                              .lastActionDate!
                                              .millisecondsSinceEpoch >
                                      86400000) {
                                    FFAppState().creditsCount = 3;
                                    FFAppState().lastActionDate =
                                        getCurrentTimestamp;
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          valueOrDefault<String>(
                                            FFLocalizations.of(context)
                                                .getVariableText(
                                              enText: 'Out of Credits!',
                                              deText: 'Keine Credits mehr!',
                                              esText: 'Sem créditos!',
                                              nlText: '¡Sin créditos!',
                                              frText: 'Slutt på studiepoeng!',
                                              itText: 'Luotot loppu!',
                                              ptText: 'Plus de crédits !',
                                              ruText: 'Geen credits meer!',
                                              plText: 'Brak kredytów!',
                                            ),
                                            'Out of Credits!',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .titleSmall
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                              ),
                                        ),
                                        duration: Duration(milliseconds: 4000),
                                        backgroundColor: Color(0xFF011323),
                                      ),
                                    );
                                    if (_shouldSetState) setState(() {});
                                    return;
                                  }
                                } else {
                                  if (FFAppState().creditsCount > 3) {
                                    FFAppState().creditsCount = 3;
                                  }
                                }
                              }
                              _model.internetEnabledClose2nd =
                                  await actions.checkInternetConnection();
                              _shouldSetState = true;
                              if (_model.internetEnabledClose2nd == true) {
                                if (FFAppState().ratingCount == 2) {
                                  await actions.requestRating();
                                }
                                if (FFAppState().ratingCount > 50) {
                                  FFAppState().ratingCount = 0;
                                }
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      valueOrDefault<String>(
                                        FFLocalizations.of(context)
                                            .getVariableText(
                                          enText:
                                              'Internet not connected! This app requires an active internet connection.',
                                          deText:
                                              'Internet nicht verbunden! Diese App erfordert eine aktive Internetverbindung.',
                                          esText:
                                              'A Internet não está ligada! Esta aplicação requer uma ligação ativa à Internet.',
                                          nlText:
                                              'Internet no está conectado. Esta aplicación requiere una conexión activa a Internet.',
                                          frText:
                                              'Internett er ikke tilkoblet! Denne appen krever en aktiv internettforbindelse.',
                                          itText:
                                              'Internet ei ole yhteydessä! Tämä sovellus vaatii aktiivisen internetyhteyden.',
                                          ptText:
                                              'Internet non connecté ! Cette application nécessite une connexion internet active.',
                                          ruText:
                                              'Internet niet verbonden! Deze app vereist een actieve internetverbinding.',
                                          plText:
                                              'Internet nie jest połączony! Ta aplikacja wymaga aktywnego połączenia z Internetem.',
                                        ),
                                        'Internet not connected! This app requires an active internet connection.',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: FlutterFlowTheme.of(context)
                                                .error,
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
                        '4llcj4n0' /* Reset/Clear Image */,
                      ),
                      options: FFButtonOptions(
                        width: MediaQuery.sizeOf(context).width * 0.7,
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle: FlutterFlowTheme.of(context).titleMedium,
                        elevation: 10.0,
                        borderSide: BorderSide(
                          color: Color(0xFF8CABFF),
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                        disabledColor: Color(0xFF5F7190),
                        disabledTextColor: Color(0xFF9EACCC),
                      ),
                    ).animateOnPageLoad(
                        animationsMap['buttonOnPageLoadAnimation2']!),
                  ),
                  if (FFAppState().creditsEnabled)
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        var _shouldSetState = false;
                        _model.interEnabledSubscribeHomePage =
                            await actions.checkInternetConnection();
                        _shouldSetState = true;
                        if (_model.interEnabledSubscribeHomePage != true) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                valueOrDefault<String>(
                                  FFLocalizations.of(context).getVariableText(
                                    enText:
                                        'Internet not connected! This app requires an active internet connection.',
                                    deText:
                                        'Internet nicht verbunden! Diese App erfordert eine aktive Internetverbindung.',
                                    esText:
                                        'A Internet não está ligada! Esta aplicação requer uma ligação ativa à Internet.',
                                    nlText:
                                        'Internet no está conectado. Esta aplicación requiere una conexión activa a Internet.',
                                    frText:
                                        'Internett er ikke tilkoblet! Denne appen krever en aktiv internettforbindelse.',
                                    itText:
                                        'Internet ei ole yhteydessä! Tämä sovellus vaatii aktiivisen internetyhteyden.',
                                    ptText:
                                        'Internet non connecté ! Cette application nécessite une connexion internet active.',
                                    ruText:
                                        'Internet niet verbonden! Deze app vereist een actieve internetverbinding.',
                                    plText:
                                        'Internet nie jest połączony! Ta aplikacja wymaga aktywnego połączenia z Internetem.',
                                  ),
                                  'Internet not connected! This app requires an active internet connection.',
                                ),
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
                        final isEntitled =
                            await revenue_cat.isEntitled('Premium') ?? false;
                        if (!isEntitled) {
                          await revenue_cat.loadOfferings();
                        }

                        if (isEntitled) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                valueOrDefault<String>(
                                  FFLocalizations.of(context).getVariableText(
                                    enText:
                                        'You already have a valid subscription!',
                                    deText:
                                        'Sie haben bereits ein gültiges Abonnement!',
                                    esText: 'Já tem uma subscrição válida!',
                                    nlText: 'Ya tiene una suscripción válida.',
                                    frText:
                                        'Du har allerede et gyldig abonnement!',
                                    itText:
                                        'Sinulla on jo voimassa oleva tilaus!',
                                    ptText:
                                        'Vous avez déjà un abonnement valide !',
                                    ruText: 'Je hebt al een geldig abonnement!',
                                    plText: 'Masz już ważną subskrypcję!',
                                  ),
                                  'You already have a valid subscription!',
                                ),
                                style: TextStyle(
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                ),
                              ),
                              duration: Duration(milliseconds: 4000),
                              backgroundColor:
                                  FlutterFlowTheme.of(context).secondary,
                            ),
                          );
                          setState(() {
                            FFAppState().creditsEnabled = false;
                            FFAppState().subscriptionCheckOnPageLoad = true;
                          });
                          if (_shouldSetState) setState(() {});
                          return;
                        }
                        await showModalBottomSheet(
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          enableDrag: false,
                          context: context,
                          builder: (context) {
                            return GestureDetector(
                              onTap: () => _model.unfocusNode.canRequestFocus
                                  ? FocusScope.of(context)
                                      .requestFocus(_model.unfocusNode)
                                  : FocusScope.of(context).unfocus(),
                              child: Padding(
                                padding: MediaQuery.viewInsetsOf(context),
                                child: RevenueCatSubsriptionPaywallWidget(),
                              ),
                            );
                          },
                        ).then((value) => safeSetState(() {}));

                        if (_shouldSetState) setState(() {});
                      },
                      child: Container(
                        width: double.infinity,
                        height: MediaQuery.sizeOf(context).height * 0.1,
                        decoration: BoxDecoration(
                          color: Color(0xFF011323),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 0.0, 10.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    AutoSizeText(
                                      FFLocalizations.of(context).getText(
                                        'dwotuuw6' /* Remaining Credits:  */,
                                      ),
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: FlutterFlowTheme.of(context)
                                                .goldMetallic,
                                          ),
                                    ),
                                    AutoSizeText(
                                      FFAppState().creditsCount.toString(),
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: Color(0xFFD2CFFB),
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: AutoSizeText(
                                  FFLocalizations.of(context).getText(
                                    'p3ahwtrn' /* Out of Credits? Come back afte... */,
                                  ),
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: FlutterFlowTheme.of(context)
                                            .celadon,
                                        fontSize: 14.0,
                                      ),
                                ),
                              ),
                              Expanded(
                                child: AutoSizeText(
                                  FFLocalizations.of(context).getText(
                                    '0x1jqzy0' /* Or Start Subscription Plan */,
                                  ),
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: FlutterFlowTheme.of(context)
                                            .warning,
                                        decoration: TextDecoration.underline,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                ].divide(SizedBox(height: 10.0)).around(SizedBox(height: 10.0)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
