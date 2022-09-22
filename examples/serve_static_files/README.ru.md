<div align="center">

**Языки:**
  
[![English](https://img.shields.io/badge/Language-English-blue?style=?style=flat-square)](README.md)
[![Russian](https://img.shields.io/badge/Language-Russian-blue?style=?style=flat-square)](README.ru.md)

</div>

Это пример использования фреймворка [Minerva](https://github.com/GlebBatykov/minerva).

Данный пример использует `StaticFilesMiddleware` для раздачи статических файлов.

В качестве папки с статическими файлами указана папка `/wwwroot`, однако вы можете указывать любую папку.

В качестве пути для доступа к статическим файлам указанн путь `/files`.

Папка `wwwroot` добавлена в конечную сборку при помощи параметра `assets` в файле `appsetting.json`.

Структура папки `wwwroot`:

- `images`
  - `cat.jpg`
  - `city.jpg`
- `hello.txt`
- `index.txt`

К файлам в этом примере вы можете получить доступ по путям:

- `http://127.0.0.1:5000/files/images/cat.jpg`
- `http://127.0.0.1:5000/files/images/city.jpg`
- `http://127.0.0.1:5000/files/hello.txt`
- `http://127.0.0.1:5000/files/index.txt`

Использование параметра `instance` класса `MinervaSetting` позволяет нам задать количество экземпляров сервера которые будут запущены. Мы указали значение параметра `instance` как `Platform.numberOfProcessors` из библиотеки `dart:io`. Это означает что количество экземпляров сервера будет равно количеству доступных потоков нашего процессора.
