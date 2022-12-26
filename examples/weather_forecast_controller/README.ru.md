<div align="center">

**Языки:**
  
[![English](https://img.shields.io/badge/Language-English-blue?style=?style=flat-square)](README.md)
[![Russian](https://img.shields.io/badge/Language-Russian-blue?style=?style=flat-square)](README.ru.md)

</div>

Это пример использования фреймворка [Minerva](https://github.com/GlebBatykov/minerva).

Данный пример использует контроллеры, способ конфигурирования конечных точек.

Контроллеры основанны на генерации кода, при генерации кода создаются `Api`, которые мы подключаем в классе `ApisBuilder`.

Контроллер `WeatherForecastController` содержит одно `GET` действие. Так как действие имеет имя `get`, которое совпадает с его методом HTTP, то имя действия не включается в путь конечной точки. Таким образом путь конечной точки содержит только имя контроллера: `/weatherforecast`.

Запустить пример можно при помощи команд:

```dart
dart run build_runner build

minerva run
```

После запуска проверить работоспособность доступной конечной точки мы послав `GET` запрос по адресу `127.0.0.1:5000/weatherforecast`.

Один из возможных вариантов содержимого тела ответа:

```dart
[{"date":"2022-08-28 16:27:16.321231","temperature":0,"summary":"Bracing"}, {"date":"2022-08-29 16:27:16.321236","temperature":32,"summary":"Bracing"}]
```

Использование параметра `instance` класса `MinervaSetting` позволяет нам задать количество экземпляров сервера которые будут запущены. Мы указали значение параметра `instance` как `Platform.numberOfProcessors` из библиотеки `dart:io`. Это означает что количество экземпляров сервера будет равно количеству доступных потоков нашего процессора.
