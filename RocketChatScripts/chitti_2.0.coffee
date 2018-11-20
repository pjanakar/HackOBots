BotsGateway = require('/root/myhubot/lib/BotsGateway.coffee')
#driver = require('@rocket.chat/sdk')

module.exports = (robot) ->
  robot.respond /Hi/i, (res) ->
    user = res.robot.alias
    room = res.envelope.user.room
    console.log res.envelope.room
    console.log "user : #{user}, room: #{room}"
    welcomemsg = "I'm #{user}, welcome to room: #{room}"
    errormsg = "I'm #{user}, sorry 'm not permitted in room:#{room}"
    msg = errormsg 
    if ( user == "pb_bot" && room == "pb_ch" )
      msg = welcomemsg
    else if ( user == "ib_bot" && room == "ib_ch" )
      msg = welcomemsg
    else if ( user == "hr_bot" )
      msg = welcomemsg

    res.send msg

  robot.respond /Leave/i, (res) -> 
    user = res.robot.alias
    console.log "user : #{user}"
    res.send "thx #{user}.. leaving room #{roomID} :("

