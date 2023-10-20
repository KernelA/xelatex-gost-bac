# ВКР бакалавра или магистра

![XeLaTeX auto compile](https://github.com/KernelA/xelatex-gost-bac/workflows/XeLaTeX%20auto%20compile/badge.svg?branch=master)

Шаблон для оформления ВКР бакалавра или магистра в XeLaTeX. Шаблон представлен в виде класса документа `bomgost.cls`.

[Статья на Habr с описанием некоторых деталей](https://habr.com/p/764596/)

## Интерактивный пример в Overleaf

[Проект в Overleaf (нужна регистрация для просмотра)](https://www.overleaf.com/read/hvxgxfnsskrm)

## Пример оформления

Начиная c v0.1.1.3 пример можно посмотреть после запуска конвеера через GitHub Actions. [В разделе Artifacts](https://github.com/actions/upload-artifact#where-does-the-upload-go) будет архив с pdf документом, который можно скачать.

## Возможные проблемы

Для корректного оформления оглавления и подсчёта значений счётчиков необходимо **2 запуска** компиляции документа.

По умолчанию установлены отступы от краёв страницы, имеющие определённый размер. При печати через программу просмотра pdf файлов поля могут не соответствовать установленным. Одна из причин такого результата - это масштабирование документа при печати. Например, Adobe reader может уменьшать масштаб документа, что приводит к большим отступам на бумаге после печати. Поэтому при печати важно смотреть на установленные параметры.

## Список использованных пакетов

Список всех пакетов, которые используются в шаблоне, приведён в [Wiki проекта](https://github.com/KernelA/xelatex-gost-bac/wiki).

## Как использовать

Для компиляции необходимо включить e-TeX. Например, если компилировать с помощью `xelatex` в [MiKTeX](https://miktex.org/), то необходимо указать дополнительную опцию `-enable-etex`:
```
xelatex -halt-on-error -enable-etex Example.tex
```

Более подробное описание располагается во вкладке [Wiki проекта](https://github.com/KernelA/xelatex-gost-bac/wiki).

## Изменение и распространение

Вы можете свободно модифицировать и распространять исходные коды этого шаблона.
