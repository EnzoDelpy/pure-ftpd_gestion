import 'dart:io';

import 'fonctions.dart';

class Affichage {
  //retourne un entier choisis par l'utilisateur qui est compris entre 1 et le parametre n
  static int choixMenus(int n) {
    int choix = 0;
    while (choix < 1 || choix > n) {
      choix = MesFonctions.saisirInt();
      if (choix < 1 || choix > n) {
        print("\x1B[31mChoix incorrect\x1B[0m");
      }
    }
    return choix;
  }

  //retourne un string contenant le menu principal
  static String afficheMenu() {
    String affichage = "\x1B[2J\x1B[0;0H\n" +
        "                         ███████ ████████  ██████                \n" +
        "                         ██         ██     ██   ██               \n" +
        "                         █████      ██     ██████                \n" +
        "                         ██         ██     ██                    \n" +
        "                         ██         ██     ██                    \n" +
        "                                                                 \n" +
        "                                                                 \n" +
        "          ██████  ███████ ███████ ████████ ██  ██████  ███    ██ \n" +
        "         ██       ██      ██         ██    ██ ██    ██ ████   ██ \n" +
        "         ██   ███ █████   ███████    ██    ██ ██    ██ ██ ██  ██ \n" +
        "         ██    ██ ██           ██    ██    ██ ██    ██ ██  ██ ██ \n" +
        "          ██████  ███████ ███████    ██    ██  ██████  ██   ████ \n" +
        "=========================================================================\n" +
        "|                           Menu Principal                              |\n" +
        "|                                                                       |\n" +
        "|   Veuillez choisir une action                                         |\n" +
        "|                                                                       |\n" +
        "|   1. Gerer un utilisateur                                             |\n" +
        "|   2. Creer un utilisateur                                             |\n" +
        "|   3. Afficher les utilisateurs                                        |\n" +
        "|   4. Quitter                                                          |\n" +
        "|                                                                       |\n" +
        "=========================================================================\n";
    return affichage;
  }

  //affiche le menu d'installation
  static String afficheInstallation() {
    String affichage = "\x1B[2J\x1B[0;0H\n" +
        "                         ███████ ████████  ██████                \n" +
        "                         ██         ██     ██   ██               \n" +
        "                         █████      ██     ██████                \n" +
        "                         ██         ██     ██                    \n" +
        "                         ██         ██     ██                    \n" +
        "                                                                 \n" +
        "                                                                 \n" +
        "          ██████  ███████ ███████ ████████ ██  ██████  ███    ██ \n" +
        "         ██       ██      ██         ██    ██ ██    ██ ████   ██ \n" +
        "         ██   ███ █████   ███████    ██    ██ ██    ██ ██ ██  ██ \n" +
        "         ██    ██ ██           ██    ██    ██ ██    ██ ██  ██ ██ \n" +
        "          ██████  ███████ ███████    ██    ██  ██████  ██   ████ \n" +
        "=========================================================================\n" +
        "|                                                                       |\n" +
        "|                           Installation                                |\n"
            "|                                                                       |\n" +
        "=========================================================================\n";
    return affichage;
  }

  //retourne un bool correspondant au choix de l'utilisateur lors de l'installation'
  static bool confirmationInstallation() {
    String confirmation = "";
    while (confirmation != "oui" && confirmation != "non") {
      print("Voulez vous vraiment effectuer l'installation ?(oui/non)");
      confirmation = MesFonctions.saisirString();
      if (confirmation != "oui" && confirmation != "non") {
        print("\x1B[31mRéponse incorrecte(oui ou non)\x1B[0m");
      }
    }
    if (confirmation == "oui") {
      return true;
    }
    return false;
  }

  //retourne un string contenant l'affichage de utilisateurs donnés en paramètre
  static String afficheUtilisateurs(List<String> lesUtilisateurs) {
    String affichage =
        "\x1B[2J\x1B[0;0H\x1B[31mAucun utilisateurs existant\x1B[0m\n\n1. Revenir au menu principal";
    if (lesUtilisateurs.isNotEmpty) {
      affichage = "\x1B[2J\x1B[0;0H\n";
      for (String elt in lesUtilisateurs) {
        affichage +=
            "===========================================================================================================\n" +
                elt +
                "\n";
      }
      affichage +=
          "===========================================================================================================\n\n1. Revenir au menu Principal";
    }
    return affichage;
  }

  //retourne un string contenant le message de reussite de l'installation
  static String afficheInstallationReussite() {
    return "\x1B[32mInstallation effectuée\x1B[0m";
  }

  //retourne un string contenant le message de réussite de création d'utilisateur
  static String afficheCreaUtilisateurReussite() {
    return "\x1B[32mUtilisateur crée\x1B[0m";
  }

  //retourne un string pour dire qu'un utilisateur au meme nom est existant
  static String afficheEchecCreaUtilisateur() {
    return "\x1B[31mUtilisateur déjà existant\x1B[0m";
  }

  //retourne un string pour dire qu'il faut lancer le programme en root
  static String afficheLanceRoot() {
    return "\x1B[31mVeuillez lancer le programme en root\x1B[0m";
  }

  //retourne le nom d'utilisateur choisi par l'utilisateur
  static String getNomUtilisateur() {
    String nom = "";
    while (nom.isEmpty) {
      print("Veuillez saisir le nom de l'utilisateur");
      nom = MesFonctions.saisirString();
      if (nom.isEmpty) {
        print("\x1B[31mVeuillez saisir un nom d'utilisateur valide\x1B[0m");
      }
    }
    return nom;
  }

  //retourne un string correspondant au mot de passe saisie par l'utilisateur
  static String getPassword() {
    print("Veuillez saisir le mot de passe");
    stdin.echoMode = false;
    String password = MesFonctions.saisirString();
    stdin.echoMode = true;
    return password;
  }

  //retourne un string contenant le menu principal
  static String afficheGestion(String nom) {
    String affichage = "\x1B[2J\x1B[0;0H\n" +
        "                         ███████ ████████  ██████                \n" +
        "                         ██         ██     ██   ██               \n" +
        "                         █████      ██     ██████                \n" +
        "                         ██         ██     ██                    \n" +
        "                         ██         ██     ██                    \n" +
        "                                                                 \n" +
        "                                                                 \n" +
        "          ██████  ███████ ███████ ████████ ██  ██████  ███    ██ \n" +
        "         ██       ██      ██         ██    ██ ██    ██ ████   ██ \n" +
        "         ██   ███ █████   ███████    ██    ██ ██    ██ ██ ██  ██ \n" +
        "         ██    ██ ██           ██    ██    ██ ██    ██ ██  ██ ██ \n" +
        "          ██████  ███████ ███████    ██    ██  ██████  ██   ████ \n" +
        "=========================================================================\n" +
        "|   Gestion de " +
        nom +
        "                         \n" +
        "|                                                                       |\n" +
        "|   Veuillez choisir une action                                         |\n" +
        "|                                                                       |\n" +
        "|   1. Limiter la bande passante du téléchargement                      |\n" +
        "|   2. Limiter la bande passsante de l'envoi                            |\n" +
        "|   3. quota en nombre de fichiers max                                  |\n" +
        "|   4. Quota en taille maximale utilisable                              |\n" +
        "|   5. Autoriser une ip depuis laquelle l'utilisateur peut se connecter |\n" +
        "|   6. Interdire une ip depuis laquelle l'utilisateur peut se connecter |\n" +
        "|   7. Limitation horaire                                               |\n" +
        "|   8. Nombre de session simultanée autorisées                          |\n" +
        "|   9. Supprimer l'utilisateur                                          |\n" +
        "|   10. Quitter                                                         |\n" +
        "|                                                                       |\n" +
        "=========================================================================\n";
    return affichage;
  }

  //retourne un string contenant le menu principal
  static String afficheGestion2(String nom) {
    String affichage = "\x1B[2J\x1B[0;0H\n" +
        "                         ███████ ████████  ██████                \n" +
        "                         ██         ██     ██   ██               \n" +
        "                         █████      ██     ██████                \n" +
        "                         ██         ██     ██                    \n" +
        "                         ██         ██     ██                    \n" +
        "                                                                 \n" +
        "                                                                 \n" +
        "          ██████  ███████ ███████ ████████ ██  ██████  ███    ██ \n" +
        "         ██       ██      ██         ██    ██ ██    ██ ████   ██ \n" +
        "         ██   ███ █████   ███████    ██    ██ ██    ██ ██ ██  ██ \n" +
        "         ██    ██ ██           ██    ██    ██ ██    ██ ██  ██ ██ \n" +
        "          ██████  ███████ ███████    ██    ██  ██████  ██   ████ \n" +
        "=========================================================================\n" +
        "|   Gestion de " +
        nom +
        "                         \n" +
        "|                                                                       |\n" +
        "|   Veuillez choisir une action                                         |\n" +
        "|                                                                       |\n" +
        "|   1. Saisir une valeur                                                |\n" +
        "|   2. Reinitialiser                                                    |\n" +
        "|                                                                       |\n" +
        "=========================================================================\n";
    return affichage;
  }

  //retourne la limite de téléchargement choisi par l'utilisateur
  static int getLimiteTelechargment() {
    print("Veuillez saisir la limite de téléchargment");
    int limite = MesFonctions.saisirInt();
    return limite;
  }

  //retourne la limite d'envoi choisi par l'utilisateur
  static int getLimiteEnvoi() {
    print("Veuillez saisir la limite d'envoi");
    int limite = MesFonctions.saisirInt();
    return limite;
  }

  //retourne le quota de fichier max choisi par l'utilisateur
  static int getQuotaFichier() {
    print("Veuillez saisir le quota de fichier");
    int limite = MesFonctions.saisirInt();
    return limite;
  }

  //retourne le quota de taille utilisable choisi par l'utilisateur
  static int getQuotaTaille() {
    print("Veuillez saisir le quota de taille utilisable");
    int limite = MesFonctions.saisirInt();
    return limite;
  }

  //retourne le nombre de session choisi par l'utilisateur
  static int getNbSession() {
    print("Veuillez saisir le nombre de session simultanée");
    int limite = MesFonctions.saisirInt();
    return limite;
  }

  //retourne un string contenant le message de reussite de l'opération
  static String afficheOperationReussite() {
    return "\x1B[32mOpération effectuée\x1B[0m";
  }

  static bool checkIp(String ip) {
    bool valide = true;
    List<String> ip_split = ip.split('.');
    if (ip_split.length != 4) {
      valide = false;
    } else {
      for (String nb in ip_split) {
        try {
          if (int.parse(nb) < 0 || int.parse(nb) > 255) {
            valide = false;
          }
        } catch (e) {
          valide = false;
        }
      }
    }
    return valide;
  }

  static String getIp() {
    String ip = "";
    while (!checkIp(ip)) {
      print("Veuillez saisir l'adresse ip");
      ip = MesFonctions.saisirString();
    }
    return ip;
  }

  static bool checkHoraire(String horaire) {
    bool valide = true;
    List<String> horaire_split = horaire.split('-');
    if (horaire_split.length != 2) {
      valide = false;
    } else {
      for (String nb in horaire_split) {
        if (nb.length != 4) {
          valide = false;
        }
        try {
          int v1 = int.parse(nb[0] + nb[1]);
          int v2 = int.parse(nb[2] + nb[3]);
          if (v1 > 23 || v1 < 0) {
            valide = false;
          }
          if (v2 < 0 || v2 > 59) {
            valide = false;
          }
        } catch (e) {
          valide = false;
        }
      }
    }
    return valide;
  }

  static String getHoraire() {
    String horaire = "";
    while (!checkHoraire(horaire)) {
      print("Veuillez saisir l'horaire (type HHmm-HHmm)");
      horaire = MesFonctions.saisirString();
    }
    return horaire;
  }

  //retourne un bool correspondant au choix de l'utilisateur pour la suppression
  static bool confirmationSuppression() {
    String confirmation = "";
    while (confirmation != "oui" && confirmation != "non") {
      print("Voulez vous vraiment supprimer l'utilisateur ?(oui/non)");
      confirmation = MesFonctions.saisirString();
      if (confirmation != "oui" && confirmation != "non") {
        print("\x1B[31mRéponse incorrecte(oui ou non)\x1B[0m");
      }
    }
    if (confirmation == "oui") {
      return true;
    }
    return false;
  }
}
