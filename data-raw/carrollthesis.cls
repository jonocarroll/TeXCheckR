\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{mythesis}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
\ProcessOptions
\LoadClass{report}


\usepackage{fancyhdr}
\usepackage{amsfonts}
\usepackage{amssymb}
\usepackage{amsmath}
\usepackage{latexsym}
\usepackage{fancyhdr}
\usepackage{graphicx}

%\usepackage{bookman}
%\usepackage{times}
\usepackage{helvet}
%\usepackage{pslatex}
%\usepackage{palatino}
%\usepackage{newcent}
%%\usepackage{charter}

\renewcommand{\figurename}{Fig.}
\renewcommand{\tablename}{Table}

% Ross' style.
% distance from top of page to text is 3.7cm similarly from the bottom of the page.
% headsep = 1.0cm
% header height should be 18pt.
% therefore: 1.0cm + 1in. + voffset + topmargin + 18pt = 3.7cm
% set voffset = -1in => topmargin = 3.7cm - 18pt - 1.0cm
%                                 = 2.7cm - 18pt

% defaults
% A4: height 29.7cm × width 21.0cm
% A4: 614pt x 794pt
%verticle controls
\setlength{\voffset}{-1in}           % 1in + voffset from the top
\setlength{\topmargin}{20.67mm}      % 1in + voffset + topmargin to header
\setlength{\headheight}{22pt}        % The size of the header box
\setlength{\headsep}{1.5cm}          % Distance between header and text  %JDC 0.5
\setlength{\textheight}{22.3cm}      % The height of the block of text
%\setlength{\textheight}{24.7cm}      % The height of the block of text
%\setlength{\footskip}{18pt}          % distance from the bottom of the text to the bottom of the footnote
\setlength{\footskip}{1.5cm}          % distance from the bottom of the text to the bottom of the footnote
%
%horizontal controls
%
\setlength{\oddsidemargin}{3.3cm}     % 1in + offsidemargin from the left  
\setlength{\evensidemargin}{2.3cm}    % probably the margin for even pages
\setlength{\marginparsep}{0cm}        % distance from the text to the horozontal margin
\setlength{\marginparwidth}{0cm}      % width of horozontal margin to the right
\setlength{\hoffset}{-1in}            % distance from text to left edge + 1in 
\setlength{\textwidth}{15.5cm}          % The width of the block of text
\setlength{\marginparpush}{0cm}  
%

%
\pagestyle{fancy}
\renewcommand{\chaptermark}[1]{\markboth{\large{#1}}{}}
\renewcommand{\sectionmark}[1]{\markright{\thesection.\ #1}}

\fancypagestyle{mystyle}{%
\fancyhf{} %Clears all header and footer fields, in preparation.
  \fancyhead[RE,LO]{ {\it \sffamily \large \nouppercase{\rightmark}}} %Displays the page number in bold in the header,
  \fancyhead[LE,RO]{ {\it \sffamily \large \nouppercase{\thepage}}}
}

\renewcommand{\chaptermark}[1]{\markboth{\large{#1}}{}}
\renewcommand{\sectionmark}[1]{\markright{\thesection.\ #1}}


\fancypagestyle{chapterpage}{%
  \fancyhf{} %Clears all header and footer fields, in preparation.
  \fancyhead[RE,LO]{{\huge \thechapter}} %Displays the page number in bold in the header,
%  \fancyfoot[CE,CO]{\thepage}
  \fancyhead[LE,RO]{ {\it \sffamily \large \nouppercase{\thepage}}}
%  \fancyhead[RE,LO]{\thepage}
}
  \renewcommand{\chaptermark}[1]{\markboth{\large{\bf #1}}{}}
  \renewcommand{\sectionmark}[1]{\markright{\thesection.\ #1}}

\fancypagestyle{frontpages}{%
  \fancyhf{} %Clears all header and footer fields, in preparation.
  \fancyhead[CE,CO]{\leftmark}
  \fancyfoot[CE,CO]{\thepage}
} %Displays the page number in bold in the header,

\fancypagestyle{originality}{%
\fancyhf{} 
  \fancyfoot[CE,CO]{\thepage}
}%Clears all header and footer fields, in preparation.

\DeclareGraphicsExtensions{.pdf}

\renewcommand{\chapter}{
                    \if@openright\cleardoublepage\else\clearpage\fi
                    \thispagestyle{plain}%
                    \global\@topnum\z@
                    \@afterindentfalse
                    \secdef\@chapter\@schapter}
                    \def\@chapter[#1]#2{\ifnum \c@secnumdepth >\m@ne
                         \refstepcounter{chapter}%
                         \typeout{\@chapapp\space\thechapter.}%
                         \addcontentsline{toc}{chapter}%
                                   {\protect\numberline{\thechapter}#1}%
                    \else
                      \addcontentsline{toc}{chapter}{#1}%
                    \fi
		    \chaptermark{#1}
                    \addtocontents{lof}{\protect\addvspace{10\p@}}%
                    \addtocontents{lot}{\protect\addvspace{10\p@}}%
                    \if@twocolumn
                      \@topnewpage[\@makechapterhead{#2}]%
                    \else
                      \@makechapterhead{#2}%
                      \@afterheading
                    \fi
}


\newenvironment{mydedication}
{\cleardoublepage \thispagestyle{empty} \vspace*{\stretch{1}} \begin{center} \em}
{\end{center} \vspace*{\stretch{3}} \clearpage}

\newcommand \upfront[1]{
  \if@openright\cleardoublepage\else\clearpage\fi
  \thispagestyle{frontpages}%
  \addcontentsline{toc}{chapter}{\numberline{}#1}
  \chaptermark{#1}
}

\newcommand \originality[1]{
  \if@openright\cleardoublepage\else\clearpage\fi
  \thispagestyle{plain}%
  \addcontentsline{toc}{chapter}{\numberline{}#1}
%  \chaptermark{#1}
  \cleardoublepage
}



\def\@makechapterhead#1{%
  \thispagestyle{chapterpage}
%  \vspace*{-1.15cm}
%  \vspace*{50\p@}%
  {\parindent \z@ \raggedright \normalfont
    \ifnum \c@secnumdepth >\m@ne
%        \huge\bfseries \@chapapp\space \thechapter
%        \par\nobreak
%        \vskip 20\p@
    \fi
    \interlinepenalty\@M
    {\sffamily\huge #1}\par\nobreak
    \vskip 40\p@
  }}
\renewcommand\section{\@startsection {section}{1}{\z@}%
                                   {-3.5ex \@plus -1ex \@minus -.2ex}%
                                   {2.3ex \@plus.2ex}%
                                   {\sffamily\LARGE}}
\renewcommand\subsection{\@startsection{subsection}{2}{\z@}%
                                     {-3.25ex\@plus -1ex \@minus -.2ex}%
                                     {1.5ex \@plus .2ex}%
                                    % {\usefont{OT1}{phv}{m}{sl} \Large}}
                                     {\sffamily\Large}}
\renewcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
                                     {-3.25ex\@plus -1ex \@minus -.2ex}%
                                     {1.5ex \@plus .2ex}%
                                     %{\usefont{OT1}{phv}{m}{sl} \large}}
            			    {\it \sffamily\large}}
\renewcommand\paragraph{\@startsection{paragraph}{4}{\z@}%
                                    {3.25ex \@plus1ex \@minus.2ex}%
                                    {-1em}%
                                    {\sffamily\normalsize}}
\renewcommand\subparagraph{\@startsection{subparagraph}{5}{\parindent}%
                                       {3.25ex \@plus1ex \@minus .2ex}%
                                       {-1em}%
                                      {\sffamily\normalsize}}




\endinput
