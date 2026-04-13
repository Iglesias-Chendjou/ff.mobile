import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'help_center_privacy_model.dart';
export 'help_center_privacy_model.dart';

class HelpCenterPrivacyWidget extends StatefulWidget {
  const HelpCenterPrivacyWidget({super.key});

  static String routeName = 'HelpCenterPrivacy';
  static String routePath = '/helpCenterPrivacy';

  @override
  State<HelpCenterPrivacyWidget> createState() =>
      _HelpCenterPrivacyWidgetState();
}

class _HelpCenterPrivacyWidgetState extends State<HelpCenterPrivacyWidget> {
  late HelpCenterPrivacyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HelpCenterPrivacyModel());
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
            'Privacy Policy',
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
                  'At FreshGo, we value your privacy and are committed to protecting your personal information. This Privacy Policy outlines how we collect, use, and safeguard your data when you use our app and services. By using FreshGo, you agree to the terms of this Privacy Policy.\n\n1. Information We Collect\nWe may collect the following types of information:\n\nPersonal Information:\nName, email address, phone number, delivery address, and payment details.\nUsage Information:\nDetails about your interactions with the app, such as pages visited and actions taken.\nDevice Information:\nInformation about your device, including IP address, operating system, and browser type.\n2. How We Use Your Information\nWe use the information we collect to:\n\nProcess and deliver your orders.\nCommunicate with you regarding your orders and account.\nImprove and personalize your app experience.\nAnalyze app usage to enhance performance.\nSend promotional offers, if you have opted in.\n3. How We Share Your Information\nWe do not sell your personal information. However, we may share it with:\n\nService Providers: Delivery partners, payment processors, and technical support teams to complete your orders.\nLegal Authorities: When required by law or to protect the rights of FreshGo.\n4. Data Security\nWe use industry-standard measures to protect your personal information, including encryption and secure servers. However, no method of transmission over the internet is 100% secure. We encourage you to safeguard your account credentials.\n\n5. Cookies and Tracking\nFreshGo uses cookies and similar technologies to enhance your app experience. These tools help us:\n\nRemember your preferences.\nAnalyze app performance and usage.\nYou can manage your cookie preferences through your device settings.\n\n6. Your Rights\nDepending on your location, you may have the following rights:\n\nAccess and update your personal information.\nRequest deletion of your data.\nOpt out of promotional communications.\nTo exercise these rights, please contact us at privacy@freshgo.com.\n\n7. Third-Party Links\nOur app may contain links to third-party websites. We are not responsible for the privacy practices of these websites.\n\n8. Children’s Privacy\nFreshGo does not knowingly collect personal information from children under 13. If we discover such information, we will delete it promptly.\n\n9. Changes to This Policy\nWe may update this Privacy Policy periodically. Changes will be posted in the app, and the \"Effective Date\" will be updated accordingly.',
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
