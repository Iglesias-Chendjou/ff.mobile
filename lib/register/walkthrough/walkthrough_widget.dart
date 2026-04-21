import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'walkthrough_model.dart';
export 'walkthrough_model.dart';

class WalkthroughWidget extends StatefulWidget {
  const WalkthroughWidget({super.key});

  static String routeName = 'Walkthrough';
  static String routePath = '/walkthrough';

  @override
  State<WalkthroughWidget> createState() => _WalkthroughWidgetState();
}

class _WalkthroughWidgetState extends State<WalkthroughWidget> {
  late WalkthroughModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WalkthroughModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setDarkModeSetting(context, ThemeMode.light);
      FFAppState().fromRegister1 = true;
      FFAppState().fromRegister2 = true;
      safeSetState(() {});
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                height: double.infinity,
                child: Stack(
                  alignment: AlignmentDirectional(0.0, 1.0),
                  children: [
                    Container(
                      width: double.infinity,
                      height: double.infinity,
                      child: PageView(
                        controller: _model.pageViewController ??=
                            PageController(initialPage: 0),
                        onPageChanged: (_) async {
                          if (FFAppState().updater) {
                            FFAppState().updater = false;
                            safeSetState(() {});
                          } else {
                            FFAppState().updater = true;
                            safeSetState(() {});
                          }
                        },
                        scrollDirection: Axis.horizontal,
                        children: [
                          Container(
                            width: double.infinity,
                            height: double.infinity,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: Image.asset(
                                  'assets/images/424r322r_(1).png',
                                ).image,
                              ),
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            height: double.infinity,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: Image.asset(
                                  'assets/images/2423wgt4gh4egegveb_(1).png',
                                ).image,
                              ),
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            height: double.infinity,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: Image.asset(
                                  'assets/images/23fergrth5r6h_(1).png',
                                ).image,
                              ),
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            height: double.infinity,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: Image.asset(
                                  'assets/images/23rfergegegerg_(1).png',
                                ).image,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              15.0, 35.0, 15.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Container(
                                  width: 80.0,
                                  height: 6.0,
                                  decoration: BoxDecoration(
                                    color: valueOrDefault<Color>(
                                      _model.pageViewCurrentIndex == 0
                                          ? FlutterFlowTheme.of(context).info
                                          : Color(0x67FFFFFF),
                                      FlutterFlowTheme.of(context).info,
                                    ),
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  width: 80.0,
                                  height: 6.0,
                                  decoration: BoxDecoration(
                                    color: _model.pageViewCurrentIndex == 1
                                        ? FlutterFlowTheme.of(context).info
                                        : Color(0x67FFFFFF),
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  width: 80.0,
                                  height: 6.0,
                                  decoration: BoxDecoration(
                                    color: _model.pageViewCurrentIndex == 2
                                        ? FlutterFlowTheme.of(context).info
                                        : Color(0x67FFFFFF),
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  width: 80.0,
                                  height: 6.0,
                                  decoration: BoxDecoration(
                                    color: _model.pageViewCurrentIndex == 3
                                        ? FlutterFlowTheme.of(context).info
                                        : Color(0x67FFFFFF),
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                ),
                              ),
                            ].divide(SizedBox(width: 8.0)),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              15.0, 0.0, 15.0, 25.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              if (_model.pageViewCurrentIndex >= 3) {
                                context.pushNamed(LoginWidget.routeName);
                              } else {
                                await _model.pageViewController?.nextPage(
                                  duration: Duration(milliseconds: 300),
                                  curve: Curves.ease,
                                );
                              }
                            },
                            text: 'Suivant',
                            options: FFButtonOptions(
                              width: double.infinity,
                              height: 52.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: Colors.white,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                              elevation: 0.0,
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            showLoadingIndicator: false,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
