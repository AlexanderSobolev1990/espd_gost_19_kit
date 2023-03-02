%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% \file       espd.cls
% \brief      Класс ЕСПД (Единая Система Программной Документации)
% \details    Использованы наработки https://github.com/damoldavskiy/espd
% \date       18.05.22 - создан
% \author     Соболев А.А.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{espd}[2019/08/24 GOST 19]
%\RequirePackage{graphicx}
%\usepackage{polyglossia}
%\usepackage{caption}
\usepackage{calc}
\usepackage{ctable}
\usepackage{longtable} % Для таблиц, длиннее 1 страницы

\usepackage{ccaption}
\usepackage{floatrow}
\usepackage{graphicx}

\usepackage{array}
\usepackage{ifthen}
\usepackage{multirow}
\usepackage{multicol}
\usepackage{ulem} % подчеркивание

\usepackage{stackengine}
\usepackage{amssymb}

%\usepackage{setspace}

%\usepackage{calc}

%\usepackage{setspace}
%%\usepackage{fontspec}
%%\usepackage{cite} % Для цитирования
%\usepackage{amsmath,bm}
%\usepackage{gensymb} % Для знака градуса
%\usepackage{mathtools}
%\usepackage{listings} % Для листингов исходного кода
%\usepackage{hhline} % Для двойной линии отчерка в заголовках таблиц
%\usepackage{color} % Цвет для листингов
%\usepackage{amssymb}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\linespread{1.25}	% Это эквивалент 1,5 интервала в ворде
%\renewcommand{\baselinestretch}{1.25}

\clubpenalty=10000  % Это костыль против
\widowpenalty=10000 % "висячих" строк
\righthyphenmin=200 % Избавляемся
\sloppy	            % от переносов слов

\newcommand{\matr}[1]{\mathbf{#1}}

%\def\note{П~р~и~м~е~ч~а~н~и~е.~}
%\def\notes{П~р~и~м~е~ч~а~н~и~я:\\}

\def\note{П\hspace{1.0mm}р\hspace{1.0mm}и\hspace{1.0mm}м\hspace{1.0mm}е\hspace{1.0mm}ч\hspace{1.0mm}а\hspace{1.0mm}н\hspace{1.0mm}и\hspace{1.0mm}е.~}
\def\notes{П\hspace{1.0mm}р\hspace{1.0mm}и\hspace{1.0mm}м\hspace{1.0mm}е\hspace{1.0mm}ч\hspace{1.0mm}а\hspace{1.0mm}н\hspace{1.0mm}и\hspace{1.0mm}я:\\}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Создает переменную, задается \cmd{val}, возвращается \@cmd
% \var{cmd}
\def\var#1{
  \expandafter
  \def\csname #1\endcsname##1{
    \ifx&##1&
      \ClassError
        {espd}
        {The \@backslashchar#1 cannot be empty}
        {You should specify non-empty #1 by typing \@backslashchar#1{#1 name}}
    \fi
    \expandafter\def\csname @#1\endcsname{##1}}
  \expandafter
  \def\csname @#1\endcsname{
    \ClassError
      {espd}
      {No \@backslashchar#1 given}
      {You should specify #1 by typing \@backslashchar#1{#1 name} in the preamble}}
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Создает переменную, задается \cmd{val}, возвращается \@cmd (по умолчанию - пустая строка)
% \var{cmd}
\def\varempty#1{
  \expandafter
  \def\csname #1\endcsname##1{\expandafter\def\csname @#1\endcsname{##1}}
  \expandafter
  \def\csname @#1\endcsname{}
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Пишет в AUX файл данную пару ключ-значение
% \set{key}{val}
\def\set#1#2{\write\@auxout{\string\newlabel{#1}{#2}}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Получает из AUX файла значение по ключу
% \get{key}
\def\get#1{\csname r@#1\endcsname}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Получает из AUX файла значение по ключу (по умолчанию 0)
% \get{key}
\def\getnum#1{\ifcsname r@#1\endcsname \csname r@#1\endcsname \else 0 \fi}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ПЕРЕМЕННЫЕ И КОНСТАНТЫ

% Размеры шрифта
%\renewcommand{\normalsize}{\fontsize{12pt}{18pt}\selectfont}
%\newcommand{\titlesize}{\fontsize{14pt}{21pt}\selectfont}
%\newcommand{\approvalsize}{\fontsize{17pt}{24pt}\selectfont}
%\newcommand{\sectionsize}{\fontsize{17pt}{18pt}\selectfont}
%\newcommand{\subsectionsize}{\fontsize{14pt}{16pt}\selectfont}
%\newcommand{\attachmentsize}{\fontsize{17pt}{24pt}\selectfont}
%\newcommand{\tabletextsize}{\fontsize{10pt}{15pt}\selectfont}
%\newcommand{\footnotesize}{\fontsize{8pt}{12pt}\selectfont}
%\newcommand{\footnotetextsize}{\fontsize{10pt}{15pt}\selectfont}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% FIXED MY VERSION
\renewcommand{\normalsize}{\fontsize{14pt}{18pt}\selectfont}
\newcommand{\titlesize}{\fontsize{14pt}{21pt}\selectfont}
\newcommand{\approvalsize}{\fontsize{17pt}{24pt}\selectfont}
\newcommand{\sectionsize}{\fontsize{14pt}{18pt}\selectfont}
\newcommand{\lusize}{\fontsize{12pt}{14pt}\selectfont}
\newcommand{\subsectionsize}{\fontsize{14pt}{16pt}\selectfont}
\newcommand{\attachmentsize}{\fontsize{14pt}{18pt}\selectfont}
%\newcommand{\tabletextsize}{\fontsize{10pt}{15pt}\selectfont}
\newcommand{\tabletextsize}{\fontsize{12pt}{15pt}\selectfont}
%\newcommand{\picturetextsize}{\fontsize{12pt}{15pt}\selectfont} % smaller font
\newcommand{\picturetextsize}{\fontsize{14pt}{18pt}\selectfont} % normal
\newcommand{\listingtextsize}{\fontsize{10pt}{10pt}\selectfont}
\newcommand{\footnotesize}{\fontsize{8pt}{12pt}\selectfont}
\newcommand{\footnotetextsize}{\fontsize{10pt}{15pt}\selectfont}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Бумага
\setlength{\paperwidth}{210mm}
\setlength{\paperheight}{297mm}
\setlength{\pdfpagewidth}{\paperwidth}
\setlength{\pdfpageheight}{\paperheight}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Отступы и размеры
\setlength{\hoffset}{-25.4mm} % Отступ равен 1 дюйм (25,4 мм) + значение \hoffset
\setlength{\voffset}{-25.4mm} % Отступ равен 1 дюйм (25,4 мм) + значение \voffset

%\setlength{\oddsidemargin}{20mm}
%\setlength{\textwidth}{180mm}
\setlength{\oddsidemargin}{25mm} % Лучше левое поле задать 25 мм, т.к. подшивают обычно 20 мм
\setlength{\textwidth}{175mm} % Ширина области текста документа

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%\setlength{\topmargin}{7.5mm}
%\setlength{\headheight}{10mm}
%\setlength{\headsep}{7.5mm}
%% Верхнее поле = topmargin + headhight + headsep = 25,0 мм по ГОСТ
%% 297-25-257=15 - нижнее поле
%\setlength{\textheight}{257mm} % Размер текстовой части
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\setlength{\topmargin}{8mm}
\setlength{\headheight}{10mm}
\setlength{\headsep}{12mm}
\newlength{\topfield} % Верхнее поле
\setlength{\topfield}{\topmargin+\headheight+\headsep}
%
\newlength{\bottomfield} % Нижнее поле
\setlength{\bottomfield}{15mm}
%
\setlength{\textheight}{\paperheight-\topfield-\bottomfield} % Размер текстовой части за вычетом верхнего/нижнего полей
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\setlength{\parindent}{10mm} % Абзацный отступ
\setlength{\parskip}{2mm}
%\setlength{\parskip}{3mm}
\setlength{\arrayrulewidth}{0.1pt}
\newlength{\tabmarg}
\setlength{\tabmarg}{2mm}
\setlength{\tabcolsep}{\tabmarg}
\raggedbottom
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Константы
\def\wordagree{Согласовано}
\def\wordapprove{Утверждаю}
\def\wordopenquote{<<}
\def\wordclosequote{>>}
\def\wordyear{г.}
\def\wordapproval{Лист утверждения}
\def\wordapprovalpostfix{-ЛУ}
\def\wordiulpostfix{-УЛ}
\def\wordperformer{Исполнитель}
\def\wordperformers{Исполнители}
\def\wordapproved{Утвержден}
\def\wordsheets{Листов}
\def\wordannotation{Аннотация}
\def\wordterms{Перечень терминов}
\def\wordabbreviations{Перечень сокращений}
\def\wordcontents{Содержание}
\def\wordattachment{Приложение}
\def\wordoriginvnumber{Инв. \textnumero~подл.}
\def\wordsignanddate{\wordsign~и дата}
\def\wordreferencenumber{Справ.~\textnumero}
\def\wordfirstapplication{Перв.~примен.}
\def\wordinstinvnumber{Взам. инв. \textnumero}
\def\wordduplinvnumber{Инв. \textnumero~дубл.}
\def\wordregistration{Лист регистрации изменений}
\def\wordsheetnumber{Номера листов (страниц)}
\def\wordsheetsindocESKD{Всего листов (страниц) в доку-\\менте}
\def\wordsheetsindocESPD{Всего\\листов\\(страниц)\\в докум.}
\def\worddocnumberESKD{Номер\\доку-\\мента}
\def\worddocnumberESPD{\textnumero\\докумен-\\та}
\def\wordincldocanddateESKD{Входящий\\номер\\сопроводи-\\тельного\\ документа~и\\дата}
\def\wordincldocanddateESPD{Входящий\\\textnumero~сопрово-\\дительно-\\го~докум.\\и~дата}
\def\wordsign{Подп.} % fixed было "Подпись"
\def\wordsignfull{Подпись} % fixed было "Подпись"
\def\worddate{Дата}
\def\wordchanges{Изм.}
\def\wordchanged{изменен-\\ных}
\def\wordreplaced{заменен-\\ных}
%\def\wordchanged{измененных}
%\def\wordreplaced{замененных}
\def\wordnew{новых}
\def\wordannulledESKD{аннулиро-\\ванных}
\def\wordannulledESPD{аннули-\\рован-\\ных}
\def\wordimage{Рисунок} % fixed было "Рис."
\def\wordrefimage{рис.~}
\def\wordbibliography{Перечень использованных источников}
\def\wordempty{}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Переменные
\var{iulproductname} % Изделие название
\var{iulcontrolsumm} % Контрольная сумма
\var{iulversion} % Версия для ИУЛ
\var{iulnumoflastchange} % Номер последнего изменения для ИУЛ
\var{iulnote} % Примечание ИУЛ
\var{iuldeveloper} % Разраб.
\var{iulcheck} % Проверил
\var{iulnormocontrol} % Н.контр
\var{iulapproved} % Утв.

\var{customername} % Заказчик
\var{customerrank}

\var{fromcustomername} % От заказчика
\var{fromcustomerrank}

\varempty{chiefconstructorname} % Главный конструктор
\varempty{chiefconstructorrank}

\varempty{headofdepartmentrank} % Начальник подразделения (Научно-тематического центра)
\varempty{headofdepartmentname}

\varempty{deputyofchiefconstructorrank} % Заместитель главного конструктора
\varempty{deputyofchiefconstructorname} 

\varempty{headoflaboratoryrank} % Начальник лаборатории
\varempty{headoflaboratoryname}

\varempty{developerrank} % Разработчик 
\varempty{developername}

\varempty{normocontrollerrank} % Нормоконтроллер
\varempty{normocontrollername}

\var{year}
\var{title}
\var{type}
\var{typecode}
\var{redaction}
\var{documentnumber}
\var{partnumber}
%\var{organizationcode}
%\var{registrationcode}
\var{productcode}

\varempty{authorname} % Исполнитель, если он один
\varempty{authorrank}

\varempty{authori} % Исполнители, если их много
\varempty{authorii}
\varempty{authoriii}
\varempty{authoriv}
\varempty{authorv}
\varempty{authorranki}
\varempty{authorrankii}
\varempty{authorrankiii}
\varempty{authorrankiv}
\varempty{authorrankv}

\varempty{firstapplication}
\varempty{referencenumber}
\varempty{emptyvar}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Согласно ГОСТ 19.101-77
\DeclareOption{exampledoc}{
	\type{Пример оформления документации}
	\typecode{99}
}
\DeclareOption{technicaltask}{
	\type{Техническое задание}
	\typecode{ТЗ}
}
\DeclareOption{specification}{
	\type{Спецификация}
	\typecode{СП}  
}
\DeclareOption{listoriginalkeepers}{
	\type{Ведомость держателей подлинников}
	\typecode{05}
}
\DeclareOption{codelisting}{
	\type{Текст программы}
	\typecode{12}
}
\DeclareOption{programdescription}{
	\type{Описание программы}
	\typecode{13}
}
\DeclareOption{listoperationaldocuments}{
	\type{Ведомость эксплуатационных документов}
	\typecode{20}
}
\DeclareOption{formular}{
	\type{Формуляр}
	\typecode{30}
}
\DeclareOption{usagedescription}{
	\type{Описание применения}
	\typecode{31}
}
\DeclareOption{sysadminmanual}{
	\type{Руководство системного программиста}
	\typecode{32}
}
\DeclareOption{programmermanual}{
  \type{Руководство программиста}
  \typecode{33}
}
\DeclareOption{operatormanual}{
  \type{Руководство оператора}
  \typecode{34}
}
\DeclareOption{languagedescription}{
  \type{Описание языка}
  \typecode{35}
}
\DeclareOption{guideoftechnicalservice}{
	\type{Руководство по техническому обслуживанию}
	\typecode{46}
}
\DeclareOption{testingmethodics}{
  \type{Программа и методика испытаний}
  \typecode{51}
}
\DeclareOption{explanatorynote}{
  \type{Пояснительная записка}
  \typecode{81}  
}
\DeclareOption{iul}{
	\type{Информационно-удостоверяющий лист}
	\typecode{91}  
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Код документа
%\def\fullcode{\@organizationcode.\@registrationcode-\@redaction~\@typecode~\@documentnumber-\@partnumber}
%\def\fullcode{\@organizationcode.\@registrationcode-\@redaction~\@typecode~\@documentnumber}
%\def\shortcode{\@organizationcode.\@registrationcode-\@redaction} % В частности, для спецификации
\def\fullcode{\@productcode-\@redaction~\@typecode~\@documentnumber}
\def\shortcode{\@productcode-\@redaction} % В частности, для спецификации
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Код документа с постфиксом листа утверждения
\def\fullcodeapp{\fullcode\wordapprovalpostfix}
\def\shortcodeapp{\shortcode\wordapprovalpostfix}

% Инициализация параметров
\ProcessOptions*
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% МАКРОСЫ ДЛЯ ВНУТРЕННЕГО ИСПОЛЬЗОВАНИЯ
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Вставляет место для подписи для исполнителя без проверки на пустоту строк
\def\onlyauthorraw#1{
% Без подчерка для подписи
\vskip 1mm\hphantom{placeforsigning}~#1\\\vskip 1mm\wordopenquote\rule{8mm}{0.1pt}\wordclosequote~\rule{3cm}{0.1pt} \@year~\wordyear\\\vskip 5mm

% C подчерком для подписи
%\vskip 1mm\rule{3cm}{0.1pt}~#1\\\vskip 1mm\wordopenquote\rule{8mm}{0.1pt}\wordclosequote~\rule{3cm}{0.1pt} \@year~\wordyear\\\vskip 5mm
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% То же, но делает проверку на пустоту строк
% \onlyauthor{author}
\def\onlyauthor#1{
	\if&#1&\else%
		\onlyauthorraw{#1}
	\fi
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Вставляет должность и место для подписи для исполнителя без проверки на пустоту строк
% \titleauthorraw{author}{authorrank}
\def\titleauthorraw#1#2{
% Без подчерка для подписи
\vskip 1mm #2\\\vskip 1mm\hphantom{placeforsigning}~#1\\\vskip 1mm \wordopenquote\rule{8mm}{0.1pt}\wordclosequote~\rule{3cm}{0.1pt} \@year~\wordyear\\\vskip 5mm

% C подчерком для подписи
%\vskip 1mm #2\\\vskip 1mm\rule{3cm}{0.1pt}~#1\\\vskip 1mm \wordopenquote\rule{8mm}{0.1pt}\wordclosequote~\rule{3cm}{0.1pt} \@year~\wordyear\\\vskip 5mm
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% То же, но делает проверку на пустоту строк
% \titleauthor{author}{authorrank}
\def\titleauthor#1#2{
  \if&#1#2&\else%
    \titleauthorraw{#1}{#2}
  \fi
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Модификация перевода строки для использования \centering и \MakeUppercase
% \protectlinebreak
\def\protectlinebreak{
  \let\defaultlinebreak\\
  \renewcommand{\\}{\protect\defaultlinebreak}
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Вставляет приложение без нумерации
% \writeattachmentnotnum{description}{title}{label}
\def\writeattachmentnonum#1#2#3{
  \refstepcounter{attachment}
  \hfill{\MakeUppercase{\wordattachment}}\vspace{-3mm} \\
  \null\hfill{#1}\vspace{3mm} \\
  {
	\attachmentsize\centering\MakeUppercase{#2}\par
  }
  \addcontentsline{toc}{attachment}{\wordattachment.~#2}
  \ifx&#3&\else
    \label{#3}
  \fi
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Вставляет приложение с нумерацией
% \writeattachmentnum{description}{title}{label}
\def\writeattachmentnum#1#2#3{
  \refstepcounter{attachment}
  \hfill{\MakeUppercase{\wordattachment~\theattachment}}\vspace{-3mm} \\
  \null\hfill{#1}\vspace{3mm} \\
  {
    \attachmentsize\centering\MakeUppercase{#2}\par
    \vspace{3mm}
  }
% Если по ГОСТ-19
  \addcontentsline{toc}{attachment}{\wordattachment~\theattachment.~#2}

% Если как хочет наш нормоконтроль - без точки
%  \addcontentsline{toc}{attachment}{\wordattachment~\theattachment~#2} 
  \ifx&#3&\else
    \label{#3}
  \fi  
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Вставляет приложение
% \attachment{description}{title}[label]
\def\attachment#1#2{
  \@ifnextchar[
    {\attachment@i{#1}{#2}}
    {\attachment@i{#1}{#2}[]}
}

\def\attachment@i#1#2[#3]{
  \newpage
  \ifnum\getnum{lastattachment}=1
    \writeattachmentnonum{#1}{#2}{#3}
  \else
    \writeattachmentnum{#1}{#2}{#3}
  \fi
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Создает ячейку заданных размеров с центрованным текстом внутри
% \def{width}{height}{text}
\def\cell#1#2#3{
  \parbox[c][#2][c]{#1}{\centering #3}%
}

\def\cellleft#1#2#3{
	\parbox[c][#2][c]{#1}{\raggedright #3}%
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Создает ячейку с центрованным текстом внутри с настраиваемой реальной высотой
% \def{width}{height}{realheight}{text}
\def\vcell#1#2#3#4{\parbox[c][#3][b]{#1}{\vbox to #2{\cell{#1}{#2}{#4}\vss}}}

\def\writesection#1{
%  \newpage
  \begin{center}
    \centering\sectionsize\MakeUppercase{#1}
    \vspace{2mm} % Added!
  \end{center}
  \par
}

\def\writesubsection#1{
  \begingroup
  \par
  \parindent -1cm
  \leftskip 2cm
  \interlinepenalty\@M
%  \vspace{4mm}
  \vspace{2mm}
  {\subsectionsize#1}%
  \vspace{2mm}
  \par
  \endgroup
}

\def\writesubsubsection#1{
	\begingroup
	\par
	\parindent -1cm
	\leftskip 2cm
	\interlinepenalty\@M
	%  \vspace{4mm}
	\vspace{2mm}
	{\subsectionsize#1}%
	\vspace{2mm}
	\par
	\endgroup
}

\def\writeparagraph#1{
	\begingroup
	\par
	\parindent -1cm
	\leftskip 2cm
	\interlinepenalty\@M
%    \vspace{4mm}
	\vspace{2mm}
	{\subsectionsize#1}%
	\vspace{2mm}
	\par
	\endgroup
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% СЕКЦИОНИРОВАНИЕ
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Счетчики
\setcounter{secnumdepth}{4}
\newcounter{section}
\newcounter{subsection}[section]

\newcounter{subsubsection}[subsection]
\newcounter{paragraph}[subsubsection]

%\newcounter{paragraph}[subsection]
%\newcounter{subparagraph}[paragraph]
\newcounter{attachment}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Разделы, подразделы, пункты и подпункты
\renewcommand{\thesection}{\arabic{section}}
\renewcommand{\thesubsection}{\arabic{section}.\arabic{subsection}}
%\renewcommand{\theparagraph}{\arabic{section}.\arabic{subsection}.\arabic{paragraph}}
%\renewcommand{\thesubparagraph}{\arabic{section}.\arabic{subsection}.\arabic{paragraph}.\arabic{subparagraph}}
\renewcommand{\thesubsubsection}{\arabic{section}.\arabic{subsection}.\arabic{subsubsection}}
\renewcommand{\theparagraph}{\arabic{section}.\arabic{subsection}.\arabic{subsubsection}.\arabic{paragraph}}
\renewcommand{\theattachment}{\arabic{attachment}}

% Если как по-правильному по ГОСТ 19 нумерация с точками
\newcommand{\numsection}{\thesection.}
\newcommand{\numsubsection}{\thesubsection.}
%\newcommand{\numparagraph}{\theparagraph.}
%\newcommand{\numsubparagraph}{\thesubparagraph.}
%\newcommand{\theparagraphonly}{\arabic{paragraph}.}
%\newcommand{\thesubparagraphonly}{\arabic{paragraph}.\arabic{subparagraph}}
\newcommand{\numsubsubsection}{\thesubsubsection.}
\newcommand{\numparagraph}{\theparagraph.}
\newcommand{\thesubsubsectionhonly}{\arabic{subsubsection}.}
\newcommand{\theparagraphonly}{\arabic{subsubsection}.\arabic{paragraph}}

% Если нумерация без точек
%\newcommand{\numsection}{\thesection}
%\newcommand{\numsubsection}{\thesubsection}
%\newcommand{\numparagraph}{\theparagraph}
%\newcommand{\numsubparagraph}{\thesubparagraph}
%\newcommand{\theparagraphonly}{\arabic{paragraph}}
%\newcommand{\thesubparagraphonly}{\arabic{paragraph}.\arabic{subparagraph}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\section}[1]{
%  \parskip3mm  		
  \ifx&#1&
    \ClassError
      {espd}
      {Empty section title}
      {According to GOST 19.106-78, section title can not be empty}
  \fi
  \refstepcounter{section}
  \writesection{\numsection~#1}  
  \addcontentsline{toc}{section}{\numsection~#1}
}
\newcommand{\subsection}[1]{
  \ifx&#1&
    \ClassError
      {espd}
      {Empty subsection title}
      {According to GOST 19.106-78, subsection title can not be empty}
  \fi
  \refstepcounter{subsection}
  \writesubsection{\numsubsection~#1}
  \addcontentsline{toc}{subsection}{\numsubsection~#1}
}
%\newcommand{\paragraph}[1]{  
%%  \parskip1mm
%  \refstepcounter{paragraph}
%  \writeparagraph{\numparagraph~#1}
%  \ifx&#1&\else
%    \addcontentsline{toc}{paragraph}{\numparagraph~#1}
%  \fi  	
%}
%\newcommand{\subparagraph}[1]{
%  \refstepcounter{subparagraph}
%  \writeparagraph{\numsubparagraph~#1}
%  \ifx&#1&\else
%    \addcontentsline{toc}{subparagraph}{\numsubparagraph~#1}
%  \fi
%}
\newcommand{\subsubsection}[1]{  
	%  \parskip1mm
	\refstepcounter{subsubsection}
	\writeparagraph{\numsubsubsection~#1}
	\ifx&#1&\else
	\addcontentsline{toc}{subsubsection}{\numsubsubsection~#1}
	\fi  	
}
\newcommand{\paragraph}[1]{
	\refstepcounter{paragraph}
	\writeparagraph{\numparagraph~#1}
	\ifx&#1&\else
	\addcontentsline{toc}{paragraph}{\numparagraph~#1}
	\fi
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\attsection}[1]{
	%  \parskip15mm
	\ifx&#1&
	\ClassError
	{espd}
	{Empty attsection title}
	{According to GOST 19.106-78, attsection title can not be empty}
	\fi
	\refstepcounter{section}
	\pdfbookmark[section]{\numsection~#1}{\thepage}
	\writesection{\numsection~#1}  
	%	\addcontentsline{toc}{section}{\numsection~#1}
}
\newcommand{\attsubsection}[1]{
	\ifx&#1&
	\ClassError
	{espd}
	{Empty attsubsection title}
	{According to GOST 19.106-78, attsubsection title can not be empty}
	\fi
	\refstepcounter{subsection}
	\pdfbookmark[subsection]{\numsubsection~#1}{\thepage}
	\writesubsection{\numsubsection~#1}
	%	\addcontentsline{toc}{subsection}{\numsubsection~#1}
}
\newcommand{\attsubsubsection}[1]{
	\ifx&#1&
	\ClassError
	{espd}
	{Empty attsubsubsection title}
	{According to GOST 19.106-78, attsubsubsection title can not be empty}
	\fi
	\refstepcounter{subsubsection}
	\pdfbookmark[subsubsection]{\numsubsubsection~#1}{\thepage}
	\writesubsubsection{\numsubsubsection~#1}
	%	\addcontentsline{toc}{subsection}{\numsubsection~#1}
}
\newcommand{\attparagraph}[1]{
	\ifx&#1&
	\ClassError
	{espd}
	{Empty attparagraph title}
	{According to GOST 19.106-78, attparagraph title can not be empty}
	\fi
	\refstepcounter{paragraph}
	\pdfbookmark[paragraph]{\numparagraph~#1}{\thepage}
	\writeparagraph{\numparagraph~#1}
	%	\addcontentsline{toc}{subsection}{\numsubsection~#1}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Аннотация
\newcommand{\annotation}{\writesection{\wordannotation}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Перечень терминов
\newenvironment{terms}
{
  \writesection{\wordterms}
  \addcontentsline{toc}{attachment}{\wordterms}
}
{
}
\newcommand{\term}[2]{\textbf{#1} -- #2 \par}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Перечень сокращений
\newenvironment{abbreviations}
{
  \writesection{\wordabbreviations}
  \addcontentsline{toc}{attachment}{\wordabbreviations}
}
{
}
\def\abbrcell#1{
	\parbox[c][1mm][c]{16mm}{\raggedright #1}%
}
\newcommand{\abbr}[2]{\abbrcell{#1} -- #2\par}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Штампы в разных вариациях по ГОСТ19
%
% \cellleft - выравнивание будет по левому краю ячейки
%
\newcommand{\stampleftfull}{
	\setlength{\arrayrulewidth}{0.5mm}
	\tabletextsize
	\setlength{\tabcolsep}{0mm}
	\itshape\fontspec{GOST type A Italic} % Italic приходится задавать так
	\begin{tabular}{|p{24.5mm}|p{34.5mm}|p{24.5mm}|p{24.5mm}|p{34.5mm}|p{21.0mm}|p{59.5mm}|p{59.5mm}|}
		\cline{1-5}\cline{7-8}
		\cell{24.5mm}{5mm}{~\wordoriginvnumber} & 
		\cell{34.5mm}{5mm}{~\wordsignanddate} & 
		\cell{24.5mm}{5mm}{~\wordinstinvnumber} & 
		\cell{24.5mm}{5mm}{~\wordduplinvnumber} & 
		\cell{34.5mm}{5mm}{~\wordsignanddate} &
		\cell{21.0mm}{5mm}{} & 
		\cell{59.5mm}{5mm}{~\wordreferencenumber} &
		\cell{59.5mm}{5mm}{~\wordfirstapplication} \\
		\cline{1-5}\cline{7-8}
		\cell{24.5mm}{7mm}{} & & & & & & \cell{59.5mm}{7mm}{~\normalsize\@referencenumber} & \cell{59.5mm}{7mm}{~\normalsize\@firstapplication} \\
		\cline{1-5}\cline{7-8}
	\end{tabular}
	\setlength{\tabcolsep}{\tabmarg}
}
\newcommand{\stampleftshort}{
	\setlength{\arrayrulewidth}{0.5mm}
	\tabletextsize
	\setlength{\tabcolsep}{0mm}
	\itshape\fontspec{GOST type A Italic} % Italic приходится задавать так
	\begin{tabular}{|p{24.5mm}|p{34.5mm}|p{24.5mm}|p{24.5mm}|p{34.5mm}|p{21.5mm} p{60mm} p{60mm}}
		\cline{1-5}
		\cell{24.5mm}{5mm}{~\wordoriginvnumber} & 
		\cell{34.5mm}{5mm}{~\wordsignanddate} & 
		\cell{24.5mm}{5mm}{~\wordinstinvnumber} & 
		\cell{24.5mm}{5mm}{~\wordduplinvnumber} & 
		\cell{34.5mm}{5mm}{~\wordsignanddate} &
		\cell{21.5mm}{5mm}{} & 
		\cell{60mm}{5mm}{} &
		\cell{60mm}{5mm}{} \\
		\cline{1-5}
		\cell{24.5mm}{7mm}{} & & & & & & & \\
		\cline{1-5}
	\end{tabular}
	\setlength{\tabcolsep}{\tabmarg}
}
\newcommand{\stampleftonlyfirstapp}{
	\setlength{\arrayrulewidth}{0.5mm}
	\tabletextsize
	\setlength{\tabcolsep}{0mm}
	\itshape\fontspec{GOST type A Italic} % Italic приходится задавать так
	\begin{tabular}{|p{24.5mm}|p{34.5mm}|p{24.5mm}|p{24.5mm}|p{34.5mm}|p{21.5mm} p{59.5mm}|p{59.5mm}|}
		\cline{1-5}\cline{8-8}
		\cell{24.5mm}{5mm}{~\wordoriginvnumber} & 
		\cell{34.5mm}{5mm}{~\wordsignanddate} & 
		\cell{24.5mm}{5mm}{~\wordinstinvnumber} & 
		\cell{24.5mm}{5mm}{~\wordduplinvnumber} & 
		\cell{34.5mm}{5mm}{~\wordsignanddate} &
		\cell{21.0mm}{5mm}{} & 
		\cell{59.5mm}{5mm}{} &
		\cell{59.5mm}{5mm}{~\wordfirstapplication} \\
		\cline{1-5}\cline{8-8}
		\cell{24.5mm}{7mm}{} & & & & & & & \cell{59.5mm}{7mm}{~\normalsize\@firstapplication} \\
		\cline{1-5}\cline{8-8}
	\end{tabular}
	\setlength{\tabcolsep}{\tabmarg}
}
\newcommand{\stampleftonlyrefnum}{
	\setlength{\arrayrulewidth}{0.5mm}
	\tabletextsize
	\setlength{\tabcolsep}{0mm}
	\itshape\fontspec{GOST type A Italic} % Italic приходится задавать так
	\begin{tabular}{|p{24.5mm}|p{34.5mm}|p{24.5mm}|p{24.5mm}|p{34.5mm}|p{21.0mm}|p{59.5mm}|p{60.0mm}}
		\cline{1-5}\cline{7-7}
		\cell{24.5mm}{5mm}{~\wordoriginvnumber} & 
		\cell{34.5mm}{5mm}{~\wordsignanddate} & 
		\cell{24.5mm}{5mm}{~\wordinstinvnumber} & 
		\cell{24.5mm}{5mm}{~\wordduplinvnumber} & 
		\cell{34.5mm}{5mm}{~\wordsignanddate} &
		\cell{21.0mm}{5mm}{} & 
		\cell{59.5mm}{5mm}{~\wordreferencenumber} &
		\cell{60.0mm}{5mm}{} \\
		\cline{1-5}\cline{7-7}
		\cell{24.5mm}{7mm}{} & & & & & & \cell{59.5mm}{7mm}{~\normalsize\@referencenumber} & \\
		\cline{1-5}\cline{7-7}
	\end{tabular}
	\setlength{\tabcolsep}{\tabmarg}
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Лист регистрации изменений
%\newcommand{\registrationlistold}{
%	\newpage  
%  	% Левый штамп вертикальный
%	\reversemarginpar
%	\setlength{\marginparsep}{17.25mm}
%	\tabletextsize
%	\renewcommand{\baselinestretch}{0.6}\selectfont  
%	\setlength{\tabcolsep}{0mm}	
%	\marginpar{\vskip -2.5cm \hbox{\rotatebox{90}{\stampleftshort}}}
%
%	% Основная таблица листа регистрации изменений
%	\reversemarginpar
%	\setlength{\marginparsep}{5.2mm}
%	\marginpar{
%		\vskip -1.5mm
%		\tabletextsize
%		\fontspec{GOST type A Bold Italic}
%		\renewcommand{\baselinestretch}{0.6}\selectfont  
%		\setlength{\tabcolsep}{0mm}				
%		\reglisttable
%		%\setlength{\tabcolsep}{\tabmarg}
%		} 
%	% Миништамп внизу
%	\marginpar{
%	    \vskip -0.4mm
%		\tabletextsize
%		\fontspec{GOST type A Bold Italic}
%		\renewcommand{\baselinestretch}{0.6}\selectfont  
%		\setlength{\tabcolsep}{0mm}				
%		\regliststamp
%	}     
%	\setlength{\tabcolsep}{\tabmarg}
%}
%
%\newcommand{\reglisttable}{ 
%\setlength{\arrayrulewidth}{0.5mm} 
%\hbox{%  	
%	\begin{tabular}{|c|c|c|c|c|c|c|c|c|c|}
%		\hline
%%		\multicolumn{10}{|c|}{\cell{184.5mm}{9.5mm}{\approvalsize \wordregistration}} \\
%		\multicolumn{10}{|c|}{\cell{184.5mm}{9.5mm}{\wordregistration}} \\
%		\hline
%		\multicolumn{5}{|c|}{\cell{87.5mm}{5.5mm}{\wordsheetnumber}} & & & & & \\
%		\cline{1-5}
%		\cell{7.5mm}{18.5mm}{\wordchanges} & \cell{19.5mm}{18.5mm}{\wordchanged} & \cell{19.5mm}{18.5mm}{\wordreplaced} & \cell{19.5mm}{18.5mm}{\wordnew} & \cell{19.5mm}{18.5mm}{\wordannulled} & \vcell{19.5mm}{24.5mm}{18.5mm}{\wordsheetsindocESKD} & \vcell{24.5mm}{24.5mm}{18.5mm}{\worddocnumberESKD} & \vcell{24.5mm}{24.5mm}{18.5mm}{\wordincldocanddateESKD} & \vcell{14.5mm}{24.5mm}{18.5mm}{\wordsign} & \vcell{11.5mm}{24.5mm}{18.5mm}{\worddate} \\
%		\hline
%		\multicolumn{10}{c}{}\\[-3.7mm]
%		\hline
%		\cell{7.5mm}{7.5mm}{} & & & & & & & & & \\ %1
%		\hline
%		\cell{7.5mm}{7.5mm}{} & & & & & & & & & \\ %2
%		\hline
%		\cell{7.5mm}{7.5mm}{} & & & & & & & & & \\ %3
%		\hline
%		\cell{7.5mm}{7.5mm}{} & & & & & & & & & \\ %4
%		\hline
%		\cell{7.5mm}{7.5mm}{} & & & & & & & & & \\ %5
%		\hline
%		\cell{7.5mm}{7.5mm}{} & & & & & & & & & \\ %6
%		\hline
%		\cell{7.5mm}{7.5mm}{} & & & & & & & & & \\ %7
%		\hline
%		\cell{7.5mm}{7.5mm}{} & & & & & & & & & \\ %8
%		\hline
%		\cell{7.5mm}{7.5mm}{} & & & & & & & & & \\ %9
%		\hline
%		\cell{7.5mm}{7.5mm}{} & & & & & & & & & \\ %10
%		\hline
%		\cell{7.5mm}{7.5mm}{} & & & & & & & & & \\ %11
%		\hline
%		\cell{7.5mm}{7.5mm}{} & & & & & & & & & \\ %12
%		\hline
%		\cell{7.5mm}{7.5mm}{} & & & & & & & & & \\ %13
%		\hline
%		\cell{7.5mm}{7.5mm}{} & & & & & & & & & \\ %14
%		\hline
%		\cell{7.5mm}{7.5mm}{} & & & & & & & & & \\ %15
%		\hline
%		\cell{7.5mm}{7.5mm}{} & & & & & & & & & \\ %16
%		\hline
%		\cell{7.5mm}{7.5mm}{} & & & & & & & & & \\ %17
%		\hline
%		\cell{7.5mm}{7.5mm}{} & & & & & & & & & \\ %18
%		\hline
%		\cell{7.5mm}{7.5mm}{} & & & & & & & & & \\ %19
%		\hline
%		\cell{7.5mm}{7.5mm}{} & & & & & & & & & \\ %20
%		\hline
%		\cell{7.5mm}{7.5mm}{} & & & & & & & & & \\ %21
%		\hline
%		\cell{7.5mm}{7.5mm}{} & & & & & & & & & \\ %22
%		\hline
%		\cell{7.5mm}{7.5mm}{} & & & & & & & & & \\ %23
%		\hline
%		\cell{7.5mm}{7.5mm}{} & & & & & & & & & \\ %24
%		\hline
%		\cell{7.5mm}{7.5mm}{} & & & & & & & & & \\ %25
%		\hline
%		\cell{7.5mm}{7.5mm}{} & & & & & & & & & \\ %26
%		\hline
%		\cell{7.5mm}{7.5mm}{} & & & & & & & & & \\ %27
%		\hline
%	\end{tabular}
%}
%}
%
%\newcommand{\regliststamp}{  
%	\setlength{\arrayrulewidth}{0.5mm} 
%	\hbox{%  	
%	\begin{tabular}{|c|c|c|c|c|c|c|}
%		\hline
%		\cell{6.5mm}{4.5mm}{} & \cell{9.5mm}{4.5mm}{} & \cell{22.5mm}{4.5mm}{} & \cell{14.5mm}{4.5mm}{} & \cell{9.5mm}{4.5mm}{} & & \cell{9.5mm}{4.5mm}{Лист} \\
%		\cline{1-5}\cline{7-7}
%		
%		\cell{6.5mm}{4.5mm}{} & \cell{9.5mm}{4.5mm}{} & \cell{22.5mm}{4.5mm}{} & \cell{14.5mm}{4.5mm}{} & \cell{9.5mm}{4.5mm}{} & \cell{109.5mm}{4.5mm}{\approvalsize{\fullcode}} & \\
%		\cline{1-5}
%		
%		\cell{6.5mm}{4.5mm}{Изм.} & \cell{9.5mm}{4.5mm}{Лист} & \cell{22.5mm}{4.5mm}{\textnumero~докум.} & \cell{14.5mm}{4.5mm}{Подп.} & \cell{9.5mm}{4.5mm}{Дата} & & \vcell{9.5mm}{8.5mm}{4.5mm}{\getnum{lastpage}}\\		
%		\hline
%	\end{tabular}
%	}	
%}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Лист регистрации изменений по ЕСКД ГОСТ 2.503-2013 
\newcommand{\reglisttableESKD}{ 
	\setlength{\arrayrulewidth}{0.5mm} 
	\vspace{-23.5mm} % Сдвижка вверх потому что сделали поле верхнее 30 мм вместо 25
%	\fontspec{GOST type A Bold Italic} % Если ГОСТ ом
	\hbox{% 
		\begin{tabular}{|c|}
			\hline
			\cell{184.5mm}{21.5mm}{\cell{184.5mm}{21.5mm}{}} \\ %1
		\end{tabular}
	}
	\vspace{-1mm}
	\hbox{%  	
		\begin{tabular}{|c|c|c|c|c|c|c|c|c|c|}
			\hline
			\multicolumn{10}{|c|}{\cell{184.5mm}{9.5mm}{\titlesize \wordregistration}} \\
			\hline
			& \multicolumn{4}{c|}{\cell{73.5mm}{5.5mm}{\wordsheetnumber}} & & & & & \\
			\cline{2-5}
			\vcell{9.5mm}{24.5mm}{18.5mm}{\wordchanges} &
			\cell{18.5mm}{18.5mm}{\wordchanged} & \cell{18.5mm}{18.5mm}{\wordreplaced} & \cell{18.5mm}{18.5mm}{\wordnew} & \cell{18.5mm}{18.5mm}{\wordannulledESKD} & \vcell{18.5mm}{24.5mm}{18.5mm}{\wordsheetsindocESKD} & \vcell{18.5mm}{24.5mm}{18.5mm}{\worddocnumberESKD} & \vcell{24.5mm}{24.5mm}{18.5mm}{\wordincldocanddateESKD} & \vcell{17.5mm}{24.5mm}{18.5mm}{\wordsignfull} & \vcell{17.5mm}{24.5mm}{18.5mm}{\worddate} \\
			\hline
			\multicolumn{10}{c}{}\\[-3.7mm]
%			\hline % горизонтальная одинарная линия
			\hhline{|=|=|=|=|=|=|=|=|=|=|} % горизонтальная двойная линия
			\cell{7.5mm}{7.5mm}{} & & & & & & & & & \\ %1
			\hline
			\cell{7.5mm}{7.5mm}{} & & & & & & & & & \\ %2
			\hline
			\cell{7.5mm}{7.5mm}{} & & & & & & & & & \\ %3
			\hline
			\cell{7.5mm}{7.5mm}{} & & & & & & & & & \\ %4
			\hline
			\cell{7.5mm}{7.5mm}{} & & & & & & & & & \\ %5
			\hline
			\cell{7.5mm}{7.5mm}{} & & & & & & & & & \\ %6
			\hline
			\cell{7.5mm}{7.5mm}{} & & & & & & & & & \\ %7
			\hline
			\cell{7.5mm}{7.5mm}{} & & & & & & & & & \\ %8
			\hline
			\cell{7.5mm}{7.5mm}{} & & & & & & & & & \\ %9
			\hline
			\cell{7.5mm}{7.5mm}{} & & & & & & & & & \\ %10
			\hline
			\cell{7.5mm}{7.5mm}{} & & & & & & & & & \\ %11
			\hline
			\cell{7.5mm}{7.5mm}{} & & & & & & & & & \\ %12
			\hline
			\cell{7.5mm}{7.5mm}{} & & & & & & & & & \\ %13
			\hline
			\cell{7.5mm}{7.5mm}{} & & & & & & & & & \\ %14
			\hline
			\cell{7.5mm}{7.5mm}{} & & & & & & & & & \\ %15
			\hline
			\cell{7.5mm}{7.5mm}{} & & & & & & & & & \\ %16
			\hline
			\cell{7.5mm}{7.5mm}{} & & & & & & & & & \\ %17
			\hline
			\cell{7.5mm}{7.5mm}{} & & & & & & & & & \\ %18
			\hline
			\cell{7.5mm}{7.5mm}{} & & & & & & & & & \\ %19
			\hline
			\cell{7.5mm}{7.5mm}{} & & & & & & & & & \\ %20
			\hline
			\cell{7.5mm}{7.5mm}{} & & & & & & & & & \\ %21
			\hline
			\cell{7.5mm}{7.5mm}{} & & & & & & & & & \\ %22
			\hline
			\cell{7.5mm}{7.5mm}{} & & & & & & & & & \\ %23
			\hline
			\cell{7.5mm}{7.5mm}{} & & & & & & & & & \\ %24
			\hline
			\cell{7.5mm}{7.5mm}{} & & & & & & & & & \\ %25
			\hline
			\cell{7.5mm}{7.5mm}{} & & & & & & & & & \\ %26
			\hline
			\cell{7.5mm}{7.5mm}{} & & & & & & & & & \\ %27
			\hline
%			\cell{7.5mm}{7.5mm}{} & & & & & & & & & \\ %28
%			\hline
%			\cell{7.5mm}{7.5mm}{} & & & & & & & & & \\ %29
%			\hline
		\end{tabular}
	}
	\vspace{-1mm}
	\hbox{%	
		\begin{tabular}{|c|c|c|c|c|c|c|}
			\hline
			\cell{6.5mm}{4.5mm}{} & \cell{9.5mm}{4.5mm}{} & \cell{22.5mm}{4.5mm}{} & \cell{14.5mm}{4.5mm}{} & \cell{9.5mm}{4.5mm}{} & & \cell{9.5mm}{4.5mm}{Лист} \\
			\cline{1-5}\cline{7-7}
			
			\cell{6.5mm}{4.5mm}{} & \cell{9.5mm}{4.5mm}{} & \cell{22.5mm}{4.5mm}{} & \cell{14.5mm}{4.5mm}{} & \cell{9.5mm}{4.5mm}{} & \cell{109.5mm}{4.5mm}{\approvalsize{\fullcode}} & \\
			\cline{1-5}
			
			\cell{6.5mm}{4.5mm}{Изм.} & \cell{9.5mm}{4.5mm}{Лист} & \cell{22.5mm}{4.5mm}{\textnumero~докум.} & \cell{14.5mm}{4.5mm}{\wordsign} & \cell{9.5mm}{4.5mm}{\worddate} & & \vcell{9.5mm}{8.5mm}{4.5mm}{\getnum{lastpage}}\\		
			\hline
		\end{tabular}
	}
}

\newcommand{\registrationlistESKD}{
	\newpage

\reversemarginpar
\setlength{\marginparsep}{17.25mm}
\tabletextsize
\renewcommand{\baselinestretch}{0.6}\selectfont  
\setlength{\tabcolsep}{0mm}	
\marginpar{\vskip -3.0cm \hbox{\rotatebox{90}{\stampleftshort}}}

	% Основная таблица листа регистрации изменений
	\reversemarginpar
	\setlength{\marginparsep}{5.2mm}
	\marginpar{
		\vskip -5.0mm
		\tabletextsize
		%		\fontspec{GOST type A Bold Italic}
		\renewcommand{\baselinestretch}{0.6}\selectfont  
		\setlength{\tabcolsep}{0mm}				
		%\reglistnew
		\reglisttableESKD
		%\setlength{\tabcolsep}{\tabmarg}
	} 
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Лист регистрации изменений по ЕСПД ГОСТ 19.604-78
\newcommand{\reglisttableESPD}{ 
	\setlength{\arrayrulewidth}{0.5mm} 
	\vspace{-5mm} % Сдвижка вверх потому что сделали поле верхнее 30 мм вместо 25
	\fontspec{GOST type A Bold Italic} % Если ГОСТ ом
	\hbox{% 
		\sectionsize % 14 - так лучше с ГОСТовским шрифтом
%		\lusize % если без ГОСТовского шрифта
		\begin{tabular}{|c|c|c|c|c|c|c|c|c|c|}
			\hline
			\multicolumn{10}{|c|}{\cell{184.5mm}{9.5mm}{\approvalsize \wordregistration}} \\ % Так лучше с ГОСТ овским шрифтом
%			\multicolumn{10}{|c|}{\cell{184.5mm}{9.5mm}{\sectionsize \wordregistration}} \\ % Так лучше с обычным шрифтом
%			\multicolumn{10}{|c|}{\cell{184.5mm}{9.5mm}{\wordregistration}} \\ % Так лучше с обычным шрифтом
			\hline
			& \multicolumn{4}{c|}{\cell{73.5mm}{5.5mm}{\wordsheetnumber}} & & & & & \\
			\cline{2-5}
			\vcell{7.5mm}{24.5mm}{18.5mm}{\wordchanges} &
			\cell{19.5mm}{18.5mm}{\wordchanged} & \cell{19.5mm}{18.5mm}{\wordreplaced} & \cell{19.5mm}{18.5mm}{\wordnew} & \cell{19.5mm}{18.5mm}{\wordannulledESPD} & \vcell{19.5mm}{24.5mm}{18.5mm}{\wordsheetsindocESPD} & \vcell{24.5mm}{24.5mm}{18.5mm}{\worddocnumberESPD} & \vcell{24.5mm}{24.5mm}{18.5mm}{\wordincldocanddateESPD} & \vcell{14.5mm}{24.5mm}{18.5mm}{\wordsign} & \vcell{11.5mm}{24.5mm}{18.5mm}{\worddate} \\
			\hline % горизонтальная одинарная линия
			\cell{7.5mm}{7.5mm}{} & & & & & & & & & \\ %1
			\hline
			\cell{7.5mm}{7.5mm}{} & & & & & & & & & \\ %2
			\hline
			\cell{7.5mm}{7.5mm}{} & & & & & & & & & \\ %3
			\hline
			\cell{7.5mm}{7.5mm}{} & & & & & & & & & \\ %4
			\hline
			\cell{7.5mm}{7.5mm}{} & & & & & & & & & \\ %5
			\hline
			\cell{7.5mm}{7.5mm}{} & & & & & & & & & \\ %6
			\hline
			\cell{7.5mm}{7.5mm}{} & & & & & & & & & \\ %7
			\hline
			\cell{7.5mm}{7.5mm}{} & & & & & & & & & \\ %8
			\hline
			\cell{7.5mm}{7.5mm}{} & & & & & & & & & \\ %9
			\hline
			\cell{7.5mm}{7.5mm}{} & & & & & & & & & \\ %10
			\hline
			\cell{7.5mm}{7.5mm}{} & & & & & & & & & \\ %11
			\hline
			\cell{7.5mm}{7.5mm}{} & & & & & & & & & \\ %12
			\hline
			\cell{7.5mm}{7.5mm}{} & & & & & & & & & \\ %13
			\hline
			\cell{7.5mm}{7.5mm}{} & & & & & & & & & \\ %14
			\hline
			\cell{7.5mm}{7.5mm}{} & & & & & & & & & \\ %15
			\hline
			\cell{7.5mm}{7.5mm}{} & & & & & & & & & \\ %16
			\hline
			\cell{7.5mm}{7.5mm}{} & & & & & & & & & \\ %17
			\hline
			\cell{7.5mm}{7.5mm}{} & & & & & & & & & \\ %18
			\hline
			\cell{7.5mm}{7.5mm}{} & & & & & & & & & \\ %19
			\hline
			\cell{7.5mm}{7.5mm}{} & & & & & & & & & \\ %20
			\hline
			\cell{7.5mm}{7.5mm}{} & & & & & & & & & \\ %21
			\hline
			\cell{7.5mm}{7.5mm}{} & & & & & & & & & \\ %22
			\hline
			\cell{7.5mm}{7.5mm}{} & & & & & & & & & \\ %23
			\hline
			\cell{7.5mm}{7.5mm}{} & & & & & & & & & \\ %24
			\hline
			\cell{7.5mm}{7.5mm}{} & & & & & & & & & \\ %25
			\hline
			\cell{7.5mm}{7.5mm}{} & & & & & & & & & \\ %26
			\hline
			\cell{7.5mm}{7.5mm}{} & & & & & & & & & \\ %27
			\hline
			%			\cell{7.5mm}{7.5mm}{} & & & & & & & & & \\ %28
			%			\hline
			%			\cell{7.5mm}{7.5mm}{} & & & & & & & & & \\ %29
			%			\hline
		\end{tabular}
	}
}

\newcommand{\registrationlistESPD}{
	\newpage	
	% Основная таблица листа регистрации изменений
	\reversemarginpar
	\setlength{\marginparsep}{5.2mm}
	\marginpar{
		\vskip -5.0mm
		\tabletextsize
		%		\fontspec{GOST type A Bold Italic}
		\renewcommand{\baselinestretch}{0.6}\selectfont  
		\setlength{\tabcolsep}{0mm}				
		\reglisttableESPD
	} 
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Штамп для учета - оригинал
%\newcommand{\stampleftfull}{
%  \tabletextsize
%  \setlength{\tabcolsep}{0mm}
%  \itshape\fontspec{GOST type A Italic} % italic приходится задавать так
%  \begin{tabular}{|p{25mm}|p{35mm}|p{25mm}|p{25mm}|p{35mm}|}
%    \hline    
%    \cell{25mm}{5mm}{\wordoriginvnumber} & 
%    \cell{35mm}{5mm}{\wordsignanddate} & 
%    \cell{25mm}{5mm}{\wordinstinvnumber} & 
%    \cell{25mm}{5mm}{\wordduplinvnumber} & 
%    \cell{35mm}{5mm}{\wordsignanddate} \\
%    \hline
%    \cell{25mm}{7mm}{} & & & & \\
%    \hline
%  \end{tabular}
%  \setlength{\tabcolsep}{\tabmarg}
%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Окружение для страниц информационной части
\newenvironment{titlepage}
{
  \thispagestyle{empty}
  \setcounter{page}{0}
  \setlength{\tabcolsep}{0mm}
  \renewcommand{\baselinestretch}{0.8}\selectfont
}
{
  \newpage
  \setlength{\tabcolsep}{\tabmarg}
  \renewcommand{\baselinestretch}{1}\selectfont
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Лист утверждения
\newcommand{\makeapproval}[1]{
\begin{titlepage}
  \reversemarginpar
%  \setlength{\marginparsep}{11.5mm}
  \setlength{\marginparsep}{17mm}
%  %\marginpar{\vskip -\topfield \hbox{\rotatebox{90}{\stampleftfull}}}
%  \marginpar{\vskip -\topfield \hbox{\rotatebox{90}{\stampleftshort}}}
%  %\marginpar{\vskip -\topfield \hbox{\rotatebox{90}{\stampleftonlyfirstapp}}}
%  %\marginpar{\vskip -\topfield \hbox{\rotatebox{90}{\stampleftonlyrefnum}}}
  	\ifthenelse{\equal{#1}{}}{% По умолчанию короткий штамп
		\marginpar{\vskip -\topfield \hbox{\rotatebox{90}{\stampleftshort}}}	
	}{%
		\ifthenelse{\equal{#1}{1}}{% Полный штамп
			\marginpar{\vskip -\topfield \hbox{\rotatebox{90}{\stampleftfull}}}	
		}{
			\ifthenelse{\equal{#1}{2}}{% Только первое применение
				\marginpar{\vskip -\topfield \hbox{\rotatebox{90}{\stampleftonlyfirstapp}}}	
			}{
				\ifthenelse{\equal{#1}{3}}{% Только номер
					\marginpar{\vskip -\topfield \hbox{\rotatebox{90}{\stampleftonlyrefnum}}}	
				}{
					\ClassError
					{espd}
					{Wrong number}
					{You should specify #1 by typing empty figure brackets or number 1..3}	
				}
			}
		}
	}
%  \vskip -\baselineskip
  \vskip -15mm
  \centering
  \protectlinebreak  
  \begin{tabular}{c c}
	\parbox[t][2cm]{0.5\textwidth}{
		\centering\MakeUppercase{\wordagree}\vskip 2mm\@customerrank\vskip 1mm\onlyauthor{\@customername}
	} &
	
	\parbox[t][2cm]{0.5\textwidth}{
		\centering\MakeUppercase{\wordapprove}\vskip 2mm\@chiefconstructorrank\vskip 1mm\onlyauthor{\@chiefconstructorname}
	}
  \end{tabular}

  {\vskip 3cm
  \linespread{1.0}\titlesize\MakeUppercase{\@title}
  \vskip 4mm}
  \normalsize\textbf{\@type}
  \vskip 4mm
  \normalsize{\MakeUppercase{\wordapproval}}
%  \normalsize{{\wordapproval}}
  \vskip 4mm
  %
  % Original:
  %\normalsize{\fullcodeapp}
  %
  % New:
  \ifthenelse{\equal{\@typecode}{СП}}{
	\normalsize{\shortcodeapp}  
  }{%
  	\normalsize{\fullcodeapp}
  }
  %
  \vskip \fill
  \begin{tabular}{c c}
    \parbox[t]{0.45\textwidth}{\raggedright
   	% левая колонка:
	\if& \@headofdepartmentname &	    
		&
	\else
		\titleauthor{\@fromcustomername}{\@fromcustomerrank}} &                       	
	\fi

    \parbox[t]{0.4\textwidth}{\raggedright    
	% правая колонка:
    	
    \if& \@headofdepartmentname &	    
   	\else
	    \titleauthor{\@headofdepartmentname}{\@headofdepartmentrank}    	
   	\fi

    \if& \@deputyofchiefconstructorname &	    
 	\else
	    \titleauthor{\@deputyofchiefconstructorname}{\@deputyofchiefconstructorrank} 
	\fi
	
	\if& \@headoflaboratoryname &	
 	\else
 	    \titleauthor{\@headoflaboratoryname}{\@headoflaboratoryrank} 
 	\fi
 	
 	\if& \@developername &	
 	\else
		\titleauthor{\@developername}{\@developerrank} 	
 	\fi
    
    \if&\@authorname&
    \else
  		\if&\@authori\@authorii\@authoriii\@authoriv\@authorv\@authorranki\@authorrankii\@authorrankiii\@authorrankiv\@authorrankv&
    		\wordperformer\\\onlyauthor{\@authorname}
   		\else
      		\wordperformers\\\onlyauthor{\@authori}\onlyauthor{\@authorii}\onlyauthor{\@authoriii}\onlyauthor{\@authoriv}\onlyauthor{\@authorv}
     	\fi
    \fi

 	\if& \@normocontrollername &	
	\else
		\titleauthor{\@normocontrollername}{\@normocontrollerrank}
	\fi

	}
  \end{tabular}
  \vskip \fill
  \@year
  \vskip 5mm
\end{titlepage}
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Лист утверждения без подписей от заказчика
\newcommand{\makeapprovalnocustomer}[1]{
	\begin{titlepage}
		\reversemarginpar
		%  \setlength{\marginparsep}{11.5mm}
		\setlength{\marginparsep}{17mm}
%		%\marginpar{\vskip -\topfield \hbox{\rotatebox{90}{\stampleftfull}}}
%		\marginpar{\vskip -\topfield \hbox{\rotatebox{90}{\stampleftshort}}}
%		%\marginpar{\vskip -\topfield \hbox{\rotatebox{90}{\stampleftonlyfirstapp}}}
%		%\marginpar{\vskip -\topfield \hbox{\rotatebox{90}{\stampleftonlyrefnum}}}
	  	\ifthenelse{\equal{#1}{}}{% По умолчанию короткий штамп
		\marginpar{\vskip -\topfield \hbox{\rotatebox{90}{\stampleftshort}}}	
		}{%
			\ifthenelse{\equal{#1}{1}}{% Полный штамп
				\marginpar{\vskip -\topfield \hbox{\rotatebox{90}{\stampleftfull}}}	
			}{
				\ifthenelse{\equal{#1}{2}}{% Только первое применение
					\marginpar{\vskip -\topfield \hbox{\rotatebox{90}{\stampleftonlyfirstapp}}}	
				}{
					\ifthenelse{\equal{#1}{3}}{% Только номер
						\marginpar{\vskip -\topfield \hbox{\rotatebox{90}{\stampleftonlyrefnum}}}	
					}{
						\ClassError
						{espd}
						{Wrong number}
						{You should specify #1 by typing empty figure brackets or number 1..3}	
					}
				}
			}
		}
%		\vskip -\baselineskip
		\vskip -15mm
		\centering
		\protectlinebreak  
		\begin{tabular}{c c}
			\parbox[t][2cm]{0.5\textwidth}{
				~
			} &
			
			\parbox[t][2cm]{0.5\textwidth}{
				\centering\MakeUppercase{\wordapprove}\vskip 2mm\@chiefconstructorrank\vskip 1mm\onlyauthor{\@chiefconstructorname}
			}
		\end{tabular}
		{\vskip 3cm
		\linespread{1.0}\titlesize\MakeUppercase{\@title}
		\vskip 4mm}
%		\vskip 3cm
%		\titlesize{\MakeUppercase{\@title}}
%		\vskip 4mm
		\normalsize\textbf{\@type}
		\vskip 4mm
		\normalsize{\MakeUppercase{\wordapproval}}
		\vskip 4mm		
		%
		% Original:
		%\normalsize{\fullcodeapp}
		%
		% New:
		\ifthenelse{\equal{\@typecode}{СП}}{
			\normalsize{\shortcodeapp}  
		}{%
			\normalsize{\fullcodeapp}
		}
		%		
		\vskip \fill
		\begin{tabular}{c c}
			\parbox[t]{0.45\textwidth}{\raggedright
				~
%				% левая колонка:
%				\if& \@headofdepartmentname &	    
%				%&
%				\else
%				\titleauthor{\@fromcustomername}{\@fromcustomerrank}%} &                       	
%				\fi
			}
			
			\parbox[t]{0.4\textwidth}{\raggedright    
				% правая колонка:
				
				\if& \@headofdepartmentname &	    
				\else
				\titleauthor{\@headofdepartmentname}{\@headofdepartmentrank}    	
				\fi
				
				\if& \@deputyofchiefconstructorname &	    
				\else
				\titleauthor{\@deputyofchiefconstructorname}{\@deputyofchiefconstructorrank} 
				\fi
				
				\if& \@headoflaboratoryname &	
				\else
				\titleauthor{\@headoflaboratoryname}{\@headoflaboratoryrank} 
				\fi
				
				\if& \@developername &	
				\else
				\titleauthor{\@developername}{\@developerrank} 	
				\fi
				
				\if&\@authorname&
				\else
				\if&\@authori\@authorii\@authoriii\@authoriv\@authorv\@authorranki\@authorrankii\@authorrankiii\@authorrankiv\@authorrankv&
				\wordperformer\\\onlyauthor{\@authorname}
				\else
				\wordperformers\\\onlyauthor{\@authori}\onlyauthor{\@authorii}\onlyauthor{\@authoriii}\onlyauthor{\@authoriv}\onlyauthor{\@authorv}
				\fi
				\fi
				
				\if& \@normocontrollername &	
				\else
				\titleauthor{\@normocontrollername}{\@normocontrollerrank}
				\fi
				
			}
		\end{tabular}
		\vskip \fill
		\@year
		\vskip 5mm
	\end{titlepage}
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Титульный лист
%\newcommand{\maketitle}[1]{
\newcommand{\maketitle}{
\begin{titlepage}
  \reversemarginpar
  \setlength{\marginparsep}{17mm}
%  \marginpar{\vskip -\topfield \hbox{\rotatebox{90}{\stampleftfull}}}
  \marginpar{\vskip -\topfield \hbox{\rotatebox{90}{\stampleftshort}}}
%  \marginpar{\vskip -\topfield \hbox{\rotatebox{90}{\stampleftonlyfirstapp}}}
%  \marginpar{\vskip -\topfield \hbox{\rotatebox{90}{\stampleftonlyrefnum}}}	
%
%  \ifthenelse{\equal{#1}{}}{% По умолчанию короткий штамп
%  	\marginpar{\vskip -\topfield \hbox{\rotatebox{90}{\stampleftshort}}}	
%  }{%
%  	\ifthenelse{\equal{#1}{1}}{% Полный штамп
%  		\marginpar{\vskip -\topfield \hbox{\rotatebox{90}{\stampleftfull}}}	
%  	}{
%  		\ifthenelse{\equal{#1}{2}}{% Только первое применение
%  			\marginpar{\vskip -\topfield \hbox{\rotatebox{90}{\stampleftonlyfirstapp}}}	
%  		}{
%  			\ifthenelse{\equal{#1}{3}}{% Только номер
%  				\marginpar{\vskip -\topfield \hbox{\rotatebox{90}{\stampleftonlyrefnum}}}	
%  			}{
%  				\ClassError
%  				{espd}
%  				{Wrong number}
%  				{You should specify #1 by typing empty figure brackets or number 1..3}	
%  			}
%  		}
%  	}
%  }  
%  \vskip -\baselineskip
  \vskip -15mm
  %
  % Original:
  %\parbox[t]{0.4\textwidth}{\centering\MakeUppercase{\wordapproved}\\\fullcodeapp}
  %
  % Fixed:
  \ifthenelse{\equal{\@typecode}{СП}}{
  	\parbox[t]{0.4\textwidth}{\centering\MakeUppercase{\wordapproved}\\\shortcodeapp}
  }{%
  	\parbox[t]{0.4\textwidth}{\centering\MakeUppercase{\wordapproved}\\\fullcodeapp}
  }
  %
  \vskip 8cm
  \centering
  \protectlinebreak
%  \titlesize{\MakeUppercase{\@title}}	
	\linespread{1.0}\titlesize\MakeUppercase{\@title}	
%	\linespread{1.0}\titlesize{\@title}	
  \vskip 4mm
  \normalsize\textbf{\@type}  
  \vskip 4mm  
  %
  % Original:
  %{\fullcode}
  %
  % Fixed:
  \ifthenelse{\equal{\@typecode}{СП}}{
	\shortcode
  }{%
	\fullcode
  }
  %
  \vskip 4mm
  {\wordsheets~\getnum{lastpage}}
  \vskip \fill
  \@year
  \vskip 5mm
  
\end{titlepage}
\stepcounter{page}
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Содержание
\newcommand\@pnumwidth{1em}
\newcommand\@tocrmarg{4em}
\newcommand\@dotsep{4}
\setcounter{tocdepth}{4}
\newcommand\tableofcontents{
  \newpage
  \writesection{\wordcontents}
%  \vspace{2mm}
  \@starttoc{toc}
}
%\newcommand\l@section[1]{\@dottedtocline{1}{0cm}{0.5cm}{\textbf{#1}}}
%\newcommand\l@subsection{\@dottedtocline{2}{0.5cm}{1cm}}
%\newcommand\l@paragraph{\@dottedtocline{3}{1cm}{1.5cm}}
%\newcommand\l@subparagraph{\@dottedtocline{4}{1.5cm}{2cm}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand\l@section[1]{\@dottedtocline{1}{0cm}{1cm}{#1}}
\newcommand\l@subsection{\@dottedtocline{2}{1cm}{2cm}}
%\newcommand\l@paragraph{\@dottedtocline{3}{2cm}{3cm}}
%\newcommand\l@subparagraph{\@dottedtocline{4}{3cm}{4cm}}
\newcommand\l@subsubsection{\@dottedtocline{3}{2cm}{3cm}}
\newcommand\l@paragraph{\@dottedtocline{4}{3cm}{4cm}}
\newcommand\l@attachment{\@dottedtocline{1}{0cm}{3cm}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%\newcommand\l@section[1]{\@dottedtocline{1}{0cm}{0.75cm}{#1}}
%\newcommand\l@subsection{\@dottedtocline{2}{0.75cm}{1.5cm}}
%\newcommand\l@paragraph{\@dottedtocline{3}{1.5cm}{2.25cm}}
%\newcommand\l@subparagraph{\@dottedtocline{4}{2.25cm}{3cm}}
%\newcommand\l@attachment{\@dottedtocline{1}{0cm}{3cm}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ВСТАВЛЯЕМЫЙ КОНТЕНТ
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Иллюстрация
% \illustration[title][description][scale]{file}[label]
\def\illustration[#1][#2][#3]#4[#5]{
  \refstepcounter{illustration}
  \vspace{2mm}
  \begin{center}
    \ifx&#1&\else
      #1 \nopagebreak \\
      \vspace{2mm}
    \fi    
    \includegraphics[width=#3\textwidth]{#4}\nopagebreak\\
%    \\\vspace{2mm}
%
%	\vspace{2mm}
%    \\
%    \noindent
%\nopagebreak
	\noindent
    \ifnum\getnum{lastillustration}=1
	    \picturetextsize\centering{#2}
    \else    	
%	    Если нумерация через точку как по ГОСТ 19	
%		\picturetextsize\centering{\wordimage~\arabic{illustration}.~{#2}} 
%       Если нумрация через дефис как хочет нормоконтроль
		\picturetextsize\centering{\wordimage~\arabic{illustration}~--~{#2}}
    \fi
    \ifx&#5&\else
      \label{#5} %      \label{img:#5}
    \fi
  \end{center}
  \vspace{2mm}
  \par % конец параграфа
}
\newcounter{illustration}
\renewcommand{\theillustration}{\wordrefimage\arabic{illustration}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Картинка
% \image[scale]{file}
\newcommand{\image}[2][1]{
  \vspace{5mm}
  \begin{center}
    \includegraphics[width=#1\textwidth]{#2}	    
  \end{center}
  \vspace{5mm}
  \par
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% РАЗНОЕ
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Сноски
\renewcommand{\footnoterule}{\rule{3cm}{0.1pt}\vskip 2mm}
\def\@makefnmark{\@textsuperscript{\footnotesize\@thefnmark)}}
\def\@makefntext#1{\hskip 1cm\@makefnmark\footnotetextsize#1}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Перечисления
\def\theenumi{\arabic{enumi}}
\def\p@enumi{\theenumi \leftmargini}
\def\labelenumi{\theenumi)}
%
\def\theenumii{--}
\def\p@enumii{\theenumii \leftmarginii}
\def\labelenumii{\theenumii}
%
\setlength{\labelsep}{5mm}
\setlength{\labelwidth}{-\parindent}
\addtolength{\labelwidth}{-\labelsep}
\addtolength{\labelwidth}{-4mm}
%
\def\@listi {\leftmargin 0mm}
\def\@listii {\leftmargin 10mm}


% Перечисление для формул c вравниванием отступов иерархии вложенности
\newcommand{\formulalist}[1]{%
{
	\setlength{\labelsep}{3.5mm}%
	\setlength{\labelwidth}{0mm}%
	\begin{itemize}
		{#1}
	\end{itemize}
}
}%
\newcommand{\formulalistsec}[1]{%
{
	\setlength{\labelsep}{3.5mm}%
	\setlength{\labelwidth}{-10mm}%
	\begin{itemize}
		{#1}
	\end{itemize}
}
}%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Библиография
\def\url{\texttt}
\newcommand\newblock{\hskip .11em\@plus.33em\@minus.07em}
\def\@biblabel#1{#1.}
\newenvironment{thebibliography}[1]
{
	\newpage
  	\writesection{\wordbibliography}
  	\list{\@biblabel{\@arabic\c@enumiv}}
    {%
     % Читерство
     %
     \itemindent -7mm	
	 \labelsep 2mm	
     %
     % Штатный вариант
     %
%     \settowidth\labelwidth{\@biblabel{#1}}
%     \leftmargin\labelwidth
%     \advance\leftmargin\labelsep
     \usecounter{enumiv}
     \let\p@enumiv\@empty
     \renewcommand\theenumiv{\@arabic\c@enumiv}}
}
{
  \endlist
  \addcontentsline{toc}{attachment}{\wordbibliography}
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Вставка в начале документа --> вынесено отдельной командой
%\AtBeginDocument{\makeapproval\maketitle}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Вставка в конце документа
\AtEndDocument{
%  \registration
  \set{lastpage}{\thepage}
  \set{lastattachment}{\arabic{attachment}}
  \set{lastillustration}{\arabic{illustration}}
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Колонтитулы и нумерация
\def\ps@default{
  \def\@oddhead{%
    \hfil
    \vbox{
      \hbox to \textwidth{\hfil\thepage\hfil}
      \vspace{3mm}      
		%
		% Original:
		%\hbox to \textwidth{\hfil\fullcode\hfil}
		%
		% Fixed:
		\ifthenelse{\equal{\@typecode}{СП}}{
		 	\hbox to \textwidth{\hfil\shortcode\hfil}
		}{%
		 	\hbox to \textwidth{\hfil\fullcode\hfil}
		}
		%
	}%
    \hfil
    }
  \let\@oddfoot\@empty
  \let\@evenhead\@oddhead
  \let\@evenfoot\@oddfoot
}
\pagestyle{default}
\pagenumbering{arabic}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Команды отмены отступов (используется при вставке формул)
\newcommand{\zerodisplayskips}{%
	\setlength{\abovedisplayskip}{0pt}%
	\setlength{\belowdisplayskip}{0pt}%
	\setlength{\abovedisplayshortskip}{0pt}%
	\setlength{\belowdisplayshortskip}{0pt}%
}%

% Удаление пробела для формул
%\newcommand{\formuladelspace}{\vspace{-\abovedisplayskip}}
\newcommand{\formuladelspace}%
{%
	\vspace{-5mm}%
}%
%\def\formuladelspace/\vspace{-5mm}

%
%\setlength\LTleft{0pt plus \textwidth}
%\setlength\LTright{0pt plus \textwidth}

% Разделитель записи «Таблица #» и названия таблицы
%\newcommand{\tablabelsep}{~\cyrdash\ }
%\LTleft=\z@
%\LTright=\fill
%%% Таблицы %%%
%\DeclareCaptionLabelSeparator{tabsep}{\tablabelsep} % нумерация таблиц
%%\DeclareCaptionFormat{split}{\splitformatlabel#1\par\splitformattext#3}
%

%\newcommand{\tablabelsep}{~\cyrdash\ }
\captiondelim{~--~} % Смена разделителя между "таблица+номер" и собственно названием
\renewcommand{\tablename}{\normalsize Таблица}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Информационно-удостоверяющий лист (ИУЛ)
\newcommand{\iulist}{
	\newpage
	{
		% Левый штамп вертикальный
		\reversemarginpar
		\setlength{\marginparsep}{17.25mm}
		\tabletextsize
		\renewcommand{\baselinestretch}{0.6}\selectfont  
%		\setlength{\tabcolsep}{0mm}	
%		\marginpar{\vskip -2.5cm \hbox{\rotatebox{90}{\stampleftshort}}}
		\marginpar{\vskip -3.0cm \hbox{\rotatebox{90}{\stampleftshort}}}
	}
	% Основная таблица ИУЛ
	\reversemarginpar
	\setlength{\marginparsep}{5.2mm}
	\marginpar{
		\vskip -12mm
%		\vskip -6.5mm
		\tabletextsize
%				\fontspec{GOST type A Bold Italic}
		%		\renewcommand{\baselinestretch}{0.6}\selectfont  
%		\setlength{\tabcolsep}{0mm}				
		\iul
%		\setlength{\tabcolsep}{\tabmarg}
	} 
	%	% Миништамп внизу ИУЛ
	%	\marginpar{
	%		\vskip -0.4mm
	%		\tabletextsize
	%		\fontspec{GOST type A Bold Italic}
	%		\renewcommand{\baselinestretch}{0.6}\selectfont  
	%		\setlength{\tabcolsep}{0mm}				
	%		\iulstamp
	%	}
		% Миништамп внизу ИУЛ
		\marginpar{
			\vskip -0.4mm
			\tabletextsize
%			\fontspec{GOST type A Bold Italic}
%			\renewcommand{\baselinestretch}{0.6}\selectfont  
%			\setlength{\tabcolsep}{0mm}				
			\iulstamp
		}     
		
	  
	\setlength{\tabcolsep}{\tabmarg}
}

%%	\setlength{\arrayrulewidth}{0.5mm} 
%%	\hbox{%  	
%%		\begin{tabular}{|c|c|c|c|c|}
%%			\hline
%%			\cell{12.5mm}{14.5mm}{Номер\\п/п} &
%%			\cell{55.5mm}{14.5mm}{Обозначение документа} &
%%			\cell{59.5mm}{14.5mm}{Наименование изделия,\\наименование документа} &
%%			\cell{24.5mm}{14.5mm}{Версия} &
%%			\cell{24.5mm}{14.5mm}{Номер\\последнего\\изменения} \\
%%			\hline
%%			\cell{1mm}{14.5mm} 1 & {\fullcode}-ДЭ & {\@productname} & 4 & 5 \\
%%			\hline
%%		\end{tabular}
%%	}

\newcommand\xrowht[2][0]{\addstackgap[.5\dimexpr#2\relax]{\vphantom{#1}}}
\newcommand{\iul}{
	\setlength{\arrayrulewidth}{0.5mm} 
	{%
		\begin{longtable}[c]{|>{\centering}m{12mm}|>{\centering}m{53mm}|>{\raggedright}m{54mm}|>{\centering}m{20mm}|>{\centering}m{20mm}|}
			%----------------------- преамбула ---------------------	
			\hline
			\centering{Номер\\п/п} & 
			\centering{Обозначение документа} & 
			\centering{Наименование изделия,\\наименование документа} & 
			\centering{Версия} &
			\centering{Номер\\последнего\\изменения} \xrowht[(5mm)]{5mm}\tabularnewline
			\hhline{|=|=|=|=|=|}
			\endfirsthead % Конец заголовка на 1 странице
			\hline
			\centering{Номер\\п/п} & 
			\centering{Обозначение документа} & 
			\centering{Наименование изделия,\\наименование документа} & 
			\centering{Версия} &
			\centering{Номер\\последнего\\изменения} \xrowht[(5mm)]{5mm}\tabularnewline
			\hhline{|=|=|=|=|=|}
			\endhead
			\hline
			\endfoot
			\hline
			\endlastfoot	
			%------------------- табличные данные ------------------		
			1 & {\fullcode}-ДЭ & {\@iulproductname} & {\@iulversion} & {\@iulnumoflastchange} \xrowht[(3.5mm)]{3.5mm}\tabularnewline\hline
		\end{longtable}
	}	
	{%
	\begin{longtable}[c]{|>{\centering}m{25mm}|>{\raggedright}m{147.5mm}|}
		\hline
%		MD5 & 
		SHA256 & 
		{\@iulcontrolsumm} \tabularnewline
		\hline
	\end{longtable}
	}
	{%
		\begin{longtable}[c]{|>{\centering}m{56mm}|>{\centering}m{56mm}|>{\centering}m{56mm}|}
			\hline
			Примечание\\{\@iulnote} & ~ & ~ \tabularnewline
			\hline
		\end{longtable}
	}
	{%
	\begin{longtable}[c]{|>{\raggedright}m{20mm}|>{\raggedright}m{50mm}|>{\centering}m{47mm}|>{\centering}m{46.5mm}|}
		\hline
		Разраб. & {\@iuldeveloper} & ~ & ~ \tabularnewline
		\hline
		Проверил & {\@iulcheck} & ~ & ~ \tabularnewline
		\hline
		~ & ~ & ~ & ~ \tabularnewline
		\hline
		Н.контр. & {\@iulnormocontrol} & ~ & ~ \tabularnewline
		\hline
		Утв. & {\@iulapproved} & ~ & ~ \tabularnewline
		\hline
	\end{longtable}
	}
%	\hfill{10cm}
%	\vspace{11.57cm}
%	\vspace{12.1cm}
%	\vskip \fill
%	{%
%		\begin{longtable}[c]{|>{\raggedright}m{75mm}|>{\centering}m{50mm}|>{\centering}m{19.5mm}|>{\centering}m{19.5mm}|}
%			\hline
%			\multirow{2}*{Информационно-удостоверяющий лист} & \multirow{2}*{\fullcode-УЛ} & Лист & Листов \tabularnewline
%			\cline{3-4}
%			~ & ~ & 1 & 1 \tabularnewline			
%			\hline
%		\end{longtable}
%	}
}

\newcommand{\iulstamp}{
	\setlength{\arrayrulewidth}{0.5mm} 
	\vspace{24.09cm}
	{%
		\begin{longtable}[c]{|>{\raggedright}m{75mm}|>{\centering}m{50mm}|>{\centering}m{19.5mm}|>{\centering}m{19.5mm}|}
			\hline
			\multirow{2}*{Информационно-удостоверяющий лист} & \multirow{2}*{\fullcode-УЛ} & Лист & Листов \tabularnewline
			\cline{3-4}
			~ & ~ & 1 & 1 \tabularnewline			
			\hline
		\end{longtable}
	}
}