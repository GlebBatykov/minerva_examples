<div align="center">

**Languages:**
  
[![English](https://img.shields.io/badge/Language-English-blue?style=?style=flat-square)](README.md)
[![Russian](https://img.shields.io/badge/Language-Russian-blue?style=?style=flat-square)](README.ru.md)

</div>

This is an example of using the [Minerva](https://github.com/GlebBatykov/minerva) framework.

This example uses `StaticFilesMiddleware` to serve static files.

The folder `/wwwroot` is specified as a folder with static files, however, you can specify any folder.

The path `/files` is specified as the path for accessing static files.

The `wwwroot` folder was added to the final assembly using the `assets` parameter in the `app setting.json` file.

Structure of the `wwwroot` folder:

- `images`
  - `cat.jpg`
  - `city.jpg`
- `hello.txt`
- `index.txt`

The files in this example can be accessed by paths:

- `http://127.0.0.1:5000/files/images/cat.jpg`
- `http://127.0.0.1:5000/files/images/city.jpg`
- `http://127.0.0.1:5000/files/hello.txt`
- `http://127.0.0.1:5000/files/index.txt`

Using the `instance` parameter of the `Minerva Setting` class allows us to set the number of server instances to be started. We have specified the value of the `instance` parameter as `Platform.NumberOfProcessors` from the `dart:io` library. This means that the number of server instances will be equal to the number of available threads of our processor.
