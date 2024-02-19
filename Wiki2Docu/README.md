# Wiki 2 Docusaurus Project Tools

This directory contains tools that I am developing to implement the project: [[GSoC2023] Upgrade the documentation system](https://forum.freecad.org/viewtopic.php?style=4&t=78143 )

* Script: `get_content.sh` is a tool for generating a list of titles of all Wiki pages related to FreeCAD, which can be imported into a new platform.
* Script: `get_Wiki2.sh` is used to retrieve content from selected pages. It can operate in "automatic" mode when we prepare a list of titles to be downloaded. The script requires one parameter to run _(the title of an existing page)_ or two parameters. In the latter case, the first parameter must be a `lista`, and the second parameter must be the name of the file with  saved titles to be downloaded. Then the script will start an automatic operation and will proceed to download all the titles. The downloaded pages will be saved in a directory named after the specified file containing  titles to be downloaded _(specified as the second parameter)_.
* Script: `Wiki2Docu4.sh` is a converter from a ***html*** format _(MediaWiki)_ to ***markdown*** _(Docusaurus)_, which I am developing. At present, it requires a parameter specifying the name of the file to perform the conversion.

---
Related topics on the FreeCAD forum: [export pages to a file](https://forum.freecad.org/viewtopic.php?style=4&t=85327)

GitHub repository of the project: [FreeCAD-documentation-docusaurus](https://github.com/FreeCAD/FreeCAD-documentation-docusaurus/blob/main/README.md)

External tool: [Markdown Live Preview](https://markdownlivepreview.com/)
