\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{bacgost}[2017/06/01 Version 0.0.5. XeLaTeX class for bachelor work.]

\LoadClass[14pt, a4paper, oneside, final]{extarticle}

\RequirePackage{fontspec}

% Спецификация для различных языков.
\RequirePackage{polyglossia}

% Все опции обрабатываются как опции класса article.
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax



% Нужно вынести в документ
% Установка основного языка и дополнительного.
\setdefaultlanguage[spelling=modern]{russian}
\setotherlanguage{english}

% Установка шрифтов
\setromanfont[Mapping=tex-text]{Times New Roman}
\setmonofont[Mapping=tex-text]{Courier New}
\setsansfont[Mapping=tex-text]{Arial}

% Для избежаниия ошибки о том, что не определён шрифт для кириллических символов.
\newfontfamily\cyrillicfonttt{Courier New}[Script=Cyrillic]
\newfontfamily\cyrillicfontsf{Arial}[Script=Cyrillic]

% Русские буквы в формулах.
\RequirePackage{mathtext} 

%---------------------------------------------------------------------------------------

% 1.5 отсуп между строками.
% Можно поменять на другие значения.
\RequirePackage{setspace}
\onehalfspacing		

% Установка одинаковых отсупов в тексте.
\frenchspacing

% Стандартные пакеты AMS.
\RequirePackage{amsmath,amsfonts,amssymb,amsthm, mathtools} 

% Нумерация формул в пределах section. Команда из пакета amsmath.
\numberwithin{equation}{section}

\RequirePackage{etoolbox}

% Узнать, сколько всего страниц в документе.
\RequirePackage{lastpage} 

% Первая строка начинается с отсупа.
\RequirePackage{indentfirst}

% Отступы страницы.
\RequirePackage[a4paper, headsep=0.5 \headsep, left=2.5cm,right=2.1cm,top=2cm,bottom=2.1cm]{geometry}

% Для уменьшения отступов в списках.
\RequirePackage{enumitem}
\setlist{nolistsep}		

% Размер красной строки.
\setlength{\parindent}{1cm}

% Стандартные символы, которые приняты в России. Для них сущетсвует аналогичные команды, но их сложнее запомнить.
% Это можно закомментировать, если удобнее писать эквивалентные команды.
\renewcommand{\epsilon}{\ensuremath{\varepsilon}}
\renewcommand{\phi}{\ensuremath{\varphi}}
\renewcommand{\kappa}{\ensuremath{\varkappa}}
\renewcommand{\le}{\ensuremath{\leqslant}}
\renewcommand{\leq}{\ensuremath{\leqslant}}
\renewcommand{\ge}{\ensuremath{\geqslant}}
\renewcommand{\geq}{\ensuremath{\geqslant}}
\renewcommand{\emptyset}{\varnothing}

%---------------------------------------------------------------------------------------
% Счётчики для автонумерации рисунков и таблиц.
\RequirePackage{totcount}

% Счётчики для рисунков и таблиц, приложений, источников.
\newtotcounter{totfigures}
\newtotcounter{tottables}
\newtotcounter{totappendix}
\newtotcounter{totreferences}

% Подсчёт количества ссылок на источники.
\pretocmd{\bibitem}{\stepcounter{totreferences}}{}{}

% Подписи для рисунков и таблиц.
% Для настройки заголовков таблиц и рисунков.
\RequirePackage[tableposition=top]{caption}

% Настройка вида подписи: Рис. (номер) стоит точка. Нумерация рисунков и таблиц в пределах section. 
\captionsetup{labelsep=period, hypcap=false, figurewithin=section, tablewithin=section } 

% Выравнивание подписей к таблицам справа.
\captionsetup[table]{singlelinecheck=off, justification=raggedleft}

%---------------------------------------------------------------------------------------
% Настройка колонтитулов.
% Номера страницы в правом верхнем углу.
\RequirePackage{fancyhdr}
\pagestyle{fancy}
\fancyhf{}
\fancyhead[R]{\thepage}
\fancyheadoffset{0mm}
\fancyfootoffset{0mm}
\setlength{\headheight}{17pt}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}
\fancypagestyle{plain}{ 
    \fancyhf{}
    \rhead{\thepage}}


%---------------------------------------------------------------------------------------
% Настройка стилей для section, subsection и т. д. в документе.
\RequirePackage[explicit]{titlesec}

% Настройка вертикальных и горизонтальных отступов.
\titlespacing*{\section}{0pt}{0pt}{*2}
\titlespacing*{\subsection}{0pt}{*2}{*2}
\titlespacing*{\subsubsection}{0pt}{*2}{*2}
\titlespacing*{\paragraph}{0pt}{0pt}{*2}
\titlespacing*{\subparagraph}{0pt}{0pt}{*2}


% Переопределение номеров раздаелов, поразделов и т. д.
\renewcommand{\thesection}{\arabic{section}}
\renewcommand{\thesubsection}{\arabic{section}.\arabic{subsection}}
\renewcommand{\thesubsubsection}{\arabic{section}.\arabic{subsection}.\arabic{subsubsection}}
\renewcommand{\theparagraph}{}
\renewcommand{\thesubparagraph}{\arabic{totappendix}}

% section, paragraph и subparagraph начинаались с новой строки.
\newcommand{\sectionbreak}{\clearpage}
\newcommand{\paragraphbreak}{\clearpage}
\newcommand{\subparagraphbreak}{\clearpage}

\newcommand{\appendixtitle}{Приложение}

% Настройка форматирования section, subsection, subsubsetcion, paragraph.
\titleformat{\section}
    {\filcenter\normalsize}
    {\thesection}
    {1ex}{#1}

\titleformat{\subsection}
    {\filcenter\normalsize}
    {\thesubsection}
    {1ex}{#1}
    
\titleformat{\subsubsection}
    {\filcenter\normalsize}
    {\thesubsubsection}
    {1ex}{#1}   
    
\titleformat{\paragraph}
    {\filcenter\normalsize}
    {}
    {1ex}{#1}
    
\titleformat{\subparagraph}
    {\filleft\normalsize}
    {\appendixtitle\ \thesubparagraph}
    {0pt}{}


%---------------------------------------------------------------------------------------
% Настройка toc, lot, lof.
% Для настройки toc, lof, lot
% Оглавление расчитано на 3 уровня.
\RequirePackage{tocloft}

% Число уровней в оглавлении.
\setcounter{tocdepth}{5}

% Число уровней 
\setcounter{secnumdepth}{5}

\cftsetindents{paragraph}{0pt}{0pt}
\cftsetindents{subparagraph}{\cftsubsecindent}{0pt}

\renewcommand{\cftsubparapresnum}{\appendixtitle\ }
%\renewcommand{\cftsubparaaftersnum}{.}

\setlength{\cftsubparanumwidth}{14ex}

\setlength{\cftbeforesecskip}{0.25ex}

% Одинаковые отсупы.
\setlength{\cftbeforesubsecskip}{\cftbeforesecskip}
\setlength{\cftbeforesubsubsecskip}{\cftbeforesecskip}
\setlength{\cftbeforeparaskip}{\cftbeforesecskip}
\setlength{\cftbeforesubparaskip}{\cftbeforesecskip}

% Альтернативный способ для вставки 'Стр.' в оглавление.
%\renewcommand{\cftaftertoctitle}{\mbox{}\hfill \\ \mbox{}\hfill{\footnotesize Стр.}\vspace{-2.5em}}}
\renewcommand{\cftdotsep}{1}

% Настройка стиля для заголовка оглавления.
\renewcommand{\cfttoctitlefont}{\hfill\normalsize}
\renewcommand{\cftaftertoctitle}{\hfill}

% Добавление ... между section и номером страницы.
\renewcommand{\cftsecleader}{\cftdotfill{\cftdotsep}}

% Стили для: section, subsection, subsubsection, paragraph в оглавлении.
\renewcommand{\cftsecfont}{\normalfont}
\renewcommand{\cftsubsecfont}{\normalfont}
\renewcommand{\cftsubsubsecfont}{\normalfont}
\renewcommand{\cftparafont}{\normalfont}
\renewcommand{\cftsubparafont}{\normalfont}

% Стиль для номера страницы напротив section.
\renewcommand{\cftsecpagefont}{\normalfont}


%---------------------------------------------------------------------------------------
% Заголовки.
% \header используется для заголовков, которые добавляются в toc.
% \header* не добавляет содержимое в toc.
\NewDocumentCommand\header{s m}{% s = star, m = mandatory arg
   \IfBooleanTF{#1}{%
      \paragraph*{#2}%
   }{%
      \paragraph{#2}%
   }%
}

%---------------------------------------------------------------------------------------

\newcommand{\abstracttitle}{РЕФЕРАТ}

\newcommand{\lofabtitle}{ОБОЗНАЧЕНИЯ И СОКРАЩЕНИЯ}

\newcommand{\mainparttitle}{ОСНОВНАЯ ЧАСТЬ}

\newcommand{\referencestitle}{СПИСОК ИСПОЛЬЗОВАННЫХ ИСТОЧНИКОВ}

\newcommand{\appendixestitle}{ПРИЛОЖЕНИЯ}

\newcommand{\toctitle}{СОДЕРЖАНИЕ}

% Окружение для реферата.
\renewenvironment{abstract}{\header*{\abstracttitle}}{}

% Окружение для списка сокращений.
\newenvironment{lofab}{\header{\lofabtitle}}{}

% Команда для формирования содержания.
\newcommand{\gosttableofcontents}{\renewcommand{\contentsname}{\toctitle}\newpage\tableofcontents\newpage}

% Окружения для вставки рисунков, таблиц, приложений.
\newenvironment{gostfigure}{\stepcounter{totfigures}}{}
\newenvironment{gosttable}{\stepcounter{tottables}}{}
\newenvironment{gostappendix}[1]{\stepcounter{totappendix}\subparagraph{\empty}\header*{#1}}{\newpage}

% Окружение для библиографии.
\newenvironment{gostbibliography}[1]{\begingroup\renewcommand{\contentsname}{\referencestitle}\renewcommand{\section}[2]{\header{\contentsname}}\begin{thebibliography}{#1}}{\end{thebibliography}\endgroup\newpage}

% Переопределение команды, чтобы номера списка литературы были формата '9.', а не '[9]'.
\makeatletter
\renewcommand\@biblabel[1]{#1.}
\makeatother

% Команда для печати заголовка 'ПРИЛОЖЕНИЯ' (то что определяет команад \appendixestitle) на отдельной странице и с выравнианием по центру.
\newcommand{\appendixes}{{\newpage\renewcommand{\paragraphbreak}{}\vspace*{\fill}%
\begin{center}%
\paragraph{\appendixestitle}%
%\phantomsection\addcontentsline{toc}{paragraph}{ОСНОВНАЯ ЧАСТЬ}%
\end{center}%
\vspace{\fill}%
\newpage%
}
}

% Команда для печати заголовка 'ОСНОВНАЯ ЧАСТЬ' на отдельной странице и с выравнианием по центру.
\newcommand{\mainpart}{{\newpage\renewcommand{\paragraphbreak}{}\vspace*{\fill}%
\begin{center}%
\paragraph{\mainparttitle}%
%\phantomsection\addcontentsline{toc}{paragraph}{ОСНОВНАЯ ЧАСТЬ}%
\end{center}%
\vspace{\fill}%
\newpage%
}
}

% Пакет для гиперссылок в документе.
% Для избежания различных проблем с корректностью гиперссылок в оглавлении этот пакет следует подключать последним.
\usepackage{hyperref}

% Изменения уровня paragraph и subparagrpah в закладках pdf документа.
% Эти команды должны включаться после пакета hyperref.
\makeatletter
\renewcommand{\toclevel@paragraph}{1}
\renewcommand{\toclevel@subparagraph}{2}
\makeatother