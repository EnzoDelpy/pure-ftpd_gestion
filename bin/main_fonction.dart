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
      GestionUtilisateurs.limiteTelechargement(nom, limite);
      print(Affichage.afficheOperationReussite());
      await Future.delayed(Duration(seconds: 2));
    } else {
      GestionUtilisateurs.reinitLimiteTelechargement(nom);
      print(Affichage.afficheOperationReussite());
      await Future.delayed(Duration(seconds: 2));
    }
  }

  static Future<void> choix_1_2(String nom) async {
    print(Affichage.afficheGestion2(nom));
    int choix = Affichage.choixMenus(2);
    if (choix == 1) {
      int limite = Affichage.getLimiteEnvoi();
      GestionUtilisateurs.limiteEnvoi(nom, limite);
      print(Affichage.afficheOperationReussite());
      await Future.delayed(Duration(seconds: 2));
    } else {
      GestionUtilisateurs.reinitLimiteEnvoi(nom);
      print(Affichage.afficheOperationReussite());
      await Future.delayed(Duration(seconds: 2));
    }
  }

  static Future<void> choix_1_3(String nom) async {
    print(Affichage.afficheGestion2(nom));
    int choix = Affichage.choixMenus(2);
    if (choix == 1) {
      int limite = Affichage.getQuotaFichier();
      GestionUtilisateurs.quotaFichier(nom, limite);
      print(Affichage.afficheOperationReussite());
      await Future.delayed(Duration(seconds: 2));
    } else {
      GestionUtilisateurs.reinitQuotaFichier(nom);
      print(Affichage.afficheOperationReussite());
      await Future.delayed(Duration(seconds: 2));
    }
  }

  static Future<void> choix_1_4(String nom) async {
    print(Affichage.afficheGestion2(nom));
    int choix = Affichage.choixMenus(2);
    if (choix == 1) {
      int limite = Affichage.getQuotaTaille();
      GestionUtilisateurs.tailleMax(nom, limite);
      print(Affichage.afficheOperationReussite());
      await Future.delayed(Duration(seconds: 2));
    } else {
      GestionUtilisateurs.reinitTailleMax(nom);
      print(Affichage.afficheOperationReussite());
      await Future.delayed(Duration(seconds: 2));
    }
  }

  static Future<void> choix_1_5(String nom) async {
    print(Affichage.afficheGestion2(nom));
    int choix = Affichage.choixMenus(2);
    if (choix == 1) {
      String limite = Affichage.getIp();
      GestionUtilisateurs.autoriseIp(nom, limite);
      print(Affichage.afficheOperationReussite());
      await Future.delayed(Duration(seconds: 2));
    } else {
      GestionUtilisateurs.reinitAutoriseIp(nom);
      print(Affichage.afficheOperationReussite());
      await Future.delayed(Duration(seconds: 2));
    }
  }

  static Future<void> choix_1_6(String nom) async {
    print(Affichage.afficheGestion2(nom));
    int choix = Affichage.choixMenus(2);
    if (choix == 1) {
      String limite = Affichage.getIp();
      GestionUtilisateurs.bloqueIp(nom, limite);
      print(Affichage.afficheOperationReussite());
      await Future.delayed(Duration(seconds: 2));
    } else {
      GestionUtilisateurs.reinitBloqueIp(nom);
      print(Affichage.afficheOperationReussite());
      await Future.delayed(Duration(seconds: 2));
    }
  }

  static Future<void> choix_1_7(String nom) async {
    print(Affichage.afficheGestion2(nom));
    int choix = Affichage.choixMenus(2);
    if (choix == 1) {
      String limite = Affichage.getHoraire();
      GestionUtilisateurs.limiteHoraire(nom, limite);
      print(Affichage.afficheOperationReussite());
      await Future.delayed(Duration(seconds: 2));
    } else {
      GestionUtilisateurs.reinitLimiteHoraire(nom);
      print(Affichage.afficheOperationReussite());
      await Future.delayed(Duration(seconds: 2));
    }
  }

  static Future<void> choix_1_8(String nom) async {
    print(Affichage.afficheGestion2(nom));
    int choix = Affichage.choixMenus(2);
    if (choix == 1) {
      int limite = Affichage.getNbSession();
      GestionUtilisateurs.nbSession(nom, limite);
      print(Affichage.afficheOperationReussite());
      await Future.delayed(Duration(seconds: 2));
    } else {
      GestionUtilisateurs.reinitNbSession(nom);
      print(Affichage.afficheOperationReussite());
      await Future.delayed(Duration(seconds: 2));
    }
  }

  static Future<void> choix_1_9(String nom) async {
    if (Affichage.confirmationSuppression()) {
      GestionUtilisateurs.supprimeUtilisateur(nom);
      print(Affichage.afficheOperationReussite());
      await Future.delayed(Duration(seconds: 2));
    }
  }
}
