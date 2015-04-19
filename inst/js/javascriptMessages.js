/* Message Handler for javascript functions passed as custom messages from shinyServer() */
Shiny.addCustomMessageHandler("javascript",
                              function(message) {
                                eval(message.value);
                              }
);
