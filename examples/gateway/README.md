<div align="center">

**Languages:**
  
[![English](https://img.shields.io/badge/Language-English-blue?style=?style=flat-square)](README.md)
[![Russian](https://img.shields.io/badge/Language-Russian-blue?style=?style=flat-square)](README.ru.md)

</div>

This is an example of using the [Minerva](https://github.com/GlebBatykov/minerva) framework.

This example contains two Minerva applications:

- `gateway`. An example of the implementation of a `geteway` service that uses `JWT` authentication, forwarding requests according to the user's access level;
- `calculator_service`. A simple demo service that implements 4 endpoints for adding, subtracting, dividing and multiplying numbers.

The `calculator_service` application contains the following endpoints:

- method: `POST`, path: `/add`. The endpoint for adding numbers;
- method: `POST`, path: `/minus`. The endpoint for subtracting numbers;
- method: `POST`, path: `/divide`. The endpoint for dividing numbers;
- method: `POST`, path: `/multiply`. The endpoint for multiplying numbers.

The `geteway` application contains the following endpoints:

- method: `POST`, path: `/auth`. Getting a `JWT` token. In this example, for demonstration purposes, in the request itself, we pass the user name, role, as well as the access level that will be recorded in the `JWT` token.

The `gateway` application uses `RedirectionMiddleware` to forward incoming requests.

Contains the following redirects:

- method: `POST`, path: `/add`, access: all. Redirects to the identical endpoint of the `calculator_service` application;
- method: `POST`, path: `/minus`, access: only users with the `User` role. Redirects to the identical endpoint of the `calculator_service` application;
- method: `POST`, path: `/divide`, access: only users with the `Admin` role. Redirects to the identical endpoint of the `calculator_service` application;
- method: `POST`, path: `/multiply`, access: users with permission level 2 and higher. Redirects to the identical endpoint of the `calculator_service` application.

Using the `instance` parameter of the `Minerva Setting` class allows us to set the number of server instances to be started. We have specified the value of the `instance` parameter as `Platform.NumberOfProcessors` from the `dart:io` library. This means that the number of server instances will be equal to the number of available threads of our processor.
