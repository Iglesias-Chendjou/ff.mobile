import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/home/main_card1/main_card1_widget.dart';
import '/home/main_my_addresses/main_my_addresses_widget.dart';
import '/walkthroughs/home.dart';
import 'dart:math';
import 'dart:ui';
import '/index.dart';
import 'home_widget.dart' show HomeWidget;
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart'
    show TutorialCoachMark;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeModel extends FlutterFlowModel<HomeWidget> {
  ///  State fields for stateful widgets in this page.

  TutorialCoachMark? homeController;
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // Models for MainCard1 dynamic component.
  late FlutterFlowDynamicModels<MainCard1Model> mainCard1Models1;
  // Models for MainCard1 dynamic component.
  late FlutterFlowDynamicModels<MainCard1Model> mainCard1Models2;

  @override
  void initState(BuildContext context) {
    mainCard1Models1 = FlutterFlowDynamicModels(() => MainCard1Model());
    mainCard1Models2 = FlutterFlowDynamicModels(() => MainCard1Model());
  }

  @override
  void dispose() {
    homeController?.finish();
    mainCard1Models1.dispose();
    mainCard1Models2.dispose();
  }
}
