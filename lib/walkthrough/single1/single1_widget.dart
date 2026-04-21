import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'single1_model.dart';
export 'single1_model.dart';

class Single1Widget extends StatefulWidget {
  const Single1Widget({super.key});

  @override
  State<Single1Widget> createState() => _Single1WidgetState();
}

class _Single1WidgetState extends State<Single1Widget> {
  late Single1Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Single1Model());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
      child: Container(
        width: 280.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primary,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(15.0, 10.0, 15.0, 12.0),
              child: Text(
                'Vous pouvez ajouter un nouveau moyen de paiement. Cliquez ici pour ajouter',
                style: FlutterFlowTheme.of(context).titleSmall.override(
                      font: GoogleFonts.inter(
                        fontWeight:
                            FlutterFlowTheme.of(context).titleSmall.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).titleSmall.fontStyle,
                      ),
                      color: FlutterFlowTheme.of(context).info,
                      letterSpacing: 0.0,
                      fontWeight:
                          FlutterFlowTheme.of(context).titleSmall.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).titleSmall.fontStyle,
                      lineHeight: 1.5,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
