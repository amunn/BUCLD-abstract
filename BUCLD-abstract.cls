% Copyright 2015-2018 by Alan Munn, Michigan State University
% amunn@msu.edu
% Use at your own risk
% 2017/3/7 Updated biblatex code due to biblatex changes
% 2018/4/16 Added normalbib option
%
%
% This class may be distributed and/or modified under the
% conditions of the LaTeX Project Public License, either version 1.3
% of this license or any later version.
% The latest version of this license is in
%   http://www.latex-project.org/lppl.txt
% and version 1.3 or later is part of all distributions of LaTeX
% version 2005/12/01 or later.
%
% This package has the LPPL maintenance status `maintained'.
% 
% The Current Maintainer of this package is Alan Munn.
%
% This package consists of the following source file:  
% 	bucld-abstract.cls 
% Documentation files:
%   bucld-abstract.tex and bucld-abstract.pdf; 

\ProvidesClass{BUCLD-abstract}[2018/04/16 Basic class for BUCLD abstract. Requires biblatex + biber]
\newif\ifBUCLD@numeric\BUCLD@numericfalse
\newif\ifBUCLD@normalbib\BUCLD@normalbibfalse
\DeclareOption{numeric}{\BUCLD@numerictrue}
\DeclareOption{normalbib}{\BUCLD@normalbibtrue}
\ProcessOptions
\ifBUCLD@numeric
    \PassOptionsToPackage{style=numeric-comp,  minnames=1, maxnames=1, autopunct=true,doi=false, url=false,isbn=false}{biblatex}
    \AtBeginDocument{
    \DeclareFieldFormat[article]{pages}{#1}%
    \renewbibmacro{in:}{%
       \ifentrytype{article}{}{\printtext{\bibstring{in}\intitlepunct}}}
    \ifBUCLD@normalbib
    \else
    \defbibenvironment{bibliography}
      {}
      {}
      {\addspace
       \printtext[labelnumberwidth]{%
         \printfield{labelprefix}%
         \printfield{labelnumber}}%
       \addhighpenspace
       }
    \fi
    }
\else
    \PassOptionsToPackage{style=authoryear-comp,  minnames=1, maxnames=2,uniquename=false,uniquelist=false, firstinits=false, autopunct=true,doi=false, url=false,isbn=false}{biblatex}
    \AtBeginDocument{
    \DeclareFieldFormat[article]{pages}{#1}
    \renewbibmacro{in:}{%
       \ifentrytype{article}{}{\printtext{\bibstring{in}\intitlepunct}}}
    \ifBUCLD@normalbib
    \else
       \xpretobibmacro{author}{\mkbibbold\bgroup}{}{}
       \xapptobibmacro{author}{\egroup}{}{}
       \defbibenvironment{bibliography}
        {}
        {}
        {\addspace}
    \fi}
    
\fi
\LoadClass[12pt,oneside,letterpaper]{article}[2008/05/27]
\RequirePackage{titlesec}
\RequirePackage{xpatch}
\RequirePackage{biblatex}
\RequirePackage{csquotes}
\RequirePackage[margin=1in]{geometry}
\RequirePackage{titling}
% sections
\titleformat{\section}[runin] 
{\normalfont\bfseries} 
{}{0pt}{} 
\titlespacing{\section} 
{0pt}{1ex plus .1ex minus .2ex}{1em}
% titling
\pretitle{\begin{center}\bfseries}
\posttitle{\par\end{center}\vskip-\baselineskip}
\predate{}
\preauthor{}
\postdate{}
\postauthor{}
\date{}
\setlength{\droptitle}{-1in}
\endinput

