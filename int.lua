local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

-- Ensure Lighting is loaded
local Lighting = game:GetService("Lighting")
if not Lighting then task.wait(1) end

-- Create intro GUI
local introGui = Instance.new("ScreenGui")
introGui.ResetOnSpawn = false
introGui.IgnoreGuiInset = true
introGui.Parent = PlayerGui

-- Blur
local blur = Instance.new("BlurEffect")
blur.Size = 0
blur.Parent = Lighting

-- Image
local image = Instance.new("ImageLabel")
image.AnchorPoint = Vector2.new(0.5, 0.5)
image.Position = UDim2.new(0.5, 0, 0.5, 0)
image.Size = UDim2.new(0, 350, 0, 350)
image.Image = "rbxassetid://84227715422318"
image.BackgroundTransparency = 1
image.ImageTransparency = 1
image.Parent = introGui

-- Tween intro
local blurInTween = TweenService:Create(blur, TweenInfo.new(2.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size=24})
local fadeInTween = TweenService:Create(image, TweenInfo.new(2.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {ImageTransparency=0.5})

blurInTween:Play()
fadeInTween:Play()
fadeInTween.Completed:Wait()

task.wait(2)

-- Tween outro
local fadeOutImageTween = TweenService:Create(image, TweenInfo.new(2.5), {ImageTransparency=1})
local fadeOutBlurTween = TweenService:Create(blur, TweenInfo.new(2.5), {Size=0})

fadeOutImageTween:Play()
fadeOutBlurTween:Play()
fadeOutImageTween.Completed:Wait()
fadeOutBlurTween.Completed:Wait()

-- Cleanup
introGui:Destroy()
blur:Destroy()
task.wait()
