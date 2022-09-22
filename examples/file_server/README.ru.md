<div align="center">

**Языки:**
  
[![English](https://img.shields.io/badge/Language-English-blue?style=?style=flat-square)](README.md)
[![Russian](https://img.shields.io/badge/Language-Russian-blue?style=?style=flat-square)](README.ru.md)

</div>

Это пример использования фреймворка [Minerva](https://github.com/GlebBatykov/minerva).

Данный пример содержит следующие конечные точки:

- метод: `POST`, путь: `/upload`. Загрузка файла;
- метод: `GET`, путь: `/download`. Скачивание файла.

Путь к папке хранения файлов задается в `values` файла `appsetting.json`. Это значение мы получаем в коде при помощи класса `ConfigurationManager`.

Использование параметра `instance` класса `MinervaSetting` позволяет нам задать количество экземпляров сервера которые будут запущены. Мы указали значение параметра `instance` как `Platform.numberOfProcessors` из библиотеки `dart:io`. Это означает что количество экземпляров сервера будет равно количеству доступных потоков нашего процессора.
