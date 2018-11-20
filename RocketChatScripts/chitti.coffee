BotsGateway = require('/root/myhubot/lib/BotsGateway.coffee')
#driver = require('@rocket.chat/sdk')

module.exports = (robot) ->
  robot.respond /Hi/i, (res) ->
    result = BotsGateway.validateEntry( robot, res )
    res.send result
    console.log "Print.. " 
    console.log res
    for i in robot
        console.log i 
#    res.finish

  robot.respond /Leave/i, (res) -> 
    user = res.robot.alias
    console.log "user : #{user}"

#  robot.http("http://localhost:3000/api/v1/channels.info?roomName=GENERAL")
#      .header('Content-Type', 'application/json')
#      .post(data) (err, res, body) ->
#         data = JSON.parse body
#         console.log "Status: #{data.success}"
    robot.http("http://localhost:3000/api/v1/channels.info?roomName=GENERAL")
         .get() (err, resp, body) ->
      if err
         resp.reply "Error getting room ID"
         robot.emit 'error', err, resp
         return
#     roomID = body.channel.id
      roomIDp = res.robot.adapter.getRoomName( "GENERAL" )
      roomID = "";
      roomIDp.then((val) -> 
         console.log(val) 
         roomID = val 
         console.log("room id" : roomID ) 
      )
      console.log "err.. #{err}"
      console.log err
      console.log "resp.."
      console.log resp
      res.robot.adapter.logout()
      res.send "thx #{user}.. leaving room #{roomID} :("

#   robot.enter (res) ->
##    entryStatus = "Hi" //BotsGateway.validateEntry( robot, res )
#    entryStatus = "Hi" 
#    res.send entryStatus
#   robot.leave (res) ->
##    exitStatus = "Bye" BotsGateway.validateExit( robot, res )
#   exitStatus = "Bye" 
#   res.send exitStatus

