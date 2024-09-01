%%
%% This is file `texmf/tex/sgcpres.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% classes.dtx  (with options: `pres')
%% 
%%
%% Copyright (C) Samuel González-Castillo (sgc.ink).
%% See LICENSE.md for license and copyright details.
%%

%%fakesection Initial setup and class options

\newcommand\sgc@version{v1.0.0-beta}

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{sgcpres}

\LoadClassWithOptions{beamer}

\newif\ifspanish\spanishfalse
\newif\ifsans\sansfalse
\newif\ifserif\seriffalse
\newif\iflm\lmfalse
\newif\ifqc\qcfalse

\DeclareOption{es}{\spanishtrue}
\DeclareOption{sans}{
\renewcommand\familydefault\sfdefault
\newmonotrue
}
\DeclareOption{serif}{\seriftrue}
\DeclareOption{lm}{\lmtrue}
\DeclareOption{sans}{\sanstrue}
\DeclareOption{qc}{\qctrue}


\ProcessOptions\relax

%%fakesection Packages and basic settings
\RequirePackage{xcolor, geometry, graphicx, tikz, pgfplots, caption}
\RequirePackage{enumitem, import, centernot, tabularray, xstring, calc}
\RequirePackage{amsthm, thmtools, mathtools, cancel, interval}
\RequirePackage[final]{listings}
\RequirePackage[separate-uncertainty = true]{siunitx}

\ifqc
\RequirePackage{quantikz, braket}
\fi

\usetikzlibrary{arrows.meta, calc, decorations.markings, math,
intersections, patterns, cd}
\tikzset{ % Make tikz lines thicker and adjust arrows
>=Stealth,
every picture/.style={line width=0.8pt},
thick/.style={line width=1.6pt},
very thick/.style={line width=2.4pt}
}

\setlength{\arrayrulewidth}{0.75pt} % Table rule thickness.



\usepackage[style=numeric,maxnames=3,minnames=3,backend=biber]{biblatex}
\DeclareFieldFormat{labelnumber}{\small\mkbibbold{#1}}
\DeclareFieldFormat{postnote}{\small #1}
\DeclareFieldFormat[article]{title}{\mkbibemph{#1}}
\DeclareFieldFormat[article]{citetitle}{\mkbibemph{#1}}
\DeclareFieldFormat[inproceedings]{title}{\mkbibemph{#1}}
\DeclareFieldFormat[inproceedings]{citetitle}{\mkbibemph{#1}}
\DeclareFieldFormat{booktitle}{#1}
\DeclareFieldFormat{journaltitle}{#1}
\DeclareFieldFormat{pages}{#1}
\DeclareFieldFormat{issn}{}
\DeclareFieldFormat{isbn}{}
\DeclareFieldFormat{doi}{}
\DeclareFieldFormat{url}{\textsc{url}: \href{#1}{#1}}
\renewbibmacro{in:}{}
\DeclareSourcemap{
\maps[datatype=bibtex, overwrite]{
\map{\step[fieldset=editor, null]}}
}

%%fakesection Language

\newcommand\str@license{All rights reserved.}
\newcommand\str@draft{DRAFT}
\newcommand\str@pageblank{This page is intentionally left blank.}
\newcommand\str@appendix{Appendix}
\newcommand\str@edition{Edition}
\newcommand\str@revision{Revision}
\newcommand\str@abstract{Abstract}

\newcommand\str@theorem{Theorem}
\newcommand\str@lemma{Lemma}
\newcommand\str@definition{Definition}
\newcommand\str@scholium{Scholium}
\newcommand\str@corollary{Corollary}
\newcommand\str@example{Example}
\newcommand\str@proposition{Proposition}
\newcommand\str@algorithm{Algorithm}

\newcommand\@thmpunct{.}

\RequirePackage[autostyle=true]{csquotes}
\newcommand\cml[1]{\enquote{#1}}

\ifspanish
\RequirePackage[spanish]{babel}
\usetikzlibrary{babel}
\decimalpoint

\renewcommand\str@license{Todos los derechos reservados.}
\renewcommand\str@draft{BORRADOR}
\renewcommand\str@pageblank{Página dejada intencionadamente en blanco.}
\renewcommand\str@appendix{Apéndice}
\renewcommand\str@edition{Edición}
\renewcommand\str@revision{Revisión}
\renewcommand\str@abstract{Resumen}

\addto\captionsspanish{
\renewcommand{\contentsname}{Índice}
}

\renewcommand\@thmpunct{.---}

\renewcommand\str@theorem{Teorema}
\renewcommand\str@lemma{Lema}
\renewcommand\str@definition{Definición}
\renewcommand\str@scholium{Escolio}
\renewcommand\str@corollary{Corolario}
\renewcommand\str@example{Ejemplo}
\renewcommand\str@proposition{Proposición}
\renewcommand\str@algorithm{Algoritmo}
\else
\RequirePackage[british]{babel}
\setquotestyle{american}
\AtBeginDocument{\def\today{%
\number\day~\ifcase\month\or January\or February\or March\or April\or%
May\or June\or July\or August\or September\or October\or November\or%
December\fi~\number\year%
}}
\fi

%%fakesection Fonts

\iflm
\RequirePackage{amsmath, amsfonts, amssymb}
\else
\RequirePackage[
scaled = 1.02,
largesc, varbb, subscriptcorrection,
frenchmath, upint, nott
]{newtx}
\renewcommand*{\coloneq}{%
\mathrel{\rlap{\raisebox{0.25ex}{$\m@th\cdot$}}%
\raisebox{-0.25ex}{$\m@th\cdot$}}=%
}
\fi

\ifxetex

\newcommand\threshold{16}
\renewcommand\threshold{10}

\AfterPreamble{\hypersetup{
pdfproducer={XeTeX}
}}

\RequirePackage[no-math]{fontspec}

\setsansfont{Inter}[
Extension = .otf,
Ligatures = {TeX},
UprightFont = {*-Regular},
Scale = 0.95,
CharacterVariant = {5,8,10},
UprightFeatures = {
SizeFeatures = {
{Size = -\threshold},
{Size = \threshold-, Font = {*Display-Regular}}
}
},
BoldFont = {*-Bold},
BoldFeatures = {
SizeFeatures = {
{Size = -\threshold},
{Size = \threshold-, Font = {*Display-Bold}}
}
},
ItalicFont = {*-Italic},
ItalicFeatures = {
SizeFeatures= {
{Size = -\threshold},
{Size = \threshold-, Font = {*Display-Italic}}
}
},
BoldItalicFont = {*-BoldItalic},
BoldItalicFeatures = {
SizeFeatures = {
{Size = -\threshold},
{Size = \threshold-, Font = {*Display-BoldItalic}}
}
}
]

\newfontfamily\sflight{Inter}[
Extension = .otf,
Ligatures = {TeX},
UprightFont = {*-Light},
Scale = 0.95,
CharacterVariant = {5,8,10},
UprightFeatures = {
SizeFeatures = {
{Size = -\threshold},
{Size = \threshold-, Font = {*Display-Light}}
}
},
BoldFont = {*-SemiBold},
BoldFeatures = {
SizeFeatures = {
{Size = -\threshold},
{Size = \threshold-, Font = {*Display-SemiBold}}
}
},
ItalicFont = {*-LightItalic},
ItalicFeatures = {
SizeFeatures= {
{Size = -\threshold},
{Size = \threshold-, Font = {*Display-LightItalic}}
}
},
BoldItalicFont = {*-SemiBoldItalic},
BoldItalicFeatures = {
SizeFeatures = {
{Size = -\threshold},
{Size = \threshold-, Font = {*Display-SemiBoldItalic}}
}
}
]

\newcommand\textsfl[1]{{\sflight#1}}

\setmonofont{JuliaMono}[
Extension = .ttf,
Ligatures = {TeX},
UprightFont = {*-Regular},
Scale = 0.85,
BoldFont = {*-Bold},
ItalicFont = {*-RegularItalic},
BoldItalicFont = {*-BoldItalic}
]

\else
\usepackage[scale=1.02,narrow]{inconsolata}
\usepackage[T1]{fontenc}
\newcommand\sflight\sffamily
\newcommand\textsfl[1]{\sffamily#1}
\fi

\newcommand\main@color{black}
\newcommand\maincolor[1]{\renewcommand{\main@color}{#1}}
\newcommand\headingfont{\sffamily\color{\main@color}}
\newcommand\lightheadingfont{\sflight\color{\main@color}}
\newcommand\resetcolor{\color{black}}

\ifsans
\renewcommand\familydefault{\sfdefault}
\fi

\ifserif
\renewcommand\headingfont{}
\renewcommand\lightheadingfont{}
\fi

%%fakesection Commands, variables and environments

\newcommand\load[1]{\subimport{#1/}{0}}
\newcommand\zeroroman[1]{\ifcase\value{#1}\relax0\else\Roman{#1}\fi}
\newcommand{\xfootnote}[2][]{{\renewcommand{\thefootnote}{#1}%
\ifx{#1}\empty\footnotetext{#2}\else\footnote{#2}\fi}}

\renewcommand{\qedsymbol}{$\blacksquare$}
\AtBeginDocument{\renewcommand{\phi}{\varphi}}
\AtBeginDocument{\renewcommand{\epsilon}{\varepsilon}}
\AtBeginDocument{\renewcommand{\emptyset}{\varnothing}}
\AtBeginDocument{\renewcommand{\leq}{\leqslant}}
\AtBeginDocument{\renewcommand{\geq}{\geqslant}}

\newcommand{\op}[1]{\operatorname{#1}}
\newcommand{\tx}[1]{\text{#1}}
\newcommand{\mmid}{\;\middle\vert\;}
\newcommand\showimp[2]{\ref{#1} $\Rightarrow$ \ref{#2}}
\newcommand\showiff[2]{\ref{#1} $\Leftrightarrow$ \ref{#2}}
\newcommand{\anb}[1]{\langle #1 \rangle}
\newcommand{\Anb}[1]{\left\langle #1 \right\rangle}
\newcommand{\norm}[1]{\Vert #1 \Vert}
\newcommand{\Norm}[1]{\left\Vert #1 \right\Vert}
\newcommand{\abs}[1]{\vert #1 \vert}
\newcommand{\Abs}[1]{\left\vert #1 \right\vert}
\newcommand{\floor}[1]{\lfloor #1 \rfloor}
\newcommand{\Floor}[1]{\left\lfloor #1 \right\rfloor}
\newcommand{\ceil}[1]{\lceil #1 \rceil}
\newcommand{\Ceil}[1]{\left\lceil #1 \right\rceil}
\newcommand\limplies\rightarrow
\newcommand\liff\leftrightarrow
\newcommand\qsep{\boldsymbol{.}\; }

\newcommand\lcm{\op{lcm}}
\ifspanish
\renewcommand\gcd{\op{mcd}}
\renewcommand\lcm{\op{mcm}}
\fi

\newenvironment{lrcases} % rcases is already defined in mathtools
{\left\{\begin{aligned}}
{\end{aligned}\right\}}

\date{\today}
\def\@years{\the\year}
\newcommand{\years}[1]{\renewcommand\@years{#1}}

\AfterPreamble{\hypersetup{
pdftitle={\@title},
pdfauthor={\@author},
pdfcreator={LaTeX (SGC \sgc@version)}
}}

\newcommand{\printcopyright}{Copyright \copyright \ \@years, \@author.}
\newcommand{\printlicense}{\str@license}
\newcommand{\copyrightfoot}{\xfootnote{\printcopyright\ \printlicense}}
\newcommand{\setcopyright}[1]{\renewcommand\printcopyright{#1}}
\newcommand{\setlicense}[1]{\renewcommand\str@license{#1}}



%%fakesection Spacing and geometry


%%fakesection Environment formats, colours and pictures

\captionsetup{labelfont=bf, font=small, margin={0.5\parindent}}

\definecolor{sgreen}{RGB}{0, 124, 60}
\definecolor{sred}{RGB}{170, 8, 42}
\definecolor{sblue}{RGB}{0, 106, 182}
\definecolor{scyan}{RGB}{0, 159, 213}
\definecolor{smagenta}{RGB}{198, 0, 118}
\definecolor{syellow}{RGB}{212, 157, 15}

\definecolor{sblack}{RGB}{0,0,0}
\definecolor{ssilver}{RGB}{52, 73, 94}
\definecolor{sgray}{RGB}{198,198,198}

\newcommand\light[1]{#1!13}

\lstset{tabsize = 4,
basicstyle=\ttfamily,
columns=flexible,
    showstringspaces=false,
numbers=left,
commentstyle=\color{darkgray},
keywordstyle=\bfseries,
stringstyle=\color{darkgray}
}

\DeclareRobustCommand{\issue}[1]{
{\headingfont\color{sred}\textbf{ISSUE} $\blacktriangleright$}
#1 {\color{sred}$\blacktriangleleft$}
}
\DeclareRobustCommand{\todo}[1]{
{\headingfont\color{sblue}\textbf{TO-DO} $\blacktriangleright$}
#1 {\color{sblue}$\blacktriangleleft$}
}

\DeclareRobustCommand{\comment}[1]{
{\headingfont\color{smagenta}\textbf{!!} $\blacktriangleright$}
#1 {\color{smagenta}$\blacktriangleleft$}
}

\newcommand\fish{\includegraphics[width=2cm]{fish.pdf}}

%%fakesection Fixes

\renewcommand*\env@matrix[1][*\c@MaxMatrixCols c]{%
\hskip -\arraycolsep
\let\@ifnextchar\new@ifnextchar
\array{#1}}

\let\tempddots\ddots
\renewcommand{\ddots}{\smash{\tempddots}}

\let\originalleft\left
\let\originalright\right
\renewcommand{\left}{\mathopen{}\mathclose\bgroup\originalleft}
\renewcommand{\right}{\aftergroup\egroup\originalright}

%%fakesection Theorem environments
%%fakesection Article and book commands and settings







%%fakesection Titles and covers





%%fakesection Presentations

\renewcommand\maincolor{ssilver}


\setbeamertemplate{navigation symbols}{}

\setbeamercolor{structure}{bg=\maincolor,fg=white}
\setbeamercolor{block title}{bg=\maincolor,fg=white}
\setbeamercolor{block body}{bg=\seccolor,fg=black}
\setbeamercolor{section in toc}{fg=\maincolor}

\setbeamerfont{block title}{shape=\bfseries}
\setbeamerfont{frametitle}{shape=\bfseries}
\setbeamerfont{title}{shape=\bfseries}
\setbeamerfont{section title}{shape=\bfseries}
\setbeamerfont{section name}{size=\large}

\definecolor{presback}{RGB}{242, 249, 250}

\setbeamercolor{normal text}{fg=black,bg=ssilver!10}






\endinput
%%
%% End of file `texmf/tex/sgcpres.cls'.
