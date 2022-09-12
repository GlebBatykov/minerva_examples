<div align="center">

**Languages:**
  
[![English](https://img.shields.io/badge/Language-English-blue?style=?style=flat-square)](README.md)
[![Russian](https://img.shields.io/badge/Language-Russian-blue?style=?style=flat-square)](README.ru.md)

</div>

This is an example of using the [Minerva](https://github.com/GlebBatykov/minerva) framework.

This example contains the following endpoints:

- method: `POST`, path: `/auth`. Getting a `JWT` token. In this example, for demonstration purposes, in the request itself, we pass the user name, role, and access level that will be recorded in the `JWT` token;
- method: `GET`, path: `/protected/first`. Endpoint accessible to users authorized by the `JWT` token, with the `User` role;
- method: `GET`, path: `/protected/second`. Endpoint accessible to users authorized by the `JWT` token, with the `Admin` role;
- method: `GET`, path: `/protected/third`. Endpoint accessible to users authorized by the `JWT` token, with an access level equal to or higher than `2`.

Using the `instance` parameter of the `MinervaSetting` class allows us to set the number of server instances to be started. We have specified the value of the `instance` parameter as `Platform.NumberOfProcessors` from the `dart:io` library. This means that the number of server instances will be equal to the number of available threads of our processor.