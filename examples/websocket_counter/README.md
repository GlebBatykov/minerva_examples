 <div align="center">

**Languages:**
  
[![English](https://img.shields.io/badge/Language-English-blue?style=?style=flat-square)](README.md)
[![Russian](https://img.shields.io/badge/Language-Russian-blue?style=?style=flat-square)](README.ru.md)

</div>

This is an example of using the [Minerva](https://github.com/GlebBatykov/minerva) framework.

This example contains a multithreaded websocket server implemented using `Minerva`, as well as a Flutter application as a client interacting with it.

The server contains the state of the counter, allows clients connecting to websockets to interact and receive this state.

Using the `instance` parameter of the `MinervaSetting` class allows us to set the number of server instances to be started. We have specified the value of the `instance` parameter as `Platform.NumberOfProcessors` from the `ё`dart:io` library. This means that the number of server instances will be equal to the number of available threads of our processor.

Features of the server implementation using `Minerva`. With the help of `Minerva` we run several instances of our server, each of which runs in its own isolate. Thus, each server instance contains its own internal state. 

However, to implement such a websocket server, we need each of the server instances to interact with the general state of the counter. We can achieve this with the help of `agents`. We create an `agent` that contains the status of the counter, and also allows you to change and receive it.

Well, we now have the opportunity to use the `agent` to interact with the state common to each of the server instances. But due to the fact that an incoming websocket connection can be processed by any of the server instances, each of the server instances interacts with its own clients connected to it. 

So then how do we notify all clients about it in case of a change in their general state? We can use Send/Receive ports for this. Using them, we can implement a mechanism for subscribing to the state of the `agent`, and then in the event of a change in the state of the counter, each of the server instances will be notified of this and notify the clients with whom it works.