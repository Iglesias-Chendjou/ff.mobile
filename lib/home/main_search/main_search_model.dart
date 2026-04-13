import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/home/main_card1/main_card1_widget.dart';
import 'dart:ui';
import 'main_search_widget.dart' show MainSearchWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MainSearchModel extends FlutterFlowModel<MainSearchWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Models for MainCard1 dynamic component.
  late FlutterFlowDynamicModels<MainCard1Model> mainCard1Models;

  @override
  void initState(BuildContext context) {
    mainCard1Models = FlutterFlowDynamicModels(() => MainCard1Model());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    mainCard1Models.dispose();
  }
}
