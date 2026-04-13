import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/home/main_card1/main_card1_widget.dart';
import '/home/z_filter_sort/z_filter_sort_widget.dart';
import '/walkthroughs/archive.dart';
import 'dart:ui';
import '/index.dart';
import 'archive_widget.dart' show ArchiveWidget;
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart'
    show TutorialCoachMark;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ArchiveModel extends FlutterFlowModel<ArchiveWidget> {
  ///  State fields for stateful widgets in this page.

  TutorialCoachMark? archiveController;
  // Models for MainCard1 dynamic component.
  late FlutterFlowDynamicModels<MainCard1Model> mainCard1Models;

  @override
  void initState(BuildContext context) {
    mainCard1Models = FlutterFlowDynamicModels(() => MainCard1Model());
  }

  @override
  void dispose() {
    archiveController?.finish();
    mainCard1Models.dispose();
  }
}
