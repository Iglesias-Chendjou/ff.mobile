import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_count_controller.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/home/main_card1/main_card1_widget.dart';
import 'dart:ui';
import 'main_single_widget.dart' show MainSingleWidget;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MainSingleModel extends FlutterFlowModel<MainSingleWidget> {
  ///  Local state fields for this component.

  int counter = 0;

  ///  State fields for stateful widgets in this component.

  // Models for MainCard1 dynamic component.
  late FlutterFlowDynamicModels<MainCard1Model> mainCard1Models;
  // State field(s) for CountController widget.
  int? countControllerValue;

  @override
  void initState(BuildContext context) {
    mainCard1Models = FlutterFlowDynamicModels(() => MainCard1Model());
  }

  @override
  void dispose() {
    mainCard1Models.dispose();
  }
}
