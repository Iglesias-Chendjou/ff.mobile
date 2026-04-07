# Prompt de developpement — ff.mobile (App Mobile Flutter)

## Instructions prealables OBLIGATOIRES

**AVANT de commencer a travailler sur ce projet, tu DOIS :**

1. **Lire le CLAUDE.md** de ce projet (`ff.mobile/CLAUDE.md`) pour comprendre la stack, la structure, les conventions et les regles metier.

2. **Lire TOUTE l'analyse fonctionnelle** dans le projet `ff.analyse/` :
   - `ff.analyse/01_use_case.puml` — Diagramme de cas d'utilisation (6 acteurs, 40+ use cases)
   - `ff.analyse/02_class_diagram.puml` — Diagramme de classes / modele de donnees (19 entites)
   - `ff.analyse/03_sequence_diagrams.puml` — 5 diagrammes de sequence (commande, cochage magasin, abonnement, colis surprise, fournisseur B2B)
   - `ff.analyse/04_activity_diagrams.puml` — 4 diagrammes d'activite (workflow quotidien, abonnement, colis surprise, fournisseur B2B)

3. **Ne jamais inventer** de fonctionnalite, d'ecran ou de regle metier. Tout est defini dans l'analyse. S'y conformer strictement.

---

## Ta mission

Tu es le developpeur mobile de la **Plateforme Anti-Gaspi Bruxelles**. Tu dois implementer l'application mobile client (iOS & Android) en **Flutter** qui consomme l'API `ff.api`.

### Ce que tu dois faire :

1. **Ecrans client** (use cases du diagramme `01_use_case.puml` — package "Espace Client") :
   - Splash screen + Onboarding (1ere utilisation)
   - Inscription / Connexion (JWT stocke en secure storage)
   - Catalogue : parcourir par categorie, rechercher, filtrer par zone (detection GPS automatique)
   - Panier : ajouter/retirer, validation stock temps reel
   - Commande : checkout, paiement Stripe (CB/Bancontact, 3D Secure via flutter_stripe)
   - Suivi livraison temps reel : carte Google Maps avec position GPS du livreur (SignalR, MAJ 30s)
   - Abonnement recurrent : choix plan (Mensuel/Trimestriel/Semestriel/Annuel), categories, jour de livraison
   - Colis Surprise : forfaits (Decouverte 30EUR/1, Classique 50EUR/3, Premium 80EUR/5), souscription, historique, notation
   - Historique commandes : liste, detail, statuts en temps reel
   - Notifications push natives (FCM via firebase_messaging)
   - Evaluation livraison (1-5 etoiles + commentaire)
   - Profil : adresses (avec autocomplete), preferences

2. **UX Mobile** :
   - Design inspire de Too Good To Go (vert anti-gaspi, illustrations food)
   - Animations fluides (Hero, page transitions)
   - Prix barre + prix -50% bien visible
   - Avertissement deadline 17h
   - Pull-to-refresh sur les listes
   - Mode hors-ligne : cache catalogue, sync au retour
   - Support dark mode
   - Responsive : phones + tablettes

3. **Integration API** :
   - Dio avec interceptor JWT (refresh token)
   - Tous les endpoints de `03_sequence_diagrams.puml`
   - Gestion erreurs (snackbars)
   - Retry automatique sur erreurs reseau

4. **Modeles Dart** :
   - Classes Dart avec fromJson/toJson (miroir des DTOs API)
   - Se baser sur le `02_class_diagram.puml`

5. **Notifications push** :
   - Firebase Cloud Messaging (foreground + background)
   - Local notifications pour les rappels
   - Deep linking vers la commande/livraison concernee

### Architecture :
- Feature-first (un dossier par fonctionnalite)
- Riverpod pour le state management (ou BLoC si prefere)
- Repository pattern pour l'acces API
- GoRouter pour la navigation
- Un widget par fichier, separation UI/logique
