import 'package:firebase_app_check/firebase_app_check.dart';

Future initializeFirebaseAppCheck() => FirebaseAppCheck.instance.activate(
      webRecaptchaSiteKey: '6Le9rzMnAAAAAEKmDLJmQhsQRDF0pyNfym3h0g8Q',
      androidProvider: AndroidProvider.playIntegrity,
    );
