## Introduction 
In FreeCAD the word "[Body](Body)" is normally used to refer to a [PartDesign_Body](PartDesign Body) object ({{incode|PartDesign::Body}} class) that is defined by the [PartDesign Workbench](PartDesign Workbench). This is a container object that can hold [Sketch](2D sketches) and [PartDesign Feature](3D geometrical features) to build a solid shape.
See [PartDesign_Body](PartDesign Body) for more information about this type of object.
## Usage
* Switch to the [PartDesign Workbench](PartDesign Workbench).
* Press {{Button|[[File:PartDesign_Body.svg|16px]] [PartDesign_Body](PartDesign Body)}}.
* Press {{Button|[[File:PartDesign_NewSketch.svg|16px]] [PartDesign_NewSketch](PartDesign NewSketch)}} to create a new [Sketch](sketch).
* Create a closed wire, and then use {{Button|[[File:PartDesign_Pad.svg|16px]] [PartDesign_Pad](PartDesign Pad)}} to extrude the sketch, and create an initial solid.
* Add more sketches and pads, and use other tools of the [PartDesign Workbench](PartDesign Workbench) to modify and transform the initial solid.
Alternatively, instead of using [Sketch](sketches), you can add primitive [PartDesign Feature](PartDesign Features), for example, a {{Button|[[File:PartDesign_AdditiveBox.svg|16px]] [PartDesign_AdditiveBox](PartDesign Additive box)}}. Any number of additive and subtractive features can be used to create a final volume.
## Notes 
A Body is required when using the [PartDesign_Workbench](PartDesign Workbench) in a [Feature_editing](feature editing) methodology.
A Body is not required when using the [Part_Workbench](Part Workbench), as this workbench uses a [Constructive_solid_geometry](constructive solid geometry) workflow, which is based on [Part_Primitives](primitive shapes) and boolean operations.
{{PartDesign Tools navi{{#translation:}}}}
{{Document objects navi{{#translation:}}}}
{{Userdocnavi{{#translation:}}}}
[[Category:Glossary{{#translation:}}]]
