local TweenService = game:GetService("TweenService")
local CoreGui = game:GetService("CoreGui")

local LocalPlayer = game:GetService("Players").LocalPlayer

local Library = {} do
	function Library:Create(Type, Properties)
		local Object = Instance.new(Type)
		
		for Name, Value in pairs(Properties) do
			Object[Name] = Value
		end
		
		return Object
	end
end

local Loader = Library:Create("ScreenGui", {
	Name = "Loader",
	DisplayOrder = 1,
	ZIndexBehavior = Enum.ZIndexBehavior.Global,
})

if syn.protect_gui then
	syn.protect_gui(Loader)
elseif get_hidden_gui then
	get_hidden_gui(Loader)
end

if gethui then
	Loader.Parent = gethui()
else
	Loader.Parent = CoreGui
end

if not shared.BeachwaveVersion then
	shared.BeachwaveVersion = "Date not found"
end

local Holder = Library:Create("Frame", {
	Name = "Holder",
	Parent = Loader,
	BackgroundColor3 = Color3.fromRGB(255, 255, 255),
	BorderSizePixel = 0,
	Position = UDim2.new(0.5, 0, 0.5, 0)
})

local Border = Library:Create("Frame", {
	Name = "Border",
	Parent = Holder,
	BackgroundColor3 = Color3.fromRGB(255, 255, 255),
	BackgroundTransparency = 1,
	BorderSizePixel = 0,
	Position = UDim2.new(0, -2, 0, -2),
	Size = UDim2.new(1, 4, 1, 4),
	ZIndex = 0
})

local UICorner = Library:Create("UICorner", {
	Parent = Border
})

local HolderUIGradient = Library:Create("UIGradient", {
	Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 75, 75)), ColorSequenceKeypoint.new(0.25, Color3.fromRGB(238, 92, 192)), ColorSequenceKeypoint.new(0.50, Color3.fromRGB(171, 105, 202)), ColorSequenceKeypoint.new(0.74, Color3.fromRGB(120, 118, 252)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(116, 168, 246))},
	Parent = Border
})

local UICorner_2 = Library:Create("UICorner", {
	Parent = Holder
})

local BorderUIGradient = Library:Create("UIGradient", {
	Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 75, 75)), ColorSequenceKeypoint.new(0.25, Color3.fromRGB(238, 92, 192)), ColorSequenceKeypoint.new(0.50, Color3.fromRGB(171, 105, 202)), ColorSequenceKeypoint.new(0.74, Color3.fromRGB(120, 118, 252)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(116, 168, 246))},
	Parent = Holder
})

local Wave = Library:Create("TextLabel", {
	Name = "Wave",
	Parent = Holder,
	BackgroundColor3 = Color3.fromRGB(255, 255, 255),
	BackgroundTransparency = 1,
	BorderSizePixel = 0,
	Position = UDim2.new(0.5, 0, 0, 0),
	Rotation = -180,
	Size = UDim2.new(0, 15, 1, 0),
	ZIndex = 2,
	Font = Enum.Font.Oswald,
	Text = "🌊",
	TextColor3 = Color3.fromRGB(255, 255, 255),
	TextSize = 1,
	TextStrokeTransparency = 0.95,
	TextTransparency = 1,
	TextXAlignment = Enum.TextXAlignment.Left
})

local Beach = Library:Create("TextLabel", {
	Name = "Beach",
	Parent = Holder,
	BackgroundColor3 = Color3.fromRGB(255, 255, 255),
	BackgroundTransparency = 1,
	BorderSizePixel = 0,
	Position = UDim2.new(0.5, -14, 0, 0),
	Rotation = 180,
	Size = UDim2.new(0, 15, 1, 0),
	ZIndex = 2,
	Font = Enum.Font.Oswald,
	Text = "🌴",
	TextColor3 = Color3.fromRGB(255, 255, 255),
	TextSize = 1,
	TextStrokeTransparency = 0.95,
	TextTransparency = 1,
	TextXAlignment = Enum.TextXAlignment.Right
})

local Status = Library:Create("TextLabel", {
	Name = "Status",
	Parent = Holder,
	BackgroundColor3 = Color3.fromRGB(255, 255, 255),
	BackgroundTransparency = 1,
	BorderSizePixel = 0,
	ClipsDescendants = true,
	Position = UDim2.new(0.5, 0, 0, 25),
	Size = UDim2.new(0, 0, 1, 0),
	Font = Enum.Font.Oswald,
	Text = ("created by coasts | updated: " .. shared.BeachwaveVersion),
	TextColor3 = Color3.fromRGB(255, 255, 255),
	TextSize = 26,
	TextStrokeTransparency = 0.95
})

local Title = Library:Create("TextLabel", {
	Name = "Title",
	Parent = Holder,
	BackgroundColor3 = Color3.fromRGB(255, 255, 255),
	BackgroundTransparency = 1,
	BorderSizePixel = 0,
	ClipsDescendants = true,
	Position = UDim2.new(0.5, 0, 0, 0),
	Size = UDim2.new(0, 0, 1, 0),
	Font = Enum.Font.Oswald,
	Text = "beachwave",
	TextColor3 = Color3.fromRGB(255, 255, 255),
	TextSize = 44,
	TextStrokeTransparency = 0.95
})


function shared:SetStatus(String)
	Status.Text = String:lower()
end

function Library:Open()
	TweenService:Create(Holder, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Position = UDim2.new(0.5, -125, 0.5, -62), Size = UDim2.new(0, 250, 0, 125)}):Play()
	TweenService:Create(Border, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {BackgroundTransparency = 0.25}):Play()

	task.wait(0.75)
	TweenService:Create(Beach, TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {TextSize = 44, Rotation = 0, TextTransparency = 0}):Play()
	TweenService:Create(Wave, TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {TextSize = 44, Rotation = 0, TextTransparency = 0}):Play()

	task.wait(1)
	TweenService:Create(Beach, TweenInfo.new(1, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Position = UDim2.new(0.5, -80, 0, 0)}):Play()
	TweenService:Create(Wave, TweenInfo.new(1, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Position = UDim2.new(0.5, 70, 0, 0)}):Play()
	TweenService:Create(Title, TweenInfo.new(1.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Position = UDim2.new(0, 0, 0, 0), Size = UDim2.new(1, 0, 1, 0)}):Play()
	TweenService:Create(Status, TweenInfo.new(1.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Position = UDim2.new(0, 0, 0, 25), Size = UDim2.new(1, 0, 1, 0)}):Play()
	
	task.wait(1.5)
end

function Library:Close()
	TweenService:Create(Beach, TweenInfo.new(1, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Position = UDim2.new(0.5, -14, 0, 0)}):Play()
	TweenService:Create(Wave, TweenInfo.new(1, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Position = UDim2.new(0.5, 0, 0, 0)}):Play()
	TweenService:Create(Title, TweenInfo.new(1.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Position = UDim2.new(0.5, 0, 0, 0), Size = UDim2.new(0, 0, 1, 0)}):Play()
	TweenService:Create(Status, TweenInfo.new(1.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Position = UDim2.new(0.5, 0, 0, 25), Size = UDim2.new(0, 0, 1, 0)}):Play()
	
	task.wait(1.75)
	TweenService:Create(Beach, TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {TextSize = 1, Rotation = 180, TextTransparency = 1}):Play()
	TweenService:Create(Wave, TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {TextSize = 1, Rotation = -180, TextTransparency = 1}):Play()

	task.wait(1)
	TweenService:Create(Holder, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Position = UDim2.new(0.5, 0, 0.5, 0), Size = UDim2.new(0, 0, 0, 0)}):Play()
	TweenService:Create(Border, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {BackgroundTransparency = 1}):Play()
	
	task.wait(0.5)
	Loader:Destroy()
	Library = nil
end

Loader.Enabled = true

coroutine.resume(coroutine.create(function()
	while task.wait() do
		if not Library then break end
		HolderUIGradient.Rotation += (0.1 % 360)
		BorderUIGradient.Rotation = HolderUIGradient.Rotation
	end
end))

return Library
