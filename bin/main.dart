import 'affichage.dart';
import 'gestion_utilisateur.dart';
import 'main_fonction.dart';

void main(List<String> args) async {
  if (!await GestionUtilisateurs.estRoot()) {
    print(Affichage.afficheLanceRoot());
  } else {
    int choix = 0;
    if (!await GestionUtilisateurs.checkInstallation()) {
      print(Affichage.afficheInstallation());
      if (!Affichage.confirmationInstallation()) {
        choix = 4;
      } else {
        GestionUtilisateurs.installation();
        print(Affichage.afficheInstallationReussite());
        await Future.delayed(Duration(seconds: 2));
      }
    }
    while (choix != 4) {
      print(Affichage.afficheMenu());
      choix = Affichage.choixMenus(4);
      if (choix == 1) {
        await MainFonction.choix_1();
      } else if (choix == 2) {
        await MainFonction.choix_2();
      } else if (choix == 3) {
        await MainFonction.choix_3();
      }
    }
  }
}
