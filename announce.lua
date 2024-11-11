local textService = game:GetService("TextService")
local playersService = game:GetService("Players")
local chatService = game:GetService("Chat")

local function sendFilteredMessage(request, message)
    local filteredMessage = textService:FilterStringAsync(message, request.Executor.UserId, Enum.TextFilterContext.PublicChat)

    for _, player in ipairs(playersService:GetPlayers()) do
        local playerChatMessage = filteredMessage:GetChatForUserAsync(player.UserId)
        request:SendEvent(player, "Message", playerChatMessage, request.Executor)
    end

    return "Created announcement."
end

return sendFilteredMessage
