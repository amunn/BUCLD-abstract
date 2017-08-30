% Copyright 2015,2017 by Alan Munn, Michigan State University
% amunn@msu.edu
% Use at your own risk
% 2017/3/7 Updated biblatex code due to biblatex changes
%
\ProvidesClass{BUCLD-abstract}[2015/05/13 Basic class for BUCLD abstract. Requires biblatex + biber]
\newif\ifBUCLD@numeric\BUCLD@numericfalse
\DeclareOption{numeric}{\BUCLD@numerictrue}
\ProcessOptions
\ifBUCLD@numeric
    \PassOptionsToPackage{style=numeric-comp,  minnames=1, maxnames=1, autopunct=true,doi=false, url=false,isbn=false}{biblatex}
  
    \AtBeginDocument{
    \DeclareFieldFormat[article]{pages}{#1}%
    \renewbibmacro{in:}{%
       \ifentrytype{article}{}{\printtext{\bibstring{in}\intitlepunct}}}
    \defbibenvironment{bibliography}
      {}
      {}
      {\addspace
       \printtext[labelnumberwidth]{%
         \printfield{labelprefix}%
         \printfield{labelnumber}}%
       \addhighpenspace
       }
    }
\else
    \PassOptionsToPackage{style=authoryear-comp,  minnames=1, maxnames=1,uniquename=false,uniquelist=false, firstinits=true, autopunct=true,doi=false, url=false,isbn=false}{biblatex}
    \AtBeginDocument{
    \DeclareFieldFormat[article]{pages}{#1}
    \renewbibmacro{in:}{%
       \ifentrytype{article}{}{\printtext{\bibstring{in}\intitlepunct}}}
        \xpretobibmacro{author}{\mkbibbold\bgroup}{}{}
        \xapptobibmacro{author}{\egroup}{}{}
    \defbibenvironment{bibliography}
      {}
      {}
      {\addspace}}
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

