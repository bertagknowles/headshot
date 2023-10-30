import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _persistimageURL =
          prefs.getString('ff_persistimageURL') ?? _persistimageURL;
    });
    _safeInit(() {
      _lastActionDate = prefs.containsKey('ff_lastActionDate')
          ? DateTime.fromMillisecondsSinceEpoch(
              prefs.getInt('ff_lastActionDate')!)
          : _lastActionDate;
    });
    _safeInit(() {
      _creditsCount = prefs.getInt('ff_creditsCount') ?? _creditsCount;
    });
    _safeInit(() {
      _ratingCount = prefs.getInt('ff_ratingCount') ?? _ratingCount;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  bool _isAnalyzing = false;
  bool get isAnalyzing => _isAnalyzing;
  set isAnalyzing(bool _value) {
    _isAnalyzing = _value;
  }

  bool _analyzeButton = true;
  bool get analyzeButton => _analyzeButton;
  set analyzeButton(bool _value) {
    _analyzeButton = _value;
  }

  bool _generateCaptions = true;
  bool get generateCaptions => _generateCaptions;
  set generateCaptions(bool _value) {
    _generateCaptions = _value;
  }

  bool _clearImage = true;
  bool get clearImage => _clearImage;
  set clearImage(bool _value) {
    _clearImage = _value;
  }

  String _persistimageURL = '';
  String get persistimageURL => _persistimageURL;
  set persistimageURL(String _value) {
    _persistimageURL = _value;
    prefs.setString('ff_persistimageURL', _value);
  }

  String _finalGeneratedCaption8Removed = '';
  String get finalGeneratedCaption8Removed => _finalGeneratedCaption8Removed;
  set finalGeneratedCaption8Removed(String _value) {
    _finalGeneratedCaption8Removed = _value;
  }

  List<String> _gptOutputStateVariable = [];
  List<String> get gptOutputStateVariable => _gptOutputStateVariable;
  set gptOutputStateVariable(List<String> _value) {
    _gptOutputStateVariable = _value;
  }

  void addToGptOutputStateVariable(String _value) {
    _gptOutputStateVariable.add(_value);
  }

  void removeFromGptOutputStateVariable(String _value) {
    _gptOutputStateVariable.remove(_value);
  }

  void removeAtIndexFromGptOutputStateVariable(int _index) {
    _gptOutputStateVariable.removeAt(_index);
  }

  void updateGptOutputStateVariableAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _gptOutputStateVariable[_index] = updateFn(_gptOutputStateVariable[_index]);
  }

  void insertAtIndexInGptOutputStateVariable(int _index, String _value) {
    _gptOutputStateVariable.insert(_index, _value);
  }

  bool _generatingCaptionsTextMsg = false;
  bool get generatingCaptionsTextMsg => _generatingCaptionsTextMsg;
  set generatingCaptionsTextMsg(bool _value) {
    _generatingCaptionsTextMsg = _value;
  }

  bool _captionsGeneratedTxtMsg = false;
  bool get captionsGeneratedTxtMsg => _captionsGeneratedTxtMsg;
  set captionsGeneratedTxtMsg(bool _value) {
    _captionsGeneratedTxtMsg = _value;
  }

  bool _viewCaptionsButton = false;
  bool get viewCaptionsButton => _viewCaptionsButton;
  set viewCaptionsButton(bool _value) {
    _viewCaptionsButton = _value;
  }

  bool _analysisCompleteTxtMsg = false;
  bool get analysisCompleteTxtMsg => _analysisCompleteTxtMsg;
  set analysisCompleteTxtMsg(bool _value) {
    _analysisCompleteTxtMsg = _value;
  }

  String _tokOp = '';
  String get tokOp => _tokOp;
  set tokOp(String _value) {
    _tokOp = _value;
  }

  String _tokRe = '';
  String get tokRe => _tokRe;
  set tokRe(String _value) {
    _tokRe = _value;
  }

  bool _creditsEnabled = false;
  bool get creditsEnabled => _creditsEnabled;
  set creditsEnabled(bool _value) {
    _creditsEnabled = _value;
  }

  DateTime? _currentTimeStamp =
      DateTime.fromMillisecondsSinceEpoch(1688927400000);
  DateTime? get currentTimeStamp => _currentTimeStamp;
  set currentTimeStamp(DateTime? _value) {
    _currentTimeStamp = _value;
  }

  DateTime? _lastActionDate =
      DateTime.fromMillisecondsSinceEpoch(1688149800000);
  DateTime? get lastActionDate => _lastActionDate;
  set lastActionDate(DateTime? _value) {
    _lastActionDate = _value;
    _value != null
        ? prefs.setInt('ff_lastActionDate', _value.millisecondsSinceEpoch)
        : prefs.remove('ff_lastActionDate');
  }

  int _creditsCount = 3;
  int get creditsCount => _creditsCount;
  set creditsCount(int _value) {
    _creditsCount = _value;
    prefs.setInt('ff_creditsCount', _value);
  }

  int _ratingCount = 0;
  int get ratingCount => _ratingCount;
  set ratingCount(int _value) {
    _ratingCount = _value;
    prefs.setInt('ff_ratingCount', _value);
  }

  bool _subscriptionCheckOnPageLoad = false;
  bool get subscriptionCheckOnPageLoad => _subscriptionCheckOnPageLoad;
  set subscriptionCheckOnPageLoad(bool _value) {
    _subscriptionCheckOnPageLoad = _value;
  }

  String _imageString = '';
  String get imageString => _imageString;
  set imageString(String _value) {
    _imageString = _value;
  }

  String _languageSelection = 'English';
  String get languageSelection => _languageSelection;
  set languageSelection(String _value) {
    _languageSelection = _value;
  }

  String _imageString2 = '';
  String get imageString2 => _imageString2;
  set imageString2(String _value) {
    _imageString2 = _value;
  }

  String _outputimage = '';
  String get outputimage => _outputimage;
  set outputimage(String _value) {
    _outputimage = _value;
  }

  String _outputimagestring = '';
  String get outputimagestring => _outputimagestring;
  set outputimagestring(String _value) {
    _outputimagestring = _value;
  }

  bool _containerTemplate = false;
  bool get containerTemplate => _containerTemplate;
  set containerTemplate(bool _value) {
    _containerTemplate = _value;
  }

  String _errorGetPrediction = '';
  String get errorGetPrediction => _errorGetPrediction;
  set errorGetPrediction(String _value) {
    _errorGetPrediction = _value;
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
