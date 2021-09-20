# SGC LaTeX document classes

The document classes can be generated from the `classes.dtx` file running `latex classes.ins`.
You can install them on your system copying the contents of the `texmf` folder to your local `texmf` folder.

There are some required font files included in the `texmf/fonts` folder. These are:
- The [Inter](https://rsms.me/inter/) fonts by Rasmus Andersson.
- The [Hack](https://sourcefoundry.org/hack/) font by Source Foundry.

If you only need a specific document class for a single document, you can paste the class file and the fonts in the working directory of your document –– there's no need to install the files on your system.

Keep in mind that these document classes **do not work with pdfLaTeX**. Use XeLaTex instead.
