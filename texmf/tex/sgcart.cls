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
\newif\iflegacy\legacyfalse
\newif\ifphysics\physicsfalse
\newif\ifhomework\homeworkfalse

\DeclareOption{es}{\spanishtrue}
\DeclareOption{sans}{
\renewcommand\familydefault\sfdefault
\newmonotrue
}
\DeclareOption{serif}{\seriftrue}
\DeclareOption{lm}{\legacytrue}
\DeclareOption{sans}{\sanstrue}
\DeclareOption{physics}{\physicstrue}
\DeclareOption{homework}{\homeworktrue}

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
\RequirePackage{enumitem, import, centernot, tabularray, xstring}
\RequirePackage{amsthm, thmtools, mathtools, cancel}
\RequirePackage[final]{listings}
\usepackage[T1]{fontenc}
\RequirePackage[separate-uncertainty = true]{siunitx}
\usepackage[style=numeric,maxnames=3]{biblatex}

\ifphysics
\RequirePackage{circuitikz, quantikz, braket}
\fi

\usetikzlibrary{arrows.meta, calc, decorations.markings, math}
\usetikzlibrary{intersections, patterns, cd}

\setlength{\arrayrulewidth}{0.75pt} % for tabular (no longer used)

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

\iflegacy
\RequirePackage{amsmath, amsfonts, amssymb}
\else
\RequirePackage[
scaled = 1.02,
largesc, varbb, subscriptcorrection,
frenchmath, upint
]{newtx}
\fi

\newcommand\headingfont{\sffamily}

\ifsans
\renewcommand\familydefault{\sfdefault}
\fi

\ifserif
\renewcommand\headingfont{}
\fi

%%fakesection Commands, variables and environments

\newcommand\@compare{}
\newcommand\load[1]{\subimport{#1/}{#1}}
\newcommand\zeroroman[1]{\ifcase\value{#1}\relax0\else\Roman{#1}\fi}
\newcommand{\xfootnote}[2][]{{\renewcommand{\thefootnote}{#1}
\ifx{#1}\empty\footnotetext{#2}\else\footnote{#2}\fi}}

\renewcommand{\qedsymbol}{//}
\AtBeginDocument{\renewcommand{\phi}{\varphi}}
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

\newenvironment{lrcases} % rcases already defined in mathtools
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


\newcommand\@release{}
\newcommand\@draft{}

\newcommand\@generateversion[1]{
\IfStrEq{\@release}{\@compare}{
\IfStrEq{\@draft}{\@compare}{
\@compare
}{
\str@draft\IfStrEq{\@draft}{nonum}{}{\ \@draft}
}
}{
\IfStrEq{\@draft}{\@compare}{
#1\@release
}{
#1\@release \
(\str@draft\IfStrEq{\@draft}{nonum}{}{\ \@draft})
}
}
}

\newcommand{\shortversion}{\@generateversion{e}}
\newcommand{\longversion}{\@generateversion{\str@edition\ }}

\SetBgContents{}

\newcommand{\draft}[1]{
\IfStrEq{#1}{\@compare}{
\renewcommand\@draft{nonum}
}{
\renewcommand\@draft{#1}
}
\SetBgContents{\bfseries\texttt{\shortversion}}
}

\newcommand{\release}[2]{
\IfStrEq{#2}{\@compare}{
\renewcommand\@release{#1-\the\year{}/\the\month{}/\the\day{}}
}{
\renewcommand\@release{#1-#2}
}
}


%%fakesection Spacing and geometry

\newcommand{\env@sep}{0.6em} % Space between environments.
\newcommand{\head@sep}{1.2em} % Space around headings.
\newcommand{\label@sep}{0.4em} % Space between labels and text (enums).

\newcommand\abovethm@skip{\env@sep}
\setlength{\partopsep}{0pt plus 0pt minus 0pt}

\ifspaced
\setlength{\parskip}{0.9em}
\setlength{\parindent}{0pt}

\renewcommand\abovethm@skip{\parskip}
\renewcommand{\env@sep}{0pt}
\renewcommand{\head@sep}{0pt}

\lstset{aboveskip = \parskip, belowskip=\parskip, xleftmargin=0pt} 

\setlength{\topsep}{0pt}
\else
\setlength{\parskip}{0pt}
\setlength{\parindent}{3em}

\lstset{aboveskip = \env@sep, belowskip=\env@sep, xleftmargin=0pt}

\setlength{\topsep}{\env@sep}
\fi

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
\geometry{a5paper,footskip=25pt, headsep=15pt, margin=1.9cm}
\SetBgPosition{-1cm, -4.5cm}
\else
\geometry{a4paper,hmargin=3.3cm,top=3.3cm, bottom = 3.3cm}
\SetBgPosition{-1cm, -8cm}
\fi

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
leftmargin=0pt, align = left, labelwidth = 0pt,
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

\newenvironment{axioms}[1][\@compare]{
\ifx#1\@compare
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

\ifafive
\lstset{basicstyle=\ttfamily\footnotesize}
\fi

\ifprint
\definecolor{xgreen}{cmyk}{.82,.11,.91,.21}
\definecolor{xred}{cmyk}{.07,.95,.77,.20}
\definecolor{xblue}{cmyk}{.84,.52,0,0}
\definecolor{xcyan}{cmyk}{.74,.08,.10,.02}
\definecolor{xmagenta}{cmyk}{.09,.96,.06,.05}
\definecolor{xyellow}{cmyk}{.03,.31,.98,.10}

\definecolor{xblack}{cmyk}{1,1,1,1}
\definecolor{xsilver}{cmyk}{.83,.62,.35,.23}
\definecolor{xgray}{cmyk}{.1,.1,.1,.1}
\else
\definecolor{xgreen}{RGB}{0, 124, 60}
\definecolor{xred}{RGB}{170, 8, 42}
\definecolor{xblue}{RGB}{0, 106, 182}
\definecolor{xcyan}{RGB}{2, 165, 195}
\definecolor{xmagenta}{RGB}{198, 0, 118}
\definecolor{xyellow}{RGB}{212, 157, 15}

\definecolor{xblack}{RGB}{0,0,0}
\definecolor{xsilver}{RGB}{52, 73, 94}
\definecolor{xgray}{RGB}{198,198,198}
\fi

\lstset{tabsize = 4,
basicstyle=\ttfamily\small,
commentstyle={\color{xgreen}},
    keywordstyle={\bfseries\color{xred}},
    stringstyle={\color{xblue}},
    showstringspaces=false,
numbers=left,
}

\DeclareRobustCommand{\issue}[1]{
{\color{xred}\headingfont\textbf{ISSUE} $\blacktriangleright$}
#1 {\color{xred}$\blacktriangleleft$}
}
\DeclareRobustCommand{\todo}[1]{
{\color{xblue}\headingfont\textbf{TO-DO} $\blacktriangleright$}
#1 {\color{xblue}$\blacktriangleleft$}
}

\DeclareRobustCommand{\comment}[1]{
{\color{xmagenta}\headingfont\textbf{!!} $\blacktriangleright$}
#1 {\color{xmagenta}$\blacktriangleleft$}
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
headformat=swapnumber,
spaceabove=\abovethm@skip,
spacebelow=\env@sep,
headpunct={\@thmpunct}
]{theorem}
\declaretheoremstyle[
notefont=\bfseries, notebraces={}{},
headfont=\bfseries,
bodyfont=\normalfont,
spaceabove=\abovethm@skip,
spacebelow=\env@sep,
headformat={\NUMBER\NOTE},
headpunct={\@thmpunct}
]{custom}
\else
\declaretheoremstyle[
headfont=\bfseries,
spaceabove=\abovethm@skip,
spacebelow=\env@sep,
bodyfont=\normalfont, 
headpunct={\@thmpunct}
]{theorem}
\declaretheoremstyle[
notefont=\bfseries, notebraces={[}{]},
headfont=\bfseries,
bodyfont=\normalfont,
spaceabove=\abovethm@skip,
spacebelow=\env@sep,
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

\ifhomework 
\RequirePackage{tcolorbox}
\tcbsetforeverylayer{sharp corners,
colback = xgrey,
colframe = xblack,
before skip = \parskip,
after skip = \parskip,
boxrule = 0.1em,
parbox=false
}
\ifspaced\else
\tcbsetforeverylayer{
before skip = \head@space, after skip = \env@space
}
\fi 
\newcounter{pcounter}
\stepcounter{pcounter}
\newenvironment{problem}[1][\Roman{pcounter}]{
\begin{tcolorbox}[boxrule=0pt]\par\noindent
\textbf{\problemstring{\ifx#1\empty\else \ \fi {#1}.---}}
}
{\end{tcolorbox}\stepcounter{pcounter}}
\fi

\pagestyle{fancy}
\lhead{}\chead{}\rhead{}\cfoot{\small\thepage}\rfoot{}\lfoot{}
\renewcommand{\headrulewidth}{0pt}

\ifprint\else
\let\cleardoublepage\clearpage
\fi


%%fakesection Titles and covers



\titleformat{\section}{\large\bfseries\headingfont}{\S\thesection}{.5em}{}
\titlespacing*{\section}{0pt}{3em}{1em}[0pt]

\titleformat{\subsection}{\bfseries\headingfont}{ \S\thesubsection \ }{0pt}{}

\titlespacing*{\subsection}{0pt}{\head@sep}{\env@sep}[0pt]




\newcommand\@coverfont{}

\newcommand{\cover}{
\pagenumbering{roman}
\NoBgThispage
\begingroup
\setlength{\parindent}{0pt} \setlength{\parskip}{1em}
\newpage
\thispagestyle{empty}\begingroup\normalfont\headingfont

\ifafive
\vspace*{1.5em} 
\else
\vspace*{5em}
\fi

\begin{center}
{
{\@coverfont\Huge\@title{\ifx\Subtitle\empty{\\[0.8em]}\else{\\[0.3em]}\fi}}
{\ifx\@subtitle\@compare{\vspace{1em}}\else{\LARGE\@subtitle\\[1.3em]}\fi}
} 
{
{
\large
\@author}

\vspace*{\fill}
\ifx\shortversion\@compare{}\else
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

\ifx\@to\@compare{}\else
\vspace*{\fill}\noindent{\itshape\@to}\vspace*{10em}\vspace*{\fill}
\newpage\fi

\pagenumbering{arabic}
\tableofcontents
}

\renewcommand{\maketitle}{
\begingroup
\headingfont
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
