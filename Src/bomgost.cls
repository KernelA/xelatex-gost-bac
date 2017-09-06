\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{bomgost}[2017/09/06 Version 0.1.0 XeLaTeX class for bachelor and magister work.]

\LoadClass[14pt, oneside]{extarticle}

\RequirePackage{fontspec}

% Спецификация для различных языков.
\RequirePackage{polyglossia}

\RequirePackage{etoolbox}

% Флаги для принятия решения о подключении пакетов.
\newbool{amspackQ}
\newbool{eqnumwithinsecQ}
\newbool{hyperrefQ}

% Обработка опций.
%---------------------------------------------------------------------------------------

% Опция для переопределения стандартных математических символов.
\DeclareOption{rusmathsym}{%
% Стандартные символы, которые приняты в России. Для них существуют аналогичные команды, но их сложнее запомнить.
\renewcommand{\epsilon}{\ensuremath{\varepsilon}}%
\renewcommand{\phi}{\ensuremath{\varphi}}%
\renewcommand{\kappa}{\ensuremath{\varkappa}}%
\renewcommand{\le}{\ensuremath{\leqslant}}%
\renewcommand{\leq}{\ensuremath{\leqslant}}%
\renewcommand{\ge}{\ensuremath{\geqslant}}%
\renewcommand{\geq}{\ensuremath{\geqslant}}%
\renewcommand{\emptyset}{\varnothing}%
}
\DeclareOption{amspack}{\booltrue{amspackQ}}
\DeclareOption{eqnumwithinsec}{\booltrue{eqnumwithinsecQ}}
\DeclareOption{hyperref}{\booltrue{hyperrefQ}}
% Все остальные опции обрабатываются как опции класса extarticle.
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{extarticle}}
\ProcessOptions\relax

%---------------------------------------------------------------------------------------

\ifbool{amspackQ}{%
% Стандартные пакеты AMS.
\RequirePackage{amsmath, amsfonts, amssymb, amsthm, mathtools}%
}{}

\ifbool{eqnumwithinsecQ}{%
\makeatletter%
\@ifpackageloaded{amsmath}{}{\RequirePackage{amsmath}}%
\makeatother%
% Нумерация формул в пределах section. Команда из пакета amsmath. 
\numberwithin{equation}{section}%
}{}


% Установка основного языка и дополнительного.
\setdefaultlanguage[spelling=modern]{russian}
\setotherlanguage{english}

% Установка шрифтов.
\setmainfont[Mapping=tex-text]{Times New Roman}
\setmonofont[Mapping=tex-text]{Courier New}
\setsansfont[Mapping=tex-text]{Arial}

% Для избежания ошибки о том, что не определён шрифт для кириллических символов.
\newfontfamily\cyrillicfont{Times New Roman}[Script=Cyrillic]
\newfontfamily\cyrillicfonttt{Courier New}[Script=Cyrillic]
\newfontfamily\cyrillicfontsf{Arial}[Script=Cyrillic]

%---------------------------------------------------------------------------------------

% 1.5 отступ между строками.
% Можно поменять на другие значения.
\RequirePackage{setspace}
\onehalfspacing     

% Установка одинаковых отступов и промежутков в тексте.
\frenchspacing

% Узнать, сколько всего страниц в документе.
\RequirePackage{lastpage} 

% Первая строка начинается с отступа.
\RequirePackage{indentfirst}

% Формат страницы.
\RequirePackage[a4paper, headsep = 0.5 \headsep, left=2.5cm, right=2.1cm, top=2cm, bottom=2.1cm]{geometry}

% Для уменьшения отступов в списках. 
\RequirePackage{enumitem}
\setlist{nolistsep}     

% Размер красной строки.
\setlength{\parindent}{1cm}

%---------------------------------------------------------------------------------------
% Счётчики для подсчёта общего количества рисунков и таблиц и др.
\RequirePackage{totcount}

% Счётчики для рисунков и таблиц, приложений, источников в списке литературы.
\newtotcounter{totfigures}
\newtotcounter{tottables}
\newtotcounter{totappendix}
\newtotcounter{totreferences}

% Подсчёт количества ссылок на источники.
\pretocmd{\bibitem}{\stepcounter{totreferences}}{}{}


% Для настройки заголовков таблиц и рисунков.
\RequirePackage[tableposition=top]{caption}

% Настройка вида подписи: [ Рис. номер ]. Нумерация рисунков и таблиц в пределах section. 
\captionsetup{labelsep=space, hypcap=false, figurewithin=section, tablewithin=section} 

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

\newcommand*{\appendixnumtitle}{Приложение}

% Настройка вертикальных и горизонтальных отступов.
\titlespacing*{\section}{0pt}{0pt}{*2}
\titlespacing*{\subsection}{0pt}{0pt}{*2}
\titlespacing*{\subsubsection}{0pt}{0pt}{*2}
\titlespacing*{\subparagraph}{0pt}{0pt}{*2}


% Переопределение номеров section, subsection и т. д.
% subparagraph используется для оформления приложений, поэтому формат номера отличается от других.
\renewcommand{\thesection}{\arabic{section}}
\renewcommand{\thesubsection}{\thesection.\arabic{subsection}}
\renewcommand{\thesubsubsection}{\thesubsection.\arabic{subsubsection}}
\renewcommand{\theparagraph}{\thesubsubsection.\arabic{paragraph}}
\renewcommand{\thesubparagraph}{\appendixnumtitle\ \arabic{totappendix}}

% section, subparagraph начинаались с новой страницы.
\newcommand{\sectionbreak}{\clearpage}
\newcommand{\subparagraphbreak}{\clearpage}


% Настройка форматирования section, subsection, subsubsetcion, subparagraph.
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

\titleformat{\subparagraph}
    {\filleft\normalsize}
    {\thesubparagraph}
    {0pt}{#1}

% Формат для \subparagraph*{...}
\titleformat{name=\subparagraph, numberless}
    {\filcenter\normalsize}
    {}
    {0pt}{#1}



%---------------------------------------------------------------------------------------
% Настройка toc, lot, lof.
% Для настройки toc, lof, lot
% Оглавление рассчитано на 3 уровня: section, subsection, subsubsection.
\RequirePackage{tocloft}

% Число уровней в оглавлении.
\addtocounter{tocdepth}{3}

% Число уровней в нумерации.
\addtocounter{secnumdepth}{3}

\cftsetindents{subparagraph}{\cftsubsecindent}{0pt}

%\renewcommand{\cftsubparapresnum}{\appendixnumtitle\ }
%\renewcommand{\cftsubparaaftersnum}{.}


\setlength{\cftbeforesecskip}{0.25ex}

% Одинаковые отступы.
\setlength{\cftbeforesubsecskip}{\cftbeforesecskip}
\setlength{\cftbeforesubsubsecskip}{\cftbeforesecskip}
\setlength{\cftbeforeparaskip}{\cftbeforesecskip}
\setlength{\cftbeforesubparaskip}{\cftbeforesecskip}

\renewcommand{\cftdotsep}{1}

% Настройка стиля для заголовка оглавления.
\renewcommand{\cfttoctitlefont}{\hfill\normalsize}
\renewcommand{\cftaftertoctitle}{\hfill}

% Добавление ... между section и номером страницы.
\renewcommand{\cftsecleader}{\cftdotfill{\cftdotsep}}

% Стили для: section, subsection, subsubsection, paragraph в оглавлении.
\renewcommand{\cftsecfont}{\normalfont}
\renewcommand{\cftsubsecfont}{\cftsecfont}
\renewcommand{\cftsubsubsecfont}{\cftsecfont}
\renewcommand{\cftparafont}{\cftsecfont}
\renewcommand{\cftsubparafont}{\cftsecfont}

% Стиль для номера страницы напротив section.
\renewcommand{\cftsecpagefont}{\cftsecfont}


%---------------------------------------------------------------------------------------
% Заголовки.
% Переопределение команды \section.
\let\oldsection\section
\RenewDocumentCommand{\section}{s o m}{%
  \IfBooleanTF{#1}
    {% \section*
      \IfNoValueTF{#2}
        {%\section*{...}
            \oldsection*{#3}% Insert \section*{...}
            % Выравнивание записей в toc. Изначально они добавляются с отступом, равным \cftsecnumwidth.
            \addtocontents{toc}{\begingroup\protect\setlength{\protect\cftsecindent}{-\cftsecnumwidth}}%
            \ifbool{hyperrefQ}{\phantomsection}{}%
            \addcontentsline{toc}{section}{\protect\numberline{}#3}%  Добавиить запись в toc 
            \addtocontents{toc}{\endgroup}
        }% 
        {%\section*[...]{...}
            \oldsection*[#2]{#3}
            \addtocontents{toc}{\begingroup\protect\setlength{\protect\cftsecindent}{-\cftsecnumwidth}}%
            \ifbool{hyperrefQ}{\phantomsection}{}%
            \addcontentsline{toc}{section}{\protect\numberline{}#2}% 
            \addtocontents{toc}{\endgroup}
        }% 
      
    }{% \section
      \IfNoValueTF{#2}
        {\oldsection{#3}}% \section{...}
        {\oldsection[#2]{#3}}% \section[..]{...}
    }%
}


%---------------------------------------------------------------------------------------

\newcommand*{\abstracttitle}{РЕФЕРАТ}

\newcommand*{\mainparttitle}{ОСНОВНАЯ ЧАСТЬ}

\newcommand*{\referencestitle}{СПИСОК ИСПОЛЬЗОВАННЫХ ИСТОЧНИКОВ}

\newcommand*{\appendixestitle}{ПРИЛОЖЕНИЯ}

\newcommand*{\appendixtitle}{ПРИЛОЖЕНИЕ}

\newcommand*{\toctitle}{СОДЕРЖАНИЕ}

% Переопределение окружения для реферата.
\renewenvironment{abstract}{\section*{\abstracttitle}}{\clearpage}

% Окружения для вставки рисунков, таблиц, приложений.
\newenvironment{gostfigure}{\stepcounter{totfigures}}{}
\newenvironment{gosttable}{\stepcounter{tottables}}{}
\newenvironment{gostappendix}[1]{%
\stepcounter{totappendix}%
% Ели приложений больше одного, то печатается заголовок с номером приложения.
% Если только одно приложение, то оно идёт сразу без заголовка и название не добавляется в toc.
% Для корректного формирования оглавления требуется минимум 3 запуска компиляции документа.
\ifnum\totvalue{totappendix}>1
\subparagraph{\empty}%
\subparagraph*{#1}%
\fi
}
{\clearpage}


% Команда для печати на отдельной странице и  вертикальным выравниванием по центру страницы.
\newcommand{\Pvcenterline}[1]{%
\begingroup%
\clearpage%
\renewcommand{\sectionbreak}{}%
\vspace*{\fill}%
\section*{#1}%
\vspace{\fill}%
\clearpage%
\endgroup%
}

% Команда для печати заголовка \appendixtitle.
% Если приложений больше одного, то выбирается множественное число заголовка для приложений, иначе единственное.
\newcommand{\printappendixes}{%
\ifnum\totvalue{totappendix}<2%
\Pvcenterline{\appendixtitle}%
\else
\Pvcenterline{\appendixestitle}%
\fi
}


\newcommand{\mainpart}{\Pvcenterline{\mainparttitle}}


% Переопределение названий для оглавления и списка литературы.
\AtBeginDocument{%
% Вычисление длины номера для приложений.
\settowidth{\cftsubparanumwidth}{\appendixnumtitle}%
\addtolength{\cftsubparanumwidth}{3ex}%
\renewcommand{\contentsname}{\toctitle}%
\renewcommand{\refname}{\referencestitle}%
}


% Команды, которые выполняются после \end{thebibliography}
\AfterEndEnvironment{thebibliography}
{%
\clearpage%
}


\renewcommand{\appendix}{\printappendixes}

\AtEndOfClass{%
   % Пакет для гиперссылок в документе.
   % Для избежания различных проблем с корректностью гиперссылок в оглавлении этот пакет следует подключать последним.
   \ifbool{hyperrefQ}{%
        \RequirePackage{hyperref}%    
        \hypersetup{%
            bookmarksnumbered,     % номера section, subsection и т. д. попадали в название закладок в pdf документе. Если эту опцию отключить, то pdf закладки, для приложений, будут с пустым текстом. 
            unicode=true,          % русские буквы в закладках PDF
            linktoc=all,           % ссылки на названиях и номерах страниц в toc
            bookmarksdepth=3       % глубина закладок в pdf файле
        }%
        % Изменение уровня \subparagraph (приложения) в закладках pdf документа. Это нужно для сохранения правильной иерархии закладок в pdf документе.
        \makeatletter%
        \renewcommand\toclevel@subparagraph{2}%
        \makeatother%
    }{}

% Переопределение команды, чтобы номера списка литературы были формата '9.', а не '[9]'.
\makeatletter
\renewcommand\@biblabel[1]{#1.}
\makeatother
}