%%
%% This is file `texmf/tex/sgcart.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% classes.dtx  (with options: `doc,article')
%% 
%%
%% Copyright (C) Samuel González-Castillo (sgc.ink).
%% See LICENSE.md for license and copyright details.
%%

%%fakesection Initial setup and class options

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{sgcart}

\LoadClass[reqno,12pt,twoside]{article}

\newif\ifspanish\spanishfalse
\newif\ifsans\sansfalse
\newif\ifserif\seriffalse
\newif\iflm\lmfalse
\newif\ifphysics\physicsfalse

\DeclareOption{es}{\spanishtrue}
\DeclareOption{sans}{
\renewcommand\familydefault\sfdefault
\newmonotrue
}
\DeclareOption{serif}{\seriftrue}
\DeclareOption{lm}{\lmtrue}
\DeclareOption{sans}{\sanstrue}
\DeclareOption{physics}{\physicstrue}

\newif\ifswap\swaptrue
\newif\ifwithin\withinfalse
\newif\ifzero\zerofalse
\newif\ifafive\afivefalse
\newif\ifspaced\spacedfalse
\newif\ifprint\printfalse
\DeclareOption{noswap}{\swapfalse}
\DeclareOption{within}{\withintrue}
\DeclareOption{zero}{\zerotrue}
\DeclareOption{a5}{\afivetrue}
\DeclareOption{spaced}{\spacedtrue}
\DeclareOption{print}{\printtrue}

\ProcessOptions\relax

%%fakesection Packages and basic settings
\RequirePackage{xcolor, geometry, graphicx, tikz, pgfplots}
\RequirePackage{enumitem, import, centernot, tabularray, xstring, calc}
\RequirePackage{amsthm, thmtools, mathtools, cancel, interval}
\RequirePackage[final]{listings}
\RequirePackage[separate-uncertainty = true]{siunitx}
\usepackage[style=numeric,maxnames=3]{biblatex}

\ifphysics
\RequirePackage{quantikz, braket}
\fi

\usetikzlibrary{arrows.meta, calc, decorations.markings, math}
\usetikzlibrary{intersections, patterns, cd}

\setlength{\arrayrulewidth}{0.75pt} % Table rule thickness.

\RequirePackage{titlesec}
\RequirePackage{fancyhdr, background}
\RequirePackage[pdfusetitle,hidelinks,final,
colorlinks = true, linkcolor = black,
urlcolor = blue, filecolor = black, citecolor = black]{hyperref}

\SetBgOpacity{1}
\SetBgAngle{90}
\SetBgScale{1.5}
\SetBgColor{black}

%%fakesection Language

\newcommand\str@problem{Problem}
\newcommand\str@license{All rights reserved.}
\newcommand\str@draft{DRAFT}
\newcommand\str@pageblank{This page is intentionally left blank.}
\newcommand\str@appendices{Appendices}
\newcommand\str@edition{Edition}
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

\ifspanish
\RequirePackage[spanish]{babel}

\usetikzlibrary{babel}

\decimalpoint
\renewcommand\str@problem{Problema}
\renewcommand\str@license{Todos los derechos reservados.}
\renewcommand\str@draft{BORRADOR}
\renewcommand\str@pageblank{Página dejada intencionadamente en blanco.}
\renewcommand\str@appendices{Apéndices}
\renewcommand\str@edition{Edición}
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

\fi

\RequirePackage[autostyle=true]{csquotes}
\newcommand\cml[1]{\enquote{#1}}

%%fakesection Fonts

\iflm
\RequirePackage{amsmath, amsfonts, amssymb}
\else
\RequirePackage[
scaled = 1.02,
largesc, varbb, subscriptcorrection,
frenchmath, upint
]{newtx}
\fi

\ifxetex

\RequirePackage[no-math]{fontspec}

\setsansfont{Inter}[
Extension = .otf,
Ligatures = {TeX},
UprightFont = {*-Regular},
Scale = 0.95,
CharacterVariant = {5,8,10,2},
UprightFeatures = {
SizeFeatures = {
{Size = -16},
{Size = 16-, Font = {*-Display}}
}
},
BoldFont = {*-Bold},
BoldFeatures = {
SizeFeatures = {
{Size = -16},
{Size = 16-, Font = {*-DisplayBold}}
}
},
ItalicFont = {*-Italic},
ItalicFeatures = {
SizeFeatures= {
{Size = -16},
{Size = 16-, Font = {*-DisplayItalic}}
}
},
BoldItalicFont = {*-BoldItalic},
BoldItalicFeatures = {
SizeFeatures = {
{Size = -16},
{Size = 16-, Font = {*-DisplayBoldItalic}}
}
}
]

\newfontfamily\sflight{Inter}[
Extension = .otf,
Ligatures = {TeX},
UprightFont = {*-Light},
Scale = 0.95,
CharacterVariant = {5,8,10,2},
UprightFeatures = {
SizeFeatures = {
{Size = -16},
{Size = 16-, Font = {*-DisplayLight}}
}
},
BoldFont = {*-SemiBold},
BoldFeatures = {
SizeFeatures = {
{Size = -16},
{Size = 16-, Font = {*-DisplaySemiBold}}
}
},
ItalicFont = {*-LightItalic},
ItalicFeatures = {
SizeFeatures= {
{Size = -16},
{Size = 16-, Font = {*-DisplayLightItalic}}
}
},
BoldItalicFont = {*-SemiBoldItalic},
BoldItalicFeatures = {
SizeFeatures = {
{Size = -16},
{Size = 16-, Font = {*-DisplaySemiBoldItalic}}
}
}
]

\newcommand\textslf[1]{{\sflight#1}}

\else
\usepackage[T1]{fontenc}
\newcommand\sflight\sffamily
\newcommand\textslf[1]{\sffamily#1}
\fi

\newcommand\headingfont{\sffamily}
\newcommand\lightheadingfont{\sflight}

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
\newcommand\showing[2]{\ref{#1} $\Rightarrow$ \ref{#2}}
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
\newcommand\qsep{.\ }

\newenvironment{lrcases} % rcases is already defined in mathtools
{\left\{\begin{aligned}}
{\end{aligned}\right\}}


\def\@subtitle{}
\date{\today}
\def\@years{\the\year}
\newcommand{\subtitle}[1]{\renewcommand\@subtitle{#1}}
\newcommand{\years}[1]{\renewcommand\@years{#1}}

\newcommand{\printcopyright}{Copyright \copyright \ \@years, \@author.}
\newcommand{\printlicense}{\str@license}
\newcommand{\setcopyright}[1]{\renewcommand\printcopyright{#1}}
\newcommand{\setlicense}[1]{\renewcommand\str@license{#1}}


\newcommand\@edition{}
\newcommand\@revision{}
\newcommand\@draft{}

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
(\str@draft\IfStrEq{\@draft}{nonum}{}{\ \@draft})%
}%
}%
}

\newcommand{\shortversion}{\@generateversion{}}
\newcommand{\longversion}{\@generateversion{\str@edition\ }}

\SetBgContents{}

\newcommand{\draft}[1]{
\IfStrEq{#1}{\@empty}{%
\renewcommand\@draft{nonum}%
}{%
\renewcommand\@draft{#1}%
}%
\SetBgContents{\bfseries\texttt{\shortversion}}%
}

\newcommand{\edition}[3][]{%
\IfStrEq{#1}{\@empty}{%
\renewcommand\@edition{#2.#3}%
}{%
\IfStrEq{#1}{today}{%
\renewcommand\@edition{#2.#3 ++ \the\year{}-\the\month{}-\the\day{}}%
}{%
\renewcommand\@edition{#2.#3 ++ #1}%
}%
}%
}

\newcommand\cf[1]{[\S~#1]}


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

\newcommand{\env@sep}{0.6em} % Space between environments.
\newcommand{\label@sep}{0.4em} % Space between labels and text (enums).
\newcommand{\thm@skip}{1.2em} % Space around theorems.
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

\renewenvironment{quote}{\begin{quotenum}\item}{\end{quotenum}}
\renewenvironment{abstract}{
\begin{abstenum}[before=\centerline{\textbf{\str@abstract}}]\item}
{\end{abstenum}}

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

%%fakesection Colours & Boxes

\ifprint
\definecolor{sgreen}{cmyk}{.82,.11,.91,.21}
\definecolor{sred}{cmyk}{.07,.95,.77,.20}
\definecolor{sblue}{cmyk}{.84,.52,0,0}
\definecolor{scyan}{cmyk}{.74,.08,.10,.02}
\definecolor{smagenta}{cmyk}{.09,.96,.06,.05}
\definecolor{syellow}{cmyk}{.03,.31,.98,.10}

\definecolor{sblack}{cmyk}{1,1,1,1}
\definecolor{ssilver}{cmyk}{.83,.62,.35,.23}
\definecolor{sgray}{cmyk}{.1,.1,.1,.1}
\else
\definecolor{sgreen}{RGB}{0, 124, 60}
\definecolor{sred}{RGB}{170, 8, 42}
\definecolor{sblue}{RGB}{0, 106, 182}
\definecolor{scyan}{RGB}{2, 165, 195}
\definecolor{smagenta}{RGB}{198, 0, 118}
\definecolor{syellow}{RGB}{212, 157, 15}

\definecolor{sblack}{RGB}{0,0,0}
\definecolor{ssilver}{RGB}{52, 73, 94}
\definecolor{sgray}{RGB}{198,198,198}
\fi

\lstset{tabsize = 4,
basicstyle=\ttfamily\small,
    showstringspaces=false,
numbers=left,
commentstyle=\color{darkgray},
keywordstyle=\bfseries,
stringstyle=\color{darkgray}
}
\ifafive
\lstset{basicstyle=\ttfamily\footnotesize}
\fi

\DeclareRobustCommand{\issue}[1]{
{\color{sred}\headingfont\textbf{ISSUE} $\blacktriangleright$}
#1 {\color{sred}$\blacktriangleleft$}
}
\DeclareRobustCommand{\todo}[1]{
{\color{sblue}\headingfont\textbf{TO-DO} $\blacktriangleright$}
#1 {\color{sblue}$\blacktriangleleft$}
}

\DeclareRobustCommand{\comment}[1]{
{\color{smagenta}\headingfont\textbf{!!} $\blacktriangleright$}
#1 {\color{smagenta}$\blacktriangleleft$}
}

\newcommand\light[1]{#1!13}

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


\ifzero\setcounter{section}{-1}\fi


\pagestyle{fancy}
\lhead{}\chead{}\rhead{}\cfoot{\small\thepage}\rfoot{}\lfoot{}
\renewcommand{\headrulewidth}{0pt}

\ifprint\else
\let\cleardoublepage\clearpage
\fi

%%fakesection Titles and covers



\titleformat{\section}{\large\bfseries\headingfont}{%
\minwidthbox{\parindentpt}{\thesection \ }}{0pt}{}
\titlespacing*{\section}{0pt}{3em}{1em}[0pt]

\titleformat{\subsection}{\bfseries\headingfont}%
{\minwidthbox{\parindentpt}{\thesubsection \ }}{0pt}{}

\titlespacing*{\subsection}{0pt}{1.2em}{\env@sep}[0pt]




\newcommand\@coverfont{}

\newcommand{\cover}{
\pagenumbering{roman}
\NoBgThispage
\begingroup
\setlength{\parindent}{0pt} \setlength{\parskip}{1em}
\newpage
\thispagestyle{empty}\begingroup\normalfont\lightheadingfont

\ifafive
\vspace*{1.5em} 
\else
\vspace*{5em}
\fi

\begin{center}
{
{\@coverfont\Huge\@title{\ifx\Subtitle\empty{\\[0.8em]}\else{\\[0.3em]}\fi}}
{\ifx\@subtitle\@empty{\vspace{1em}}\else{\LARGE\@subtitle\\[1.3em]}\fi}
} 
{
{
\large
\@author}

\vspace*{\fill}
\ifx\shortversion\@empty{}\else
{\smallskip \@coverfont
\large
\centerline{\longversion}}
\fi
}
\end{center}

\ifafive
\vspace{3em}
\else
\vspace{6em}
\fi
\endgroup
\newpage


\ifprint\newpage\thispagestyle{empty}
\vspace*{\fill}\centerline{\str@pageblank}\vspace{10em}
\vspace*{\fill}\newpage\fi

\endgroup

\ifx\@to\@empty{}\else
\vspace*{\fill}\noindent{\itshape\@to}\vspace*{10em}\vspace*{\fill}
\newpage\fi

\pagenumbering{arabic}
\tableofcontents
}

\renewcommand{\maketitle}{
\begingroup
\lightheadingfont
\setlength{\parskip}{0pt}
\setlength{\parindent}{0pt}
\center
{\LARGE{\@title}
{\ifx\@subtitle\empty\else{\\\Large{\@subtitle}}\fi}\par\bigskip}
{\@author}\\ \@date\vspace{7em}

\ifspaced\else\vspace{0.7em}\fi
\endgroup
}

\endinput
%%
%% End of file `texmf/tex/sgcart.cls'.
