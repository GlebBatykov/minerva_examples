 <div align="center">

**Languages:**
  
[![English](https://img.shields.io/badge/Language-English-blue?style=?style=flat-square)](README.md)
[![Russian](https://img.shields.io/badge/Language-Russian-blue?style=?style=flat-square)](README.ru.md)

</div>

This is an example of using the [Minerva](https://github.com/GlebBatykov/minerva) framework.

This example contains multithreaded server implemented using `Minerva`, as well as `Flutter` application as a client interacting with it.

The `Flutter` application is list of notes.

The server uses `MongoDB` as the database. The database connection string is written in `appsettings.json` file, while the server is running, we access it using the `ConfigurationManager` class. This example uses a database in `MongoDB` named `note_list`, collection of `notes`.

The server contains the following endpoints:

- method: `GET`, path: `/notes`. The end point of getting notes;
- method: `POST`, path: `/notes/add`. The endpoint for adding a note;
- method: `DELETE`, path: `/notes`. The endpoint for deleting a note.

Using the `instance` parameter of the `Minerva Setting` class allows us to set the number of server instances to be started. We have specified the value of the `instance` parameter as `Platform.NumberOfProcessors` from the `dart:io` library. This means that the number of server instances will be equal to the number of available threads of our processor.
