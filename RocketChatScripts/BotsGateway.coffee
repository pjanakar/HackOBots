exports.validateEntry = ( robot, res ) ->
  permission = [ 'Permitted', 'Not-Permitted' ]
  result = res.random permission 

exports.validateExit = ( robot, res ) ->
  exitStatus = [ 'Successful', 'Not-successful' ]
  result = res.random exitStatus

