import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/walkthroughs/payment.dart';
import 'dart:ui';
import '/index.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart'
    show TutorialCoachMark;
import 'payment_method_widget.dart' show PaymentMethodWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PaymentMethodModel extends FlutterFlowModel<PaymentMethodWidget> {
  ///  State fields for stateful widgets in this page.

  TutorialCoachMark? paymentController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    paymentController?.finish();
  }
}
