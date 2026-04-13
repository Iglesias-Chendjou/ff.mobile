import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'help_center_terms_model.dart';
export 'help_center_terms_model.dart';

class HelpCenterTermsWidget extends StatefulWidget {
  const HelpCenterTermsWidget({super.key});

  static String routeName = 'HelpCenterTerms';
  static String routePath = '/helpCenterTerms';

  @override
  State<HelpCenterTermsWidget> createState() => _HelpCenterTermsWidgetState();
}

class _HelpCenterTermsWidgetState extends State<HelpCenterTermsWidget> {
  late HelpCenterTermsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HelpCenterTermsModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: false,
          leading: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(6.0, 6.0, 6.0, 6.0),
            child: FlutterFlowIconButton(
              borderRadius: 50.0,
              buttonSize: 42.0,
              fillColor: FlutterFlowTheme.of(context).accent4,
              icon: Icon(
                FFIcons.karrowLeft,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 24.0,
              ),
              onPressed: () async {
                context.safePop();
              },
            ),
          ),
          title: Text(
            'Terms & Conditions',
            style: FlutterFlowTheme.of(context).headlineSmall.override(
                  font: GoogleFonts.inter(
                    fontWeight:
                        FlutterFlowTheme.of(context).headlineSmall.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).headlineSmall.fontStyle,
                  ),
                  letterSpacing: 0.0,
                  fontWeight:
                      FlutterFlowTheme.of(context).headlineSmall.fontWeight,
                  fontStyle:
                      FlutterFlowTheme.of(context).headlineSmall.fontStyle,
                ),
          ),
          actions: [],
          flexibleSpace: FlexibleSpaceBar(
            background: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
            ),
          ),
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                child: Text(
                  'Welcome to FreshGo! By using our app and services, you agree to abide by the following terms and conditions. Please read them carefully before placing an order.\n\n1. Introduction\nFreshGo (\"we,\" \"our,\" or \"us\") offers grocery delivery services to simplify your shopping experience. By accessing or using our app, you agree to these Terms & Conditions.\n\n2. Eligibility\nYou must be at least 18 years old to use FreshGo.\nAll information provided during registration must be accurate and complete.\nYou are responsible for maintaining the confidentiality of your account credentials.\n3. Placing Orders\nAll orders are subject to availability and acceptance.\nPrices and promotions displayed in the app are subject to change without notice.\nOnce an order is confirmed, cancellation may not always be possible.\n4. Payments\nPayments must be completed through the app using the supported methods.\nFreshGo is not responsible for any payment issues caused by third-party providers (e.g., banks, payment gateways).\n5. Delivery Policy\nFreshGo strives to deliver orders within the specified timeframe, but delays may occur due to unforeseen circumstances such as weather or traffic.\nIf you are unavailable at the delivery location, we will follow the delivery instructions provided in your order. If none are specified, we may attempt redelivery at an additional cost.\n6. Refund Policy\nRefunds are available for items that are damaged, expired, or missing from your order.\nRefund requests must be made within 24 hours of delivery.\nFreshGo reserves the right to request proof of the issue before processing a refund.\n7. User Conduct\nYou agree not to misuse the app or its services in any way.\nFraudulent activity, including false refund claims, may result in account suspension or termination.\n8. Limitation of Liability\nFreshGo is not liable for:\n\nDelays or failures caused by factors beyond our control.\nIncorrect delivery details provided by the user.\nLoss or damage to items left as per delivery instructions.\n9. Privacy Policy\nFreshGo is committed to protecting your privacy. Please refer to our Privacy Policy for details on how we collect, use, and protect your personal information.\n\n10. Changes to Terms\nWe may update these Terms & Conditions from time to time. Changes will be effective immediately upon posting in the app. Continued use of FreshGo signifies your acceptance of the updated terms.',
                  style: FlutterFlowTheme.of(context).titleSmall.override(
                        font: GoogleFonts.inter(
                          fontWeight: FlutterFlowTheme.of(context)
                              .titleSmall
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).titleSmall.fontStyle,
                        ),
                        letterSpacing: 0.0,
                        fontWeight:
                            FlutterFlowTheme.of(context).titleSmall.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).titleSmall.fontStyle,
                      ),
                ),
              ),
            ]
                .addToStart(SizedBox(height: 15.0))
                .addToEnd(SizedBox(height: 15.0)),
          ),
        ),
      ),
    );
  }
}
