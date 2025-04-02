local discord = require "@antiraid/discord"
local promise = require "@antiraid/promise"
local Primitives = require "@antiraid-core/primitives"
local Message = require "@antiraid-ext/events/discord/Message"

local evt: Primitives.Event, ctx: Primitives.TemplateContext = ...

local discordExecutor = discord.new(ctx)
Message(evt, function(msg)
    if msg.content == "ping" then
        promise.yield(discordExecutor:create_message({
            channel_id = msg.channel_id or error("no channel id"),
            data = {
                content = "pong",
            },
        }))
    end
end)    
