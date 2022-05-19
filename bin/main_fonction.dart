import 'affichage.dart';
import 'gestion_utilisateur.dart';

class MainFonction {
  static Future<void> choix_3() async {
    print(Affichage.afficheUtilisateurs(
        await GestionUtilisateurs.getUtilisateurs()));
    Affichage.choixMenus(1);
  }

  static Future<void> choix_2() async {
    if (await GestionUtilisateurs.creerUtilisateur(
        Affichage.getNomUtilisateur())) {
      await GestionUtilisateurs.restartService();
      print(Affichage.afficheCreaUtilisateurReussite());
      await Future.delayed(Duration(seconds: 2));
    } else {
      print(Affichage.afficheEchecCreaUtilisateur());
      await Future.delayed(Duration(seconds: 2));
    }
  }

  static Future<void> choix_1() async {
    String nom = Affichage.getNomUtilisateur();
    if ((await GestionUtilisateurs.getUtilisateurs()).contains(nom)) {
      print(Affichage.afficheGestion(nom));
      int choix = Affichage.choixMenus(9);
      if (choix == 1) {
        await choix_1_1(nom);
      } else if (choix == 2) {
        await choix_1_2(nom);
      } else if (choix == 3) {
        await choix_1_3(nom);
      } else if (choix == 4) {
        await choix_1_4(nom);
      } else if (choix == 5) {
        await choix_1_5(nom);
      } else if (choix == 6) {
        await choix_1_6(nom);
      } else if (choix == 7) {
        await choix_1_7(nom);
      } else if (choix == 8) {
        await choix_1_8(nom);
      } else if (choix == 9) {
        await choix_1_9(nom);
      } else {
        return;
      }
    } else {
      print("\x1B[31mUtilisateur inexistant\x1B[0m");
      await Future.delayed(Duration(seconds: 2));
    }
  }

  static Future<void> choix_1_1(String nom) async {
    print(Affichage.afficheGestion2(nom));
    int choix = Affichage.choixMenus(2);
    if (choix == 1) {
      int limite = Affichage.getLimiteTelechargment();
      await GestionUtilisateurs.limiteTelechargement(nom, limite);
      await GestionUtilisateurs.restartService();
      print(Affichage.afficheOperationReussite());
      await Future.delayed(Duration(seconds: 2));
    } else {
      await GestionUtilisateurs.reinitLimiteTelechargement(nom);
      await GestionUtilisateurs.restartService();
      print(Affichage.afficheOperationReussite());
      await Future.delayed(Duration(seconds: 2));
    }
  }

  static Future<void> choix_1_2(String nom) async {
    print(Affichage.afficheGestion2(nom));
    int choix = Affichage.choixMenus(2);
    if (choix == 1) {
      int limite = Affichage.getLimiteEnvoi();
      await GestionUtilisateurs.limiteEnvoi(nom, limite);
      await GestionUtilisateurs.restartService();
      print(Affichage.afficheOperationReussite());
      await Future.delayed(Duration(seconds: 2));
    } else {
      await GestionUtilisateurs.reinitLimiteEnvoi(nom);
      await GestionUtilisateurs.restartService();
      print(Affichage.afficheOperationReussite());
      await Future.delayed(Duration(seconds: 2));
    }
  }

  static Future<void> choix_1_3(String nom) async {
    print(Affichage.afficheGestion2(nom));
    int choix = Affichage.choixMenus(2);
    if (choix == 1) {
      int limite = Affichage.getQuotaFichier();
      await GestionUtilisateurs.quotaFichier(nom, limite);
      await GestionUtilisateurs.restartService();
      print(Affichage.afficheOperationReussite());
      await Future.delayed(Duration(seconds: 2));
    } else {
      await GestionUtilisateurs.reinitQuotaFichier(nom);
      await GestionUtilisateurs.restartService();
      print(Affichage.afficheOperationReussite());
      await Future.delayed(Duration(seconds: 2));
    }
  }

  static Future<void> choix_1_4(String nom) async {
    print(Affichage.afficheGestion2(nom));
    int choix = Affichage.choixMenus(2);
    if (choix == 1) {
      int limite = Affichage.getQuotaTaille();
      await GestionUtilisateurs.tailleMax(nom, limite);
      await GestionUtilisateurs.restartService();
      print(Affichage.afficheOperationReussite());
      await Future.delayed(Duration(seconds: 2));
    } else {
      await GestionUtilisateurs.reinitTailleMax(nom);
      await GestionUtilisateurs.restartService();
      print(Affichage.afficheOperationReussite());
      await Future.delayed(Duration(seconds: 2));
    }
  }

  static Future<void> choix_1_5(String nom) async {
    print(Affichage.afficheGestion2(nom));
    int choix = Affichage.choixMenus(2);
    if (choix == 1) {
      String limite = Affichage.getIp();
      await GestionUtilisateurs.autoriseIp(nom, limite);
      await GestionUtilisateurs.restartService();
      print(Affichage.afficheOperationReussite());
      await Future.delayed(Duration(seconds: 2));
    } else {
      await GestionUtilisateurs.reinitAutoriseIp(nom);
      await GestionUtilisateurs.restartService();
      print(Affichage.afficheOperationReussite());
      await Future.delayed(Duration(seconds: 2));
    }
  }

  static Future<void> choix_1_6(String nom) async {
    print(Affichage.afficheGestion2(nom));
    int choix = Affichage.choixMenus(2);
    if (choix == 1) {
      String limite = Affichage.getIp();
      await GestionUtilisateurs.bloqueIp(nom, limite);
      await GestionUtilisateurs.restartService();
      print(Affichage.afficheOperationReussite());
      await Future.delayed(Duration(seconds: 2));
    } else {
      await GestionUtilisateurs.reinitBloqueIp(nom);
      await GestionUtilisateurs.restartService();
      print(Affichage.afficheOperationReussite());
      await Future.delayed(Duration(seconds: 2));
    }
  }

  static Future<void> choix_1_7(String nom) async {
    String limite = Affichage.getHoraire();
    await GestionUtilisateurs.limiteHoraire(nom, limite);
    await GestionUtilisateurs.restartService();
    print(Affichage.afficheOperationReussite());
    await Future.delayed(Duration(seconds: 2));
  }

  static Future<void> choix_1_8(String nom) async {
    print(Affichage.afficheGestion2(nom));
    int choix = Affichage.choixMenus(2);
    if (choix == 1) {
      int limite = Affichage.getNbSession();
      await GestionUtilisateurs.nbSession(nom, limite);
      await GestionUtilisateurs.restartService();
      print(Affichage.afficheOperationReussite());
      await Future.delayed(Duration(seconds: 2));
    } else {
      await GestionUtilisateurs.reinitNbSession(nom);
      await GestionUtilisateurs.restartService();
      print(Affichage.afficheOperationReussite());
      await Future.delayed(Duration(seconds: 2));
    }
  }

  static Future<void> choix_1_9(String nom) async {
    if (Affichage.confirmationSuppression()) {
      await GestionUtilisateurs.supprimeUtilisateur(nom);
      await GestionUtilisateurs.restartService();
      print(Affichage.afficheOperationReussite());
      await Future.delayed(Duration(seconds: 2));
    }
  }
}
