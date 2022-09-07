<div align="center">

**Languages:**
  
[![English](https://img.shields.io/badge/Language-English-blue?style=?style=flat-square)](README.md)
[![Russian](https://img.shields.io/badge/Language-Russian-blue?style=?style=flat-square)](README.ru.md)

</div>

This is an example of using the [Minerva](https://github.com/GlebBatykov/minerva) framework.

This example contains the following endpoints:

- method: `POST`, path: `/upload`. File Upload;
- method: `GET`, path: `/download`. Downloading the file.

The path to the file storage folder is set in the `values` of the `app setting.json` file. We get this value in the code using the `ConfigurationManager` class.

Using the `instance` parameter of the `MinervaSetting` class allows us to set the number of server instances to be started. We have specified the value of the `instance` parameter as `Platform.NumberOfProcessors` from the `ё`dart:io` library. This means that the number of server instances will be equal to the number of available threads of our processor.
