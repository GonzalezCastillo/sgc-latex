# SGC-LaTeX document classes

This is the repository for my personal LaTeX document classes. They are heavily customised and designed to fit my taste and needs.

## Quick start
**If you just want to compile a document that relies on these document classes:**

1. Find whichever document class you are looking for in the `texmf/tex` folder.
2. Copy the class file to your local working directory.
3. Compile your document with pdfLaTeX.

There is no need to install all the files on your system.

## Font dependencies
Depending on which TeX engine you use, the document classes will use different fonts:

- If you use XeLaTeX, the document classes will load [Inter](https://rsms.me/inter/) using the fontspec package and they will use it as their default sans serif font. The Inter font files are included in the `texmf/fonts` folder and they must be accessible to fontspec if you use these document classes with XeLaTeX.

- If you use pdfLaTeX, the default sans serif font will be Tex Gyre Heros, which comes bundled with most TeX distributions.

## Full installation
You can install the document classes on your system by copying the contents of the `texmf` folder to your local `texmf` folder.

The document classes have been generated from the `classes.dtx` source file running this command:

```
latex classes.ins
```

