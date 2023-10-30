import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'template_gallery_widget.dart' show TemplateGalleryWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TemplateGalleryModel extends FlutterFlowModel<TemplateGalleryWidget> {
  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {}

  /// Action blocks are added here.

  Future imgextract(
    BuildContext context, {
    int? srnoparameter,
  }) async {
    bool? internetEnabledOnTemplate;
    ImghashRecord? srnoOutput;

    FFAppState().update(() {
      FFAppState().containerTemplate = true;
    });
    internetEnabledOnTemplate = await actions.checkInternetConnection();
    if (internetEnabledOnTemplate != true) {
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
      FFAppState().update(() {
        FFAppState().containerTemplate = false;
      });
      return;
    }
    srnoOutput = await queryImghashRecordOnce(
      queryBuilder: (imghashRecord) => imghashRecord.where(
        'srno',
        isEqualTo: srnoparameter,
      ),
      singleRecord: true,
    ).then((s) => s.firstOrNull);
    FFAppState().update(() {
      FFAppState().imageString2 = srnoOutput!.hash;
    });
    if (FFAppState().imageString2 == null || FFAppState().imageString2 == '') {
      return;
    }
    FFAppState().analyzeButton = false;
    FFAppState().clearImage = false;
    FFAppState().update(() {
      FFAppState().containerTemplate = false;
    });
    Navigator.pop(context);
  }

  /// Additional helper methods are added here.
}
