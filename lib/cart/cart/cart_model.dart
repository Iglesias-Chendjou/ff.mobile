import '/backend/schema/structs/index.dart';
import '/cart/cartitem_clean/cartitem_clean_widget.dart';
import '/cart/cartitem_delete/cartitem_delete_widget.dart';
import '/cart/promo_code/promo_code_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/home/main_card1/main_card1_widget.dart';
import '/home/main_my_addresses/main_my_addresses_widget.dart';
import 'dart:math';
import 'dart:ui';
import '/index.dart';
import 'cart_widget.dart' show CartWidget;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CartModel extends FlutterFlowModel<CartWidget> {
  ///  State fields for stateful widgets in this page.

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
    mainCard1Models1.dispose();
    mainCard1Models2.dispose();
  }
}
