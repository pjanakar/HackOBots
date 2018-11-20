// Description:
//    An example script, tells you the time. See below on how documentation works.
//    https://github.com/hubotio/hubot/blob/master/docs/scripting.md#documenting-scripts
// 
// Commands:
//    bot what time is it? - Tells you the time
//    bot what's the time? - Tells you the time
//
module.exports = (robot) => {
  robot.logger.info( "PPP - myfirstbot") 
  robot.respond(/Hi/gi, (res) => {
     res.reply('Hi Puru')
  }) 

  robot.respond(/(what time is it|what's the time)/gi, (res) => {
    const d = new Date()
    const t = `${d.getHours()}:${d.getMinutes()} and ${d.getSeconds()} seconds`
    res.reply(`It's ${t}`)
  })

  	robot.respond(/marketquote/gi, (res) => {
	const norrisUrl = 'https://api.icndb.com/jokes/random';
	var response
	// wrap with promise
	new Promise((resolve, reject) => 
    	robot.http(norrisUrl).get()((err, response, body) =>
        err ? reject(err) : resolve(body) ))

	// parse to js object
	.then(body => res.reply(body))
  	})


  	robot.respond(/getdirectory/gi, (res) => {
	const norrisUrl = 'http://localhost:3000/api/v1/directory';
	var response
	// wrap with promise
	new Promise((resolve, reject) => 
    	robot.http(norrisUrl).get()((err, response, body) =>
        err ? reject(err) : resolve(body) ))

	// parse to js object
	.then(body => res.reply(body))
	})
}
