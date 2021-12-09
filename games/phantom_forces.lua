local PlayerUtilities = {}

local Replication, HUD

for Index, Value in pairs(getgc(true)) do
    if typeof(Value) == "table" then 
        if rawget(Value, "getbodyparts") then
            Replication = Value
        end

        if rawget(Value, "getplayerhealth") then
            HUD = Value
        end
    end
end

warn("GetBodyParts:", GetBodyParts)
warn("GetPlayerHealth:", GetPlayerHealth)

function PlayerUtilities:IsPlayerAlive(Player)
    return HUD:isplayeralive(Player)
end

function PlayerUtilities:GetHealth(Player)
    local PlayerHealth = HUD:getplayerhealth(Player)

    if PlayerHealth then
        return {
            CurrentHealth = math.floor(PlayerHealth),
            MaxHealth = 100
        }
    end
end

function PlayerUtilities:GetBodyParts(Player)
    local BodyParts = Replication.GetBodyParts(Player)

    print(BodyParts)
    if BodyParts and BodyParts.torso then
        return {
            Character = BodyParts.rootpart.Parent,
            Head = BodyParts.head,
            Root = BodyParts.rootpart,
            Torso = BodyParts.torso,
            LeftArm = BodyParts.larm,
            RightArm = BodyParts.rarm,
            LeftLeg = BodyParts.lleg,
            RightLeg = BodyParts.rleg
        }
    end
end

return PlayerUtilities
