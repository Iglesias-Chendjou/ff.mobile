import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_count_controller.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/home/main_single/main_single_widget.dart';
import 'dart:ui';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'main_card1_model.dart';
export 'main_card1_model.dart';

class MainCard1Widget extends StatefulWidget {
  const MainCard1Widget({
    super.key,
    int? index,
    this.data,
  }) : this.index = index ?? 0;

  final int index;
  final DataStruct? data;

  @override
  State<MainCard1Widget> createState() => _MainCard1WidgetState();
}

class _MainCard1WidgetState extends State<MainCard1Widget> {
  static Widget _buildProductImage(String path, {double? width, double? height}) {
    if (path.isEmpty) {
      return Image.asset('assets/images/600x600_(1).png', width: width, height: height, fit: BoxFit.contain, alignment: Alignment.center);
    }
    if (path.startsWith('http')) {
      return Image.network(path, width: width, height: height, fit: BoxFit.contain, alignment: Alignment.center,
        errorBuilder: (context, error, stackTrace) => Image.asset('assets/images/600x600_(1).png', width: width, height: height, fit: BoxFit.contain));
    }
    return Image.asset(path, width: width, height: height, fit: BoxFit.contain, alignment: Alignment.center,
      errorBuilder: (context, error, stackTrace) => Image.asset('assets/images/600x600_(1).png', width: width, height: height, fit: BoxFit.contain));
  }
  late MainCard1Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MainCard1Model());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        await showModalBottomSheet(
          isScrollControlled: true,
          backgroundColor: FlutterFlowTheme.of(context).accent4,
          barrierColor: FlutterFlowTheme.of(context).barier,
          context: context,
          builder: (context) {
            return Padding(
              padding: MediaQuery.viewInsetsOf(context),
              child: MainSingleWidget(
                data: widget!.data,
                index: widget!.index,
                cartData: FFAppState()
                    .CartList
                    .where((e) => e.id == widget!.data?.id)
                    .toList()
                    .firstOrNull,
              ),
            );
          },
        ).then((value) => safeSetState(() {}));
      },
      child: Container(
        width: MediaQuery.sizeOf(context).width * 0.44,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).accent1,
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  alignment: AlignmentDirectional(-1.0, 1.0),
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15.0),
                        topRight: Radius.circular(15.0),
                      ),
                      child: _buildProductImage(
                        valueOrDefault<String>(
                          widget!.data?.image,
                          'assets/images/600x600_(1).png',
                        ),
                        width: double.infinity,
                        height: 130.0,
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).error,
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  3.0, 2.0, 3.0, 2.0),
                              child: Text(
                                valueOrDefault<String>(
                                  widget!.data?.sale,
                                  '-30%',
                                ),
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      color: FlutterFlowTheme.of(context).info,
                                      fontSize: 9.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                            ),
                          ),
                          if (widget!.data?.tag1 != null &&
                              widget!.data?.tag1 != '')
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 2.0, 0.0, 0.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: valueOrDefault<Color>(
                                    widget!.data?.tag1Color,
                                    FlutterFlowTheme.of(context).success,
                                  ),
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      3.0, 2.0, 3.0, 2.0),
                                  child: Text(
                                    valueOrDefault<String>(
                                      widget!.data?.tag1,
                                      'NO SUGAR',
                                    ),
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.inter(
                                            fontWeight: FontWeight.w500,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                          color:
                                              FlutterFlowTheme.of(context).info,
                                          fontSize: 9.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                          lineHeight: 1.2,
                                        ),
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 0.0, 0.0),
                  child: RichText(
                    textScaler: MediaQuery.of(context).textScaler,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: '${widget!.data?.newPrice?.toStringAsFixed(2)} €  ',
                          style:
                              FlutterFlowTheme.of(context).titleMedium.override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .fontStyle,
                                    ),
                                    color: FlutterFlowTheme.of(context).error,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .fontStyle,
                                  ),
                        ),
                        TextSpan(
                          text: '${widget!.data?.oldPrice?.toStringAsFixed(2)} €',
                          style: FlutterFlowTheme.of(context)
                              .bodyLarge
                              .override(
                                font: GoogleFonts.inter(
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .bodyLarge
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyLarge
                                      .fontStyle,
                                ),
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                letterSpacing: 0.0,
                                fontWeight: FlutterFlowTheme.of(context)
                                    .bodyLarge
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyLarge
                                    .fontStyle,
                                decoration: TextDecoration.lineThrough,
                              ),
                        )
                      ],
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.inter(
                              fontWeight: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                            letterSpacing: 0.0,
                            fontWeight: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10.0, 6.0, 10.0, 0.0),
                  child: Text(
                    valueOrDefault<String>(
                      widget!.data?.title,
                      'Boisson anti-gaspi du jour',
                    ).maybeHandleOverflow(
                      maxChars: 16,
                      replacement: '…',
                    ),
                    style: FlutterFlowTheme.of(context).labelLarge.override(
                          font: GoogleFonts.inter(
                            fontWeight: FlutterFlowTheme.of(context)
                                .labelLarge
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .labelLarge
                                .fontStyle,
                          ),
                          fontSize: 14.0,
                          letterSpacing: 0.0,
                          fontWeight: FlutterFlowTheme.of(context)
                              .labelLarge
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).labelLarge.fontStyle,
                          lineHeight: 1.3,
                        ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10.0, 6.0, 0.0, 0.0),
                  child: Text(
                    valueOrDefault<String>(
                      widget!.data?.description,
                      '800 g',
                    ),
                    style: FlutterFlowTheme.of(context).labelLarge.override(
                          font: GoogleFonts.inter(
                            fontWeight: FlutterFlowTheme.of(context)
                                .labelLarge
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .labelLarge
                                .fontStyle,
                          ),
                          color: FlutterFlowTheme.of(context).secondaryText,
                          fontSize: 14.0,
                          letterSpacing: 0.0,
                          fontWeight: FlutterFlowTheme.of(context)
                              .labelLarge
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).labelLarge.fontStyle,
                        ),
                  ),
                ),
                if (!FFAppState().CartList.contains(FFAppState()
                    .CartList
                    .where((e) => e.id == widget!.data?.id)
                    .toList()
                    .firstOrNull))
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(6.0, 10.0, 6.0, 6.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        FFAppState().addToCartList(CartStruct(
                          id: widget!.data?.id,
                          item: widget!.data,
                          quantity: 1,
                          date: getCurrentTimestamp,
                        ));
                        _model.updatePage(() {});
                        if (FFAppState().updater) {
                          FFAppState().updater = false;
                          safeSetState(() {});
                        } else {
                          FFAppState().updater = true;
                          safeSetState(() {});
                        }
                      },
                      child: Container(
                        width: double.infinity,
                        height: 42.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).customColor1,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 8.0,
                              color: Color(0x10000000),
                              offset: Offset(
                                0.0,
                                4.0,
                              ),
                            )
                          ],
                          borderRadius: BorderRadius.circular(11.0),
                        ),
                        child: Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Text(
                            '+ Ajouter au panier',
                            style: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .fontStyle,
                                  ),
                                  fontSize: 15.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .fontStyle,
                                ),
                          ),
                        ),
                      ),
                    ),
                  ),
                if (FFAppState().CartList.contains(FFAppState()
                    .CartList
                    .where((e) => e.id == widget!.data?.id)
                    .toList()
                    .firstOrNull))
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(6.0, 10.0, 6.0, 6.0),
                      child: Container(
                        width: double.infinity,
                        height: 42.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).accent2,
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Container(
                          width: 140.0,
                          height: double.infinity,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).accent4,
                            borderRadius: BorderRadius.circular(12.0),
                            shape: BoxShape.rectangle,
                          ),
                          child: FlutterFlowCountController(
                            decrementIconBuilder: (enabled) => Icon(
                              FFIcons.kminus,
                              color: enabled
                                  ? FlutterFlowTheme.of(context).primaryText
                                  : FlutterFlowTheme.of(context).icon,
                              size: 25.0,
                            ),
                            incrementIconBuilder: (enabled) => Icon(
                              Icons.add_rounded,
                              color: enabled
                                  ? FlutterFlowTheme.of(context).primaryText
                                  : FlutterFlowTheme.of(context).icon,
                              size: 25.0,
                            ),
                            countBuilder: (count) => Text(
                              count.toString(),
                              style: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .fontStyle,
                                  ),
                            ),
                            count: _model.countControllerValue ??= FFAppState()
                                .CartList
                                .where((e) => e.id == widget!.data?.id)
                                .toList()
                                .firstOrNull!
                                .quantity,
                            updateCount: (count) async {
                              safeSetState(
                                  () => _model.countControllerValue = count);
                              if (_model.countControllerValue! < 1) {
                                FFAppState().removeFromCartList(FFAppState()
                                    .CartList
                                    .where((e) => e.id == widget!.data?.id)
                                    .toList()
                                    .firstOrNull!);
                                _model.updatePage(() {});
                              } else {
                                FFAppState().updateCartListAtIndex(
                                  widget!.index,
                                  (e) => e..incrementQuantity(1),
                                );
                                _model.updatePage(() {});
                              }

                              if (FFAppState().updater) {
                                FFAppState().updater = false;
                                safeSetState(() {});
                              } else {
                                FFAppState().updater = true;
                                safeSetState(() {});
                              }
                            },
                            stepSize: 1,
                            minimum: 0,
                            maximum: 20,
                            contentPadding: EdgeInsetsDirectional.fromSTEB(
                                12.0, 0.0, 12.0, 0.0),
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 5.0, 0.0),
                  child: ToggleIcon(
                    onPressed: () async {
                      safeSetState(
                        () => FFAppState().WishList.contains(widget!.data)
                            ? FFAppState().removeFromWishList(widget!.data!)
                            : FFAppState().addToWishList(widget!.data!),
                      );
                    },
                    value: FFAppState().WishList.contains(widget!.data),
                    onIcon: Icon(
                      FFIcons.kfavorite24dpE8EAEDFILL1Wght500GRAD0Opsz24,
                      color: FlutterFlowTheme.of(context).error,
                      size: 23.0,
                    ),
                    offIcon: Icon(
                      FFIcons.kfavorite24dpE8EAEDFILL1Wght500GRAD0Opsz24,
                      color: FlutterFlowTheme.of(context).icon,
                      size: 23.0,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
