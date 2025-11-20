repeat task.wait() until game:IsLoaded()

local Players = game:GetService('Players')
local CoreGui = game:GetService('CoreGui')

local PlayerGui = Players.LocalPlayer.PlayerGui

local Player = Players.LocalPlayer
local Mouse = Player:GetMouse()

local RunService = game:GetService('RunService')

local Ts = game:GetService('TweenService')
local Info = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)

local UserInputService = game:GetService('UserInputService')
local HttpService = game:GetService('HttpService')

local Library = {
    Flags = {}
}

if not isfolder('Byte') then
    makefolder('Byte')
end

function Library:save_flags()
    local flags = HttpService:JSONEncode(Library.Flags)

    writefile('Byte/' .. game.GameId .. '.lua', flags)
end

function Library:load_flags()
    if not isfile('Byte/' .. game.GameId .. '.lua') then 
        Library.save_flags()
        return
    end

    local flags = readfile('Byte/' .. game.GameId .. '.lua')

    if not flags then 
        Library.save_flags()
        return
    end

    Library.Flags = HttpService:JSONDecode(flags)
end

Library.load_flags()

function Library:Drag(v)
	v.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			self.Dragging = true
			self.DragStart = input.Position
			self.StartPosition = v.Position

			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					self.Dragging = false
				end
			end)
		end
	end)

	v.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			if self.Dragging then
				local delta = input.Position - self.DragStart
				v.Position = UDim2.new(self.StartPosition.X.Scale, self.StartPosition.X.Offset + delta.X, self.StartPosition.Y.Scale, self.StartPosition.Y.Offset + delta.Y)
			end
		end
	end)
end

Library["1"] = Instance.new("ScreenGui", (RunService:IsStudio() and PlayerGui) or CoreGui);
Library["1"]["Name"] = [[Mobile_Gui]];
Library["1"]["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling;

Library["2"] = Instance.new("TextButton", Library["1"]);
Library["2"]["BorderSizePixel"] = 0;
Library["2"]["Modal"] = false; -- set to true to break shiftlock
Library["2"]["AutoButtonColor"] = false;
Library["2"]["TextSize"] = 14;
Library["2"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
Library["2"]["BackgroundColor3"] = Color3.fromRGB(28, 29, 34);
Library["2"]["FontFace"] = Font.new([[rbxasset://fonts/families/Montserrat.json]], Enum.FontWeight.SemiBold, Enum.FontStyle.Normal);
Library["2"]["Size"] = UDim2.new(0, 122, 0, 38);
Library["2"]["Name"] = [[Mobile]];
Library["2"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
Library["2"]["Text"] = [[]];
Library["2"]["Position"] = UDim2.new(0.021, -4, 0.918, -5);

Library["3"] = Instance.new("UICorner", Library["2"]);
Library["3"]["CornerRadius"] = UDim.new(0, 13);

Library["4"] = Instance.new("ImageLabel", Library["2"]);
Library["4"]["ZIndex"] = 0;
Library["4"]["BorderSizePixel"] = 0;
Library["4"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
Library["4"]["ImageTransparency"] = 0.2;
Library["4"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
Library["4"]["Image"] = [[rbxassetid://17183270335]];
Library["4"]["Size"] = UDim2.new(0, 144, 0, 58);
Library["4"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
Library["4"]["BackgroundTransparency"] = 1;
Library["4"]["Name"] = [[Shadow]];
Library["4"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);

Library["5"] = Instance.new("ImageLabel", Library["2"]);
Library["5"]["BorderSizePixel"] = 0;
Library["5"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
Library["5"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
Library["5"]["Image"] = [[rbxassetid://10709810463]];
Library["5"]["Size"] = UDim2.new(0, 15, 0, 15);
Library["5"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
Library["5"]["BackgroundTransparency"] = 1;
Library["5"]["Name"] = [[Icon]];
Library["5"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);

function Library:Tween(object, goal, callback)
	local Tween = Ts:Create(object, Info, goal)

	Tween.Completed:Connect(callback or function() end)
	Tween:Play()
end

function Library.Add_Window(Title)
	local Gui = {}

	Gui["1"] = Instance.new("ScreenGui", (RunService:IsStudio() and PlayerGui) or CoreGui);
	Gui["1"]["Name"] = [[Stream]];
	Gui["1"]["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling;

	Gui["2"] = Instance.new("Frame", Gui["1"]);
	Gui["2"]["Active"] = true;
	Gui["2"]["BorderSizePixel"] = 0;
	Gui["2"]["BackgroundColor3"] = Color3.fromRGB(14, 14, 14);
	Gui["2"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
	Gui["2"]["Size"] = UDim2.new(0, 640, 0, 355);
	Gui["2"]["Position"] = UDim2.new(0.5, 0, 0.4935, 0);
	Gui["2"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	Gui["2"]["Name"] = [[Container]];
	Gui["2"]["BackgroundTransparency"] = 0.1;

	Gui["93"] = Instance.new("UIScale", Gui["2"]);

	Gui["3"] = Instance.new("Frame", Gui["2"]);
	Gui["3"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
	Gui["3"]["Size"] = UDim2.new(0.95, 0, 0.95, 0);
	Gui["3"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
	Gui["3"]["BackgroundTransparency"] = 1;

	Gui["4"] = Instance.new("UICorner", Gui["2"]);
	Gui["4"]["CornerRadius"] = UDim.new(0, 10);

	Gui["5"] = Instance.new("Frame", Gui["2"]);
	Gui["5"]["BorderSizePixel"] = 0;
	Gui["5"]["BackgroundColor3"] = Color3.fromRGB(28, 28, 28);
	Gui["5"]["Size"] = UDim2.new(0, 624, 0, 24);
	Gui["5"]["Position"] = UDim2.new(0.0125, 0, 0.02254, 0);
	Gui["5"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	Gui["5"]["Name"] = [[Header]];
	Gui["5"]["BackgroundTransparency"] = 0.5;

	Gui["6"] = Instance.new("UICorner", Gui["5"]);
	Gui["6"]["CornerRadius"] = UDim.new(0, 5);

	Gui["7"] = Instance.new("TextLabel", Gui["5"]);
	Gui["7"]["TextWrapped"] = true;
	Gui["7"]["BorderSizePixel"] = 0;
	Gui["7"]["TextXAlignment"] = Enum.TextXAlignment.Left;
	Gui["7"]["TextScaled"] = true;
	Gui["7"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
	Gui["7"]["TextSize"] = 14;
	Gui["7"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.SemiBold, Enum.FontStyle.Normal);
	Gui["7"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
	Gui["7"]["BackgroundTransparency"] = 1;
	Gui["7"]["AnchorPoint"] = Vector2.new(0, 0.5);
	Gui["7"]["Size"] = UDim2.new(0, 78, 0, 12);
	Gui["7"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	Gui["7"]["Text"] = Title
	Gui["7"]["Name"] = [[Client]];
	Gui["7"]["Position"] = UDim2.new(0.06, 0, 0.5, 0);

	
	Gui["logo"] = Instance.new("ImageLabel", Gui["5"])
	Gui["logo"].BorderSizePixel = 0
	Gui["logo"].BackgroundTransparency = 1
	Gui["logo"].AnchorPoint = Vector2.new(0, 0.5)
	Gui["logo"].Position = UDim2.new(0.02, 0, 0.5, 0)
	Gui["logo"].Size = UDim2.new(0, 16, 0, 16)
	Gui["logo"].Image = [[rbxassetid://102793636152650]]
	Gui["logo"].Name = [[Logo]]

	Gui["8"] = Instance.new("UITextSizeConstraint", Gui["7"]);
	Gui["8"]["MaxTextSize"] = 12;
	Gui["8"]["MinTextSize"] = 12;

	Gui["9"] = Instance.new("Frame", Gui["5"]);
	Gui["9"]["BorderSizePixel"] = 0;
	Gui["9"]["BackgroundColor3"] = Color3.fromRGB(34, 34, 34);
	Gui["9"]["AnchorPoint"] = Vector2.new(1, 0.5);
	Gui["9"]["Size"] = UDim2.new(0, 64, 0, 17);
	Gui["9"]["Position"] = UDim2.new(0.995, 0, 0.5, 0);
	Gui["9"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	Gui["9"]["Name"] = [[SearchBar]];
	Gui["9"]["BackgroundTransparency"] = 0.5;

	Gui["a"] = Instance.new("UICorner", Gui["9"]);
	Gui["a"]["CornerRadius"] = UDim.new(0, 4);

	Gui["b"] = Instance.new("TextBox", Gui["9"]);
	Gui["b"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
	Gui["b"]["PlaceholderColor3"] = Color3.fromRGB(255, 255, 255);
	Gui["b"]["BorderSizePixel"] = 0;
	Gui["b"]["TextXAlignment"] = Enum.TextXAlignment.Left;
	Gui["b"]["TextWrapped"] = true;
	Gui["b"]["TextTransparency"] = 0.5;
	Gui["b"]["TextSize"] = 10;
	Gui["b"]["Name"] = [[Input]];
	Gui["b"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
	Gui["b"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.SemiBold, Enum.FontStyle.Normal);
	Gui["b"]["AnchorPoint"] = Vector2.new(0, 0.5);
	Gui["b"]["ClearTextOnFocus"] = false;
	Gui["b"]["PlaceholderText"] = [[Search]];
	Gui["b"]["Size"] = UDim2.new(0, 39, 0, 14);
	Gui["b"]["Position"] = UDim2.new(0, 0, 0.5, 0);
	Gui["b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	Gui["b"]["Text"] = [[]];
	Gui["b"]["BackgroundTransparency"] = 1;

	Gui["c"] = Instance.new("UITextSizeConstraint", Gui["b"]);
	Gui["c"]["MaxTextSize"] = 10;
	Gui["c"]["MinTextSize"] = 10;

	Gui["d"] = Instance.new("UIPadding", Gui["9"]);
	Gui["d"]["PaddingLeft"] = UDim.new(0, 9);

	Gui["e"] = Instance.new("ImageLabel", Gui["9"]);
	Gui["e"]["BorderSizePixel"] = 0;
	Gui["e"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
	Gui["e"]["AnchorPoint"] = Vector2.new(1, 0.5);
	Gui["e"]["Image"] = [[rbxassetid://72131122316767]];
	Gui["e"]["Size"] = UDim2.new(0, 17, 0, 17);
	Gui["e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	Gui["e"]["BackgroundTransparency"] = 1;
	Gui["e"]["Name"] = [[IconBG]];
	Gui["e"]["Position"] = UDim2.new(1, 0, 0.5, 0);

	Gui["f"] = Instance.new("ImageLabel", Gui["e"]);
	Gui["f"]["BorderSizePixel"] = 0;
	Gui["f"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
	Gui["f"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
	Gui["f"]["Image"] = [[rbxassetid://79243925523770]];
	Gui["f"]["Size"] = UDim2.new(0, 9, 0, 9);
	Gui["f"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	Gui["f"]["BackgroundTransparency"] = 1;
	Gui["f"]["Name"] = [[Icon]];
	Gui["f"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);

	Gui["10"] = Instance.new("ScrollingFrame", Gui["2"]);
	Gui["10"]["Active"] = true;
	Gui["10"]["BorderSizePixel"] = 0;
	Gui["10"]["CanvasSize"] = UDim2.new(0, 0, 0.5, 0);
	Gui["10"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
	Gui["10"]["Name"] = [[Tabs]];
	Gui["10"]["ScrollBarImageTransparency"] = 1;
	Gui["10"]["AutomaticCanvasSize"] = Enum.AutomaticSize.X;
	Gui["10"]["Size"] = UDim2.new(0, 138, 0, 308);
	Gui["10"]["ScrollBarImageColor3"] = Color3.fromRGB(0, 0, 0);
	Gui["10"]["Position"] = UDim2.new(0.0125, 0, 0.10986, 0);
	Gui["10"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	Gui["10"]["ScrollBarThickness"] = 0;
	Gui["10"]["BackgroundTransparency"] = 1;

	Gui["11"] = Instance.new("UIListLayout", Gui["10"]);
	Gui["11"]["Padding"] = UDim.new(0, 6);
	Gui["11"]["SortOrder"] = Enum.SortOrder.LayoutOrder;

	Library:Drag(Gui['2'])

	local Tween_Time = 0.65

	Library['2'].InputBegan:Connect(function(input, gpe)
		if gpe then
			return
		end

		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			if Gui['1'].Enabled then
				local Tween_Out = Ts:Create(Gui["93"], TweenInfo.new(Tween_Time, Enum.EasingStyle.Back, Enum.EasingDirection.InOut), {
					Scale = 0.01
				})

				Tween_Out:Play()
				Tween_Out.Completed:Wait()

				Gui['1'].Enabled = false
			else
				Gui['1'].Enabled = true

				Gui["93"].Scale = 0.01

				local Tween_In = Ts:Create(Gui["93"], TweenInfo.new(Tween_Time, Enum.EasingStyle.Back, Enum.EasingDirection.InOut), {
					Scale = 1
				})

				Tween_In:Play()
			end
		end
	end)

	Library['2'].TouchTap:Connect(function()
		if Gui['1'].Enabled then
			local Tween_Out = Ts:Create(Gui["93"], TweenInfo.new(Tween_Time, Enum.EasingStyle.Back, Enum.EasingDirection.InOut), {
				Scale = 0.01
			})

			Tween_Out:Play()
			Tween_Out.Completed:Wait()

			Gui['1'].Enabled = false
		else
			Gui['1'].Enabled = true

			Gui["93"].Scale = 0.01

			local Tween_In = Ts:Create(Gui["93"], TweenInfo.new(Tween_Time, Enum.EasingStyle.Back, Enum.EasingDirection.InOut), {
				Scale = 1
			})

			Tween_In:Play()
		end
	end)

	function Gui.Create_Tab(options)
		local Tab = {

			Current_Tab = nil,

			Hover = false,
			Active = false
		}

		Tab["12"] = Instance.new("TextButton", Gui['10']);
		Tab["12"]["BorderSizePixel"] = 0;
		Tab["12"]["AutoButtonColor"] = false;
		Tab["12"]["TextSize"] = 14;
		Tab["12"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
		Tab["12"]["BackgroundColor3"] = Color3.fromRGB(28, 28, 28);
		Tab["12"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
		Tab["12"]["Size"] = UDim2.new(0, 138, 0, 27);
		Tab["12"]["BackgroundTransparency"] = 1;
		Tab["12"]["Name"] = [[Tab]];
		Tab["12"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		Tab["12"]["Text"] = [[]];

		Tab["13"] = Instance.new("UICorner", Tab["12"]);
		Tab["13"]["CornerRadius"] = UDim.new(0, 5);

		Tab["14"] = Instance.new("ImageLabel", Tab["12"]);
		Tab["14"]["BorderSizePixel"] = 0;
		Tab["14"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		Tab["14"]["AnchorPoint"] = Vector2.new(0, 0.5);
		Tab["14"]["Image"] = options.icon;
		Tab["14"]["Size"] = UDim2.new(0, 12, 0, 12);
		Tab["14"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		Tab["14"]["BackgroundTransparency"] = 1;
		Tab["14"]["Name"] = [[Icon]];
		Tab["14"]["Position"] = UDim2.new(0.1, 0, 0.5, 0);
		Tab['14']['ImageTransparency'] = 0.6

		Tab["15"] = Instance.new("TextLabel", Tab["12"]);
		Tab["15"]["TextWrapped"] = true;
		Tab["15"]["BorderSizePixel"] = 0;
		Tab["15"]["TextXAlignment"] = Enum.TextXAlignment.Left;
		Tab["15"]["TextScaled"] = true;
		Tab["15"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		Tab["15"]["TextSize"] = 14;
		Tab["15"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Bold, Enum.FontStyle.Italic);
		Tab["15"]["TextColor3"] = Color3.fromRGB(200, 200, 200);
		Tab["15"]["BackgroundTransparency"] = 1;
		Tab["15"]["AnchorPoint"] = Vector2.new(0, 0.5);
		Tab["15"]["Size"] = UDim2.new(0, 75, 0, 12);
		Tab["15"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		Tab["15"]["Text"] = options.name;
		Tab["15"]["Name"] = [[Title]];
		Tab["15"]["Position"] = UDim2.new(0.225, 0, 0.5, 0);

		Tab["16"] = Instance.new("UITextSizeConstraint", Tab["15"]);
		Tab["16"]["MaxTextSize"] = 12;
		Tab["16"]["MinTextSize"] = 12;

		function Tab:Activate()
			if not Tab.Active then
				if Gui.CurrentTab ~= nil then
					Gui.CurrentTab:Deactivate()
				end

				Tab.Active = true
				Gui.CurrentTab = Tab

				Tab['12']['BackgroundTransparency'] = 0.5
				Tab['15']['TextTransparency'] = 0

				Tab['14']['ImageTransparency'] = 0

			end
		end

		function Tab:Deactivate()
			if Tab.Active then
				Tab.Active = false
				Tab.Hover = false

				Tab['12']['BackgroundTransparency'] = 1
				Tab['15']['TextTransparency'] = 0.6

				Tab['14']['ImageTransparency'] = 0.6
			end
		end

		Tab['12'].MouseButton1Click:Connect(function()
			Tab:Activate()
		end)

		function Tab.Create_Section()
			local Section = {}

			Section["21"] = Instance.new("Folder", Gui["2"]);
			Section["21"]["Name"] = [[Sections]];

			Section["58"] = Instance.new("ScrollingFrame", Section["21"]);
			Section["58"]["Active"] = true;
			Section["58"]["BorderSizePixel"] = 0;
			Section["58"]["CanvasSize"] = UDim2.new(0, 0, 0.5, 0);
			Section["58"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
			Section["58"]["Name"] = [[LeftSection]];
			Section["58"]["ScrollBarImageTransparency"] = 1;
			Section["58"]["AutomaticCanvasSize"] = Enum.AutomaticSize.XY;
			Section["58"]["Size"] = UDim2.new(0, 237, 0, 306);
			Section["58"]["ScrollBarImageColor3"] = Color3.fromRGB(0, 0, 0);
			Section["58"]["Position"] = UDim2.new(0.24, 0, 0.11, 0);

			Section["58"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			Section["58"]["ScrollBarThickness"] = 0;
			Section["58"]["BackgroundTransparency"] = 1;

			Section["59"] = Instance.new("UIListLayout", Section["58"]);
			Section["59"]["Padding"] = UDim.new(0, 6);

			Section["60"] = Instance.new("ScrollingFrame", Section["21"]);
			Section["60"]["Active"] = true;
			Section["60"]["BorderSizePixel"] = 0;
			Section["60"]["CanvasSize"] = UDim2.new(0, 0, 0.5, 0);
			Section["60"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
			Section["60"]["Name"] = [[RightSection]];
			Section["60"]["ScrollBarImageTransparency"] = 1;
			Section["60"]["AutomaticCanvasSize"] = Enum.AutomaticSize.XY;
			Section["60"]["Size"] = UDim2.new(0, 237, 0, 306);
			Section["60"]["ScrollBarImageColor3"] = Color3.fromRGB(0, 0, 0);
			Section["60"]["Position"] = UDim2.new(0.62, 0, 0.11, 0);

			Section["60"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			Section["60"]["ScrollBarThickness"] = 0;
			Section["60"]["BackgroundTransparency"] = 1;

			Section["61"] = Instance.new("UIListLayout", Section["60"]);
			Section["61"]["Padding"] = UDim.new(0, 6);

			local Container = Gui["2"]
			local Index = 0

			for _, v in pairs(Container:GetChildren()) do
				if v:IsA('Folder') and v.Name == 'Sections' then
					Index = Index + 1

					if Index >= 2 then
						for _, child in pairs(v:GetChildren()) do
							if child:IsA('ScrollingFrame') then
								child.Visible = false
							end
						end
					end
				end
			end

			Tab['12'].InputBegan:Connect(function(input, gpe)
				if gpe then
					return
				end

				if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
					for _, folder in pairs(Gui["2"]:GetChildren()) do
						if folder:IsA('Folder') and folder.Name == 'Sections' then
							for _, section in pairs(folder:GetChildren()) do
								if section:IsA('ScrollingFrame') then
									section.Visible = false
								end
							end
						end
					end

					Section['58'].Visible = true
					Section['60'].Visible = true
				end
			end)

			function Section.Create_Toggle(options)
				local Toggle = {
					State = false,
					flag = options.flag,
					Keybind = nil,
					WaitingForKey = false
				}

				local Target_Section

				if options.section == 'left' then
					Target_Section = Section["58"]
				else
					Target_Section = Section["60"]
				end

				Toggle["5a"] = Instance.new("Frame", Target_Section);
				Toggle["5a"]["BorderSizePixel"] = 0;
				Toggle["5a"]["BackgroundColor3"] = Color3.fromRGB(27, 27, 27);
				Toggle["5a"]["ClipsDescendants"] = true;
				Toggle["5a"]["Size"] = UDim2.new(0, 237, 0, 28);
				Toggle["5a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Toggle["5a"]["Name"] = [[Module]];
				Toggle["5a"]["BackgroundTransparency"] = 0.5;

				Toggle["5b"] = Instance.new("UICorner", Toggle["5a"]);
				Toggle["5b"]["CornerRadius"] = UDim.new(0, 5);

				Toggle["88"] = Instance.new("ImageButton", Toggle["5a"])
				Toggle["88"]["BorderSizePixel"] = 0;
				Toggle["88"]["ImageTransparency"] = 1;
				Toggle["88"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Toggle["88"]["Image"] = [[rbxassetid://85806357619289]];
				Toggle["88"]["Size"] = UDim2.new(0, 237, 0, 28);
				Toggle["88"]["BackgroundTransparency"] = 1;
				Toggle["88"]["Name"] = [[Header]];
				Toggle["88"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);

				Toggle["89"] = Instance.new("ImageLabel", Toggle["88"]);
				Toggle["89"]["BorderSizePixel"] = 0;
				Toggle["89"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Toggle["89"]["ImageTransparency"] = 0.5;
				Toggle["89"]["Image"] = [[rbxassetid://119990362562133]];
				Toggle["89"]["Size"] = UDim2.new(0, 11, 0, 11);
				Toggle["89"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Toggle["89"]["BackgroundTransparency"] = 1;
				Toggle["89"]["Rotation"] = 0;
				Toggle["89"]["Name"] = [[Arrow]];
				Toggle["89"]["Position"] = UDim2.new(0.9, 0, 0.286, 0);

				Toggle["8a"] = Instance.new("TextButton", Toggle["88"]);
				Toggle["8a"]["BorderSizePixel"] = 0;
				Toggle["8a"]["AutoButtonColor"] = false;
				Toggle["8a"]["TextSize"] = 14;
				Toggle["8a"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
				Toggle["8a"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Toggle["8a"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
				Toggle["8a"]["AnchorPoint"] = Vector2.new(0, 0.5);
				Toggle["8a"]["Size"] = UDim2.new(0, 33, 0, 28);
				Toggle["8a"]["BackgroundTransparency"] = 1;
				Toggle["8a"]["Name"] = [[Keybind]];
				Toggle["8a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Toggle["8a"]["Text"] = [[]];
				Toggle["8a"]["Position"] = UDim2.new(0, 0, 0.5, 0);

				Toggle["8b"] = Instance.new("Frame", Toggle["8a"]);
				Toggle["8b"]["BorderSizePixel"] = 0;
				Toggle["8b"]["BackgroundColor3"] = Color3.fromRGB(63, 63, 63);
				Toggle["8b"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
				Toggle["8b"]["Size"] = UDim2.new(0, 20, 0, 20);
				Toggle["8b"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
				Toggle["8b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Toggle["8b"]["Name"] = [[Background]];
				Toggle["8b"]["BackgroundTransparency"] = 0.5;

				Toggle["8c"] = Instance.new("UICorner", Toggle["8b"]);
				Toggle["8c"]["CornerRadius"] = UDim.new(0, 4);

				Toggle["8d"] = Instance.new("TextLabel", Toggle["8b"]);
				Toggle["8d"]["BorderSizePixel"] = 0;
				Toggle["8d"]["TextTransparency"] = 0.5;
				Toggle["8d"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Toggle["8d"]["TextSize"] = 10;
				Toggle["8d"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.SemiBold, Enum.FontStyle.Normal);
				Toggle["8d"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
				Toggle["8d"]["BackgroundTransparency"] = 1;
				Toggle["8d"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
				Toggle["8d"]["Size"] = UDim2.new(0, 12, 0, 12);
				Toggle["8d"]["Visible"] = false;
				Toggle["8d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Toggle["8d"]["Text"] = [[R]];
				Toggle["8d"]["Name"] = [[String]];
				Toggle["8d"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);

				Toggle["8e"] = Instance.new("UITextSizeConstraint", Toggle["8d"]);
				Toggle["8e"]["MaxTextSize"] = 11;
				Toggle["8e"]["MinTextSize"] = 11;

				Toggle["8f"] = Instance.new("ImageLabel", Toggle["8b"]);
				Toggle["8f"]["BorderSizePixel"] = 0;
				Toggle["8f"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Toggle["8f"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
				Toggle["8f"]["Image"] = [[rbxassetid://114520037763143]];
				Toggle["8f"]["Size"] = UDim2.new(0, 10, 0, 10);
				Toggle["8f"]["Visible"] = false;
				Toggle["8f"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Toggle["8f"]["BackgroundTransparency"] = 1;
				Toggle["8f"]["Name"] = [[Delete]];
				Toggle["8f"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);

				Toggle["90"] = Instance.new("ImageLabel", Toggle["8b"]);
				Toggle["90"]["BorderSizePixel"] = 0;
				Toggle["90"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Toggle["90"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
				Toggle["90"]["Image"] = [[rbxassetid://10734887784]];
				Toggle["90"]["Size"] = UDim2.new(0, 10, 0, 10);
				Toggle["90"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Toggle["90"]["BackgroundTransparency"] = 1;
				Toggle["90"]["Name"] = [[Edit]];
				Toggle["90"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);

				Toggle["91"] = Instance.new("TextLabel", Toggle["8a"]);
				Toggle["91"]["TextWrapped"] = true;
				Toggle["91"]["BorderSizePixel"] = 0;
				Toggle["91"]["TextXAlignment"] = Enum.TextXAlignment.Left;
				Toggle["91"]["TextTransparency"] = 0.5;
				Toggle["91"]["TextScaled"] = true;
				Toggle["91"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Toggle["91"]["TextSize"] = 14;
				Toggle["91"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.SemiBold, Enum.FontStyle.Normal);
				Toggle["91"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
				Toggle["91"]["BackgroundTransparency"] = 1;
				Toggle["91"]["AnchorPoint"] = Vector2.new(0, 0.5);
				Toggle["91"]["Size"] = UDim2.new(0, 156, 0, 12);
				Toggle["91"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Toggle["91"]["Text"] = options.name;
				Toggle["91"]["Name"] = [[Title]];
				Toggle["91"]["Position"] = UDim2.new(1, 0, 0.5, 0);

				if Library.Flags[Toggle.flag] then
					local Background_Tween = Ts:Create(Toggle["88"], TweenInfo.new(0.2), { ImageTransparency = 0.5 })
					Background_Tween:Play()
				else
					local Background_Tween = Ts:Create(Toggle["88"], TweenInfo.new(0.2), { ImageTransparency = 1 })
					Background_Tween:Play()
				end

				function Toggle:Toggle(state)
					if Library.Flags[self.flag] == nil then
						Library.Flags[self.flag] = false
					end

					if state == nil then
						Library.Flags[self.flag] = not Library.Flags[self.flag]
					else
						Library.Flags[self.flag] = state
					end

					if Library.Flags[self.flag] then
						local Background_Tween = Ts:Create(Toggle["88"], TweenInfo.new(0.2), { ImageTransparency = 0.5 })
						Background_Tween:Play()
					else
						local Background_Tween = Ts:Create(Toggle["88"], TweenInfo.new(0.2), { ImageTransparency = 1 })
						Background_Tween:Play()
					end

					Library.save_flags()
					options.callback(Library.Flags[self.flag])
				end

				if Library.Flags[Toggle.flag] == nil then
					Library.Flags[Toggle.flag] = false
				end

				Toggle:Toggle(Library.Flags[Toggle.flag])

				Toggle["8a"].MouseButton1Click:Connect(function()
					if not Toggle.WaitingForKey then
						Toggle["90"].Visible = false
						Toggle["8d"].Visible = true
						Toggle["8d"].Text = ".."
						Toggle.WaitingForKey = true
					end
				end)

				UserInputService.InputBegan:Connect(function(input, gpe)
					if Toggle.WaitingForKey and not gpe then
						if input.UserInputType == Enum.UserInputType.Keyboard then
							local key = input.KeyCode.Name
							if #key == 1 and key:match("%a") then
								Toggle["8d"].Text = key:upper()
								Toggle["8d"].Visible = true
								Toggle["90"].Visible = false
								Toggle.Keybind = Enum.KeyCode[key]
								Toggle.WaitingForKey = false
							elseif key == "Backspace" then
								Toggle["8d"].Text = ""
								Toggle["8d"].Visible = false
								Toggle["90"].Visible = true
								Toggle.Keybind = nil
								Toggle.WaitingForKey = false
							end
						end
					elseif Toggle.Keybind and input.KeyCode == Toggle.Keybind and not gpe then
						Toggle:Toggle()
					end
				end)

				Toggle['88'].InputBegan:Connect(function(input, gpe)
					if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
						Toggle:Toggle()
					end
				end)

				Toggle['88'].TouchTap:Connect(function()
					Toggle:Toggle()
				end)

				return Toggle
			end

function Section.Create_DropToggle(options)
	local DropToggle = {
		State = false,
		flag = options.flag,
		Keybind = nil,
		WaitingForKey = false
	}

	local Target_Section = options.section == 'left' and Section["58"] or Section["60"]

	DropToggle.Frame = Instance.new("Frame", Target_Section)
	DropToggle.Frame.Size = UDim2.new(0, 237, 0, 28)
	DropToggle.Frame.BackgroundTransparency = 0.5
	DropToggle.Frame.BackgroundColor3 = Color3.fromRGB(27, 27, 27)
	DropToggle.Frame.ClipsDescendants = true
	DropToggle.Frame.Name = "DropToggle"

	local Corner = Instance.new("UICorner", DropToggle.Frame)
	Corner.CornerRadius = UDim.new(0, 5)

	DropToggle.Header = Instance.new("ImageButton", DropToggle.Frame)
	DropToggle.Header.Size = UDim2.new(1, 0, 0, 28)
	DropToggle.Header.BackgroundTransparency = 1
	DropToggle.Header.ImageTransparency = 1
	DropToggle.Header.Image = "rbxassetid://85806357619289"
	DropToggle.Header.Name = "Header"

	DropToggle.Arrow = Instance.new("ImageLabel", DropToggle.Header)
	DropToggle.Arrow.Size = UDim2.new(0, 11, 0, 11)
	DropToggle.Arrow.Position = UDim2.new(0.9, 0, 0.286, 0)
	DropToggle.Arrow.BackgroundTransparency = 1
	DropToggle.Arrow.ImageTransparency = 0.5
	DropToggle.Arrow.Image = "rbxassetid://119990362562133"
	DropToggle.Arrow.Name = "Arrow"

	DropToggle.Title = Instance.new("TextLabel", DropToggle.Header)
	DropToggle.Title.Size = UDim2.new(0, 156, 0, 12)
	DropToggle.Title.Position = UDim2.new(0.06, 0, 0.5, 0)
	DropToggle.Title.AnchorPoint = Vector2.new(0, 0.5)
	DropToggle.Title.BackgroundTransparency = 1
	DropToggle.Title.TextTransparency = 0.5
	DropToggle.Title.TextScaled = true
	DropToggle.Title.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.SemiBold)
	DropToggle.Title.TextColor3 = Color3.new(1, 1, 1)
	DropToggle.Title.TextXAlignment = Enum.TextXAlignment.Left
	DropToggle.Title.Text = options.name or "DropToggle"
	DropToggle.Title.Name = "Title"

	local TitleConstraint = Instance.new("UITextSizeConstraint", DropToggle.Title)
	TitleConstraint.MaxTextSize = 12

	DropToggle.KeybindBtn = Instance.new("TextButton", DropToggle.Header)
	DropToggle.KeybindBtn.Size = UDim2.new(0, 33, 0, 28)
	DropToggle.KeybindBtn.BackgroundTransparency = 1
	DropToggle.KeybindBtn.Text = ""

	DropToggle.KeybindBG = Instance.new("Frame", DropToggle.KeybindBtn)
	DropToggle.KeybindBG.Size = UDim2.new(0, 20, 0, 20)
	DropToggle.KeybindBG.Position = UDim2.new(0.5, 0, 0.5, 0)
	DropToggle.KeybindBG.AnchorPoint = Vector2.new(0.5, 0.5)
	DropToggle.KeybindBG.BackgroundColor3 = Color3.fromRGB(63, 63, 63)
	DropToggle.KeybindBG.BackgroundTransparency = 0.5

	local KBCorner = Instance.new("UICorner", DropToggle.KeybindBG)
	KBCorner.CornerRadius = UDim.new(0, 4)

	DropToggle.KeybindText = Instance.new("TextLabel", DropToggle.KeybindBG)
	DropToggle.KeybindText.Size = UDim2.new(0, 12, 0, 12)
	DropToggle.KeybindText.Position = UDim2.new(0.5, 0, 0.5, 0)
	DropToggle.KeybindText.AnchorPoint = Vector2.new(0.5, 0.5)
	DropToggle.KeybindText.BackgroundTransparency = 1
	DropToggle.KeybindText.TextColor3 = Color3.new(1, 1, 1)
	DropToggle.KeybindText.TextTransparency = 0.5
	DropToggle.KeybindText.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.SemiBold)
	DropToggle.KeybindText.Visible = false

	DropToggle.EditIcon = Instance.new("ImageLabel", DropToggle.KeybindBG)
	DropToggle.EditIcon.Size = UDim2.new(0, 10, 0, 10)
	DropToggle.EditIcon.Position = UDim2.new(0.5, 0, 0.5, 0)
	DropToggle.EditIcon.AnchorPoint = Vector2.new(0.5, 0.5)
	DropToggle.EditIcon.BackgroundTransparency = 1
	DropToggle.EditIcon.Image = "rbxassetid://10734887784"

	DropToggle.Content = Instance.new("ScrollingFrame", DropToggle.Frame)
	DropToggle.Content.Size = UDim2.new(1, 0, 0, 0)
	DropToggle.Content.Position = UDim2.new(0, 0, 1, 0)
	DropToggle.Content.AnchorPoint = Vector2.new(0, 1)
	DropToggle.Content.BackgroundTransparency = 1
	DropToggle.Content.ScrollBarThickness = 0
	DropToggle.Content.AutomaticCanvasSize = Enum.AutomaticSize.Y

	local ContentList = Instance.new("UIListLayout", DropToggle.Content)
	ContentList.Padding = UDim.new(0, 4)
	ContentList.HorizontalAlignment = Enum.HorizontalAlignment.Center

	local ContentPadding = Instance.new("UIPadding", DropToggle.Content)
	ContentPadding.PaddingTop = UDim.new(0, 4)
	ContentPadding.PaddingLeft = UDim.new(0, 8)
	ContentPadding.PaddingRight = UDim.new(0, 8)

	if Library.Flags[DropToggle.flag] == nil then
		Library.Flags[DropToggle.flag] = false
	end
	DropToggle.State = Library.Flags[DropToggle.flag]

	function DropToggle:Toggle(state)
		if state ~= nil then
			DropToggle.State = state
		else
			DropToggle.State = not DropToggle.State
		end

		Library.Flags[self.flag] = DropToggle.State
		Library.save_flags()

		Library:Tween(DropToggle.Header, {ImageTransparency = DropToggle.State and 0.5 or 1})
		Library:Tween(DropToggle.Arrow, {Rotation = DropToggle.State and -90 or 0})

		if DropToggle.State then
			local contentHeight = DropToggle.Content.AbsoluteCanvasSize.Y + 12
			Library:Tween(DropToggle.Frame, {Size = UDim2.new(0, 237, 0, 28 + contentHeight)})
			Library:Tween(DropToggle.Content, {Size = UDim2.new(1, 0, 0, contentHeight)})
		else
			Library:Tween(DropToggle.Frame, {Size = UDim2.new(0, 237, 0, 28)})
			Library:Tween(DropToggle.Content, {Size = UDim2.new(1, 0, 0, 0)})
		end

		if options.callback then
			options.callback(DropToggle.State)
		end
	end

	DropToggle.KeybindBtn.MouseButton1Click:Connect(function()
		if not DropToggle.WaitingForKey then
			DropToggle.EditIcon.Visible = false
			DropToggle.KeybindText.Visible = true
			DropToggle.KeybindText.Text = ".."
			DropToggle.WaitingForKey = true
		end
	end)

	UserInputService.InputBegan:Connect(function(input, gp)
		if DropToggle.WaitingForKey and not gp then
			if input.UserInputType == Enum.UserInputType.Keyboard then
				local key = input.KeyCode.Name
				if key:match("^%u$") then
					DropToggle.KeybindText.Text = key
					DropToggle.Keybind = Enum.KeyCode[key]
				elseif key == "Backspace" then
					DropToggle.KeybindText.Text = ""
					DropToggle.Keybind = nil
					DropToggle.EditIcon.Visible = true
				end
				DropToggle.KeybindText.Visible = DropToggle.Keybind ~= nil
				DropToggle.WaitingForKey = false
			end
		elseif DropToggle.Keybind and input.KeyCode == DropToggle.Keybind and not gp then
			DropToggle:Toggle()
		end
	end)

	DropToggle.Header.MouseButton1Click:Connect(function()
		DropToggle:Toggle()
	end)

	DropToggle.Header.TouchTap:Connect(function()
		DropToggle:Toggle()
	end)

	DropToggle:Toggle(DropToggle.State)

	return DropToggle
end

				function Module.Create_Slider(self, options)
					local Slider = {
						MouseDown = false,
						Hover = false,
						Connection = nil
					}

					Slider["3e"] = Instance.new("TextButton", Module["5c"]);
					Slider["3e"]["BorderSizePixel"] = 0;
					Slider["3e"]["AutoButtonColor"] = false;
					Slider["3e"]["TextSize"] = 14;
					Slider["3e"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
					Slider["3e"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
					Slider["3e"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
					
					Slider["3e"]["Size"] = UDim2.new(0, 216, 0, 0);
					Slider["3e"]["BackgroundTransparency"] = 1;
					Slider["3e"]["TextTransparency"] = 1
					
					if options.position == 'top' then
						Module._prependIndex = Module._prependIndex - 1
						Slider["3e"]["LayoutOrder"] = Module._prependIndex
					else
						Module._layoutIndex = Module._layoutIndex + 1
						Slider["3e"]["LayoutOrder"] = Module._layoutIndex
					end
					Slider["3e"]["Name"] = [[Slider]];
					Slider["3e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					Slider["3e"]["Text"] = [[]];

					Slider["3f"] = Instance.new("Frame", Slider["3e"]);
					Slider["3f"]["BorderSizePixel"] = 0;
					Slider["3f"]["BackgroundColor3"] = Color3.fromRGB(49, 49, 49);
					Slider["3f"]["AnchorPoint"] = Vector2.new(0.5, 1);
					Slider["3f"]["Size"] = UDim2.new(0, 217, 0, 4);
					Slider["3f"]["Position"] = UDim2.new(0.5, 0, 0.8, 0);
					Slider["3f"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					Slider["3f"]["Name"] = [[Drag]];
					Slider["3f"]["BackgroundTransparency"] = 0.5;

				   Slider["40"] = Instance.new("UICorner", Slider["3f"]);

					Slider["41"] = Instance.new("Frame", Slider["3f"]);
					Slider["41"]["BorderSizePixel"] = 0;
					Slider["41"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
					Slider["41"]["AnchorPoint"] = Vector2.new(0, 0.5);

					local Percentage = (options.default - options.min) / (options.max - options.min)
					Slider["41"].Size = UDim2.fromScale(Percentage, 1)

					Slider["41"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					Slider["41"]["Name"] = [[Fill]];
					Slider["41"]["BackgroundTransparency"] = 0.5;

					Slider["42"] = Instance.new("UICorner", Slider["41"]);

					Slider["43"] = Instance.new("Frame", Slider["41"]);
					Slider["43"]["BorderSizePixel"] = 0;
					Slider["43"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
					Slider["43"]["AnchorPoint"] = Vector2.new(1, 0.5);
					Slider["43"]["Size"] = UDim2.new(0, 6, 0, 6)

					Slider["43"]["Position"] = UDim2.new(1, 0, 0.5, 0)

					Slider["43"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					Slider["43"]["Name"] = [[Circle]];

					Slider["44"] = Instance.new("UICorner", Slider["43"]);
					Slider["44"]["CornerRadius"] = UDim.new(1, 0);

					Slider["45"] = Instance.new("TextLabel", Slider["3e"]);
					Slider["45"]["TextWrapped"] = true;
					Slider["45"]["BorderSizePixel"] = 0;
					Slider["45"]["TextXAlignment"] = Enum.TextXAlignment.Left;
					Slider["45"]["TextTransparency"] = 0.5;
					Slider["45"]["TextScaled"] = true;
					Slider["45"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
					Slider["45"]["TextSize"] = 14;
					Slider["45"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Medium, Enum.FontStyle.Normal);
					Slider["45"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
					Slider["45"]["BackgroundTransparency"] = 1;
					Slider["45"]["AnchorPoint"] = Vector2.new(0, 0.5);
					Slider["45"]["Size"] = UDim2.new(0, 172, 0, 12);
					Slider["45"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					Slider["45"]["Text"] = options.name
					Slider["45"]["Name"] = [[Title]];
					Slider["45"]["Position"] = UDim2.new(0, 0, 0.1, 0);

					Slider["46"] = Instance.new("UITextSizeConstraint", Slider["45"]);
					Slider["46"]["MaxTextSize"] = 12;
					Slider["46"]["MinTextSize"] = 12;

					Slider["47"] = Instance.new("TextLabel", Slider["3e"]);
					Slider["47"]["TextWrapped"] = true;
					Slider["47"]["BorderSizePixel"] = 0;
					Slider["47"]["TextXAlignment"] = Enum.TextXAlignment.Right;
					Slider["47"]["TextTransparency"] = 0.5;
					Slider["47"]["TextScaled"] = true;
					Slider["47"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
					Slider["47"]["TextSize"] = 14;
					Slider["47"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Medium, Enum.FontStyle.Normal);
					Slider["47"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
					Slider["47"]["BackgroundTransparency"] = 1;
					Slider["47"]["AnchorPoint"] = Vector2.new(1, 0.5);
					Slider["47"]["Size"] = UDim2.new(0, 42, 0, 12);
					Slider["47"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					Slider["47"]["Text"] = options.default
					Slider["47"]["Name"] = [[Value]];
					Slider["47"]["Position"] = UDim2.new(1, 0, 0.4, 0);

					Slider["48"] = Instance.new("UITextSizeConstraint", Slider["47"]);
					Slider["48"]["MaxTextSize"] = 12;
					Slider["48"]["MinTextSize"] = 12;
 
					function Slider:SetValue(v)
						if v == nil then

							local Percentage = math.clamp((Mouse.X - Slider['3e'].AbsolutePosition.X) / (Slider['3e'].AbsoluteSize.X), 0, 1)
							local Value = math.floor(((options.max - options.min) * Percentage) + options.min)

							Slider['47'].Text = tostring(Value)
							Slider["43"]["Position"] = UDim2.new(1, 0, 0.5, 0);

							Slider["41"].Size = UDim2.fromScale(Percentage, 1)
						else
							Slider['47'].Text = tostring(v)
							Slider['3f'].Size = UDim2.fromScale(((v - options.min) / (options.max - options.min)), 1)
						end

						options.callback(Slider:GetValue())
					end

					function Slider:GetValue()
						return tonumber(Slider['47'].Text)
					end

					Slider['3e'].MouseEnter:Connect(function()
						Slider.Hover = true
					end)

					Slider['3e'].MouseLeave:Connect(function()
						Slider.Hover = false
					end)

					UserInputService.InputBegan:Connect(function(input, gpe)
						if Slider.Hover then
							if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
								Slider.MouseDown = true

								if not Slider.Connection then
									Slider.Connection = RunService.RenderStepped:Connect(function()
										Slider:SetValue()
									end)
								end
							end
						end
					end)

					UserInputService.InputEnded:Connect(function(input, gpe)
						if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
							Slider.MouseDown = false

							if Slider.Connection then
								Slider.Connection:Disconnect()
							end

							Slider.Connection = nil
						end
					end)

					-- animate slide-down + fade-in
					pcall(function()
						local tween = Ts:Create(Slider["3e"], TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Size = UDim2.new(0, 216, 0, 27), TextTransparency = 0 })
						tween:Play()
					end)

					return Slider
				end

				-- Allows creating additional dropdowns inside this Module's Settings
				function Module.Create_Dropdown(self, options)
					local DD = {}

					DD.Frame = Instance.new("TextButton", Module["5c"])
					DD.Frame.BorderSizePixel = 0
					DD.Frame.AutoButtonColor = false
					DD.Frame.TextSize = 14
					DD.Frame.TextColor3 = Color3.fromRGB(0, 0, 0)
					DD.Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					DD.Frame.FontFace = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
					-- start collapsed so it can animate into view
					DD.Frame.Size = UDim2.new(0, 216, 0, 0)
					DD.Frame.BackgroundTransparency = 1
					DD.Frame.TextTransparency = 1
					-- layout order based on options.position ('top' to prepend)
					if options.position == 'top' then
						Module._prependIndex = Module._prependIndex - 1
						DD.Frame.LayoutOrder = Module._prependIndex
					else
						Module._layoutIndex = Module._layoutIndex + 1
						DD.Frame.LayoutOrder = Module._layoutIndex
					end

					-- wrap the dropdown header + options in a container so we can animate
					-- the container's size. Animating a single child's Size causes UIListLayout
					-- to reposition siblings smoothly, preventing clipping of sliders below.
					local DD_Container = Instance.new('Frame', Module["5c"])
					DD_Container.BorderSizePixel = 0
					DD_Container.BackgroundTransparency = 1
					DD_Container.Size = UDim2.new(0, 216, 0, 0)
					DD_Container.Name = 'DD_Container'
					DD_Container.ZIndex = 8
					DD_Container.ClipsDescendants = false
					-- move the layout order from the header to the container so it sorts correctly
					DD_Container.LayoutOrder = DD.Frame.LayoutOrder
					DD.Frame.LayoutOrder = 0

					-- reparent the header into the container so options (which are children
					-- of the header) move with it
					DD.Frame.Parent = DD_Container
					-- ensure the header button has a real clickable area (header height)
					DD.Frame.Size = UDim2.new(0, 216, 0, 27)
					DD.Frame.Position = UDim2.new(0, 0, 0, 0)
					DD.Frame.Name = [[Dropdown]]
					DD.Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
					DD.Frame.Text = [[]]

					DD.Padding = Instance.new("UIPadding", DD.Frame)
					DD.Padding.PaddingTop = UDim.new(0, 3)

					DD.Title = Instance.new("TextLabel", DD.Frame)
					DD.Title.TextWrapped = true
					DD.Title.BorderSizePixel = 0
					DD.Title.TextXAlignment = Enum.TextXAlignment.Left
					DD.Title.TextTransparency = 0.5
					DD.Title.TextScaled = true
					DD.Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					DD.Title.TextSize = 14
					DD.Title.FontFace = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Medium, Enum.FontStyle.Normal)
					DD.Title.TextColor3 = Color3.fromRGB(255, 255, 255)
					DD.Title.BackgroundTransparency = 1
					DD.Title.Size = UDim2.new(0, 215, 0, 12)
					DD.Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
					DD.Title.Text = options.name or ''
					DD.Title.Name = [[Title]]

					DD.Box = Instance.new("Frame", DD.Title)
					DD.Box.BorderSizePixel = 0
					DD.Box.BackgroundColor3 = Color3.fromRGB(49, 49, 49)
					DD.Box.AnchorPoint = Vector2.new(0.5, 0)
					DD.Box.Size = UDim2.new(0, 218, 0, 18)
					DD.Box.Position = UDim2.new(0.5, 0, 1.3, 0)
					DD.Box.BorderColor3 = Color3.fromRGB(0, 0, 0)
					DD.Box.Name = [[Box]]
					DD.Box.BackgroundTransparency = 1

					local Corner = Instance.new("UICorner", DD.Box)

					DD.Options = Instance.new("Frame", DD.Box)
					DD.Options.BorderSizePixel = 0
					DD.Options.BackgroundColor3 = Color3.fromRGB(36, 36, 36)
					DD.Options.AnchorPoint = Vector2.new(0.5, 0)
					DD.Options.ClipsDescendants = true
					DD.Options.Size = UDim2.new(0, 218, 0, 0)
					DD.Options.Position = UDim2.new(0.5, 0, 0.5, 4)
					DD.Options.BorderColor3 = Color3.fromRGB(0, 0, 0)
					DD.Options.Name = [[Options]]
					DD.Options.BackgroundTransparency = 1

					DD.Fill = Instance.new("Frame", DD.Options)
					DD.Fill.BorderSizePixel = 0
					DD.Fill.BackgroundColor3 = Color3.fromRGB(36, 36, 36)
					DD.Fill.Size = UDim2.new(0, 218, 0, 89)
					DD.Fill.Position = UDim2.new(0, 0, -0.05, 0)
					DD.Fill.BorderColor3 = Color3.fromRGB(0, 0, 0)
					DD.Fill.Name = [[Fill]]
					DD.Fill.BackgroundTransparency = 0.5

					local Corner2 = Instance.new("ImageLabel", DD.Fill)
					Corner2.BorderSizePixel = 0
					Corner2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					Corner2.ImageTransparency = 0.5
					Corner2.Image = [[rbxassetid://135267619427964]]
					Corner2.Size = UDim2.new(0, 218, 0, 10)
					Corner2.BorderColor3 = Color3.fromRGB(0, 0, 0)
					Corner2.BackgroundTransparency = 1
					Corner2.Name = [[Corner]]
					Corner2.Position = UDim2.new(0, 0, 1, 0)

					DD.List = Instance.new("ScrollingFrame", DD.Options)
					DD.List.Active = true
					DD.List.BorderSizePixel = 0
					DD.List.CanvasSize = UDim2.new(0, 0, 0.5, 0)
					DD.List.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					DD.List.Name = [[List]]
					DD.List.ScrollBarImageTransparency = 1
					DD.List.AnchorPoint = Vector2.new(0.5, 0)
					DD.List.AutomaticCanvasSize = Enum.AutomaticSize.XY
					DD.List.Size = UDim2.new(0, 218, 0, 85)
					DD.List.ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0)
					DD.List.Position = UDim2.new(0.5, 0, 0, 0)
					DD.List.BorderColor3 = Color3.fromRGB(0, 0, 0)
					DD.List.ScrollBarThickness = 0
					DD.List.BackgroundTransparency = 1

					local listLayout = Instance.new("UIListLayout", DD.List)
					listLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center

					function DD:Select_Option(option)
						if option == nil or option == "" or not table.find(options.options, option) then
							DD.Selected_Option = options.options[1]
						else
							DD.Selected_Option = option
						end

						if options.flag then
							Library.Flags[options.flag] = DD.Selected_Option
						end

						if options.callback then
							options.callback(DD.Selected_Option)
						end

						Library.save_flags()
					end

					-- initialize
					if options.flag and Library.Flags[options.flag] then
						DD.Selected_Option = Library.Flags[options.flag]
					else
						DD.Selected_Option = options.options and options.options[1] or ''
					end

					for _, option in pairs(options.options or {}) do
						local Option_Button = Instance.new("TextButton", DD.List)
						Option_Button.BorderSizePixel = 0
						Option_Button.TextXAlignment = Enum.TextXAlignment.Left
						Option_Button.TextTransparency = 0.5
						Option_Button.TextSize = 12
						Option_Button.TextColor3 = Color3.fromRGB(255, 255, 255)
						Option_Button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
						Option_Button.FontFace = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Medium, Enum.FontStyle.Normal)
						Option_Button.ZIndex = 2
						Option_Button.Size = UDim2.new(0, 205, 0, 17)
						Option_Button.BackgroundTransparency = 1
						Option_Button.Name = "Option"
						Option_Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
						Option_Button.Text = option

						if option == DD.Selected_Option then
							Option_Button.TextTransparency = 0
							Option_Button.TextStrokeTransparency = 0.86
						end

						Option_Button.MouseButton1Click:Connect(function()
							for _, v in pairs(DD.List:GetChildren()) do
								if v:IsA("TextButton") then
									v.TextTransparency = 0.5
									v.TextStrokeTransparency = 1
								end
							end

							Option_Button.TextTransparency = 0
							Option_Button.TextStrokeTransparency = 0.86

							DD:Select_Option(option)
						end)
					end

					-- add arrow and toggle behavior so this dropdown is interactive
					DD.Arrow = Instance.new('ImageLabel', DD.Frame)
					DD.Arrow.BorderSizePixel = 0
					DD.Arrow.BackgroundTransparency = 1
					DD.Arrow.Image = [[rbxassetid://119990362562133]]
					DD.Arrow.ImageTransparency = 0.5
					DD.Arrow.Size = UDim2.new(0, 11, 0, 11)
					DD.Arrow.Position = UDim2.new(0.9, 0, 0.286, 0)
					DD.Arrow.Name = 'Arrow'

					DD.Frame.ZIndex = 10
					DD.Options.ZIndex = 11
					DD_Container.ZIndex = 9
					DD.Frame.Active = true
					DD.Frame.Visible = true

					local open = false
					local function toggleDD(state)
						if state == nil then state = not open end
						open = state
						local headerHeight = 27
						local optionsHeight = 85
						local desiredOpenHeight = headerHeight + optionsHeight
						if open then
							-- detect the next sibling below this container (by LayoutOrder)
							local parent = DD_Container.Parent
							local myOrder = DD_Container.LayoutOrder or 0
							local nextChild = nil
							local nextOrder = math.huge
							for _, child in pairs(parent:GetChildren()) do
								if child ~= DD_Container and child:IsA('Instance') and child.LayoutOrder then
									local ord = child.LayoutOrder
									if ord > myOrder and ord < nextOrder then
										nextOrder = ord
										nextChild = child
									end
								end
							end
							local adjust = 0
							if nextChild then
								-- compute overlap in absolute coords. wait two frames to ensure layouts are stable
								RunService.Heartbeat:Wait()
								RunService.Heartbeat:Wait()
								local containerAbsY = DD_Container.AbsolutePosition and DD_Container.AbsolutePosition.Y or 0
								local nextAbsY = nextChild.AbsolutePosition and nextChild.AbsolutePosition.Y or 0
								local openBottom = containerAbsY + desiredOpenHeight
								local overlap = openBottom - nextAbsY
								if overlap > 0 then
									-- add slightly larger padding so sliders visibly move out of the dropdown area
									adjust = math.max(overlap + 8, 8)
								end
							end
							local finalHeight = desiredOpenHeight + adjust
							Ts:Create(DD_Container, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Size = UDim2.new(0, 216, 0, finalHeight) }):Play()
							Ts:Create(DD.Arrow, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Rotation = -90 }):Play()
						else
							Ts:Create(DD_Container, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Size = UDim2.new(0, 216, 0, headerHeight) }):Play()
							Ts:Create(DD.Arrow, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Rotation = 0 }):Play()
						end
					end

					-- add an invisible hitbox over the header so clicks always register
					DD.Hit = Instance.new('TextButton', DD_Container)
					DD.Hit.Name = 'Hitbox'
					DD.Hit.Size = UDim2.new(0, 216, 0, 27)
					DD.Hit.Position = UDim2.new(0, 0, 0, 0)
					DD.Hit.BackgroundTransparency = 1
					DD.Hit.AutoButtonColor = false
					DD.Hit.ZIndex = 100
					DD.Hit.Text = ''

					DD.Hit.MouseButton1Click:Connect(function()
						warn('Dropdown clicked (hitbox):', options and options.name or '(no-name)')
						local ok, err = pcall(toggleDD)
						if not ok then
							warn('toggleDD error:', err)
						end
					end)

					-- animate slide-down + fade-in for the dropdown container (header visible)
					pcall(function()
						local tween = Ts:Create(DD_Container, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Size = UDim2.new(0, 216, 0, 27) })
						tween:Play()
						DD.Frame.TextTransparency = 0
					end)

					return DD
				end
				return Module
			end

			return Section
		end
		return Tab
	end
	return Gui
end

return Library





-- Example usage: creating a window, a tab, a section, then a drop-module
-- (and adding multiple sliders + multiple dropdowns inside that module).
-- Uncomment and adapt in your executor environment.

-- local Library_Handler = Library.Add_Window('Byte')

-- local Player_Tab = Library_Handler.Create_Tab({
--     name = 'Player',
--     icon = 'rbxassetid://126017907477623'
-- })

-- local Player_Section = Player_Tab.Create_Section()

-- -- Create a drop-toggle module and keep the returned module object
-- local myModule = Player_Section.Create_DropToggle({
--     name = 'My Module',
--     section = 'left',
--
--     flag = 'MyModule_Toggle',       -- persisted toggle open/closed state
--     flag2 = 'MyModule_Default',     -- persisted selected option (main dropdown)
--
--     options = {'OptionA', 'OptionB', 'OptionC'},
--     callback = function(state)
--         print('Module toggled:', state)
--     end,
--
--     callback2 = function(selected)
--         print('Primary selection changed:', selected)
--     end
-- })

-- -- Add multiple sliders to the same module (works because Create_Slider is a Module method)
-- myModule:Create_Slider({
--     name = 'Speed',
--     min = 0,
--     max = 100,
--     default = 50,
--     callback = function(value)
--         print('Speed slider value:', value)
--     end
-- })

-- myModule:Create_Slider({
--     name = 'Range',
--     min = 0,
--     max = 500,
--     default = 200,
--     callback = function(value)
--         print('Range slider value:', value)
--     end
-- })

-- -- Example: create a slider inserted at the TOP of the module
-- myModule:Create_Slider({
--     name = 'Speed',
--     min = 0,
--     max = 100,
--     default = 50,
--     position = 'top', -- 'top' will place this slider above existing items
--     callback = function(value)
--         print('Speed slider value:', value)
--     end
-- })

-- -- Example: create a slider appended at the BOTTOM (default)
-- myModule:Create_Slider({
--     name = 'Range',
--     min = 0,
--     max = 500,
--     default = 200,
--     callback = function(value)
--         print('Range slider value:', value)
--     end
-- })
-- local dd2 = myModule:Create_Dropdown({
--     name = 'Weapon',
--     options = {'Sword', 'Bow', 'Staff'},
--     flag = 'MyModule_Weapon',
--     callback = function(selected)
--         print('Weapon selected:', selected)
--     end
-- })

-- -- Example: create a dropdown inserted at the top
-- local dd2 = myModule:Create_Dropdown({
--     name = 'Weapon',
--     options = {'Sword', 'Bow', 'Staff'},
--     flag = 'MyModule_Weapon',
--     position = 'top',
--     callback = function(selected)
--         print('Weapon selected:', selected)
--     end
-- })

-- -- You can read the current selected option via the dropdown object (if you need it):
-- -- print('Current mode:', dd1.Selected_Option)
-- -- print('Current weapon:', dd2.Selected_Option)
