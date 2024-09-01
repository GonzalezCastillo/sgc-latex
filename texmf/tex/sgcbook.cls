%%
%% This is file `texmf/tex/sgcbook.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% classes.dtx  (with options: `doc,book')
%% 
%%
%% Copyright (C) Samuel González-Castillo (sgc.ink).
%% See LICENSE.md for license and copyright details.
%%

%%fakesection Initial setup and class options

\newcommand\sgc@version{v1.0.0-beta}

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{sgcbook}

\LoadClass[reqno,12pt]{book}

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

\newif\ifswap\swaptrue
\newif\ifwithin\withinfalse
\newif\ifzero\zerofalse
\newif\ifafive\afivefalse
\newif\ifspaced\spacedfalse
\newif\ifprint\printfalse
\DeclareOption{noswap}{\swapfalse}
\withintrue
\DeclareOption{zero}{\zerotrue}
\DeclareOption{a5}{\afivetrue}
\DeclareOption{spaced}{\spacedtrue}
\DeclareOption{print}{\printtrue}

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

\RequirePackage{titlesec}
\RequirePackage{fancyhdr, background}
\RequirePackage[hidelinks,final,
colorlinks = true, linkcolor = black,
urlcolor = blue, filecolor = black, citecolor = black]{hyperref}

\SetBgOpacity{1}
\SetBgAngle{90}
\SetBgScale{1.5}
\SetBgColor{black}


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

\newcommand\@authordisplay{}
\renewcommand\author[2][\@empty]{%
\ifx#1\@empty%
\renewcommand{\@author}{#2}\renewcommand{\@authordisplay}{#2}%
\else%
\renewcommand{\@author}{#2}\renewcommand{\@authordisplay}{#1}%
\fi%
}
\def\@subtitle{}
\date{\today}
\def\@years{\the\year}
\newcommand{\subtitle}[1]{\renewcommand\@subtitle{#1}}
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


\newcommand\@edition{}
\newcommand\@draft{}
\newif\ifversion\versionfalse

\newcommand\@generateversion[1]{%
\IfStrEq{\@edition}{\@empty}{%
\IfStrEq{\@draft}{\@empty}{%
\@empty%
}{%
\str@draft\IfStrEq{\@draft}{nonum}{}{\ \@draft}%
}%
}{%
\IfStrEq{\@draft}{\@empty}{%
#1\@edition%
}{%
#1\@edition \ %
--- \str@draft\IfStrEq{\@draft}{nonum}{}{\ \@draft}%
}%
}%
}

\newcommand{\shortversion}{\@generateversion{v}}
\newcommand{\longversion}{\@generateversion{\str@edition\ }}

\SetBgContents{}

\newcommand{\draft}[1]{
\versiontrue%
\IfStrEq{#1}{\@empty}{%
\renewcommand\@draft{nonum}%
}{%
\renewcommand\@draft{#1}%
}%
\SetBgContents{\bfseries\texttt{\shortversion}}%
}

\newcommand\lzero[1]{\ifnum#1<10 0\fi\the#1}

\newcommand{\edition}[3][]{%
\versiontrue%
\IfStrEq{#1}{\@empty}{%
\renewcommand\@edition{#2.#3}%
}{%
\IfStrEq{#1}{today}{%
\renewcommand\@edition{#2.#3 (\str@revision\ %
\the\year{}-\lzero\month-\lzero\day)}%
}{%
\renewcommand\@edition{#2.#3 (\str@revision \ #1)}%
}%
}%
}

\newcommand\cf[1]{[{\small #1}]}
\newcommand\se{\S\,}


%%fakesection Spacing and geometry

\pagestyle{plain}
\ifafive
\let\small\relax
\let\footnotesize\relax
\let\scriptsize\relax
\let\tiny\relax
\let\large\relax
\let\Large\relax
\let\LARGE\relax
\let\huge\relax
\let\Huge\relax
\input{size10.clo}
\geometry{a5paper, footskip=25pt, headsep=15pt, hmargin=1.6cm, vmargin=2cm}
\SetBgPosition{-1cm, -4.5cm}
\else
\geometry{a4paper, hmargin=3.2cm, vmargin=3.3cm}
\SetBgPosition{-1cm, -8cm}
\fi

\newlength\env@sep
\newlength\label@sep
\newlength\thm@skip
\setlength{\env@sep}{0.6em} % Space between environments.
\setlength{\label@sep}{0.4em} % Space between labels and text (enums).
\setlength{\thm@skip}{1.2em} % Space around theorems.
\setlength{\partopsep}{0pt plus 0pt minus 0pt}

\ifspaced
\setlength{\parskip}{0.9em}
\setlength{\parindent}{0pt}

\renewcommand{\thm@skip}{\parskip}
\renewcommand{\env@sep}{0pt}

\lstset{aboveskip = \parskip, belowskip=\parskip, xleftmargin=0pt} 

\setlength{\topsep}{0pt}
\else
\setlength{\parskip}{0pt}
\setlength{\parindent}{3em}

\lstset{aboveskip = \env@sep, belowskip=\env@sep, xleftmargin=0pt}

\setlength{\topsep}{\env@sep}
\fi

\newlength{\numlength}
\newlength{\parindentpt}
\setlength{\parindentpt}{\dimexpr\parindent}
\newcommand\minwidthbox[2]{%
\settowidth\numlength{#2}%
\makebox[\ifdim\numlength>#1{\numlength}\else{#1}\fi][l]{#2}%
}

%%fakesection Lists and related environments

\ifspaced
\setlist{leftmargin=*, itemindent=0pt,
align = right, labelsep = \label@sep,
listparindent=\parindent, parsep=\parskip,
topsep=\env@sep, itemsep=0pt}
\else
\setlist{leftmargin=\parindent, itemindent=0pt,
align = right, labelsep = \label@sep,
listparindent=\parindent, parsep=\parskip,
topsep=\env@sep, itemsep=0pt}
\fi

\setlist[enumerate,1]{label=\arabic*.,ref=\arabic*}
\setlist[enumerate,2]{
label={\textit{\alph*})},ref={\textit{\alph*})},
listparindent={\ifspaced 0pt \else 1.5em \fi },leftmargin=1.5em,
labelsep=0pt,labelwidth=1.5em,align=left}

\newlist{lettered}{enumerate}{1}
\setlist[lettered]{
label={\textit{\alph*})},ref={\textit{\alph*})}} 

\newlist{statements}{enumerate}{1}
\setlist[statements]{
label={(\roman*)},ref=(\roman*)}

\newlist{equivalent}{enumerate}{1}
\setlist[equivalent]{
label=(\alph*),ref=(\alph*)}

\newlist{parlist}{enumerate}{1}
\setlist[parlist]{
label={(\roman*)},ref=(\roman*),
leftmargin=0pt, align = left, labelwidth = *,
itemsep=\env@sep}

\newlist{exercises}{enumerate}{1}
\ifspaced
\setlist[exercises]{
label=\textbf{\arabic*)\ },ref=\arabic*,
leftmargin=0pt, align = left, labelsep = 0pt, labelwidth = 0pt,
itemsep=0pt}
\else
\setlist[exercises]{
label=\textbf{\arabic*) },ref=\arabic*,
leftmargin=0pt, align = left, labelsep =*, labelwidth = 0pt,
itemsep=\env@sep, itemindent=\parindent}
\fi

\newlist{quotenum}{enumerate}{1}
\setlist[quotenum]{
leftmargin=\parindent,
align = left, labelsep = 0pt, labelwidth = 0pt,
topsep=\env@sep, itemsep=0pt, font=\small,label=}

\newlist{abstenum}{enumerate}{1}
\setlist[abstenum]{
leftmargin=\parindent, rightmargin=\parindent,
align = left, labelsep = 0pt, labelwidth = 0pt,
topsep=\env@sep, itemsep=0pt, font=\small,label=}

\renewenvironment{quote}{
\begingroup\small\begin{quotenum}\item
}{
\end{quotenum}\endgroup
}


\newcommand\@deductionref{}
\newenvironment{deduction}[1]{
\renewcommand\@deductionref{#1}
\begin{enumerate}[label=(\arabic*),itemsep=\env@sep]
\label{#1}
}{
\end{enumerate}
}
\newcommand\dstep[3][]{\item \label{\@deductionref #1} [#2] \  $#3$}
\newcommand\dref[1]{\ref{\@deductionref #1}}

\newcounter{axiomnum}
\def\axiomletter{}

\newenvironment{axioms}[1][\@empty]{
\ifx#1\@empty
\begin{enumerate}[
label=(\axiomletter\arabic*),noitemsep,
before=\setcounter{enumi}{\value{axiomnum}},
after=\setcounter{axiomnum}{\value{enumi}}] 
\else
\begin{enumerate}[
label={(#1\arabic*)},noitemsep,
after=\setcounter{axiomnum}{\value{enumi}}
\global\def\axiomletter{#1}]
\fi
}{\end{enumerate}}

%%fakesection Environment formats, colours and pictures

\captionsetup{labelfont=bf, font=small, margin={0.5\parindent}}

\ifprint
\definecolor{sgreen}{cmyk}{.82,.11,.91,.21}
\definecolor{sred}{cmyk}{.07,.95,.77,.20}
\definecolor{sblue}{cmyk}{.84,.52,0,0}
\definecolor{scyan}{cmyk}{1,.05,.15,.05}
\definecolor{smagenta}{cmyk}{.09,.96,.06,.05}
\definecolor{syellow}{cmyk}{.03,.31,.98,.10}

\definecolor{sblack}{cmyk}{1,1,1,1}
\definecolor{ssilver}{cmyk}{.83,.62,.35,.23}
\definecolor{sgray}{cmyk}{.1,.1,.1,.1}
\else
\definecolor{sgreen}{RGB}{0, 124, 60}
\definecolor{sred}{RGB}{170, 8, 42}
\definecolor{sblue}{RGB}{0, 106, 182}
\definecolor{scyan}{RGB}{0, 159, 213}
\definecolor{smagenta}{RGB}{198, 0, 118}
\definecolor{syellow}{RGB}{212, 157, 15}

\definecolor{sblack}{RGB}{0,0,0}
\definecolor{ssilver}{RGB}{52, 73, 94}
\definecolor{sgray}{RGB}{198,198,198}
\fi

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
\ifafive
\lstset{basicstyle=\ttfamily}
\fi

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
\ifswap
\declaretheoremstyle[
headfont=\bfseries,
bodyfont=\normalfont,
spaceabove=\thm@skip,
spacebelow=\thm@skip,
postheadspace=0pt,
headformat={%
\minwidthbox{\parindentpt}{\headingfont\NUMBER\ }\NAME \NOTE%
},
headpunct={\@thmpunct\ \,}
]{theorem}
\declaretheoremstyle[
notefont=\bfseries, notebraces={}{},
headfont=\bfseries,
bodyfont=\normalfont,
spaceabove=\thm@skip,
spacebelow=\thm@skip,
postheadspace=0pt,
headformat={%
\renewcommand\thmt@space{}%
\minwidthbox{\parindentpt}{\headingfont\NUMBER \ }\NOTE%
},
headpunct={\if\NOTE\empty\else{\@thmpunct\ \,}\fi}
]{custom}
\else
\declaretheoremstyle[
headfont=\bfseries,
spaceabove=\thm@skip,
spacebelow=\thm@skip,
bodyfont=\normalfont, 
headpunct={\@thmpunct}
]{theorem}
\declaretheoremstyle[
notefont=\bfseries, notebraces={[}{]},
headfont=\bfseries,
bodyfont=\normalfont,
spaceabove=\thm@skip,
spacebelow=\thm@skip,
headindent=0pt,
headformat=\NUMBER,
headpunct={\@thmpunct}
]{custom}
\fi

\declaretheorem[style=theorem,name=\str@theorem]{theorem}

\newcommand{\nthm}[2]{
\declaretheorem[style=theorem, name={#1}, sibling=theorem]{#2}
}

\nthm{\str@definition}{definition}
\nthm{\str@scholium}{scholium}
\nthm{\str@example}{example}
\nthm{\str@proposition}{proposition}
\nthm{\str@corollary}{corollary}
\nthm{\str@lemma}{lemma}
\nthm{\str@algorithm}{algorithm}

\declaretheorem[style=custom,name=,sibling=theorem]{para}
\declaretheorem[style=custom,name=]{unpara}

\ifwithin
\numberwithin{equation}{section}
\numberwithin{figure}{section}
\numberwithin{table}{section}

\numberwithin{theorem}{section}
\numberwithin{definition}{section}
\numberwithin{example}{section}
\numberwithin{corollary}{section}
\numberwithin{lemma}{section}
\numberwithin{proposition}{section}
\numberwithin{scholium}{section}
\numberwithin{para}{section}
\numberwithin{algorithm}{section}

\numberwithin{unpara}{section}
\renewcommand{\theunpara}{\arabic{unpara}}
\fi
%%fakesection Article and book commands and settings

\newcommand\@code{}
\newcommand\@to{}
\newcommand\dedication[1]{\renewcommand{\@to}{#1}}

\newcommand\unsection[1]{\section*{#1}\addcontentsline{toc}{section}{#1}}
\newcommand\unsubsection[1]{\subsection*{#1}\addcontentsline{toc}{subsection}{#1}}

\subtitle{}


\newcommand\code[1]{\renewcommand{\@code}{#1}}

\renewcommand\thesection{\arabic{section}}
\renewcommand\thechapter{\zeroroman{chapter}}
\renewcommand\thepart{\partname \ \arabic{part}}
\ifzero\setcounter{chapter}{-1}\fi

\newcommand\unchapter[1]{ \chapter*{#1}
\addcontentsline{toc}{chapter}{#1}\markboth{#1}{}
}
\renewcommand\appendix{
\unchapter{\str@appendix}
\stepcounter{chapter}\setcounter{section}{0}
\chlabel{appendix}
\renewcommand\thesection{\Alph{section}}
}

\newcommand\@chlabel{}
\AtBeginDocument{
\let\@classiclabel\label
\let\@classicref\ref
\newcommand\chlabel[1]{%
\renewcommand\@chlabel{#1}\@classiclabel{#1}%
}%
\let\@classicamslabel\label@in@display
\renewcommand{\label}[1]{\@classiclabel{\@chlabel:#1}}
\renewcommand{\label@in@display}[1]{\@classicamslabel{\@chlabel:#1}}
\renewcommand{\ref}[2][\@empty]{%
\IfStrEq{#1}{\@empty}{%
\@classicref{\@chlabel:#2}%
}{%
\IfStrEq{#1}{appendix}{%
\@classicref{appendix:#2}%
}{%
\@classicref{#1}-\@classicref{#1:#2}%
}%
}%
}%
\newcommand{\xref}[2][\@empty]{%
\IfStrEq{#1}{\@empty}{%
\@classicref{\@chlabel:#2}%
}{%
\IfStrEq{#1}{appendix}{%
\@classicref{appendix:#2}%
}{%
\@classicref{#1:#2}%
}%
}%
}%
\newcommand{\chref}[1]{\@classicref{#1}}
\newcommand{\rref}[3][\@empty]{\ref[#1]{#2}\xref[#1]{#2:#3}}
}




\pagestyle{fancy}
\ifprint
\fancyhead[CE]{\scshape\footnotesize\nouppercase{\leftmark}}
\fancyhead[CO]{\scshape\footnotesize\nouppercase{\rightmark}}
\fancyhead[L,R]{}

\fancyfoot[LE]{\small\thepage}
\fancyfoot[RO]{\small\thepage}
\fancyfoot[C,LO,RE]{}

\fancypagestyle{plain}{
\lhead{}\chead{}\rhead{}
\fancyfoot[LE]{\small\thepage}
\fancyfoot[RO]{\small\thepage}
\fancyfoot[C,LO,RE]{}
}
\else
\lhead{}\chead{\scshape\footnotesize\nouppercase{\leftmark}}\rhead{}
\cfoot{\small\thepage}\rfoot{}\lfoot{}

\fancypagestyle{plain}{
\lhead{}\chead{}\rhead{}
\cfoot{\small\thepage}\rfoot{}\lfoot{}
}

\fi

\renewcommand{\headrulewidth}{0pt}

\ifprint\else
\let\cleardoublepage\clearpage
\fi

%%fakesection Titles and covers


\titleformat{\part}[display]{
\setlength{\parskip}{0pt}\setlength{\parindent}{0pt}
\headingfont\bfseries\Huge\centering\medskip\vspace*{\fill}
}{\LARGE\bfseries\partname~\arabic{part}
}{0pt}{}[\vspace{200pt}\vspace*{\fill}]

\titlespacing{\part}{0pt}{0pt}{0pt}[0pt]

\titleformat{\chapter}[display]{%
\setlength{\parskip}{0pt}\setlength{\parindent}{0pt}%
\huge\centering\lightheadingfont%
}{\large\bfseries\chaptername~\thechapter}{0.1em}{}[]

\titlespacing*{\chapter}{0pt}{0pt}{6\thm@skip}[0pt]
\assignpagestyle{\chapter}{plain}


\titleformat{\section}{\large\bfseries\headingfont}{%
\minwidthbox{\parindentpt}{\thesection \ }}{0pt}{}
\titlespacing*{\section}{0pt}{2\thm@skip}{\thm@skip}[0pt]

\titleformat{\subsection}{\bfseries\headingfont}%
{\minwidthbox{\parindentpt}{\thesubsection \ }}{0pt}{}

\titlespacing*{\subsection}{0pt}{2\thm@skip}{\thm@skip}[0pt]



\renewcommand{\maketitle}[1][\@empty]{
\frontmatter

\begingroup
\setlength{\parindent}{0pt}\setlength{\parskip}{0pt}
\thispagestyle{empty}\normalfont%

\begingroup
\headingfont\centering\newpage

\ifafive
\vspace*{1.5em} 
\else
\vspace*{5em}
\fi
{
{\huge\lightheadingfont\bfseries\@title\par}%
\IfStrEq{\@subtitle}{\@empty}{\vspace{3cm}}%
{{\vspace{0.15cm}}\LARGE\@subtitle\\[3.85cm]}%
}
\resetcolor
{
\Large%
\@authordisplay%
}

\vspace*{\fill}
\ifversion{\bfseries\large\centerline{\longversion}}\fi

\ifafive
\vspace{3em}
\else
\vspace{6em}
\fi

\endgroup

\newpage

\thispagestyle{empty}
\begingroup
\headingfont\resetcolor\flushleft
\setlength{\parskip}{1em}
\vspace*{\fill}
\ifx#1\@empty
\textbf{\@title}\\
\textbf{\textit{\@subtitle}}\par
{\longversion}\par
\printcopyright\IfStrEq{\printlicense}{\@empty}{}{\\ \printlicense}\par
\@date\par
\@code\par
\else{#1}\fi
\vspace{3cm}\par
\vspace*{\fill}
\endgroup
\newpage


\IfStrEq{\@to}{\@empty}{}{%
\vspace*{\fill}\noindent{\itshape\@to}\vspace*{10em}\vspace*{\fill}%
}

\newpage 
\endgroup

}


%%fakesection Presentations

\endinput
%%
%% End of file `texmf/tex/sgcbook.cls'.
