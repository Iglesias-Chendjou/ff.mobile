import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'about_fresh_go_model.dart';
export 'about_fresh_go_model.dart';

class AboutFreshGoWidget extends StatefulWidget {
  const AboutFreshGoWidget({super.key});

  static String routeName = 'AboutFreshGo';
  static String routePath = '/aboutFreshGo';

  @override
  State<AboutFreshGoWidget> createState() => _AboutFreshGoWidgetState();
}

class _AboutFreshGoWidgetState extends State<AboutFreshGoWidget> {
  late AboutFreshGoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AboutFreshGoModel());
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
            'À propos de FoodFirst',
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
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                child: Text(
                  'FoodFirst',
                  style: FlutterFlowTheme.of(context).headlineMedium.override(
                        font: GoogleFonts.inter(
                          fontWeight: FlutterFlowTheme.of(context)
                              .headlineMedium
                              .fontWeight,
                          fontStyle: FlutterFlowTheme.of(context)
                              .headlineMedium
                              .fontStyle,
                        ),
                        letterSpacing: 0.0,
                        fontWeight: FlutterFlowTheme.of(context)
                            .headlineMedium
                            .fontWeight,
                        fontStyle: FlutterFlowTheme.of(context)
                            .headlineMedium
                            .fontStyle,
                      ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                child: Text(
                  'Version: 1.02.35',
                  style: FlutterFlowTheme.of(context).labelLarge.override(
                        font: GoogleFonts.inter(
                          fontWeight: FlutterFlowTheme.of(context)
                              .labelLarge
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).labelLarge.fontStyle,
                        ),
                        color: FlutterFlowTheme.of(context).secondaryText,
                        letterSpacing: 0.0,
                        fontWeight:
                            FlutterFlowTheme.of(context).labelLarge.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).labelLarge.fontStyle,
                      ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(15.0, 35.0, 15.0, 0.0),
                child: Text(
"Bienvenue sur FoodFirst - votre partenaire anti-gaspi a Bruxelles !\n\nChez FoodFirst, nous croyons que lutter contre le gaspillage alimentaire devrait etre simple, rapide et accessible a tous. C’est pourquoi nous avons cree une plateforme qui vous connecte aux produits frais et de qualite a prix reduit, livres directement chez vous en quelques clics.\n\nNotre Mission\nNotre mission est de reduire le gaspillage alimentaire tout en rendant les courses accessibles a tous. Que vous soyez un professionnel presse, un parent ou simplement a la recherche de bons plans, FoodFirst est la pour vous faire gagner du temps et de l’argent.\n\nCe que nous offrons\nLarge selection : Des fruits et legumes frais aux produits laitiers, en passant par les boissons et l’epicerie.\nLivraison rapide : Recevez vos courses rapidement et a l’heure.\nApplication intuitive : Notre interface simple rend la navigation et la commande agreables.\nOffres exclusives : Profitez de reductions anti-gaspi chaque jour.\n\nPourquoi choisir FoodFirst ?\nFraicheur garantie : Nous collaborons avec des magasins de confiance pour garantir des produits de qualite.\nService client : Votre satisfaction est notre priorite, nous sommes toujours la pour vous aider.\nEco-responsable : Nous reduisons le gaspillage alimentaire et optimisons nos livraisons pour limiter notre empreinte carbone.\n\nNotre Vision\nNous voulons transformer l’experience des courses en permettant a chacun d’acceder a des produits frais, abordables et anti-gaspi.\n\nRejoignez la famille FoodFirst\nNous sommes bien plus qu’un service de livraison - nous sommes engages pour un avenir sans gaspillage. Merci de faire confiance a FoodFirst !",
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
