--[[
      __          __              ____  
     /\ \        / /             |___ \ 
    /  \ \  /\  / /_ _ _ __ _ __   __) |
   / /\ \ \/  \/ / _` | '__| '_ \ |__ < 
  / ____ \  /\  / (_| | |  | | | |___) |
 /_/    \_\/  \/ \__,_|_|  |_| |_|____/ 

	AWarn3 by Mr.President
]]

----------------------------------------------------------------------
----------------------------------------------------------------------

--Set this to true if you wish to enable discord logging. Note: You'll need to provide a webhook URL below as well.
local enable_discord_logging = false

--Set the Webhook URL for your discord server channel here.
local discord_webhook_url = ""

--Feel free to keep this using the relay on my server. If you want to use your own server, you can upload the file located in the addon folder to your own server and change the path here.
local discord_webhook_relay_url = "http://g4p.org/awarn2/discordrelay.php"

----------------------------------------------------------------------
----------------------------------------------------------------------



MsgC( AWARN3_STATECOLOR, "[AWarn3] ", AWARN3_WHITE, "Loading Discord Module\n" )


hook.Add( "AWarnPlayerWarned", "AWarn3WarningDiscordRelay", function( pl, aID, reason )
	local admin = AWarn:GetPlayerFromID64( aID )
	if not admin then return end
	
	local msg = "**%s** warned **%s** for reason: **%s**."
	msg = msg:format( admin:GetName(), pl:GetName(), reason )
	AWarn:DiscordWarning( msg )
end )

function AWarn:DiscordWarning( msg )
	if not enable_discord_logging then return end
	http.Post(discord_webhook_relay_url, {
		title = "AWarn3 - Warning on " .. AWarn:GetOption( "awarn_server_name" ) or game.GetIPAddress(),
		bar_color = "#FF8C00",
		url = discord_webhook_url,
		body = msg
		}, function( r ) print(r) end, function( e ) print(e) end
	)
end

function AWarn:DiscordPunishment( msg )
	if not enable_discord_logging then return end
	http.Post(discord_webhook_relay_url, {
		title = "AWarn3 - Punishment on " .. AWarn:GetOption( "awarn_server_name" ) or game.GetIPAddress(),
		bar_color = "#FF0000",
		url = discord_webhook_url,
		body = msg
		}, function( r ) print(r) end, function( e ) print(e) end
	)
end