% tilics/booklet/tilics.cls

% cft 2019-05-11

\NeedsTeXFormat{LaTeX2e}[1996/06/01]
% \NeedsTeXFormat{LaTeX2e}[1995/12/01]

\ProvidesClass{tilics}
              [2019/05/11 christian.tschudin@unibas.ch]

\usepackage[english]{babel}

% \usepackage[paperheight=4in,paperwidth=6in,margin=0.75in,heightrounded,showframe]{geometry}
% \usepackage[paperheight=4in,paperwidth=6in,margin=1cm,showframe]{geometry}
\usepackage[paperheight=4in,paperwidth=6in,margin=1cm]{geometry}

\usepackage[scaled]{helvet}
\renewcommand\familydefault{\sfdefault} 
\usepackage[T1]{fontenc}

\usepackage{afterpage}
\usepackage[
  % set width and height to a4 width and height + 6mm
  % width=6.2truein, height=4.8truein,
  width=6truein, height=4.8truein,
  % use any combination of these options to add different cut markings
  cam, axes, frame, cross,
  % cam, axes, cross,
  % set the type of TeX renderer you use
  pdftex,
  % center the contents
  center
]{crop}
\usepackage{framed}
\usepackage{graphics}

%\usepackage{setspace}
\usepackage[absolute,overlay]{textpos}
\usepackage{pgffor}
\usepackage{tikz}
\usepackage{xcolor}

\definecolor{UnibasMint}{rgb}{0.647, 0.843, 0.824} % 165, 215, 210
\definecolor{UnibasRed}{rgb}{0.824, 0.02, 0.216}   % 210, 5, 55

% ----------------------------------------------------------------------

\@twosidetrue
\@mparswitchtrue

% \input{size10.clo}

\renewcommand\normalsize{%
   \@setfontsize\normalsize\@xipt{15}%
   \abovedisplayskip 11\p@ \@plus3\p@ \@minus6\p@
   \abovedisplayshortskip \z@ \@plus3\p@
   \belowdisplayshortskip 6.5\p@ \@plus3.5\p@ \@minus3\p@
   \belowdisplayskip \abovedisplayskip
   \let\@listi\@listI}
\normalsize
\newcommand\small{%
   \@setfontsize\small\@ixpt{11}%
   \abovedisplayskip 8.5\p@ \@plus3\p@ \@minus4\p@
   \abovedisplayshortskip \z@ \@plus2\p@
   \belowdisplayshortskip 4\p@ \@plus2\p@ \@minus2\p@
   \def\@listi{\leftmargin\rightmargin
               \topsep 4\p@ \@plus2\p@ \@minus2\p@
               \parsep 2\p@ \@plus\p@ \@minus\p@
               \itemsep \parsep}%
   \belowdisplayskip \abovedisplayskip
}
\newcommand\footnotesize{\@setfontsize\tiny\@viipt\@viipt}
\newcommand\tiny{\@setfontsize\tiny\@vpt\@vipt}
\newcommand\large{\@setfontsize\large\@xiipt{14}}
\newcommand\Large{\@setfontsize\Large\@xivpt{18}}
\newcommand\LARGE{\@setfontsize\LARGE\@xviipt{22}}
\newcommand\huge{\@setfontsize\huge\@xxpt{25}}
\newcommand\Huge{\@setfontsize\Huge\@xxvpt{30}}
\newcommand\HUGE{\@setfontsize\Huge{38}{47}}

\newcommand\thepage{\@arabic\c@page}
\newcommand\labelitemi{\textbullet}

\setcounter{secnumdepth}{1}
\newcounter{topic}
\setcounter{topic}{0}

\newlength{\poffs}
\newlength{\pdelta}
%\setlength{\pdelta}{2.3mm}
\setlength{\pdelta}{1.5mm}

% These commands are used by Pandoc generated latex
\usepackage{hyperref}
\hypersetup{colorlinks=true,linkcolor=blue,urlcolor=blue}

\usepackage[normalem]{ulem}
\usepackage{soul}
\newenvironment{quote}
  {\begin{list}{}{\leftmargin=1cm \rightmargin=1cm} \item[]\fontfamily{ptm}\selectfont}
  {\end{list}}
  \usepackage{longtable}
  \usepackage{booktabs}
\providecommand{\tightlist}{%
  \setlength{\itemsep}{0pt}
  \setlength{\parskip}{0pt}
}
\setlength{\labelsep}{0.2em}

\usepackage{svg}
\newcommand{\inputSvg}[1]{%
  \newpage
  \topskip 0pt  % Remove any space at the top of the page
  \vspace*{\fill}  % Fill the space above the image
  \filename@parse{#1}%
  \noindent\hfill\includesvg[inkscapepath=svg-inkscape/\filename@area,height=2.5in,width=3.5in]{#1}\hfill  % Center horizontally
  \vspace*{\fill}  % Fill the space below the image
}

% Render codeblock
\usepackage{fancyvrb}
\DefineVerbatimEnvironment{Highlighting}{Verbatim}{commandchars=\\\{\}}
\definecolor{shadecolor}{rgb}{0.9, 0.9, 0.9} % Light gray color for shaded backgrounds
\newenvironment{Shaded}{\begin{snugshade}}{\end{snugshade}}

\newcommand{\AlertTok}[1]{\textcolor[rgb]{0.8,0.0,0.0}{#1}}
\newcommand{\AnnotationTok}[1]{\textcolor[rgb]{0.0,0.0,1.0}{\textbf{\textit{#1}}}}
\newcommand{\AttributeTok}[1]{\textcolor[rgb]{0.0,0.5,1.0}{#1}}
\newcommand{\BaseNTok}[1]{\textcolor[rgb]{0.0,0.7,0.0}{#1}}
\newcommand{\BuiltInTok}[1]{\textcolor[rgb]{0.9,0.4,0.0}{#1}}
\newcommand{\CharTok}[1]{\textcolor[rgb]{0.5,0.0,1.0}{#1}}
\newcommand{\CommentTok}[1]{\textcolor[rgb]{0.2,0.8,0.2}{\textbf{\textit{#1}}}}
\newcommand{\CommentVarTok}[1]{\textcolor[rgb]{1.0,0.0,1.0}{#1}}
\newcommand{\ConstantTok}[1]{\textcolor[rgb]{0.7,0.1,0.1}{#1}}
\newcommand{\ControlFlowTok}[1]{\textcolor[rgb]{0.0,0.0,0.7}{\textbf{#1}}}
\newcommand{\DataTypeTok}[1]{\textcolor[rgb]{0.3,0.6,1.0}{\underline{#1}}}
\newcommand{\DecValTok}[1]{\textcolor[rgb]{0.0,0.7,0.0}{#1}}
\newcommand{\DocumentationTok}[1]{\textcolor[rgb]{0.0,0.0,1.0}{\textit{#1}}}
\newcommand{\ErrorTok}[1]{\textcolor[rgb]{1.0,0.0,0.0}{\textbf{#1}}}
\newcommand{\ExtensionTok}[1]{\textcolor[rgb]{0.5,0.5,0.0}{#1}}
\newcommand{\FloatTok}[1]{\textcolor[rgb]{0.0,0.5,0.0}{#1}}
\newcommand{\FunctionTok}[1]{\textcolor[rgb]{1.0,0.5,0.0}{\textbf{#1}}}
\newcommand{\ImportTok}[1]{\textcolor[rgb]{0.9,0.2,0.5}{#1}}
\newcommand{\InformationTok}[1]{\textcolor[rgb]{0.0,0.0,1.0}{\textbf{\textit{#1}}}}
\newcommand{\KeywordTok}[1]{\textcolor[rgb]{0.1,0.1,0.8}{\textbf{#1}}}
\newcommand{\NormalTok}[1]{\textcolor[rgb]{0.3,0.3,0.3}{#1}}
\newcommand{\OperatorTok}[1]{\textcolor[rgb]{0.0,0.0,0.0}{#1}}
\newcommand{\OtherTok}[1]{\textcolor[rgb]{0.9,0.0,0.0}{#1}}
\newcommand{\PreprocessorTok}[1]{\textcolor[rgb]{0.0,0.0,1.0}{\textbf{#1}}}
\newcommand{\RegionMarkerTok}[1]{\textcolor[rgb]{0.5,0.2,0.5}{#1}}
\newcommand{\SpecialCharTok}[1]{\textcolor[rgb]{0.0,0.7,0.0}{#1}}
\newcommand{\SpecialStringTok}[1]{\textcolor[rgb]{0.0,0.5,0.0}{#1}}
\newcommand{\StringTok}[1]{\textcolor[rgb]{0.0,0.0,1.0}{#1}}
\newcommand{\VariableTok}[1]{\textcolor[rgb]{0.5,0.5,0.5}{#1}}
\newcommand{\VerbatimStringTok}[1]{\textcolor[rgb]{0.0,0.5,0.0}{#1}}
\newcommand{\WarningTok}[1]{\textcolor[rgb]{1.0,0.0,0.0}{\textbf{#1}}}



\newcommand{\section}[1]{%
  \newpage\vspace*{\fill}%
  \setlength{\poffs}{1cm}%
  \addtolength{\poffs}{\thetopic\pdelta}%
  %\leftBar%
  % article number to the right
  \begin{textblock*}{5cm}(13.4cm,\poffs) % {block width} (coords) 
    {\tikz \fill [black] (0.1,0.1) rectangle (3,1.2);}%
    \hspace*{-2.7cm}\raisebox{2.5mm}{\textcolor{white}{\Huge\bf \thetopic}}%
    % \hspace*{-2.7cm}\raisebox{2.5mm}{\textcolor{white}{\Huge\bf \tilicsArtNum}}    
  \end{textblock*}%
%
  \topic*{#1}\stepcounter{topic}\small
}

\newcommand\topic{%
  \@startsection{topic}{0}{\z@}%
  %{-3.5ex \@plus -1ex \@minus -.2ex}
  {0ex \@plus -0.1ex \@minus -0.1ex}%
  % {2.3ex \@plus.2ex}%
  {1.5ex \@plus.1ex}%
  {\normalfont\Large\bfseries\aftergroup\@afterindentfalse}}

\newcommand{\rightBar}{%
  \begin{textblock*}{1cm}(14.35cm,-0.2cm) % {block width} (coords) 
    {\tikz \fill [black] (0.1,0.1) rectangle (0.6,10.6);}%
  \end{textblock*}%
}

\newcommand{\leftBar}{%
  \begin{textblock*}{1cm}(-0.4cm,-0.2cm) % {block width} (coords) 
    {\tikz \fill [black] (0.1,0.1) rectangle (0.6,10.6);}%
  \end{textblock*}%
}

\newcommand{\inputFig}[1]{%
  \newpage\topskip 0pt%\rightBar
  \vspace*{\fill}%

  \noindent\hfill\includegraphics{#1}\hfill
  \vspace*{\fill}
}

\newcommand{\inputText}[1]{%
  \input{#1}

  \vspace*{\fill}
  \vspace*{0.2cm}
}

\DeclareOldFontCommand{\tt}{\normalfont\ttfamily}{\mathtt}
\DeclareOldFontCommand{\sf}{\normalfont\sffamily}{\mathsf}
\DeclareOldFontCommand{\bf}{\normalfont\bfseries}{\mathbf}

\def\ps@tilics{%
  %\let\@oddfoot\@empty\let\@oddhead\@empty
  %\let\@evenfoot\@empty\let\@evenhead\@empty
  \newgeometry{left=2cm,right=2cm}
}

\thispagestyle{empty}
\parindent 1em

\newif\ifminibooklet
% eof
