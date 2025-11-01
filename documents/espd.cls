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
%\usepackage{floatraw}

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
\def\notes{П\hspace{1.0mm}р\hspace{1.0mm}и\hspace{1.0mm}м\hspace{1.0mm}е\hspace{1.0mm}ч\hspace{1.0mm}а\hspace{1.0mm}н\hspace{1.0mm}и\hspace{1.0mm}я:}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Создает переменную, задается \cmd{val}, возвращается \@cmd
% \var{cmd}
\def\var#1{
  \expandafter
  \def\csname #1\endcsname##1{
    \ifx&##1&
      \ClassError
        {espd}
        {\@backslashchar#1 cannot be empty}
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
\newcommand{\biggersize}{\fontsize{16pt}{16pt}\selectfont}
\newcommand{\titlesize}{\fontsize{14pt}{21pt}\selectfont}
\newcommand{\approvalsize}{\fontsize{17pt}{24pt}\selectfont}
\newcommand{\sectionsize}{\fontsize{14pt}{18pt}\selectfont}
\newcommand{\lusize}{\fontsize{12pt}{14pt}\selectfont}
\newcommand{\subsectionsize}{\fontsize{14pt}{16pt}\selectfont}
\newcommand{\attachmentsize}{\fontsize{14pt}{18pt}\selectfont}
\newcommand{\leftstamptextsize}{\fontsize{10pt}{15pt}\selectfont}
\newcommand{\leftstamptextsizesec}{\fontsize{12pt}{15pt}\selectfont}
%\newcommand{\tabletextsize}{\fontsize{10pt}{15pt}\selectfont}
\newcommand{\tabletextsize}{\fontsize{12pt}{15pt}\selectfont}
\newcommand{\tabletextsizesmall}{\fontsize{11pt}{11pt}\selectfont}
\newcommand{\tbsm}{\fontsize{8pt}{8pt}\selectfont}
%\newcommand{\picturetextsize}{\fontsize{12pt}{15pt}\selectfont} % smaller font
\newcommand{\picturetextsize}{\fontsize{14pt}{18pt}\selectfont} % normal
\newcommand{\listingtextsize}{\fontsize{10pt}{10pt}\selectfont}
\newcommand{\listingtextsizesmall}{\fontsize{8pt}{8pt}\selectfont}
%\newcommand{\listingtextsize}{\fontsize{11pt}{11pt}\selectfont}
\newcommand{\footnotesize}{\fontsize{10pt}{12pt}\selectfont}
\newcommand{\footnotetextsize}{\fontsize{12pt}{15pt}\selectfont}
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
%\setlength{\textwidth}{175mm} % Ширина области текста документа - так правое поле будет 10 мм
\setlength{\textwidth}{170mm} % Ширина области текста документа - так правое поле будет 15 мм

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
%\setlength{\parindent}{10mm} % Абзацный отступ
\setlength{\parindent}{12.5mm} % Абзацный отступ
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
\def\worddate{Да-\\та}
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
\def\wordbibliographysecond{Источники, использованные при разработке}
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
\varempty{developerrankafter} % Разработчик в конце документа
\varempty{developername}

\varempty{normocontrollerrank} % Нормоконтролер
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

\varempty{bibtype} % если будет bibtype=1, то библиография включается как раздел нумерованный
\varempty{bibtext} % если будет тут что-то написано, это будет вставлено перед перечнем литературы в разделе
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Согласно ГОСТ 19.101-77
\DeclareOption{exampledoc}{
	\type{Пример оформления документации}
	\typecode{100}
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
% --> Следующие документы не по ГОСТ-19
\DeclareOption{dataprotocol}{
	\type{Протокол обмена}
	\typecode{99}  
}
\DeclareOption{additional}{
	\type{Дополнительный документ}
	\typecode{addition}  
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
\raggedleft{\vskip 1mm\hphantom{placeforsigning}~#1}\\ \vskip 1mm
\centering{\wordopenquote\rule{5mm}{0.1pt}\wordclosequote~\rule{2.0cm}{0.1pt} \@year~\wordyear}\\ \vskip 5mm
%\raggedleft{\vskip 1mm\hphantom{placeforsigning}~#1}\\ \vskip 1mm
%\centering{\wordopenquote\rule{8mm}{0.1pt}\wordclosequote~\rule{2.5cm}{0.1pt} \@year~\wordyear}\\ \vskip 5mm

%{\vskip 1mm\hphantom{placeforsigning}~#1}\\ \vskip 1mm
%{\wordopenquote\rule{8mm}{0.1pt}\wordclosequote~\rule{3cm}{0.1pt} \@year~\wordyear}\\ \vskip 5mm

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
%\vskip 1mm \raggedright{#2}\\ \raggedleft{\vskip 1mm\hphantom{placeforsigning}~#1}\\ \vskip 1mm \centering{\wordopenquote\rule{8mm}{0.1pt}\wordclosequote~\rule{3cm}{0.1pt} \@year~\wordyear}\\ \vskip 5mm
\vskip 1mm \raggedright{#2}\\ \raggedleft{\vskip 1mm\hphantom{placeforsigning}~#1}\\ \vskip 1mm \centering{\wordopenquote\rule{5mm}{0.1pt}\wordclosequote~\rule{2.0cm}{0.1pt} \@year~\wordyear}\\ \vskip 5mm

% C подчерком для подписи
%\vskip 1mm #2\\\vskip 1mm\rule{3cm}{0.1pt}~#1\\\vskip 1mm \wordopenquote\rule{8mm}{0.1pt}\wordclosequote~\rule{3cm}{0.1pt} \@year~\wordyear\\\vskip 5mm
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Вставляет должность и место для подписи для исполнителя без проверки на пустоту строк
% \titleauthorrawnodate{author}{authorrank}
\def\titleauthorrawnodate#1#2{
	% Без подчерка для подписи
	%\vskip 1mm \raggedright{#2}\\ \raggedleft{\vskip 1mm\hphantom{placeforsigning}~#1}\\ \vskip 1mm \centering{\wordopenquote\rule{8mm}{0.1pt}\wordclosequote~\rule{3cm}{0.1pt} \@year~\wordyear}\\ \vskip 5mm
	\vskip 1mm \raggedright{#2}\\ \raggedleft{\vskip 1mm\hphantom{placeforsigning}~#1}\\ \vskip 1mm %\centering{\wordopenquote\rule{5mm}{0.1pt}\wordclosequote~\rule{2.0cm}{0.1pt} \@year~\wordyear}\\ \vskip 5mm
	
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
% То же, но делает проверку на пустоту строк
% \titleauthornodate{author}{authorrank}
\def\titleauthornodate#1#2{
	\if&#1#2&\else%
	\titleauthorrawnodate{#1}{#2}
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

%   \hfill{\MakeUppercase{\wordattachment}}\vspace{-3mm} \\
%	\null\hfill{#1}\vspace{3mm} \\

  	\hfill{\MakeUppercase{\textit{\wordattachment}}}\vspace{-2mm} \\ % Курсивом как в ГОСТ-19
	\null\hfill\textit{#1}\vspace{4mm} \\ % Курсивом как в ГОСТ-19
	%  \hfill{\MakeUppercase{\wordattachment~\theattachment}}\vspace{-3mm} \\ % Без курсива
	%  \null\hfill{#1}\vspace{4mm} \\ % Без курсива
%	{%
%		\raggedleft%
%		\begin{tabular}{l}
%		{\MakeUppercase{\textit{\wordattachment}}}\vspace{-2mm} \tabularnewline
%		{\textit{#1}} \tabularnewline
%		\end{tabular}
%		\vspace{6mm}\\
%	}	
  {
	\attachmentsize\centering\MakeUppercase{#2}\par %Без курсива
%	\vspace{3mm}
  }

%  \addcontentsline{toc}{attachment}{\wordattachment.~#2}
%  \addcontentsline{toc}{attachment}{\wordattachment~#1~#2} % БЕЗ ТОЧКИ КАК ХОТЕЛ НОРМОКОНТРОЛЬ!
  \addcontentsline{toc}{attachment}{\wordattachment.~#2} % C ТОЧКОЙ!
  \ifx&#3&\else
    \label{#3}
  \fi
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Вставляет приложение с нумерацией
% \writeattachmentnum{description}{title}{label}
\def\writeattachmentnum#1#2#3{
  \refstepcounter{attachment}
%%%
%%% Вариант выравнивания по простому по правой границе
%%%
  \hfill{\MakeUppercase{\textit{\wordattachment~\theattachment}}}\vspace{-2mm} \\ % Курсивом как в ГОСТ-19
  \null\hfill\textit{#1}\vspace{5mm} \\ % Курсивом как в ГОСТ-19
%%  \hfill{\MakeUppercase{\wordattachment~\theattachment}}\vspace{-3mm} \\ % Без курсива
%%  \null\hfill{#1}\vspace{4mm} \\ % Без курсива
%%
%%
% Вариант выравнивание как в ГОСТ 19.106 в конце
%
%{%
%	\raggedleft%
%	\begin{tabular}{l}
%	{\MakeUppercase{\textit{\wordattachment~\theattachment}}}\vspace{-2mm} \tabularnewline
%	{\textit{#1}} \tabularnewline
%	\end{tabular}
%	\vspace{4mm}\\
%}
%
  {
    \attachmentsize\centering\MakeUppercase{#2}\par %Без курсива
    \vspace{3mm}
  }
% Если по ГОСТ-19
%  \addcontentsline{toc}{attachment}{\wordattachment~\theattachment.~#2}

% Если как хочет наш нормоконтроль - без точки
%  \addcontentsline{toc}{attachment}{\wordattachment~\theattachment~#2} 

% Новый вариант
%  \addcontentsline{toc}{attachment}{\wordattachment~\theattachment~#1~#2} % БЕЗ ТОЧКИ КАК ХОТЕЛ НОРМОКОНТРОЛЬ!
  \addcontentsline{toc}{attachment}{\wordattachment~\theattachment~#1.~#2} % С ТОЧКОЙ

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
	\parbox[c][#2][b]{#1}{\raggedright #3}%
}

\def\cellleftcenter#1#2#3{
	\parbox[c][#2][b]{#1}{\centering #3}%
}

\def\celltop#1#2#3{
	\parbox[c][#2][t]{#1}{\centering\vspace{2mm}#3}%
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
%  \parindent -1.0cm % Для абзацного отступа 1.0
  \parindent -0.75cm % Для абзацного отступа 1.25  
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
	%  \parindent -1.0cm % Для абзацного отступа 1.0
	\parindent -0.75cm % Для абзацного отступа 1.25  
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
	%  \parindent -1.0cm % Для абзацного отступа 1.0
	\parindent -0.75cm % Для абзацного отступа 1.25  
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
	\newpage % Раздел с новой страницы!
%	\vspace{1cm}
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
	\newpage % Раздел приложения с новой страницы!
%	\vspace{1cm}
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
% \cellleft  - выравнивание будет по левому краю ячейки
% \cell  - выравнивание будет по центру ячейки
%

%% Как по ГОСТу - жирный шрифт
%\def\stampfontstyle{%
%	\setlength{\arrayrulewidth}{0.5mm}
%	\tabletextsize
%	\setlength{\tabcolsep}{0mm}
%	\itshape\fontspec{GOST type A Italic} % Italic приходится задавать так
%}
%\newcommand{\stampleftfull}{
%	\stampfontstyle
%	\begin{tabular}{|p{24.5mm}|p{34.5mm}|p{24.5mm}|p{24.5mm}|p{34.5mm}|p{21.0mm}|p{59.5mm}|p{59.5mm}|}
%		\cline{1-5}\cline{7-8}
%		\cell{24.5mm}{5mm}{~\wordoriginvnumber} & 
%		\cell{34.5mm}{5mm}{~\wordsignanddate} & 
%		\cell{24.5mm}{5mm}{~\wordinstinvnumber} & 
%		\cell{24.5mm}{5mm}{~\wordduplinvnumber} & 
%		\cell{34.5mm}{5mm}{~\wordsignanddate} &
%		\cell{21.0mm}{5mm}{} & 
%		\cell{59.5mm}{5mm}{~\wordreferencenumber} &
%		\cell{59.5mm}{5mm}{~\wordfirstapplication} \\
%		\cline{1-5}\cline{7-8}
%		\cell{24.5mm}{7mm}{} & & & & & & \cell{59.5mm}{7mm}{~\normalsize\@referencenumber} & \cell{59.5mm}{7mm}{~\normalsize\@firstapplication} \\
%		\cline{1-5}\cline{7-8}
%	\end{tabular}
%	\setlength{\tabcolsep}{\tabmarg}
%}
%\newcommand{\stampleftshort}{
%	\stampfontstyle
%	\begin{tabular}{|p{24.5mm}|p{34.5mm}|p{24.5mm}|p{24.5mm}|p{34.5mm}|p{21.5mm} p{60mm} p{60mm}}
%		\cline{1-5}
%		\cell{24.5mm}{5mm}{~\wordoriginvnumber} & 
%		\cell{34.5mm}{5mm}{~\wordsignanddate} & 
%		\cell{24.5mm}{5mm}{~\wordinstinvnumber} & 
%		\cell{24.5mm}{5mm}{~\wordduplinvnumber} & 
%		\cell{34.5mm}{5mm}{~\wordsignanddate} &
%		\cell{21.5mm}{5mm}{} & 
%		\cell{60mm}{5mm}{} &
%		\cell{60mm}{5mm}{} \\
%		\cline{1-5}
%		\cell{24.5mm}{7mm}{} & & & & & & & \\
%		\cline{1-5}
%	\end{tabular}
%	\setlength{\tabcolsep}{\tabmarg}
%}
%\newcommand{\stampleftonlyfirstapp}{
%	\stampfontstyle
%	\begin{tabular}{|p{24.5mm}|p{34.5mm}|p{24.5mm}|p{24.5mm}|p{34.5mm}|p{21.5mm} p{59.5mm}|p{59.5mm}|}
%		\cline{1-5}\cline{8-8}
%		\cell{24.5mm}{5mm}{~\wordoriginvnumber} & 
%		\cell{34.5mm}{5mm}{~\wordsignanddate} & 
%		\cell{24.5mm}{5mm}{~\wordinstinvnumber} & 
%		\cell{24.5mm}{5mm}{~\wordduplinvnumber} & 
%		\cell{34.5mm}{5mm}{~\wordsignanddate} &
%		\cell{21.0mm}{5mm}{} & 
%		\cell{59.5mm}{5mm}{} &
%		\cell{59.5mm}{5mm}{~\wordfirstapplication} \\
%		\cline{1-5}\cline{8-8}
%		\cell{24.5mm}{7mm}{} & & & & & & & \cell{59.5mm}{7mm}{~\normalsize\@firstapplication} \\
%		\cline{1-5}\cline{8-8}
%	\end{tabular}
%	\setlength{\tabcolsep}{\tabmarg}
%}
%\newcommand{\stampleftonlyrefnum}{
%	\stampfontstyle
%	\begin{tabular}{|p{24.5mm}|p{34.5mm}|p{24.5mm}|p{24.5mm}|p{34.5mm}|p{21.0mm}|p{59.5mm}|p{60.0mm}}
%		\cline{1-5}\cline{7-7}
%		\cell{24.5mm}{5mm}{~\wordoriginvnumber} & 
%		\cell{34.5mm}{5mm}{~\wordsignanddate} & 
%		\cell{24.5mm}{5mm}{~\wordinstinvnumber} & 
%		\cell{24.5mm}{5mm}{~\wordduplinvnumber} & 
%		\cell{34.5mm}{5mm}{~\wordsignanddate} &
%		\cell{21.0mm}{5mm}{} & 
%		\cell{59.5mm}{5mm}{~\wordreferencenumber} &
%		\cell{60.0mm}{5mm}{} \\
%		\cline{1-5}\cline{7-7}
%		\cell{24.5mm}{7mm}{} & & & & & & \cell{59.5mm}{7mm}{~\normalsize\@referencenumber} & \\
%		\cline{1-5}\cline{7-7}
%	\end{tabular}
%	\setlength{\tabcolsep}{\tabmarg}
%}

%
% \cellleft  - выравнивание будет по левому краю ячейки
% \cell  - выравнивание будет по центру ячейки
%

% Как хочет нормоконтроль - тоненькие линии
\def\stampfontstyle{%
	\setlength{\arrayrulewidth}{0.1mm}
	\setlength{\tabcolsep}{0mm}
	\leftstamptextsize
%	\raggedright
}
% Толстые линии
\def\stampfontstylebold{%
	\setlength{\arrayrulewidth}{0.5mm}
	\setlength{\tabcolsep}{0mm}
	\leftstamptextsize
	%	\raggedright
}

\newcommand{\stampleftfull}{
	\stampfontstyle
	\begin{tabular}{|p{24.9mm}|p{34.9mm}|p{24.9mm}|p{24.9mm}|p{34.9mm}|p{21.9mm}|p{59.9mm}|p{59.9mm}|}
		\cline{1-5}\cline{7-8}
		\celleft{24.9mm}{5mm}{~\wordoriginvnumber} & 
		\cellleft{34.9mm}{5mm}{~\wordsignanddate} & 
		\cellleft{24.9mm}{5mm}{~\wordinstinvnumber} & 
		\cellleft{24.9mm}{5mm}{~\wordduplinvnumber} & 
		\cellleft{34.9mm}{5mm}{~\wordsignanddate} &
		\cellleft{21.9mm}{5mm}{} & 
		\cellleftcenter{59.9mm}{5mm}{~\wordreferencenumber} &
		\cellleftcenter{59.9mm}{5mm}{~\wordfirstapplication} \\
		\cline{1-5}\cline{7-8}
%		\cell{24.9mm}{7mm}{} & & & & & & \cell{59.9mm}{7mm}{~\leftstamptextsizesec\@referencenumber} & \cell{59.9mm}{7mm}{~\leftstamptextsizesec\@firstapplication} \\
		\cline{1-5}\cline{7-8}
	\end{tabular}
	\setlength{\tabcolsep}{\tabmarg}
}
\newcommand{\stampleftshort}{
	\stampfontstyle
	\begin{tabular}{|p{24.9mm}|p{34.9mm}|p{24.9mm}|p{24.9mm}|p{34.9mm}|p{21.9mm} p{60mm} p{60mm}}
		\cline{1-5}
		\cellleft{24.9mm}{5mm}{~\wordoriginvnumber} & 
		\cellleft{34.9mm}{5mm}{~\wordsignanddate} & 
		\cellleft{24.9mm}{5mm}{~\wordinstinvnumber} & 
		\cellleft{24.9mm}{5mm}{~\wordduplinvnumber} & 
		\cellleft{34.9mm}{5mm}{~\wordsignanddate} &
		\cellleft{21.9mm}{5mm}{} & 
		\cell{60mm}{5mm}{} &
		\cell{60mm}{5mm}{} \\
		\cline{1-5}
		\cell{24.9mm}{7mm}{} & & & & & & & \\
		\cline{1-5}
	\end{tabular}
	\setlength{\tabcolsep}{\tabmarg}
}
\newcommand{\stampleftshortbold}{
	\stampfontstylebold
	\begin{tabular}{|p{24.9mm}|p{34.9mm}|p{24.9mm}|p{24.9mm}|p{34.9mm}|p{21.9mm} p{60mm} p{60mm}}
		\cline{1-5}
		\cellleft{24.9mm}{5mm}{~\wordoriginvnumber} & 
		\cellleft{34.9mm}{5mm}{~\wordsignanddate} & 
		\cellleft{24.9mm}{5mm}{~\wordinstinvnumber} & 
		\cellleft{24.9mm}{5mm}{~\wordduplinvnumber} & 
		\cellleft{34.9mm}{5mm}{~\wordsignanddate} &
		\cellleft{21.9mm}{5mm}{} & 
		\cell{60mm}{5mm}{} &
		\cell{60mm}{5mm}{} \\
		\cline{1-5}
		\cell{24.9mm}{7mm}{} & & & & & & & \\
		\cline{1-5}
	\end{tabular}
	\setlength{\tabcolsep}{\tabmarg}
}
\newcommand{\stampleftonlyfirstapp}{ % НЕ ПО ГОСТ, НО ТАК ХОЧЕТ НОРМОКОНТРОЛЬ? Или просто привыкли, гады
	\stampfontstyle
	\begin{tabular}{|p{24.9mm}|p{34.9mm}|p{24.9mm}|p{24.9mm}|p{34.9mm}|p{59.9mm}|p{34.9mm}|p{46.9mm}}

		\cline{1-5}\cline{7-7}
		\cellleft{24.9mm}{5mm}{~\wordoriginvnumber} & 
		\cellleft{34.9mm}{5mm}{~\wordsignanddate} & 
		\cellleft{24.9mm}{5mm}{~\wordinstinvnumber} & 
		\cellleft{24.9mm}{5mm}{~\wordduplinvnumber} & 
		\cellleft{34.9mm}{5mm}{~\wordsignanddate} &
		\cell{59.9mm}{5mm}{} & 		
		\cellleftcenter{34.9mm}{5mm}{~\wordfirstapplication} &
		\cell{46.9mm}{5mm}{} \\
		\cline{1-5}\cline{7-7}
		\cell{24.9mm}{7mm}{} & & & & & & \cell{34.9mm}{7mm}{\@firstapplication} & \\
		\cline{1-5}\cline{7-7}
	\end{tabular}
	\setlength{\tabcolsep}{\tabmarg}
}
\newcommand{\stampleftonlyrefnum}{
	\stampfontstyle
	\begin{tabular}{|p{24.9mm}|p{34.9mm}|p{24.9mm}|p{24.9mm}|p{34.9mm}|p{21.9mm}|p{59.9mm}|p{59.9mm}}
		\cline{1-5}\cline{7-7}
		\cellleft{24.9mm}{5mm}{~\wordoriginvnumber} & 
		\cellleft{34.9mm}{5mm}{~\wordsignanddate} & 
		\cellleft{24.9mm}{5mm}{~\wordinstinvnumber} & 
		\cellleft{24.9mm}{5mm}{~\wordduplinvnumber} & 
		\cellleft{34.9mm}{5mm}{~\wordsignanddate} &
		\cell{21.9mm}{5mm}{} & 
		\cellleftcenter{59.9mm}{5mm}{~\wordreferencenumber} &
		\cell{59.9mm}{5mm}{} \\
		\cline{1-5}\cline{7-7}
		\cell{24.95mm}{7mm}{} & & & & & & \cell{59.9mm}{7mm}{~\leftstamptextsizesec\@referencenumber} & \\
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
\newcommand{\reglisttableESPDoldasingost}{ 
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

% Лист регистрации так, как хочет его величество нормоконтроль - тонкие линии, шрифт не гост, первая графа 12мм
\newcommand{\reglisttableESPD}{ 
	%	\setlength{\arrayrulewidth}{0.5mm} 
	\setlength{\arrayrulewidth}{0.1mm}
	\renewcommand\baselinestretch{1.0} % Немного сожмем таблицу 
	\vspace{-5mm} % Сдвижка вверх потому что сделали поле верхнее 30 мм вместо 25
%	\vspace{-7mm} % Сдвижка вверх потому что сделали поле верхнее 30 мм вместо 25
	%	\fontspec{GOST type A Bold Italic} % Если ГОСТ ом
	\hbox{% 
		%		\sectionsize % 14 - так лучше с ГОСТовским шрифтом
		\lusize % если без ГОСТовского шрифта
		\begin{tabular}{|c|c|c|c|c|c|c|c|c|c|}
			\hline
			%			\multicolumn{10}{|c|}{\cell{184.5mm}{9.5mm}{\approvalsize \wordregistration}} \\ % Так лучше с ГОСТ овским шрифтом
			\multicolumn{10}{|c|}{\cell{185mm}{9.5mm}{\sectionsize \wordregistration}} \\ % Так лучше с обычным шрифтом
			%			\multicolumn{10}{|c|}{\cell{184.5mm}{9.5mm}{\wordregistration}} \\ % Так лучше с обычным шрифтом
			\hline
			& \multicolumn{4}{c|}{\cell{73.9mm}{5.9mm}{\wordsheetnumber}} & & & & & \\
			\cline{2-5}
%			\vcell{7.9mm}{24.9mm}{18.9mm}{\wordchanges} &
			\vcell{11.9mm}{24.9mm}{18.9mm}{\wordchanges} &
			\celltop{18.9mm}{18.9mm}{\wordchanged} & \celltop{18.9mm}{18.9mm}{\wordreplaced} & \celltop{18.9mm}{18.9mm}{\wordnew} & \celltop{18.9mm}{18.9mm}{\wordannulledESPD} & \vcell{19.9mm}{24.9mm}{18.9mm}{\wordsheetsindocESPD} & \vcell{24.9mm}{24.9mm}{18.9mm}{\worddocnumberESPD} & \vcell{24.9mm}{24.9mm}{18.9mm}{\wordincldocanddateESPD} & \vcell{14.9mm}{24.9mm}{18.9mm}{\wordsign} & \vcell{11.9mm}{24.9mm}{18.9mm}{\worddate} \\
%			\cell{18.9mm}{18.9mm}{\wordchanged} & \cell{18.9mm}{18.9mm}{\wordreplaced} & \cell{18.9mm}{18.9mm}{\wordnew} & \cell{18.9mm}{18.9mm}{\wordannulledESPD} & \vcell{19.9mm}{24.9mm}{18.9mm}{\wordsheetsindocESPD} & \vcell{24.9mm}{24.9mm}{18.9mm}{\worddocnumberESPD} & \vcell{24.9mm}{24.9mm}{18.9mm}{\wordincldocanddateESPD} & \vcell{14.9mm}{24.9mm}{18.9mm}{\wordsign} & \vcell{11.9mm}{24.9mm}{18.9mm}{\worddate} \\
			\hline % горизонтальная одинарная линия
			\cell{6.9mm}{6.9mm}{} & & & & & & & & & \\ %1
			\hline
			\cell{6.9mm}{6.9mm}{} & & & & & & & & & \\ %2
			\hline
			\cell{6.9mm}{6.9mm}{} & & & & & & & & & \\ %3
			\hline
			\cell{6.9mm}{6.9mm}{} & & & & & & & & & \\ %4
			\hline
			\cell{6.9mm}{6.9mm}{} & & & & & & & & & \\ %5
			\hline
			\cell{6.9mm}{6.9mm}{} & & & & & & & & & \\ %6
			\hline
			\cell{6.9mm}{6.9mm}{} & & & & & & & & & \\ %7
			\hline
			\cell{6.9mm}{6.9mm}{} & & & & & & & & & \\ %8
			\hline
			\cell{6.9mm}{6.9mm}{} & & & & & & & & & \\ %9
			\hline
			\cell{6.9mm}{6.9mm}{} & & & & & & & & & \\ %10
			\hline
			\cell{6.9mm}{6.9mm}{} & & & & & & & & & \\ %11
			\hline
			\cell{6.9mm}{6.9mm}{} & & & & & & & & & \\ %12
			\hline
			\cell{6.9mm}{6.9mm}{} & & & & & & & & & \\ %13
			\hline
			\cell{6.9mm}{6.9mm}{} & & & & & & & & & \\ %14
			\hline
			\cell{6.9mm}{6.9mm}{} & & & & & & & & & \\ %15
			\hline
			\cell{6.9mm}{6.9mm}{} & & & & & & & & & \\ %16
			\hline
			\cell{6.9mm}{6.9mm}{} & & & & & & & & & \\ %17
			\hline
			\cell{6.9mm}{6.9mm}{} & & & & & & & & & \\ %18
			\hline
			\cell{6.9mm}{6.9mm}{} & & & & & & & & & \\ %19
			\hline
			\cell{6.9mm}{6.9mm}{} & & & & & & & & & \\ %20
			\hline
			\cell{6.9mm}{6.9mm}{} & & & & & & & & & \\ %21
			\hline
			\cell{6.9mm}{6.9mm}{} & & & & & & & & & \\ %22
			\hline
			\cell{6.9mm}{6.9mm}{} & & & & & & & & & \\ %23
			\hline
			\cell{6.9mm}{6.9mm}{} & & & & & & & & & \\ %24
			\hline
			\cell{6.9mm}{6.9mm}{} & & & & & & & & & \\ %25
			\hline
			\cell{6.9mm}{6.9mm}{} & & & & & & & & & \\ %26
			\hline
			\cell{6.9mm}{6.9mm}{} & & & & & & & & & \\ %27
			\hline
			\cell{6.9mm}{6.9mm}{} & & & & & & & & & \\ %28
			\hline
			\cell{6.9mm}{6.9mm}{} & & & & & & & & & \\ %29
			\hline
			\cell{6.9mm}{6.9mm}{} & & & & & & & & & \\ %30
			\hline
			\cell{6.9mm}{6.9mm}{} & & & & & & & & & \\ %31
			\hline
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
\def\titlelinespreadlu{1.4}%{1.0} % Межстрочный интервал титула в ЛУ
\def\titlelinespread{1.0}%{1.0} % Межстрочный интервал титула
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Лист утверждения
\newcommand{\makelistapproval}[1]{
\begin{titlepage}
  \reversemarginpar
%  \setlength{\marginparsep}{11.5mm}
  \setlength{\marginparsep}{17mm} % как по ГОСТу
%  \setlength{\marginparsep}{9mm} % как хочет? нормоконтроль
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
%  \vskip -15mm
  \vskip -7mm
  \centering
  \protectlinebreak  
  \begin{tabular}{c c c}
	\parbox[t][2cm]{0.45\textwidth}{
		\centering\MakeUppercase{\wordagree}\vskip 1mm\@customerrank\vskip 1mm\onlyauthor{\@customername}
	} &

	% Центральная фантомная для выравнивания
	\parbox[t]{0.08\textwidth}{\phantom{1}} &
	
	\parbox[t][2cm]{0.4\textwidth}{
		\centering\MakeUppercase{\wordapprove}\vskip 1mm\@chiefconstructorrank\vskip 1mm\onlyauthor{\@chiefconstructorname}
	}
  \end{tabular}

  {\vskip 3cm
%  \linespread{1.0}\titlesize\MakeUppercase{\@title}
  \linespread{\titlelinespreadlu}\titlesize{\@title}
  \vskip 4mm}
  \normalsize\textbf{\@type}
  \vskip 4mm
%  \normalsize{\MakeUppercase{\textbf{\wordapproval}}} % 14
  \biggersize{\MakeUppercase{\textbf{\wordapproval}}} % 16
  \vskip 2mm
  %
  % Original:
  %\normalsize{\fullcodeapp}
  %
  % New:
  \ifthenelse{\equal{\@typecode}{СП}}{
	\normalsize{\textbf{\shortcodeapp}}  
  }{%
  	\normalsize{\textbf{\fullcodeapp}}
  }
  %
%  \vskip 4mm
  \vskip \fill%4mm %

  \begin{tabular}{c c c}
    \parbox[t]{0.45\textwidth}{\centering
   	% левая колонка:
	\if& \@headofdepartmentname &	    
		&
	\else
     	\centering{\MakeUppercase{\wordagree}}\vskip 1mm
%		\titleauthor{\@fromcustomername}{\@fromcustomerrank} } &  
		\@fromcustomerrank\vskip 1mm\onlyauthor{\@fromcustomername} } &                    	
	\fi
	
	% Центральная фантомная для выравнивания
    \parbox[t]{0.08\textwidth}{\phantom{1}} &

    \parbox[t]{0.4\textwidth}{\raggedright%  \centering %  
	% правая колонка:
    	
%    \phantom{Фантомная строка} % Из-за сдвига колонки на слово "согласовано"   	
    \vskip 2.5mm
       	
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
   		  \raggedright{\wordperformer}\\ \onlyauthor{\@authorname}
   		\else
   		  \raggedright{\wordperformers}\\ \onlyauthor{\@authori}\onlyauthor{\@authorii}\onlyauthor{\@authoriii}\onlyauthor{\@authoriv}\onlyauthor{\@authorv}
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
\newcommand{\makelistapprovalnocustomer}[1]{
	\begin{titlepage}
		\reversemarginpar
%        \setlength{\marginparsep}{11.5mm}
		\setlength{\marginparsep}{17mm} % как по ГОСТу
%        \setlength{\marginparsep}{9mm} % как хочет? нормоконтроль
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
		%  \vskip -\baselineskip
		%  \vskip -15mm
		\vskip -7mm
		\centering
		\protectlinebreak  
		\begin{tabular}{c c c}
			\parbox[t][2cm]{0.45\textwidth}{
				~
			} &
		
			% Центральная фантомная для выравнивания
			\parbox[t]{0.08\textwidth}{\phantom{1}} &
			
			\parbox[t][2cm]{0.4\textwidth}{
				\centering\MakeUppercase{\wordapprove}\vskip 2mm\@chiefconstructorrank\vskip 1mm\onlyauthor{\@chiefconstructorname}
			}
		\end{tabular}
	
		{\vskip 3cm
		%  \linespread{1.0}\titlesize\MakeUppercase{\@title}
		\linespread{\titlelinespreadlu}\titlesize{\@title}
		\vskip 4mm}
		\normalsize\textbf{\@type}
		\vskip 4mm
		%  \normalsize{\MakeUppercase{\textbf{\wordapproval}}} % 14
		\biggersize{\MakeUppercase{\textbf{\wordapproval}}} % 16
		\vskip 2mm		
		%
		% Original:
		%\normalsize{\fullcodeapp}
		%
		% New:
		\ifthenelse{\equal{\@typecode}{СП}}{
			\normalsize\textbf{\shortcodeapp}  
		}{%
			\normalsize\textbf{\fullcodeapp}
		}
		%		
		\vskip \fill
		\begin{tabular}{c c c}
			\parbox[t]{0.45\textwidth}{\raggedright
				~
%				% левая колонка:
%				\if& \@headofdepartmentname &	    
%				%&
%				\else
%				\titleauthor{\@fromcustomername}{\@fromcustomerrank}%} &                       	
%				\fi
			}
		
			% Центральная фантомная для выравнивания
			\parbox[t]{0.08\textwidth}{\phantom{1}} &
			
			\parbox[t]{0.4\textwidth}{\raggedright    
				% правая колонка:
			
%				\phantom{Фантомная строка} % Из-за сдвига колонки на слово "согласовано" 
				\vskip 2.5mm
				
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
				\raggedright{\wordperformer}\\\onlyauthor{\@authorname}
				\else
				\raggedright{\wordperformers}\\\onlyauthor{\@authori}\onlyauthor{\@authorii}\onlyauthor{\@authoriii}\onlyauthor{\@authoriv}\onlyauthor{\@authorv}
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
% Лист утверждения без подписей от заказчика и без нормоконтроллера
\newcommand{\makelistapprovalnocustomernonormocontroller}[1]{
	\begin{titlepage}
		\reversemarginpar
		%  \setlength{\marginparsep}{11.5mm}
		\setlength{\marginparsep}{17mm} % как по ГОСТу
		%  \setlength{\marginparsep}{9mm} % как хочет? нормоконтроль
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
		%  \vskip -\baselineskip
		%  \vskip -15mm
		\vskip -7mm
		\centering
		\protectlinebreak  
		\begin{tabular}{c c c}
			\parbox[t][2cm]{0.45\textwidth}{
				~
			} &
		
			% Центральная фантомная для выравнивания
			\parbox[t]{0.08\textwidth}{\phantom{1}} &
			
			\parbox[t][2cm]{0.4\textwidth}{
				\centering\MakeUppercase{\wordapprove}\vskip 2mm\@chiefconstructorrank\vskip 1mm\onlyauthor{\@chiefconstructorname}
			}
		\end{tabular}
	
		{\vskip 3cm
		%  \linespread{1.0}\titlesize\MakeUppercase{\@title}
		\linespread{\titlelinespreadlu}\titlesize{\@title}
		\vskip 4mm}
		\normalsize\textbf{\@type}
		\vskip 4mm
		%  \normalsize{\MakeUppercase{\textbf{\wordapproval}}} % 14
		\biggersize{\MakeUppercase{\textbf{\wordapproval}}} % 16
		\vskip 2mm		
		%
		% Original:
		%\normalsize{\fullcodeapp}
		%
		% New:
		\ifthenelse{\equal{\@typecode}{СП}}{
			\normalsize\textbf{\shortcodeapp}  
		}{%
			\normalsize\textbf{\fullcodeapp}
		}
		%  \vskip 4mm
		\vskip \fill%4mm %
		\begin{tabular}{c c c}
			\parbox[t]{0.45\textwidth}{\raggedright
				~
				%				% левая колонка:
				%				\if& \@headofdepartmentname &	    
				%				%&
				%				\else
				%				\titleauthor{\@fromcustomername}{\@fromcustomerrank}%} &                       	
				%				\fi
			}
		
			% Центральная фантомная для выравнивания
			\parbox[t]{0.08\textwidth}{\phantom{1}} &
			
			\parbox[t]{0.4\textwidth}{\raggedright    
				% правая колонка:
				
				%    \phantom{Фантомная строка} % Из-за сдвига колонки на слово "согласовано"   	
				\vskip 2.5mm
				
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
				\raggedright{\wordperformer}\\\onlyauthor{\@authorname}
				\else
				\raggedright{\wordperformers}\\\onlyauthor{\@authori}\onlyauthor{\@authorii}\onlyauthor{\@authoriii}\onlyauthor{\@authoriv}\onlyauthor{\@authorv}
				\fi
				\fi				
%				\if& \@normocontrollername &	
%				\else
%				\titleauthor{\@normocontrollername}{\@normocontrollerrank}
%				\fi				
			}
		\end{tabular}
		\vskip \fill
		\@year
		\vskip 5mm
	\end{titlepage}
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Титульный лист без подписей от заказчика без слов ЛИСТ УТВЕРЖДЕНИЯ (для техзадания)
% но с подписями слева
\newcommand{\makelisttitlenocustomernonormocontroller}[1]{
	\begin{titlepage}
		\reversemarginpar
		%  \setlength{\marginparsep}{11.5mm}
		\setlength{\marginparsep}{17mm} % как по ГОСТу
		%  \setlength{\marginparsep}{9mm} % как хочет? нормоконтроль
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
		%  \vskip -\baselineskip
		%  \vskip -15mm
		\vskip -7mm
%		\vskip 6mm
		\centering
		\protectlinebreak  
		\begin{tabular}{c c c}
			\parbox[t][2cm]{0.45\textwidth}{
				~
			} &
		
			% Центральная фантомная для выравнивания
			\parbox[t]{0.08\textwidth}{\phantom{1}} &
			
			\parbox[t][2cm]{0.4\textwidth}{
				\centering\MakeUppercase{\wordapprove}\vskip 2mm\@chiefconstructorrank\vskip 1mm\onlyauthor{\@chiefconstructorname}
			}
		\end{tabular}
	
		{\vskip 3cm
		%  \linespread{1.0}\titlesize\MakeUppercase{\@title}
		\linespread{\titlelinespreadlu}\titlesize{\@title}
		\vskip 4mm}
		\normalsize\textbf{\@type}
%		\vskip 4mm
%		%  \normalsize{\MakeUppercase{\textbf{\wordapproval}}} % 14
%		\biggersize{\MakeUppercase{\textbf{\wordapproval}}} % 16
%		\vskip 4mm		
		\vskip 2mm		
		%
		% Original:
		%\normalsize{\fullcodeapp}
		%
		% New:
		\ifthenelse{\equal{\@typecode}{СП} \OR \equal{\@typecode}{ТЗ}}{
			\normalsize\textbf{\shortcode}  
		}{%
			\normalsize\textbf{\fullcode}
		}
		\vskip 4mm
		\textbf{\wordsheets~\getnum{lastpage}}	
		%		
		\vskip \fill
		\begin{tabular}{c c c}
			\parbox[t]{0.45\textwidth}{\raggedright
				~
				%				% левая колонка:
				%				\if& \@headofdepartmentname &	    
				%				%&
				%				\else
				%				\titleauthor{\@fromcustomername}{\@fromcustomerrank}%} &                       	
				%				\fi
			}
		
			% Центральная фантомная для выравнивания
			\parbox[t]{0.08\textwidth}{\phantom{1}} &
			
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
				\raggedright{\wordperformer}\\\onlyauthor{\@authorname}
				\else
				\raggedright{\wordperformers}\\\onlyauthor{\@authori}\onlyauthor{\@authorii}\onlyauthor{\@authoriii}\onlyauthor{\@authoriv}\onlyauthor{\@authorv}
				\fi
				\fi				
				%				\if& \@normocontrollername &	
				%				\else
				%				\titleauthor{\@normocontrollername}{\@normocontrollerrank}
				%				\fi				
			}
		\end{tabular}
		\vskip \fill
		\@year
		\vskip 5mm
	\end{titlepage}
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Титульный лист (без подписей)
\newcommand{\makelisttitle}[1]{
%\newcommand{\maketitle}{
\begin{titlepage}
  \reversemarginpar
  \setlength{\marginparsep}{17mm}
%  \marginpar{\vskip -\topfield \hbox{\rotatebox{90}{\stampleftfull}}}
%  \marginpar{\vskip -\topfield \hbox{\rotatebox{90}{\stampleftshort}}}
%  \marginpar{\vskip -\topfield \hbox{\rotatebox{90}{\stampleftonlyfirstapp}}}
%  \marginpar{\vskip -\topfield \hbox{\rotatebox{90}{\stampleftonlyrefnum}}}	

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
%  \vskip -15mm
  \vskip 6mm
  %
  % Original:
  %\parbox[t]{0.4\textwidth}{\centering\MakeUppercase{\wordapproved}\\\fullcodeapp}
  %
  % Fixed:
  \ifthenelse{\equal{\@typecode}{СП} \OR \equal{\@typecode}{ТЗ}}{
  	\parbox[t]{0.4\textwidth}{\centering\MakeUppercase{\wordapproved}\vspace{2mm}\\\shortcodeapp}
  }{%
  	\parbox[t]{0.4\textwidth}{\centering\MakeUppercase{\wordapproved}\vspace{2mm}\\\fullcodeapp}
  }
  %
%  \vskip 8cm
  \vskip 4cm
  \centering
  \protectlinebreak
%  \linespread{1.0}\titlesize\MakeUppercase{\@title}
  \linespread{\titlelinespread}\titlesize{\@title}
%  \vskip 4mm
%  \vskip 2mm
%  \vskip 1mm
%  \vskip 0.5mm
  \\% без интервала, просто перенос строки
  \normalsize\textbf{\@type}  
%  \vskip 4mm
%  \vskip 2mm
%  \vskip 0.1mm
  \\ % без интервала, просто перенос строки
  
  %
  % Original:
  %{\fullcode}
  %
  % Fixed:
  \ifthenelse{\equal{\@typecode}{СП} \OR \equal{\@typecode}{ТЗ}}{
	\textbf{\shortcode}
  }{%
	\textbf{\fullcode}
  }
  %
  \vskip 4mm
%  \vskip 2mm  
  \textbf{\wordsheets~\getnum{lastpage}}
  \vskip \fill
  \@year
  \vskip 5mm
  
\end{titlepage}
\stepcounter{page}
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Титульный лист (без подписей и без утвержден)
\newcommand{\makelisttitlesimple}[1]{
	\begin{titlepage}
		\reversemarginpar
		\setlength{\marginparsep}{17mm}
		%\marginpar{\vskip -\topfield \hbox{\rotatebox{90}{\stampleftfull}}}
		%\marginpar{\vskip -\topfield \hbox{\rotatebox{90}{\stampleftshort}}}
		%\marginpar{\vskip -\topfield \hbox{\rotatebox{90}{\stampleftonlyfirstapp}}}
		%\marginpar{\vskip -\topfield \hbox{\rotatebox{90}{\stampleftonlyrefnum}}}	
		
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
		%  \vskip -15mm
		\vskip 6mm
		%
		% Original:
		%\parbox[t]{0.4\textwidth}{\centering\MakeUppercase{\wordapproved}\\\fullcodeapp}
		%
		% Fixed:
%		\ifthenelse{\equal{\@typecode}{СП}}{
%			\parbox[t]{0.4\textwidth}{\centering\MakeUppercase{\wordapproved}\\\shortcodeapp}
%		}{%
%			\parbox[t]{0.4\textwidth}{\centering\MakeUppercase{\wordapproved}\\\fullcodeapp}
%		}
		%
		%  \vskip 8cm
		\vskip 4cm
		\centering
		\protectlinebreak
%		\linespread{1.0}\titlesize\MakeUppercase{\@title}
		\linespread{\titlelinespreadlu}\titlesize{\@title}
		%  \vskip 4mm
		%  \vskip 2mm
		%  \vskip 1mm
		%  \vskip 0.5mm
		\\% без интервала, просто перенос строки
		
		\ifthenelse{\equal{\@typecode}{addition}}{
			%
		}{%			
			\normalsize\textbf{\@type}  
			%  \vskip 4mm
			%  \vskip 2mm
			%  \vskip 0.1mm
			\\ % без интервала, просто перенос строки
			%
			% Original:
			%{\fullcode}
			%
			% Fixed:
			\ifthenelse{\equal{\@typecode}{СП} \OR \equal{\@typecode}{ТЗ}}{
				\textbf{\shortcode}
			}{%
				\textbf{\fullcode}
			}
		}
		%
		\vskip 4mm
		%  \vskip 2mm  		
		\textbf{\wordsheets~\getnum{lastpage}}
		\vskip \fill
		\@year
		\vskip 5mm
		
	\end{titlepage}
	\stepcounter{page}
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Подписи в конце текста документа (для ТЗ)
\newcommand{\makeaftersignatures}{
\begin{tabular}{c c c}
	\parbox[t]{0.4\textwidth}{\raggedright
		~
%		% левая колонка:
%		\if& \@headofdepartmentname &	    
%		%&
%		\else
%		\titleauthor{\@fromcustomername}{\@fromcustomerrank}%} &                       	
%		\fi
	}
	
	% Центральная фантомная для выравнивания
	\parbox[t]{0.08\textwidth}{\phantom{1}} &
	
	\parbox[t]{0.4\textwidth}{\raggedright    
		% правая колонка:		
		\titleauthornodate{\@developername}{\@developerrankafter} 				
	}
\end{tabular}
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Содержание
\newcommand\@pnumwidth{1em}
\newcommand\@tocrmarg{4em}
%
%\newcommand\@dotsep{4} % расстояние между точками оглавления, очевидно в точках
%\newcommand\@dotsep{2}
\newcommand\@dotsep{0.01} % чтобы как в ворде...
%
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

% перенес из под \def\illustration
\newcounter{illustration}
\renewcommand{\theillustration}{\wordrefimage\arabic{illustration}} % Без номера раздела
%\renewcommand{\theillustration}{\wordrefimage\arabic{section}.\arabic{illustration}} % С номером раздела
\newcommand{\theunderillustration}{\wordimage~\arabic{illustration}} % Без номера раздела

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
	    \picturetextsize\centering{\wordimage~--~{#2}}
    \else    	
%	    Если нумерация через точку как по ГОСТ 19	
%		\picturetextsize\centering{\wordimage~\arabic{illustration}.~{#2}} 
%       Если нумрация через дефис как хочет нормоконтроль
%		\picturetextsize\centering{\wordimage~\arabic{illustration}~--~{#2}} % Без номера раздела
%		\picturetextsize\centering{\wordimage~\arabic{section}.\arabic{illustration}~--~{#2}} % C номером раздела

		\picturetextsize\centering{\theunderillustration~--~{#2}}
    \fi
    \ifx&#5&\else
      \label{#5} % было     \label{img:#5}
%      \label{\arabic{section}. #5} % было
    \fi  
  \end{center}

  \vspace{2mm}
  \par % конец параграфа
}

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
\renewcommand{\footnoterule}{\raggedright\rule{3cm}{0.1pt}\vskip 2mm}
\def\@makefnmark{\@textsuperscript{\footnotesize\@thefnmark)}}
\def\@makefntext#1{\hskip 1cm\@makefnmark\footnotetextsize#1}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Перечисления
\def\theenumi{\arabic{enumi}}
\def\labelenumi{\theenumi)}
%\def\p@enumi{\theenumi \leftmargini}
%
\def\theenumii{--}
\def\labelenumii{\theenumii}
%\def\p@enumii{\theenumii \leftmarginii}
%
\setlength{\labelsep}{2mm}%{5mm}% Зазор между "черточкой" списка (маркером) и текстом
\setlength{\labelwidth}{-\parindent}
\addtolength{\labelwidth}{-\labelsep}
\addtolength{\labelwidth}{-4mm}
%
\def\@listi {\leftmargin 0mm} % Абзацный отступ списка 1 уровня
%\def\@listii {\leftmargin 10mm} % Абзацный отступ списка 2 уровня - при абзацном отступе 1.0
\def\@listii {\leftmargin 12.5mm} % Абзацный отступ списка 2 уровня - при абзацном отступе 1.25
%
% Перечисление для формул c вравниванием отступов иерархии вложенности
\newcommand{\formulalist}[1]{%
{
%	\setlength{\labelsep}{3.5mm}% При использовании абзацного отступа 1.0
	\setlength{\labelwidth}{0mm}% При использовании абзацного отступа 1.0

	\setlength{\labelsep}{5.75mm}%При использовании абзацного отступа 1.25
%	\setlength{\labelwidth}{-2.5mm}% При использовании абзацного отступа 1.25 - НЕТ!


	\begin{itemize}
		{#1}
	\end{itemize}
}
}%
\newcommand{\formulalistsec}[1]{%
{
%	\setlength{\labelsep}{3.5mm}% При использовании абзацного отступа 1.0
%	\setlength{\labelwidth}{-10mm}% При использовании абзацного отступа 1.0

%	\setlength{\labelsep}{5.75mm}%При использовании абзацного отступа 1.25
%	\setlength{\labelwidth}{-12.5mm}% При использовании абзацного отступа 1.25

	\setlength{\labelsep}{6mm}%При использовании абзацного отступа 1.25
	\setlength{\labelwidth}{-12.5mm}% При использовании абзацного отступа 1.25
		
	\begin{itemize}
		{#1}
	\end{itemize}
}
}%
\newcommand{\formulalistthrd}[1]{%
	{
		%	\setlength{\labelsep}{3.5mm}% При использовании абзацного отступа 1.0
		%	\setlength{\labelwidth}{-10mm}% При использовании абзацного отступа 1.0
		
		%	\setlength{\labelsep}{5.75mm}%При использовании абзацного отступа 1.25
		%	\setlength{\labelwidth}{-12.5mm}% При использовании абзацного отступа 1.25
		
		\setlength{\labelsep}{6mm}%При использовании абзацного отступа 1.25
		\setlength{\labelwidth}{-12.5mm}% При использовании абзацного отступа 1.25
		
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
%
%  	\writesection{\wordbibliography}
%    \addcontentsline{toc}{attachment}{\wordbibliography} % Переставлено сюда
%	
%	\ifthenelse{\equal{\@typecode}{81}}{
	\ifthenelse{\equal{\@bibtype}{1}}{
		\section{\wordbibliographysecond}
	}{
		\writesection{\wordbibliography} % В противном случае стандартная библиография
		\addcontentsline{toc}{attachment}{\wordbibliography}
	}
	%
	% Вставка текста из переменной
	\ifthenelse{\equal{\@bibtext}{}}{
		% Если переменная пуста
		% Ничего не делаем
	}{
		% Если переменная не пуста, вставляем текст
		{\@bibtext} % Вставляем текст курсивом или другим нужным форматом
	}
  	%
  	\list{\@biblabel{\@arabic\c@enumiv}}
    {%
     % Читерство
     %
%     \itemindent -7mm	
	 \itemindent -5mm		
	 \labelsep 2mm	
     %
     % Штатный вариант
     %
%     \settowidth\labelwidth{\@biblabel{#1}}
%     \leftmargin\labelwidth
%     \advance\leftmargin\labelsep
     %
     \usecounter{enumiv}
     \let\p@enumiv\@empty
     \renewcommand\theenumiv{\@arabic\c@enumiv}}
}
{
  \endlist
%  \addcontentsline{toc}{attachment}{\wordbibliography}
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
		\ifthenelse{\equal{\@typecode}{addition}}{
			% Нет колонтитула
		}{\ifthenelse{\equal{\@typecode}{СП}}{
		\hbox to \textwidth{\hfil\shortcode\hfil}
		}{%
		 	\hbox to \textwidth{\hfil\fullcode\hfil}
		}
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
		\marginpar{\vskip -3.5cm \hbox{\rotatebox{90}{\stampleftshortbold}}}
	}
	% Основная таблица ИУЛ
	\reversemarginpar
%	\setlength{\marginparsep}{5.2mm}
	\setlength{\marginparsep}{4.4mm}
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
	\setlength{\arrayrulewidth}{0.1mm}%{0.5mm}  
	{%
		\begin{longtable}[c]{|>{\centering}m{13mm}|>{\centering}m{55mm}|>{\raggedright}m{55mm}|>{\centering}m{20mm}|>{\centering}m{20mm}|}
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
	\begin{longtable}[c]{|>{\centering}m{25mm}|>{\raggedright}m{150mm}|}
		\hline
%		MD5 & 
		SHA256 & 
		{\@iulcontrolsumm} \tabularnewline
		\hline
	\end{longtable}
	}
	{%
		\begin{longtable}[c]{|>{\centering}m{57mm}|>{\centering}m{57mm}|>{\centering}m{57mm}|}
			\hline
			Примечание\\{\@iulnote} & ~ & ~ \tabularnewline
			\hline
		\end{longtable}
	}
	{%
	\begin{longtable}[c]{|>{\raggedright}m{20mm}|>{\raggedright}m{50mm}|>{\centering}m{47mm}|>{\centering}m{50mm}|}
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
%	\setlength{\arrayrulewidth}{0.5mm} 
%	\vspace{24.09cm}
	\setlength{\arrayrulewidth}{0.1mm}
	\vspace{24.15cm}
	{%
		\begin{longtable}[c]{|>{\raggedright}m{75mm}|>{\centering}m{52mm}|>{\centering}m{20mm}|>{\centering}m{20mm}|}
			\hline
			\multirow{2}*{Информационно-удостоверяющий лист} & \multirow{2}*{\fullcode-УЛ} & Лист & Листов \tabularnewline
			\cline{3-4}
			~ & ~ & 1 & 1 \tabularnewline			
			\hline
		\end{longtable}
	}
}
