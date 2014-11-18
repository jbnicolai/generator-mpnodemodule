# # <%= modulename %>
<% if( useredis ){ %>
# ### extends [RedisConnector](./redisconnector.coffee.html)
<% }else{ %>
# ### extends [NPM:MPBasic](https://cdn.rawgit.com/mpneuried/mpbaisc/master/_docs/index.coffee.html)
<% } %>
#
# ### Exports: *Class*
#
# Main Module to init the heartbeat to redis
# 
<% if( useredis ){ %>
# **internal modules**
# [Redisconnector](./redisconnector.coffee.html)
Redisconnector = require( "./redisconnector" ) 
<% } %>
class <%= modulename %> extends <% if( useredis ){ %>Redisconnector<% }else{ %>require( "mpbasic" )()<% } %>

	# ## defaults
	default: =>
		@extend super, 
			# **<%= modulename %>.foo** *Number* This is a example default option
			foo: 23
			# **<%= modulename %>.bar** *String* This is a example default option
			bar: "Buzz"

	###	
	## constructor 
	###
	constructor: ( options )->
		super
		<% if( useredis ){ %>
		# wrap start method to only be active until the connection is established
		@start = @_waitUntil( @_start, "connected" )
		<% } %>

		@start()<% if( useredis ){ %>
		@connect()<% } %>

		return

	<% if( useredis ){ %>_<% } %>start: =>
		@debug "START"
		return

#export this class
module.exports = <%= modulename %>