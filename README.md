# FreeCAD-translators-tools
Bash scripts useful to FreeCAD translators

---

## QMconvert2.sh
Combined with [weekly builds FreeCAD](https://github.com/FreeCAD/FreeCAD-Bundle/releases/tag/weekly-builds) of FreeCAD released in the form of _**AppImage**_, we gain the possibility to test translations "on the spot." This allows us to test developed translations without waiting for the full release cycle of the next test version, which contains updated UI translations.

Translations for [FreeCAD](https://www.freecad.org/index.php?lang=pl) are made on the platrorm [Crowdin](https://crowdin.com/project/freecad/pl). Download the updated GUI text files in your favorite language from there.

This is the second version of a bash script designed to prepare compiled language files for the QT development environment upon which FreeCAD is based. Essentially, the script was created to make it easier for translators to test the quality of translations prepared for the GUI in a local environment. It also allows for local translation work, such as for external workbenches not yet incorporated into FreeCAD-addons. In such cases, the script can also be useful.

### What this script does:
* Ensures that the file name adheres to predefined conventions _(e.g., uppercase letter at the beginning)_,
* Adds the language code _(and possibly the region code)_ to the file name, which is read from the header of the source file,
* Compiles the files using the ***lrelease*** tool installed on the system,
* Moves the compiled files to the appropriate location within the FreeCAD directory structure,
* Can process any number of source files located in the current directory.

### Preparing the local environment for the script.
If working on a Debian OS, you will need the package:
```
qttools5-dev-tools
```
This package includes QT tools, including the necessary lrelease.

### Prepare source files with translations.
You can download `.ts` files for the GUI part you are interested in from the Crowdin project platform [FreeCAD](https://crowdin.com/project/freecad/pl) or [FreeCAD-addons](https://crowdin.com/project/freecad-addons). If you do not have an account, you must have a friend who does.

![how to download the source file](/images/download_2024-02-15_13-56.webm)
If you are working with an external workbench from outside the ***FreeCAD-addons*** repository, you must generate the translation source files yourself, locally.

### Working with a script.
It is straightforward. Copy the script file to the directory where you have downloaded the source files. Give it the required `+x` permissions, then call it from the console.

<video width="320" height="240" controls>
  <source src="[https://github.com/kaktusus/FreeCAD-translators-tools/blob/main/images/QMConvwet2_2024-02-15_14-53.webm](https://github.com/kaktusus/FreeCAD-translators-tools/raw/refs/heads/main/QMConvwet2_2024-02-15_14-53.webm)" type="video/webm">
</video>

![operation of script](/images/QMConvwet2_2024-02-15_14-53.webm)

#### Download sctipt here.
[QMConvert2](/bash_scripts/QMconvert2.sh)

### Update 2025-11-16

This is yet another change to the location of local translation files.
Starting from the latest release, the new target directory is:
`~/.local/share/FreeCAD/v1-1/translations`
Therefore, the script requires an update.

It is possible to check the current configuration directory from within the application using the Python console: 
```
App.getUserAppDataDir()
```

A `translations` directory for local translation files must be created precisely there.
