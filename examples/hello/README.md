<div align="center">

**Languages:**
  
[![English](https://img.shields.io/badge/Language-English-blue?style=?style=flat-square)](README.md)
[![Russian](https://img.shields.io/badge/Language-Russian-blue?style=?style=flat-square)](README.ru.md)

</div>

This is an example of using the [Minerva](https://github.com/GlebBatykov/minerva) framework. 

This example contains one endpoint for a `GET` request at `/hello`.

You can run the example using the `minerva run` command.

After launching, we check the operability of the available endpoint by sending a `GET` request to the address `127.0.0.1:5000/hello`. 

We will get a response with the body: `Hello, world!`.

Using the `instance` parameter of the `Minerva Setting` class allows us to set the number of server instances to be started. We have specified the value of the `instance` parameter as `Platform.NumberOfProcessors` from the `dart:io` library. This means that the number of server instances will be equal to the number of available threads of our processor.
