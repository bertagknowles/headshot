import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/revenue_cat_util.dart' as revenue_cat;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'revenue_cat_subsription_paywall_model.dart';
export 'revenue_cat_subsription_paywall_model.dart';

class RevenueCatSubsriptionPaywallWidget extends StatefulWidget {
  const RevenueCatSubsriptionPaywallWidget({Key? key}) : super(key: key);

  @override
  _RevenueCatSubsriptionPaywallWidgetState createState() =>
      _RevenueCatSubsriptionPaywallWidgetState();
}

class _RevenueCatSubsriptionPaywallWidgetState
    extends State<RevenueCatSubsriptionPaywallWidget> {
  late RevenueCatSubsriptionPaywallModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RevenueCatSubsriptionPaywallModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return ClipRRect(
      borderRadius: BorderRadius.circular(0.0),
      child: Container(
        width: double.infinity,
        height: MediaQuery.sizeOf(context).height * 1.0,
        decoration: BoxDecoration(
          color: Color(0xFF011323),
          boxShadow: [
            BoxShadow(
              blurRadius: 4.0,
              color: Color(0x33000000),
              offset: Offset(0.0, 2.0),
            )
          ],
          borderRadius: BorderRadius.circular(0.0),
          shape: BoxShape.rectangle,
          border: Border.all(
            color: FlutterFlowTheme.of(context).primaryBackground,
          ),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(10.0, 20.0, 10.0, 20.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SelectionArea(
                  child: Text(
                FFLocalizations.of(context).getText(
                  'n84eobvz' /* ✨ AI Face Swap Photo */,
                ),
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).titleMedium.override(
                      fontFamily: 'Readex Pro',
                      color: Color(0xFF7EADF4),
                    ),
              )),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 4.0),
                child: SelectionArea(
                    child: Text(
                  FFLocalizations.of(context).getText(
                    'h73inq1v' /* Unlimited access
High server p... */
                    ,
                  ),
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).bodySmall.override(
                        fontFamily: 'Readex Pro',
                        color: Color(0xFFAB8A7B),
                      ),
                )),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 4.0),
                child: SelectionArea(
                    child: Text(
                  FFLocalizations.of(context).getText(
                    'e83pr17u' /* Please review the options belo... */,
                  ),
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).bodySmall.override(
                        fontFamily: 'Readex Pro',
                        color: Color(0xFF8374D2),
                      ),
                )),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                child: Container(
                  width: 100.0,
                  decoration: BoxDecoration(
                    color: Color(0xFF3A3772),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 4.0,
                        color: Color(0x33000000),
                        offset: Offset(0.0, 2.0),
                      )
                    ],
                    borderRadius: BorderRadius.circular(12.0),
                    border: Border.all(
                      color: Color(0xFF7EADF4),
                      width: 2.0,
                    ),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SelectionArea(
                            child: AutoSizeText(
                          valueOrDefault<String>(
                            revenue_cat
                                .offerings!.current!.weekly!.storeProduct.title,
                            'Unavailable',
                          ).maybeHandleOverflow(
                            maxChars: 13,
                            replacement: '…',
                          ),
                          textAlign: TextAlign.start,
                          style: FlutterFlowTheme.of(context).titleSmall,
                        )),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 5.0, 0.0, 0.0),
                          child: SelectionArea(
                              child: Text(
                            valueOrDefault<String>(
                              revenue_cat.offerings!.current!.weekly!
                                  .storeProduct.description,
                              'Unavailable',
                            ),
                            textAlign: TextAlign.start,
                            style:
                                FlutterFlowTheme.of(context).bodySmall.override(
                                      fontFamily: 'Readex Pro',
                                      color: Color(0xFF9EACCC),
                                    ),
                          )),
                        ),
                        SelectionArea(
                            child: Text(
                          valueOrDefault<String>(
                            revenue_cat.offerings!.current!.weekly!.storeProduct
                                .priceString,
                            'Unavailable',
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Readex Pro',
                                    color: Color(0xFF9EACCC),
                                  ),
                        )),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 10.0, 0.0, 0.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              var _shouldSetState = false;
                              _model.interEnabledBuy1Button =
                                  await actions.checkInternetConnection();
                              _shouldSetState = true;
                              if (_model.interEnabledBuy1Button != true) {
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
                              _model.weekly = await revenue_cat
                                  .purchasePackage(valueOrDefault<String>(
                                revenue_cat
                                    .offerings!.current!.weekly!.identifier,
                                'Unavailable',
                              ));
                              _shouldSetState = true;
                              if (_model.weekly!) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      valueOrDefault<String>(
                                        FFLocalizations.of(context)
                                            .getVariableText(
                                          enText: 'Success!',
                                          deText: 'Erfolgreich!',
                                          esText: 'Sucesso!',
                                          nlText: '¡Éxito!',
                                          frText: 'Suksess!',
                                          itText: 'Menestys!',
                                          ptText: 'Succès !',
                                          ruText: 'Succes!',
                                          plText: 'Sukces!',
                                        ),
                                        'Success!',
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
                                FFAppState().creditsEnabled = false;
                                Navigator.pop(context);
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      valueOrDefault<String>(
                                        FFLocalizations.of(context)
                                            .getVariableText(
                                          enText: 'Unable to purchase!',
                                          deText: 'Kauf nicht möglich!',
                                          esText: 'Não é possível comprar!',
                                          nlText: 'No se puede comprar.',
                                          frText: 'Kan ikke kjøpe!',
                                          itText: 'Ei voi ostaa!',
                                          ptText: 'Impossible d\'acheter !',
                                          ruText: 'Kan niet kopen!',
                                          plText: 'Nie można kupić!',
                                        ),
                                        'Unable to purchase!',
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
                                Navigator.pop(context);
                              }

                              if (_shouldSetState) setState(() {});
                            },
                            text: FFLocalizations.of(context).getText(
                              'xxsf35i7' /* Subscribe Now */,
                            ),
                            options: FFButtonOptions(
                              height: 50.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10.0, 0.0, 10.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).goldMetallic,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    color: Color(0xFF011323),
                                    fontSize: 18.0,
                                  ),
                              elevation: 2.0,
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                child: Container(
                  width: 100.0,
                  decoration: BoxDecoration(
                    color: Color(0xFF3A3772),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 4.0,
                        color: Color(0x33000000),
                        offset: Offset(0.0, 2.0),
                      )
                    ],
                    borderRadius: BorderRadius.circular(12.0),
                    border: Border.all(
                      color: Color(0xFF7EADF4),
                      width: 2.0,
                    ),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SelectionArea(
                            child: AutoSizeText(
                          valueOrDefault<String>(
                            revenue_cat.offerings!.current!.monthly!
                                .storeProduct.title,
                            'Unavailable',
                          ).maybeHandleOverflow(
                            maxChars: 12,
                            replacement: '…',
                          ),
                          textAlign: TextAlign.start,
                          style: FlutterFlowTheme.of(context).titleSmall,
                        )),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 5.0, 0.0, 0.0),
                          child: SelectionArea(
                              child: Text(
                            valueOrDefault<String>(
                              revenue_cat.offerings!.current!.monthly!
                                  .storeProduct.description,
                              'Unavailable',
                            ),
                            textAlign: TextAlign.start,
                            style:
                                FlutterFlowTheme.of(context).bodySmall.override(
                                      fontFamily: 'Readex Pro',
                                      color: Color(0xFF9EACCC),
                                    ),
                          )),
                        ),
                        SelectionArea(
                            child: Text(
                          valueOrDefault<String>(
                            revenue_cat.offerings!.current!.monthly!
                                .storeProduct.priceString,
                            'Unavailable',
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Readex Pro',
                                    color: Color(0xFF9EACCC),
                                  ),
                        )),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 10.0, 0.0, 0.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              var _shouldSetState = false;
                              _model.interEnabledBuy2Button =
                                  await actions.checkInternetConnection();
                              _shouldSetState = true;
                              if (_model.interEnabledBuy2Button != true) {
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
                              _model.monthly = await revenue_cat
                                  .purchasePackage(valueOrDefault<String>(
                                revenue_cat
                                    .offerings!.current!.monthly!.identifier,
                                'Unavailable',
                              ));
                              _shouldSetState = true;
                              if (_model.monthly!) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      valueOrDefault<String>(
                                        FFLocalizations.of(context)
                                            .getVariableText(
                                          enText: 'Success!',
                                          deText: 'Erfolgreich!',
                                          esText: 'Sucesso!',
                                          nlText: '¡Éxito!',
                                          frText: 'Suksess!',
                                          itText: 'Menestys!',
                                          ptText: 'Succès !',
                                          ruText: 'Succes!',
                                          plText: 'Sukces!',
                                        ),
                                        'Success!',
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
                                FFAppState().creditsEnabled = false;
                                Navigator.pop(context);
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      valueOrDefault<String>(
                                        FFLocalizations.of(context)
                                            .getVariableText(
                                          enText: 'Unable to purchase!',
                                          deText: 'Kauf nicht möglich!',
                                          esText: 'Não é possível comprar!',
                                          nlText: 'No se puede comprar.',
                                          frText: 'Kan ikke kjøpe!',
                                          itText: 'Ei voi ostaa!',
                                          ptText: 'Impossible d\'acheter !',
                                          ruText: 'Kan niet kopen!',
                                          plText: 'Nie można kupić!',
                                        ),
                                        'Unable to purchase!',
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
                                Navigator.pop(context);
                              }

                              if (_shouldSetState) setState(() {});
                            },
                            text: FFLocalizations.of(context).getText(
                              '9qbnksal' /* Subscribe Now */,
                            ),
                            options: FFButtonOptions(
                              height: 50.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10.0, 0.0, 10.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).goldMetallic,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    color: Color(0xFF011323),
                                    fontSize: 18.0,
                                  ),
                              elevation: 2.0,
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Spacer(),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(50.0, 10.0, 50.0, 10.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    Navigator.pop(context);
                  },
                  text: FFLocalizations.of(context).getText(
                    'y2dwnzki' /* Continue with limited access */,
                  ),
                  options: FFButtonOptions(
                    height: 40.0,
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).darkPurple,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Readex Pro',
                          color: Color(0xFF7EADF4),
                          fontSize: 14.0,
                          fontWeight: FontWeight.normal,
                        ),
                    elevation: 0.0,
                    borderSide: BorderSide(
                      color: Color(0xFF7EADF4),
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(50.0, 10.0, 50.0, 20.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    var _shouldSetState = false;
                    _model.interEnabledRestoreButton =
                        await actions.checkInternetConnection();
                    _shouldSetState = true;
                    if (_model.interEnabledRestoreButton == true) {
                      await revenue_cat.restorePurchases();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            valueOrDefault<String>(
                              FFLocalizations.of(context).getVariableText(
                                enText: 'Purchase restored!',
                                deText: 'Kauf wiederhergestellt!',
                                esText: 'Compra restaurada!',
                                nlText: '¡Compra restaurada!',
                                frText: 'Kjøp restaurert!',
                                itText: 'Osto palautettu!',
                                ptText: 'Achat restauré !',
                                ruText: 'Koop gerestaureerd!',
                                plText: 'Zakup przywrócony!',
                              ),
                              'Purchase restored!',
                            ),
                            style: TextStyle(
                              color: FlutterFlowTheme.of(context).primaryText,
                            ),
                          ),
                          duration: Duration(milliseconds: 4000),
                          backgroundColor:
                              FlutterFlowTheme.of(context).secondary,
                        ),
                      );
                      Navigator.pop(context);
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
                    '17qx36j5' /* Restore Purchases */,
                  ),
                  options: FFButtonOptions(
                    height: 40.0,
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: Color(0xFF063C6D),
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Readex Pro',
                          color: Color(0xFF7EADF4),
                          fontSize: 14.0,
                          fontWeight: FontWeight.normal,
                        ),
                    elevation: 0.0,
                    borderSide: BorderSide(
                      color: Color(0xFF7EADF4),
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        await launchURL(
                            'https://www.apple.com/legal/macapps/stdeula/');
                      },
                      child: Text(
                        FFLocalizations.of(context).getText(
                          'rarghd8q' /* Terms of Use */,
                        ),
                        style: FlutterFlowTheme.of(context).bodySmall.override(
                              fontFamily: 'Readex Pro',
                              color: Color(0xFF7EADF4),
                            ),
                      ),
                    ),
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        await launchURL(
                            'https://sites.google.com/view/vgcentral-appstore/privacy-policy');
                      },
                      child: Text(
                        FFLocalizations.of(context).getText(
                          'oxgiaoao' /* Privacy Policy */,
                        ),
                        style: FlutterFlowTheme.of(context).bodySmall.override(
                              fontFamily: 'Readex Pro',
                              color: Color(0xFF7EADF4),
                            ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
