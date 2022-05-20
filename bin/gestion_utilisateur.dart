import 'dart:convert';
import 'dart:io';

import 'affichage.dart';

class GestionUtilisateurs {
  GestionUtilisateurs();

  //retourune true si l'utilisateur FTPUSER existe sinon false
  static Future<bool> checkInstallation() async {
    ProcessResult result =
        await Process.run('bash', ['-c', 'cut -d: -f1 /etc/passwd']);
    List<String> users = LineSplitter.split(result.stdout).toList();
    return (users.contains("FTPUSER"));
  }

  //installe pure-ftpd et la configuration de base
  static Future<void> installation() async {
    await Process.run('bash', ['-c', 'apt-get -yq install pure-ftpd']);
    await Process.run('bash', ['-c', 'mkdir /home/FTPUSER']);
    await Process.run(
        'bash', ['-c', 'useradd FTPUSER -u 9999 -d /home/FTPUSER']);
    await Process.run('bash', ['-c', 'chown root /home/FTPUSER']);
    await Process.run('bash', ['-c', 'chgrp root /home/FTPUSER']);
    await Process.run(
        'bash', ['-c', 'echo yes > /etc/pure-ftpd/conf/CreateHomeDir']);
    await Process.run('bash', [
      '-c',
      'ln -s /etc/pure-ftpd/conf/PureDB /etc/pure-ftpd/auth/60puredb'
    ]);
  }

  //redemarre le service pure-ftpd
  static Future<void> restartService() async {
    await Process.run('bash', ['-c', 'service pure-ftpd restart']);
  }

  //retourne une liste contenant tout les utilisateurs virtuels existants
  static Future<List<String>> getUtilisateurs() async {
    ProcessResult result = await Process.run(
        'bash', ['-c', 'cut -d: -f1 /etc/pure-ftpd/pureftpd.passwd']);
    List<String> users = LineSplitter.split(result.stdout).toList();
    return (users);
  }

  //Creer un utilisateur virtuel ftp et renvoie un booléen pour savoir si l'utilisateur existe déjà
  static Future<bool> creerUtilisateur(String utilisateur) async {
    bool valide = true;
    if ((await getUtilisateurs()).contains(utilisateur)) {
      valide = false;
    } else {
      Process p = await Process.start('bash', [
        '-c',
        'pure-pw useradd ' +
            utilisateur +
            ' -u 9999 -g 9999 -d /home/FTPUSER/' +
            utilisateur +
            ' -m'
      ]);
      String mdp = Affichage.getPassword();
      p.stdin.writeln(mdp);
      p.stdin.writeln(mdp);
    }
    return valide;
  }

  //limite la bande passante  de téléchargement d'un utilisateur avec la valeur donnée en paramètre
  static Future<void> limiteTelechargement(String nom, int valeur) async {
    await Process.run('bash', ['-c', 'pure-pw usermod $nom -t $valeur -m']);
  }

  //limite la bande passante d'envoi d'un utilisateur avec la valeur donnée en paramètre
  static Future<void> limiteEnvoi(String nom, int valeur) async {
    await Process.run('bash', ['-c', 'pure-pw usermod $nom -T $valeur -m']);
  }

  //limite le nombre max de fichier d'un utilisateur avec la valeur donnée en paramètre
  static Future<void> quotaFichier(String nom, int valeur) async {
    await Process.run('bash', ['-c', 'pure-pw usermod $nom -n $valeur -m']);
  }

  //limite la taille max utilisable d'un utilisateur avec la valeur donnée en paramètre
  static Future<void> tailleMax(String nom, int valeur) async {
    await Process.run('bash', ['-c', 'pure-pw usermod $nom -N $valeur -m']);
  }

  //autorise une ip pour un utilisateur
  static Future<void> autoriseIp(String nom, String ip) async {
    await Process.run('bash', ['-c', 'pure-pw usermod $nom -r $ip -m']);
  }

  //bloque une ip pour un utilisateur
  static Future<void> bloqueIp(String nom, String ip) async {
    await Process.run('bash', ['-c', 'pure-pw usermod $nom -R $ip -m']);
  }

  //Limitation horraire d'un utilisateur
  static Future<void> limiteHoraire(String nom, String horaire) async {
    await Process.run('bash', ['-c', 'pure-pw usermod $nom -z $horaire -m']);
  }

  //Limite le nombre de session simultanée
  static Future<void> nbSession(String nom, int valeur) async {
    await Process.run('bash', ['-c', 'pure-pw usermod $nom -y $valeur -m']);
  }

  //reinitialise la limite de bande passante de téléchargement d'un utilisateur
  static Future<void> reinitLimiteTelechargement(String nom) async {
    await Process.run('bash', ['-c', 'pure-pw usermod $nom -t "" -m']);
  }

  //reinitialise la limite de bande passante d'envoi d'un utilisateur
  static Future<void> reinitLimiteEnvoi(String nom) async {
    await Process.run('bash', ['-c', 'pure-pw usermod $nom -T "" -m']);
  }

  //renitialise le nombre max de fichier d'un utilisateur
  static Future<void> reinitQuotaFichier(String nom) async {
    await Process.run('bash', ['-c', 'pure-pw usermod $nom -n "" -m']);
  }

  //reinitialise la taille max utilisable d'un utilisateur
  static Future<void> reinitTailleMax(String nom) async {
    await Process.run('bash', ['-c', 'pure-pw usermod $nom -N "" -m']);
  }

  //reinitialise les ip autorisées
  static Future<void> reinitAutoriseIp(String nom) async {
    await Process.run('bash', ['-c', 'pure-pw usermod $nom -r "" -m']);
  }

  //réinitialise les ip bloquées
  static Future<void> reinitBloqueIp(String nom) async {
    await Process.run('bash', ['-c', 'pure-pw usermod $nom -R "" -m']);
  }

  //réinitialise la limitation horaire
  static Future<void> reinitLimiteHoraire(String nom) async {
    await Process.run('bash', ['-c', 'pure-pw usermod $nom -z "" -m']);
  }

  //réinitialise le nombre de session simultanée
  static Future<void> reinitNbSession(String nom) async {
    await Process.run('bash', ['-c', 'pure-pw usermod $nom -y "" -m']);
  }

  //Supprime un utilisateur donné en paramètre
  static Future<void> supprimeUtilisateur(String nom) async {
    await Process.run('bash', ['-c', 'pure-pw userdel $nom -m']);
  }

  //Renvoi un booléen pour savoir si le programme a été lancé en root
  static Future<bool> estRoot() async {
    bool valide = false;
    ProcessResult result = await Process.run('bash', ['-c', 'whoami']);
    List<String> user = result.stdout.split(' ');
    try {
      return (user[0].substring(0, 4) == "root");
    } catch (e) {
      return false;
    }
  }
}
