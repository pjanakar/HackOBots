var Client = require('node-rest-client').Client;
 
var client = new Client();
 
// direct way
client.get("http://localhost:3000/api/v1/channels.info?roomName=GENERAL", function (data, response) {
    // parsed response body as js object
    console.log(data);
    // raw response
    console.log(response);
});
