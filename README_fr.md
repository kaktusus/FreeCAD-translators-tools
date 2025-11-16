# Outils de traduction pour FreeCAD
Scripts bash utiles pour les traducteurs FreeCAD

---

## QMconvert2.sh
En combinaison avec les versions [de développement de FreeCAD](https://github.com/FreeCAD/FreeCAD-Bundle/releases/tag/weekly-builds) préparées sous la forme de ***AppImage***, nous avons la possibilité de tester les traductions "directement". Cela nous permet de tester les nouvelles traductions sans attendre le cycle complet de publication de la prochaine version de test, qui contient les mises à jour des traductions de l'interface utilisateur.

Les traductions pour [FreeCAD](https://www.freecad.org/index.php?lang=fr) sont réalisées sur la plateforme [Crowdin](https://crowdin.com/project/freecad/fr). De ce lien, vous pouvez télécharger les fichiers texte de l'interface utilisateur dans votre langue préférée.

Il s'agit de la deuxième version d'un script bash conçu pour préparer des fichiers de langue compilés pour l'environnement de développement QT sur lequel FreeCAD est basé. Ce script a été créé pour permettre aux traducteurs de tester plus facilement la qualité des traductions préparées pour l'interface graphique dans un environnement local. Il est également possible d'effectuer des traductions localement, par exemple pour des ateliers externes qui ne sont pas encore soumis aux extensions de FreeCAD. Dans ce cas, le script peut également être utile.

### Ce que ce script va faire :
* vérifier que le nom du fichier est aligné avec les hypothèses faites _(lettre majuscule devant, etc.)_,
* ajouter le code de la langue _(et peu-être le code région)_ au nom du fichier, qui est lu à partir de l'en-tête du fichier source,
* compiler les fichiers en utilisant l'outil ***lrelease*** installé sur le système,
* déplacer les fichiers compilés à l'emplacement approprié dans la structure du répertoire de FreeCAD,
* peut traiter n'importe quel nombre de fichiers sources situés dans le répertoire courant.

### Préparer l'environnement local pour le script.
Si vous travaillez sur Debian OS, vous aurez besoin du paquetage :
```
qttools5-dev-tools
```
Il contient les outils QT, y compris lrelease nécessaire.

### Préparer les fichiers sources avec les traductions.
Vous pouvez télécharger les fichiers ".ts" pour la partie GUI qui vous intéresse depuis la plateforme Crowdin de [FreeCAD](https://crowdin.com/project/freecad/fr) ou des [extensions de FreeCAD](https://crowdin.com/project/freecad-addons). Si vous n'avez pas de compte, vous devez avoir un ami qui en a un.

![Comment télécharger le fichier source](/images/download_2024-02-15_13-56.webm)
Si vous travaillez avec un atelier externe au répertoire ***FreeCAD-addons***, vous devrez générer les fichiers sources de traduction vous-même, localement.

### Travailler avec un script.
C'est simple. Copiez le fichier script dans le répertoire où vous avez téléchargé les fichiers sources. Donnez-lui les permissions "+x" nécessaires, puis appelez-le dans la console.

![Fonctionnement du script](/images/QMConvwet2_2024-02-15_14-53.webm)

#### Téléchargez le script ici.
[QMConvert2](/bash_scripts/QMconvert2.sh)

### Mise à jour du 2025-11-16

Il s’agit d’un nouveau changement concernant l’emplacement des fichiers de traduction locaux.
À partir de la dernière version, le nouveau répertoire cible est :
`~/.local/share/FreeCAD/v1-1/translations`
Par conséquent, le script doit être mis à jour.

Il est possible de vérifier le répertoire de configuration actuel directement dans le programme via la console Python :

```
App.getUserAppDataDir()

```
Il faut créer un dossier `translations` à cet emplacement pour y placer les fichiers de traduction locaux.
