local MarketplaceService = game:GetService("MarketplaceService")
local TextService = game:GetService("TextService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local HttpService = game:GetService("HttpService")
local RunService = game:GetService("RunService")
local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local PlayerMouse = Player:GetMouse()

local redzlib = {
	Themes = {
		Darker = {
			["Color Hub 1"] = ColorSequence.new({
				ColorSequenceKeypoint.new(0.00, Color3.fromRGB(25, 25, 25)),
				ColorSequenceKeypoint.new(0.50, Color3.fromRGB(32.5, 32.5, 32.5)),
				ColorSequenceKeypoint.new(1.00, Color3.fromRGB(25, 25, 25))
			}),
			["Color Hub 2"] = Color3.fromRGB(30, 30, 30),
			["Color Stroke"] = Color3.fromRGB(40, 40, 40),
			["Color Theme"] = Color3.fromRGB(88, 101, 242),
			["Color Text"] = Color3.fromRGB(243, 243, 243),
			["Color Dark Text"] = Color3.fromRGB(180, 180, 180)
		},
		Dark = {
			["Color Hub 1"] = ColorSequence.new({
				ColorSequenceKeypoint.new(0.00, Color3.fromRGB(40, 40, 40)),
				ColorSequenceKeypoint.new(0.50, Color3.fromRGB(47.5, 47.5, 47.5)),
				ColorSequenceKeypoint.new(1.00, Color3.fromRGB(40, 40, 40))
			}),
			["Color Hub 2"] = Color3.fromRGB(45, 45, 45),
			["Color Stroke"] = Color3.fromRGB(65, 65, 65),
			["Color Theme"] = Color3.fromRGB(65, 150, 255),
			["Color Text"] = Color3.fromRGB(245, 245, 245),
			["Color Dark Text"] = Color3.fromRGB(190, 190, 190)
		},
		Purple = {
			["Color Hub 1"] = ColorSequence.new({
				ColorSequenceKeypoint.new(0.00, Color3.fromRGB(27.5, 25, 30)),
				ColorSequenceKeypoint.new(0.50, Color3.fromRGB(32.5, 32.5, 32.5)),
				ColorSequenceKeypoint.new(1.00, Color3.fromRGB(27.5, 25, 30))
			}),
			["Color Hub 2"] = Color3.fromRGB(30, 30, 30),
			["Color Stroke"] = Color3.fromRGB(40, 40, 40),
			["Color Theme"] = Color3.fromRGB(150, 0, 255),
			["Color Text"] = Color3.fromRGB(240, 240, 240),
			["Color Dark Text"] = Color3.fromRGB(180, 180, 180)
		},
		Ocean = {
			["Color Hub 1"] = ColorSequence.new({
				ColorSequenceKeypoint.new(0.00, Color3.fromRGB(10, 30, 50)),
				ColorSequenceKeypoint.new(0.50, Color3.fromRGB(15, 40, 65)),
				ColorSequenceKeypoint.new(1.00, Color3.fromRGB(10, 30, 50))
			}),
			["Color Hub 2"] = Color3.fromRGB(12, 35, 55),
			["Color Stroke"] = Color3.fromRGB(20, 55, 80),
			["Color Theme"] = Color3.fromRGB(0, 180, 220),
			["Color Text"] = Color3.fromRGB(220, 240, 255),
			["Color Dark Text"] = Color3.fromRGB(140, 180, 210)
		},
		Crimson = {
			["Color Hub 1"] = ColorSequence.new({
				ColorSequenceKeypoint.new(0.00, Color3.fromRGB(30, 10, 10)),
				ColorSequenceKeypoint.new(0.50, Color3.fromRGB(40, 15, 15)),
				ColorSequenceKeypoint.new(1.00, Color3.fromRGB(30, 10, 10))
			}),
			["Color Hub 2"] = Color3.fromRGB(35, 12, 12),
			["Color Stroke"] = Color3.fromRGB(55, 20, 20),
			["Color Theme"] = Color3.fromRGB(220, 40, 40),
			["Color Text"] = Color3.fromRGB(255, 230, 230),
			["Color Dark Text"] = Color3.fromRGB(200, 160, 160)
		},
		Emerald = {
			["Color Hub 1"] = ColorSequence.new({
				ColorSequenceKeypoint.new(0.00, Color3.fromRGB(10, 28, 18)),
				ColorSequenceKeypoint.new(0.50, Color3.fromRGB(14, 38, 24)),
				ColorSequenceKeypoint.new(1.00, Color3.fromRGB(10, 28, 18))
			}),
			["Color Hub 2"] = Color3.fromRGB(12, 33, 21),
			["Color Stroke"] = Color3.fromRGB(20, 55, 35),
			["Color Theme"] = Color3.fromRGB(0, 200, 100),
			["Color Text"] = Color3.fromRGB(220, 255, 235),
			["Color Dark Text"] = Color3.fromRGB(140, 200, 165)
		},
		Sunset = {
			["Color Hub 1"] = ColorSequence.new({
				ColorSequenceKeypoint.new(0.00, Color3.fromRGB(35, 18, 10)),
				ColorSequenceKeypoint.new(0.50, Color3.fromRGB(45, 25, 12)),
				ColorSequenceKeypoint.new(1.00, Color3.fromRGB(35, 18, 10))
			}),
			["Color Hub 2"] = Color3.fromRGB(40, 22, 12),
			["Color Stroke"] = Color3.fromRGB(65, 38, 18),
			["Color Theme"] = Color3.fromRGB(255, 120, 30),
			["Color Text"] = Color3.fromRGB(255, 240, 220),
			["Color Dark Text"] = Color3.fromRGB(210, 175, 140)
		},
		Midnight = {
			["Color Hub 1"] = ColorSequence.new({
				ColorSequenceKeypoint.new(0.00, Color3.fromRGB(8, 8, 18)),
				ColorSequenceKeypoint.new(0.50, Color3.fromRGB(12, 12, 25)),
				ColorSequenceKeypoint.new(1.00, Color3.fromRGB(8, 8, 18))
			}),
			["Color Hub 2"] = Color3.fromRGB(10, 10, 22),
			["Color Stroke"] = Color3.fromRGB(22, 22, 45),
			["Color Theme"] = Color3.fromRGB(100, 80, 255),
			["Color Text"] = Color3.fromRGB(220, 218, 255),
			["Color Dark Text"] = Color3.fromRGB(155, 150, 210)
		},
		Rose = {
			["Color Hub 1"] = ColorSequence.new({
				ColorSequenceKeypoint.new(0.00, Color3.fromRGB(32, 14, 24)),
				ColorSequenceKeypoint.new(0.50, Color3.fromRGB(42, 20, 32)),
				ColorSequenceKeypoint.new(1.00, Color3.fromRGB(32, 14, 24))
			}),
			["Color Hub 2"] = Color3.fromRGB(38, 17, 28),
			["Color Stroke"] = Color3.fromRGB(60, 28, 46),
			["Color Theme"] = Color3.fromRGB(255, 80, 140),
			["Color Text"] = Color3.fromRGB(255, 228, 240),
			["Color Dark Text"] = Color3.fromRGB(210, 160, 185)
		},
		Monochrome = {
			["Color Hub 1"] = ColorSequence.new({
				ColorSequenceKeypoint.new(0.00, Color3.fromRGB(18, 18, 18)),
				ColorSequenceKeypoint.new(0.50, Color3.fromRGB(26, 26, 26)),
				ColorSequenceKeypoint.new(1.00, Color3.fromRGB(18, 18, 18))
			}),
			["Color Hub 2"] = Color3.fromRGB(22, 22, 22),
			["Color Stroke"] = Color3.fromRGB(50, 50, 50),
			["Color Theme"] = Color3.fromRGB(200, 200, 200),
			["Color Text"] = Color3.fromRGB(240, 240, 240),
			["Color Dark Text"] = Color3.fromRGB(170, 170, 170)
		},
		Arctic = {
			["Color Hub 1"] = ColorSequence.new({
				ColorSequenceKeypoint.new(0.00, Color3.fromRGB(15, 25, 35)),
				ColorSequenceKeypoint.new(0.50, Color3.fromRGB(20, 34, 48)),
				ColorSequenceKeypoint.new(1.00, Color3.fromRGB(15, 25, 35))
			}),
			["Color Hub 2"] = Color3.fromRGB(18, 30, 42),
			["Color Stroke"] = Color3.fromRGB(30, 55, 75),
			["Color Theme"] = Color3.fromRGB(130, 220, 255),
			["Color Text"] = Color3.fromRGB(225, 245, 255),
			["Color Dark Text"] = Color3.fromRGB(155, 200, 230)
		},
		Amber = {
			["Color Hub 1"] = ColorSequence.new({
				ColorSequenceKeypoint.new(0.00, Color3.fromRGB(32, 22, 5)),
				ColorSequenceKeypoint.new(0.50, Color3.fromRGB(42, 30, 8)),
				ColorSequenceKeypoint.new(1.00, Color3.fromRGB(32, 22, 5))
			}),
			["Color Hub 2"] = Color3.fromRGB(38, 26, 6),
			["Color Stroke"] = Color3.fromRGB(65, 48, 12),
			["Color Theme"] = Color3.fromRGB(255, 185, 30),
			["Color Text"] = Color3.fromRGB(255, 245, 215),
			["Color Dark Text"] = Color3.fromRGB(210, 180, 120)
		},
		Neon = {
			["Color Hub 1"] = ColorSequence.new({
				ColorSequenceKeypoint.new(0.00, Color3.fromRGB(5, 5, 10)),
				ColorSequenceKeypoint.new(0.50, Color3.fromRGB(8, 8, 16)),
				ColorSequenceKeypoint.new(1.00, Color3.fromRGB(5, 5, 10))
			}),
			["Color Hub 2"] = Color3.fromRGB(6, 6, 13),
			["Color Stroke"] = Color3.fromRGB(15, 15, 30),
			["Color Theme"] = Color3.fromRGB(0, 255, 128),
			["Color Text"] = Color3.fromRGB(210, 255, 235),
			["Color Dark Text"] = Color3.fromRGB(130, 210, 170)
		},
		Sakura = {
			["Color Hub 1"] = ColorSequence.new({
				ColorSequenceKeypoint.new(0.00, Color3.fromRGB(38, 20, 28)),
				ColorSequenceKeypoint.new(0.50, Color3.fromRGB(50, 28, 38)),
				ColorSequenceKeypoint.new(1.00, Color3.fromRGB(38, 20, 28))
			}),
			["Color Hub 2"] = Color3.fromRGB(44, 24, 33),
			["Color Stroke"] = Color3.fromRGB(72, 40, 56),
			["Color Theme"] = Color3.fromRGB(255, 160, 190),
			["Color Text"] = Color3.fromRGB(255, 235, 242),
			["Color Dark Text"] = Color3.fromRGB(215, 170, 190)
		},
		Forest = {
			["Color Hub 1"] = ColorSequence.new({
				ColorSequenceKeypoint.new(0.00, Color3.fromRGB(12, 22, 14)),
				ColorSequenceKeypoint.new(0.50, Color3.fromRGB(17, 30, 19)),
				ColorSequenceKeypoint.new(1.00, Color3.fromRGB(12, 22, 14))
			}),
			["Color Hub 2"] = Color3.fromRGB(14, 26, 16),
			["Color Stroke"] = Color3.fromRGB(25, 48, 28),
			["Color Theme"] = Color3.fromRGB(80, 200, 80),
			["Color Text"] = Color3.fromRGB(215, 245, 215),
			["Color Dark Text"] = Color3.fromRGB(140, 195, 140)
		},
		Lava = {
			["Color Hub 1"] = ColorSequence.new({
				ColorSequenceKeypoint.new(0.00, Color3.fromRGB(28, 8, 4)),
				ColorSequenceKeypoint.new(0.50, Color3.fromRGB(38, 12, 6)),
				ColorSequenceKeypoint.new(1.00, Color3.fromRGB(28, 8, 4))
			}),
			["Color Hub 2"] = Color3.fromRGB(33, 10, 5),
			["Color Stroke"] = Color3.fromRGB(60, 20, 10),
			["Color Theme"] = Color3.fromRGB(255, 70, 20),
			["Color Text"] = Color3.fromRGB(255, 225, 215),
			["Color Dark Text"] = Color3.fromRGB(210, 155, 135)
		},
		Aqua = {
			["Color Hub 1"] = ColorSequence.new({
				ColorSequenceKeypoint.new(0.00, Color3.fromRGB(8, 28, 32)),
				ColorSequenceKeypoint.new(0.50, Color3.fromRGB(11, 38, 44)),
				ColorSequenceKeypoint.new(1.00, Color3.fromRGB(8, 28, 32))
			}),
			["Color Hub 2"] = Color3.fromRGB(10, 33, 38),
			["Color Stroke"] = Color3.fromRGB(18, 60, 68),
			["Color Theme"] = Color3.fromRGB(0, 220, 200),
			["Color Text"] = Color3.fromRGB(210, 255, 252),
			["Color Dark Text"] = Color3.fromRGB(130, 205, 200)
		},
		Sand = {
			["Color Hub 1"] = ColorSequence.new({
				ColorSequenceKeypoint.new(0.00, Color3.fromRGB(35, 30, 20)),
				ColorSequenceKeypoint.new(0.50, Color3.fromRGB(46, 40, 27)),
				ColorSequenceKeypoint.new(1.00, Color3.fromRGB(35, 30, 20))
			}),
			["Color Hub 2"] = Color3.fromRGB(40, 35, 23),
			["Color Stroke"] = Color3.fromRGB(68, 60, 38),
			["Color Theme"] = Color3.fromRGB(220, 185, 100),
			["Color Text"] = Color3.fromRGB(255, 248, 225),
			["Color Dark Text"] = Color3.fromRGB(200, 180, 140)
		},
		Lilac = {
			["Color Hub 1"] = ColorSequence.new({
				ColorSequenceKeypoint.new(0.00, Color3.fromRGB(25, 18, 35)),
				ColorSequenceKeypoint.new(0.50, Color3.fromRGB(34, 25, 46)),
				ColorSequenceKeypoint.new(1.00, Color3.fromRGB(25, 18, 35))
			}),
			["Color Hub 2"] = Color3.fromRGB(30, 22, 40),
			["Color Stroke"] = Color3.fromRGB(52, 38, 70),
			["Color Theme"] = Color3.fromRGB(195, 140, 255),
			["Color Text"] = Color3.fromRGB(240, 230, 255),
			["Color Dark Text"] = Color3.fromRGB(185, 160, 220)
		},
		Slate = {
			["Color Hub 1"] = ColorSequence.new({
				ColorSequenceKeypoint.new(0.00, Color3.fromRGB(18, 22, 28)),
				ColorSequenceKeypoint.new(0.50, Color3.fromRGB(24, 30, 38)),
				ColorSequenceKeypoint.new(1.00, Color3.fromRGB(18, 22, 28))
			}),
			["Color Hub 2"] = Color3.fromRGB(21, 26, 33),
			["Color Stroke"] = Color3.fromRGB(38, 48, 60),
			["Color Theme"] = Color3.fromRGB(100, 160, 220),
			["Color Text"] = Color3.fromRGB(220, 230, 245),
			["Color Dark Text"] = Color3.fromRGB(150, 170, 200)
		},
		Toxic = {
			["Color Hub 1"] = ColorSequence.new({
				ColorSequenceKeypoint.new(0.00, Color3.fromRGB(12, 20, 8)),
				ColorSequenceKeypoint.new(0.50, Color3.fromRGB(16, 28, 10)),
				ColorSequenceKeypoint.new(1.00, Color3.fromRGB(12, 20, 8))
			}),
			["Color Hub 2"] = Color3.fromRGB(14, 24, 9),
			["Color Stroke"] = Color3.fromRGB(26, 46, 16),
			["Color Theme"] = Color3.fromRGB(160, 255, 0),
			["Color Text"] = Color3.fromRGB(230, 255, 200),
			["Color Dark Text"] = Color3.fromRGB(160, 210, 100)
		},
		Copper = {
			["Color Hub 1"] = ColorSequence.new({
				ColorSequenceKeypoint.new(0.00, Color3.fromRGB(28, 16, 8)),
				ColorSequenceKeypoint.new(0.50, Color3.fromRGB(38, 22, 11)),
				ColorSequenceKeypoint.new(1.00, Color3.fromRGB(28, 16, 8))
			}),
			["Color Hub 2"] = Color3.fromRGB(33, 19, 10),
			["Color Stroke"] = Color3.fromRGB(58, 34, 18),
			["Color Theme"] = Color3.fromRGB(200, 115, 60),
			["Color Text"] = Color3.fromRGB(255, 235, 220),
			["Color Dark Text"] = Color3.fromRGB(200, 160, 130)
		},
		Glacier = {
			["Color Hub 1"] = ColorSequence.new({
				ColorSequenceKeypoint.new(0.00, Color3.fromRGB(16, 28, 36)),
				ColorSequenceKeypoint.new(0.50, Color3.fromRGB(22, 38, 48)),
				ColorSequenceKeypoint.new(1.00, Color3.fromRGB(16, 28, 36))
			}),
			["Color Hub 2"] = Color3.fromRGB(19, 33, 42),
			["Color Stroke"] = Color3.fromRGB(32, 58, 75),
			["Color Theme"] = Color3.fromRGB(100, 210, 240),
			["Color Text"] = Color3.fromRGB(215, 242, 255),
			["Color Dark Text"] = Color3.fromRGB(140, 190, 220)
		},
		Obsidian = {
			["Color Hub 1"] = ColorSequence.new({
				ColorSequenceKeypoint.new(0.00, Color3.fromRGB(10, 10, 12)),
				ColorSequenceKeypoint.new(0.50, Color3.fromRGB(15, 14, 18)),
				ColorSequenceKeypoint.new(1.00, Color3.fromRGB(10, 10, 12))
			}),
			["Color Hub 2"] = Color3.fromRGB(12, 12, 15),
			["Color Stroke"] = Color3.fromRGB(28, 26, 34),
			["Color Theme"] = Color3.fromRGB(160, 140, 255),
			["Color Text"] = Color3.fromRGB(225, 222, 255),
			["Color Dark Text"] = Color3.fromRGB(155, 148, 200)
		},
		Peach = {
			["Color Hub 1"] = ColorSequence.new({
				ColorSequenceKeypoint.new(0.00, Color3.fromRGB(36, 20, 14)),
				ColorSequenceKeypoint.new(0.50, Color3.fromRGB(48, 28, 18)),
				ColorSequenceKeypoint.new(1.00, Color3.fromRGB(36, 20, 14))
			}),
			["Color Hub 2"] = Color3.fromRGB(42, 24, 16),
			["Color Stroke"] = Color3.fromRGB(70, 42, 28),
			["Color Theme"] = Color3.fromRGB(255, 165, 110),
			["Color Text"] = Color3.fromRGB(255, 240, 230),
			["Color Dark Text"] = Color3.fromRGB(215, 175, 150)
		},
		Cobalt = {
			["Color Hub 1"] = ColorSequence.new({
				ColorSequenceKeypoint.new(0.00, Color3.fromRGB(8, 14, 35)),
				ColorSequenceKeypoint.new(0.50, Color3.fromRGB(11, 19, 46)),
				ColorSequenceKeypoint.new(1.00, Color3.fromRGB(8, 14, 35))
			}),
			["Color Hub 2"] = Color3.fromRGB(10, 16, 40),
			["Color Stroke"] = Color3.fromRGB(18, 30, 70),
			["Color Theme"] = Color3.fromRGB(55, 115, 255),
			["Color Text"] = Color3.fromRGB(215, 225, 255),
			["Color Dark Text"] = Color3.fromRGB(140, 160, 220)
		},
		Infrared = {
			["Color Hub 1"] = ColorSequence.new({
				ColorSequenceKeypoint.new(0.00, Color3.fromRGB(30, 10, 20)),
				ColorSequenceKeypoint.new(0.50, Color3.fromRGB(40, 14, 28)),
				ColorSequenceKeypoint.new(1.00, Color3.fromRGB(30, 10, 20))
			}),
			["Color Hub 2"] = Color3.fromRGB(35, 12, 24),
			["Color Stroke"] = Color3.fromRGB(60, 22, 42),
			["Color Theme"] = Color3.fromRGB(255, 50, 100),
			["Color Text"] = Color3.fromRGB(255, 220, 235),
			["Color Dark Text"] = Color3.fromRGB(210, 150, 175)
		},
		Teal = {
			["Color Hub 1"] = ColorSequence.new({
				ColorSequenceKeypoint.new(0.00, Color3.fromRGB(8, 26, 26)),
				ColorSequenceKeypoint.new(0.50, Color3.fromRGB(11, 35, 35)),
				ColorSequenceKeypoint.new(1.00, Color3.fromRGB(8, 26, 26))
			}),
			["Color Hub 2"] = Color3.fromRGB(10, 30, 30),
			["Color Stroke"] = Color3.fromRGB(18, 55, 55),
			["Color Theme"] = Color3.fromRGB(0, 190, 175),
			["Color Text"] = Color3.fromRGB(210, 252, 248),
			["Color Dark Text"] = Color3.fromRGB(130, 200, 192)
		},
		Gold = {
			["Color Hub 1"] = ColorSequence.new({
				ColorSequenceKeypoint.new(0.00, Color3.fromRGB(28, 22, 6)),
				ColorSequenceKeypoint.new(0.50, Color3.fromRGB(38, 30, 9)),
				ColorSequenceKeypoint.new(1.00, Color3.fromRGB(28, 22, 6))
			}),
			["Color Hub 2"] = Color3.fromRGB(33, 26, 7),
			["Color Stroke"] = Color3.fromRGB(58, 46, 14),
			["Color Theme"] = Color3.fromRGB(255, 210, 50),
			["Color Text"] = Color3.fromRGB(255, 250, 220),
			["Color Dark Text"] = Color3.fromRGB(210, 188, 130)
		},
		Void = {
			["Color Hub 1"] = ColorSequence.new({
				ColorSequenceKeypoint.new(0.00, Color3.fromRGB(4, 4, 8)),
				ColorSequenceKeypoint.new(0.50, Color3.fromRGB(6, 6, 12)),
				ColorSequenceKeypoint.new(1.00, Color3.fromRGB(4, 4, 8))
			}),
			["Color Hub 2"] = Color3.fromRGB(5, 5, 10),
			["Color Stroke"] = Color3.fromRGB(14, 12, 22),
			["Color Theme"] = Color3.fromRGB(120, 60, 255),
			["Color Text"] = Color3.fromRGB(210, 200, 255),
			["Color Dark Text"] = Color3.fromRGB(140, 125, 200)
		},
		Mint = {
			["Color Hub 1"] = ColorSequence.new({
				ColorSequenceKeypoint.new(0.00, Color3.fromRGB(8, 28, 22)),
				ColorSequenceKeypoint.new(0.50, Color3.fromRGB(12, 38, 30)),
				ColorSequenceKeypoint.new(1.00, Color3.fromRGB(8, 28, 22))
			}),
			["Color Hub 2"] = Color3.fromRGB(10, 33, 26),
			["Color Stroke"] = Color3.fromRGB(18, 60, 46),
			["Color Theme"] = Color3.fromRGB(50, 235, 170),
			["Color Text"] = Color3.fromRGB(210, 255, 240),
			["Color Dark Text"] = Color3.fromRGB(130, 205, 175)
		},
		Blush = {
			["Color Hub 1"] = ColorSequence.new({
				ColorSequenceKeypoint.new(0.00, Color3.fromRGB(38, 18, 26)),
				ColorSequenceKeypoint.new(0.50, Color3.fromRGB(50, 24, 34)),
				ColorSequenceKeypoint.new(1.00, Color3.fromRGB(38, 18, 26))
			}),
			["Color Hub 2"] = Color3.fromRGB(44, 21, 30),
			["Color Stroke"] = Color3.fromRGB(72, 36, 52),
			["Color Theme"] = Color3.fromRGB(255, 130, 170),
			["Color Text"] = Color3.fromRGB(255, 232, 242),
			["Color Dark Text"] = Color3.fromRGB(215, 165, 190)
		},
		Dusk = {
			["Color Hub 1"] = ColorSequence.new({
				ColorSequenceKeypoint.new(0.00, Color3.fromRGB(20, 14, 30)),
				ColorSequenceKeypoint.new(0.50, Color3.fromRGB(28, 20, 42)),
				ColorSequenceKeypoint.new(1.00, Color3.fromRGB(20, 14, 30))
			}),
			["Color Hub 2"] = Color3.fromRGB(24, 17, 36),
			["Color Stroke"] = Color3.fromRGB(45, 32, 68),
			["Color Theme"] = Color3.fromRGB(210, 100, 255),
			["Color Text"] = Color3.fromRGB(238, 225, 255),
			["Color Dark Text"] = Color3.fromRGB(175, 150, 220)
		},
		Storm = {
			["Color Hub 1"] = ColorSequence.new({
				ColorSequenceKeypoint.new(0.00, Color3.fromRGB(18, 20, 28)),
				ColorSequenceKeypoint.new(0.50, Color3.fromRGB(24, 27, 38)),
				ColorSequenceKeypoint.new(1.00, Color3.fromRGB(18, 20, 28))
			}),
			["Color Hub 2"] = Color3.fromRGB(21, 24, 33),
			["Color Stroke"] = Color3.fromRGB(40, 46, 65),
			["Color Theme"] = Color3.fromRGB(130, 180, 255),
			["Color Text"] = Color3.fromRGB(218, 228, 255),
			["Color Dark Text"] = Color3.fromRGB(148, 168, 215)
		},
		Rust = {
			["Color Hub 1"] = ColorSequence.new({
				ColorSequenceKeypoint.new(0.00, Color3.fromRGB(30, 12, 6)),
				ColorSequenceKeypoint.new(0.50, Color3.fromRGB(42, 17, 8)),
				ColorSequenceKeypoint.new(1.00, Color3.fromRGB(30, 12, 6))
			}),
			["Color Hub 2"] = Color3.fromRGB(36, 14, 7),
			["Color Stroke"] = Color3.fromRGB(65, 28, 14),
			["Color Theme"] = Color3.fromRGB(215, 90, 40),
			["Color Text"] = Color3.fromRGB(255, 228, 215),
			["Color Dark Text"] = Color3.fromRGB(205, 158, 130)
		},
		Jade = {
			["Color Hub 1"] = ColorSequence.new({
				ColorSequenceKeypoint.new(0.00, Color3.fromRGB(8, 24, 20)),
				ColorSequenceKeypoint.new(0.50, Color3.fromRGB(11, 33, 27)),
				ColorSequenceKeypoint.new(1.00, Color3.fromRGB(8, 24, 20))
			}),
			["Color Hub 2"] = Color3.fromRGB(10, 28, 24),
			["Color Stroke"] = Color3.fromRGB(18, 54, 44),
			["Color Theme"] = Color3.fromRGB(0, 180, 140),
			["Color Text"] = Color3.fromRGB(210, 252, 245),
			["Color Dark Text"] = Color3.fromRGB(130, 200, 185)
		},
		Horizon = {
			["Color Hub 1"] = ColorSequence.new({
				ColorSequenceKeypoint.new(0.00, Color3.fromRGB(32, 14, 18)),
				ColorSequenceKeypoint.new(0.50, Color3.fromRGB(42, 20, 26)),
				ColorSequenceKeypoint.new(1.00, Color3.fromRGB(18, 18, 36))
			}),
			["Color Hub 2"] = Color3.fromRGB(28, 16, 24),
			["Color Stroke"] = Color3.fromRGB(55, 32, 48),
			["Color Theme"] = Color3.fromRGB(255, 100, 80),
			["Color Text"] = Color3.fromRGB(255, 230, 225),
			["Color Dark Text"] = Color3.fromRGB(210, 162, 155)
		},
		Plum = {
			["Color Hub 1"] = ColorSequence.new({
				ColorSequenceKeypoint.new(0.00, Color3.fromRGB(26, 10, 30)),
				ColorSequenceKeypoint.new(0.50, Color3.fromRGB(36, 14, 42)),
				ColorSequenceKeypoint.new(1.00, Color3.fromRGB(26, 10, 30))
			}),
			["Color Hub 2"] = Color3.fromRGB(31, 12, 36),
			["Color Stroke"] = Color3.fromRGB(56, 22, 66),
			["Color Theme"] = Color3.fromRGB(185, 60, 210),
			["Color Text"] = Color3.fromRGB(240, 218, 255),
			["Color Dark Text"] = Color3.fromRGB(185, 145, 215)
		},
		IceBlue = {
			["Color Hub 1"] = ColorSequence.new({
				ColorSequenceKeypoint.new(0.00, Color3.fromRGB(10, 22, 38)),
				ColorSequenceKeypoint.new(0.50, Color3.fromRGB(14, 30, 52)),
				ColorSequenceKeypoint.new(1.00, Color3.fromRGB(10, 22, 38))
			}),
			["Color Hub 2"] = Color3.fromRGB(12, 26, 45),
			["Color Stroke"] = Color3.fromRGB(22, 50, 82),
			["Color Theme"] = Color3.fromRGB(90, 200, 255),
			["Color Text"] = Color3.fromRGB(215, 242, 255),
			["Color Dark Text"] = Color3.fromRGB(140, 190, 230)
		},
		Mocha = {
			["Color Hub 1"] = ColorSequence.new({
				ColorSequenceKeypoint.new(0.00, Color3.fromRGB(28, 18, 12)),
				ColorSequenceKeypoint.new(0.50, Color3.fromRGB(38, 26, 17)),
				ColorSequenceKeypoint.new(1.00, Color3.fromRGB(28, 18, 12))
			}),
			["Color Hub 2"] = Color3.fromRGB(33, 22, 14),
			["Color Stroke"] = Color3.fromRGB(60, 42, 26),
			["Color Theme"] = Color3.fromRGB(200, 150, 100),
			["Color Text"] = Color3.fromRGB(255, 242, 228),
			["Color Dark Text"] = Color3.fromRGB(200, 172, 140)
		},
		Magenta = {
			["Color Hub 1"] = ColorSequence.new({
				ColorSequenceKeypoint.new(0.00, Color3.fromRGB(30, 6, 26)),
				ColorSequenceKeypoint.new(0.50, Color3.fromRGB(40, 8, 36)),
				ColorSequenceKeypoint.new(1.00, Color3.fromRGB(30, 6, 26))
			}),
			["Color Hub 2"] = Color3.fromRGB(35, 7, 31),
			["Color Stroke"] = Color3.fromRGB(65, 14, 58),
			["Color Theme"] = Color3.fromRGB(255, 40, 200),
			["Color Text"] = Color3.fromRGB(255, 215, 248),
			["Color Dark Text"] = Color3.fromRGB(210, 140, 200)
		},
		Carbon = {
			["Color Hub 1"] = ColorSequence.new({
				ColorSequenceKeypoint.new(0.00, Color3.fromRGB(14, 14, 14)),
				ColorSequenceKeypoint.new(0.50, Color3.fromRGB(20, 20, 20)),
				ColorSequenceKeypoint.new(1.00, Color3.fromRGB(14, 14, 14))
			}),
			["Color Hub 2"] = Color3.fromRGB(17, 17, 17),
			["Color Stroke"] = Color3.fromRGB(40, 40, 40),
			["Color Theme"] = Color3.fromRGB(255, 80, 0),
			["Color Text"] = Color3.fromRGB(242, 242, 242),
			["Color Dark Text"] = Color3.fromRGB(170, 170, 170)
		},
		Marine = {
			["Color Hub 1"] = ColorSequence.new({
				ColorSequenceKeypoint.new(0.00, Color3.fromRGB(6, 18, 38)),
				ColorSequenceKeypoint.new(0.50, Color3.fromRGB(8, 24, 52)),
				ColorSequenceKeypoint.new(1.00, Color3.fromRGB(6, 18, 38))
			}),
			["Color Hub 2"] = Color3.fromRGB(7, 21, 45),
			["Color Stroke"] = Color3.fromRGB(14, 42, 82),
			["Color Theme"] = Color3.fromRGB(0, 160, 230),
			["Color Text"] = Color3.fromRGB(210, 238, 255),
			["Color Dark Text"] = Color3.fromRGB(130, 182, 220)
		},
		Parchment = {
			["Color Hub 1"] = ColorSequence.new({
				ColorSequenceKeypoint.new(0.00, Color3.fromRGB(38, 32, 22)),
				ColorSequenceKeypoint.new(0.50, Color3.fromRGB(50, 42, 30)),
				ColorSequenceKeypoint.new(1.00, Color3.fromRGB(38, 32, 22))
			}),
			["Color Hub 2"] = Color3.fromRGB(44, 37, 26),
			["Color Stroke"] = Color3.fromRGB(74, 64, 44),
			["Color Theme"] = Color3.fromRGB(230, 195, 120),
			["Color Text"] = Color3.fromRGB(255, 248, 228),
			["Color Dark Text"] = Color3.fromRGB(210, 188, 148)
		},
		Indigo = {
			["Color Hub 1"] = ColorSequence.new({
				ColorSequenceKeypoint.new(0.00, Color3.fromRGB(12, 10, 40)),
				ColorSequenceKeypoint.new(0.50, Color3.fromRGB(17, 14, 55)),
				ColorSequenceKeypoint.new(1.00, Color3.fromRGB(12, 10, 40))
			}),
			["Color Hub 2"] = Color3.fromRGB(14, 12, 48),
			["Color Stroke"] = Color3.fromRGB(26, 22, 88),
			["Color Theme"] = Color3.fromRGB(90, 80, 255),
			["Color Text"] = Color3.fromRGB(220, 218, 255),
			["Color Dark Text"] = Color3.fromRGB(148, 142, 220)
		},
		Scarlet = {
			["Color Hub 1"] = ColorSequence.new({
				ColorSequenceKeypoint.new(0.00, Color3.fromRGB(32, 6, 6)),
				ColorSequenceKeypoint.new(0.50, Color3.fromRGB(44, 8, 8)),
				ColorSequenceKeypoint.new(1.00, Color3.fromRGB(32, 6, 6))
			}),
			["Color Hub 2"] = Color3.fromRGB(38, 7, 7),
			["Color Stroke"] = Color3.fromRGB(70, 14, 14),
			["Color Theme"] = Color3.fromRGB(255, 30, 30),
			["Color Text"] = Color3.fromRGB(255, 222, 222),
			["Color Dark Text"] = Color3.fromRGB(210, 148, 148)
		},
		Blossom = {
			["Color Hub 1"] = ColorSequence.new({
				ColorSequenceKeypoint.new(0.00, Color3.fromRGB(36, 16, 28)),
				ColorSequenceKeypoint.new(0.50, Color3.fromRGB(48, 22, 38)),
				ColorSequenceKeypoint.new(1.00, Color3.fromRGB(36, 16, 28))
			}),
			["Color Hub 2"] = Color3.fromRGB(42, 19, 33),
			["Color Stroke"] = Color3.fromRGB(70, 34, 58),
			["Color Theme"] = Color3.fromRGB(255, 180, 220),
			["Color Text"] = Color3.fromRGB(255, 238, 248),
			["Color Dark Text"] = Color3.fromRGB(218, 172, 200)
		},
		Eclipse = {
			["Color Hub 1"] = ColorSequence.new({
				ColorSequenceKeypoint.new(0.00, Color3.fromRGB(6, 6, 16)),
				ColorSequenceKeypoint.new(0.50, Color3.fromRGB(10, 8, 22)),
				ColorSequenceKeypoint.new(1.00, Color3.fromRGB(6, 6, 16))
			}),
			["Color Hub 2"] = Color3.fromRGB(8, 7, 19),
			["Color Stroke"] = Color3.fromRGB(20, 18, 44),
			["Color Theme"] = Color3.fromRGB(170, 130, 255),
			["Color Text"] = Color3.fromRGB(228, 222, 255),
			["Color Dark Text"] = Color3.fromRGB(155, 142, 215)
		},
		Olive = {
			["Color Hub 1"] = ColorSequence.new({
				ColorSequenceKeypoint.new(0.00, Color3.fromRGB(22, 24, 10)),
				ColorSequenceKeypoint.new(0.50, Color3.fromRGB(30, 33, 14)),
				ColorSequenceKeypoint.new(1.00, Color3.fromRGB(22, 24, 10))
			}),
			["Color Hub 2"] = Color3.fromRGB(26, 28, 12),
			["Color Stroke"] = Color3.fromRGB(48, 52, 22),
			["Color Theme"] = Color3.fromRGB(175, 190, 60),
			["Color Text"] = Color3.fromRGB(238, 242, 210),
			["Color Dark Text"] = Color3.fromRGB(178, 185, 140)
		},
		Frostbite = {
			["Color Hub 1"] = ColorSequence.new({
				ColorSequenceKeypoint.new(0.00, Color3.fromRGB(8, 20, 38)),
				ColorSequenceKeypoint.new(0.50, Color3.fromRGB(12, 28, 52)),
				ColorSequenceKeypoint.new(1.00, Color3.fromRGB(18, 12, 36))
			}),
			["Color Hub 2"] = Color3.fromRGB(10, 24, 44),
			["Color Stroke"] = Color3.fromRGB(20, 46, 80),
			["Color Theme"] = Color3.fromRGB(80, 220, 255),
			["Color Text"] = Color3.fromRGB(215, 248, 255),
			["Color Dark Text"] = Color3.fromRGB(138, 195, 232)
		},
		Ember = {
			["Color Hub 1"] = ColorSequence.new({
				ColorSequenceKeypoint.new(0.00, Color3.fromRGB(34, 14, 6)),
				ColorSequenceKeypoint.new(0.50, Color3.fromRGB(46, 20, 8)),
				ColorSequenceKeypoint.new(1.00, Color3.fromRGB(34, 14, 6))
			}),
			["Color Hub 2"] = Color3.fromRGB(40, 17, 7),
			["Color Stroke"] = Color3.fromRGB(72, 32, 14),
			["Color Theme"] = Color3.fromRGB(255, 140, 40),
			["Color Text"] = Color3.fromRGB(255, 238, 215),
			["Color Dark Text"] = Color3.fromRGB(215, 175, 132)
		},
		Nautical = {
			["Color Hub 1"] = ColorSequence.new({
				ColorSequenceKeypoint.new(0.00, Color3.fromRGB(8, 20, 30)),
				ColorSequenceKeypoint.new(0.50, Color3.fromRGB(10, 28, 42)),
				ColorSequenceKeypoint.new(1.00, Color3.fromRGB(8, 20, 30))
			}),
			["Color Hub 2"] = Color3.fromRGB(9, 24, 36),
			["Color Stroke"] = Color3.fromRGB(16, 46, 66),
			["Color Theme"] = Color3.fromRGB(255, 200, 50),
			["Color Text"] = Color3.fromRGB(255, 248, 215),
			["Color Dark Text"] = Color3.fromRGB(200, 185, 130)
		},
		Vine = {
			["Color Hub 1"] = ColorSequence.new({
				ColorSequenceKeypoint.new(0.00, Color3.fromRGB(14, 24, 12)),
				ColorSequenceKeypoint.new(0.50, Color3.fromRGB(19, 33, 16)),
				ColorSequenceKeypoint.new(1.00, Color3.fromRGB(14, 24, 12))
			}),
			["Color Hub 2"] = Color3.fromRGB(16, 28, 14),
			["Color Stroke"] = Color3.fromRGB(28, 52, 24),
			["Color Theme"] = Color3.fromRGB(100, 220, 60),
			["Color Text"] = Color3.fromRGB(220, 250, 210),
			["Color Dark Text"] = Color3.fromRGB(145, 200, 130)
		},
		Cinder = {
			["Color Hub 1"] = ColorSequence.new({
				ColorSequenceKeypoint.new(0.00, Color3.fromRGB(16, 14, 14)),
				ColorSequenceKeypoint.new(0.50, Color3.fromRGB(22, 20, 18)),
				ColorSequenceKeypoint.new(1.00, Color3.fromRGB(16, 14, 14))
			}),
			["Color Hub 2"] = Color3.fromRGB(19, 17, 16),
			["Color Stroke"] = Color3.fromRGB(44, 40, 36),
			["Color Theme"] = Color3.fromRGB(240, 120, 60),
			["Color Text"] = Color3.fromRGB(248, 238, 228),
			["Color Dark Text"] = Color3.fromRGB(200, 175, 155)
		},
		Cosmos = {
			["Color Hub 1"] = ColorSequence.new({
				ColorSequenceKeypoint.new(0.00, Color3.fromRGB(6, 4, 18)),
				ColorSequenceKeypoint.new(0.50, Color3.fromRGB(10, 6, 26)),
				ColorSequenceKeypoint.new(1.00, Color3.fromRGB(6, 4, 18))
			}),
			["Color Hub 2"] = Color3.fromRGB(8, 5, 22),
			["Color Stroke"] = Color3.fromRGB(18, 12, 48),
			["Color Theme"] = Color3.fromRGB(140, 200, 255),
			["Color Text"] = Color3.fromRGB(220, 232, 255),
			["Color Dark Text"] = Color3.fromRGB(148, 168, 225)
		},
		Mushroom = {
			["Color Hub 1"] = ColorSequence.new({
				ColorSequenceKeypoint.new(0.00, Color3.fromRGB(26, 22, 20)),
				ColorSequenceKeypoint.new(0.50, Color3.fromRGB(35, 30, 27)),
				ColorSequenceKeypoint.new(1.00, Color3.fromRGB(26, 22, 20))
			}),
			["Color Hub 2"] = Color3.fromRGB(30, 26, 23),
			["Color Stroke"] = Color3.fromRGB(56, 48, 42),
			["Color Theme"] = Color3.fromRGB(190, 165, 130),
			["Color Text"] = Color3.fromRGB(248, 242, 232),
			["Color Dark Text"] = Color3.fromRGB(195, 178, 158)
		},
		Pixel = {
			["Color Hub 1"] = ColorSequence.new({
				ColorSequenceKeypoint.new(0.00, Color3.fromRGB(8, 8, 8)),
				ColorSequenceKeypoint.new(0.50, Color3.fromRGB(14, 14, 14)),
				ColorSequenceKeypoint.new(1.00, Color3.fromRGB(8, 8, 8))
			}),
			["Color Hub 2"] = Color3.fromRGB(11, 11, 11),
			["Color Stroke"] = Color3.fromRGB(28, 28, 28),
			["Color Theme"] = Color3.fromRGB(0, 255, 60),
			["Color Text"] = Color3.fromRGB(0, 255, 60),
			["Color Dark Text"] = Color3.fromRGB(0, 180, 44)
		},
		Holographic = {
			["Color Hub 1"] = ColorSequence.new({
				ColorSequenceKeypoint.new(0.00, Color3.fromRGB(14, 18, 30)),
				ColorSequenceKeypoint.new(0.50, Color3.fromRGB(22, 18, 38)),
				ColorSequenceKeypoint.new(1.00, Color3.fromRGB(18, 24, 32))
			}),
			["Color Hub 2"] = Color3.fromRGB(18, 20, 34),
			["Color Stroke"] = Color3.fromRGB(36, 40, 70),
			["Color Theme"] = Color3.fromRGB(160, 240, 255),
			["Color Text"] = Color3.fromRGB(228, 248, 255),
			["Color Dark Text"] = Color3.fromRGB(155, 200, 230)
		},
		Candy = {
			["Color Hub 1"] = ColorSequence.new({
				ColorSequenceKeypoint.new(0.00, Color3.fromRGB(36, 10, 28)),
				ColorSequenceKeypoint.new(0.50, Color3.fromRGB(48, 14, 38)),
				ColorSequenceKeypoint.new(1.00, Color3.fromRGB(36, 10, 28))
			}),
			["Color Hub 2"] = Color3.fromRGB(42, 12, 33),
			["Color Stroke"] = Color3.fromRGB(72, 22, 60),
			["Color Theme"] = Color3.fromRGB(255, 80, 200),
			["Color Text"] = Color3.fromRGB(255, 225, 250),
			["Color Dark Text"] = Color3.fromRGB(215, 160, 205)
		},
		Titan = {
			["Color Hub 1"] = ColorSequence.new({
				ColorSequenceKeypoint.new(0.00, Color3.fromRGB(12, 12, 18)),
				ColorSequenceKeypoint.new(0.50, Color3.fromRGB(18, 18, 26)),
				ColorSequenceKeypoint.new(1.00, Color3.fromRGB(12, 12, 18))
			}),
			["Color Hub 2"] = Color3.fromRGB(15, 15, 22),
			["Color Stroke"] = Color3.fromRGB(32, 32, 48),
			["Color Theme"] = Color3.fromRGB(180, 180, 255),
			["Color Text"] = Color3.fromRGB(230, 230, 255),
			["Color Dark Text"] = Color3.fromRGB(155, 155, 210)
		},
		Flame = {
			["Color Hub 1"] = ColorSequence.new({
				ColorSequenceKeypoint.new(0.00, Color3.fromRGB(30, 8, 4)),
				ColorSequenceKeypoint.new(0.50, Color3.fromRGB(44, 12, 6)),
				ColorSequenceKeypoint.new(1.00, Color3.fromRGB(24, 10, 6))
			}),
			["Color Hub 2"] = Color3.fromRGB(37, 10, 5),
			["Color Stroke"] = Color3.fromRGB(70, 20, 10),
			["Color Theme"] = Color3.fromRGB(255, 60, 0),
			["Color Text"] = Color3.fromRGB(255, 228, 218),
			["Color Dark Text"] = Color3.fromRGB(210, 148, 120)
		},
		Mist = {
			["Color Hub 1"] = ColorSequence.new({
				ColorSequenceKeypoint.new(0.00, Color3.fromRGB(28, 30, 34)),
				ColorSequenceKeypoint.new(0.50, Color3.fromRGB(36, 40, 46)),
				ColorSequenceKeypoint.new(1.00, Color3.fromRGB(28, 30, 34))
			}),
			["Color Hub 2"] = Color3.fromRGB(32, 35, 40),
			["Color Stroke"] = Color3.fromRGB(55, 60, 70),
			["Color Theme"] = Color3.fromRGB(165, 190, 220),
			["Color Text"] = Color3.fromRGB(228, 235, 245),
			["Color Dark Text"] = Color3.fromRGB(160, 175, 198)
		},
		Orchid = {
			["Color Hub 1"] = ColorSequence.new({
				ColorSequenceKeypoint.new(0.00, Color3.fromRGB(28, 10, 34)),
				ColorSequenceKeypoint.new(0.50, Color3.fromRGB(38, 14, 46)),
				ColorSequenceKeypoint.new(1.00, Color3.fromRGB(28, 10, 34))
			}),
			["Color Hub 2"] = Color3.fromRGB(33, 12, 40),
			["Color Stroke"] = Color3.fromRGB(60, 22, 74),
			["Color Theme"] = Color3.fromRGB(220, 100, 255),
			["Color Text"] = Color3.fromRGB(245, 220, 255),
			["Color Dark Text"] = Color3.fromRGB(192, 152, 225)
		},
		Bronze = {
			["Color Hub 1"] = ColorSequence.new({
				ColorSequenceKeypoint.new(0.00, Color3.fromRGB(26, 14, 6)),
				ColorSequenceKeypoint.new(0.50, Color3.fromRGB(36, 20, 8)),
				ColorSequenceKeypoint.new(1.00, Color3.fromRGB(26, 14, 6))
			}),
			["Color Hub 2"] = Color3.fromRGB(31, 17, 7),
			["Color Stroke"] = Color3.fromRGB(58, 32, 14),
			["Color Theme"] = Color3.fromRGB(205, 130, 70),
			["Color Text"] = Color3.fromRGB(255, 238, 220),
			["Color Dark Text"] = Color3.fromRGB(200, 165, 125)
		},
		Neptune = {
			["Color Hub 1"] = ColorSequence.new({
				ColorSequenceKeypoint.new(0.00, Color3.fromRGB(6, 16, 36)),
				ColorSequenceKeypoint.new(0.50, Color3.fromRGB(8, 22, 50)),
				ColorSequenceKeypoint.new(1.00, Color3.fromRGB(6, 16, 36))
			}),
			["Color Hub 2"] = Color3.fromRGB(7, 19, 43),
			["Color Stroke"] = Color3.fromRGB(14, 38, 80),
			["Color Theme"] = Color3.fromRGB(60, 200, 200),
			["Color Text"] = Color3.fromRGB(210, 248, 252),
			["Color Dark Text"] = Color3.fromRGB(130, 195, 210)
		},
		Glacier2 = {
			["Color Hub 1"] = ColorSequence.new({
				ColorSequenceKeypoint.new(0.00, Color3.fromRGB(20, 30, 45)),
				ColorSequenceKeypoint.new(0.50, Color3.fromRGB(26, 40, 60)),
				ColorSequenceKeypoint.new(1.00, Color3.fromRGB(20, 30, 45))
			}),
			["Color Hub 2"] = Color3.fromRGB(23, 35, 52),
			["Color Stroke"] = Color3.fromRGB(40, 65, 95),
			["Color Theme"] = Color3.fromRGB(150, 230, 255),
			["Color Text"] = Color3.fromRGB(220, 248, 255),
			["Color Dark Text"] = Color3.fromRGB(148, 200, 235)
		},
		Ruby = {
			["Color Hub 1"] = ColorSequence.new({
				ColorSequenceKeypoint.new(0.00, Color3.fromRGB(32, 8, 14)),
				ColorSequenceKeypoint.new(0.50, Color3.fromRGB(44, 11, 19)),
				ColorSequenceKeypoint.new(1.00, Color3.fromRGB(32, 8, 14))
			}),
			["Color Hub 2"] = Color3.fromRGB(38, 9, 16),
			["Color Stroke"] = Color3.fromRGB(70, 18, 30),
			["Color Theme"] = Color3.fromRGB(255, 50, 80),
			["Color Text"] = Color3.fromRGB(255, 220, 228),
			["Color Dark Text"] = Color3.fromRGB(210, 145, 158)
		},
		Hazel = {
			["Color Hub 1"] = ColorSequence.new({
				ColorSequenceKeypoint.new(0.00, Color3.fromRGB(26, 20, 12)),
				ColorSequenceKeypoint.new(0.50, Color3.fromRGB(35, 28, 16)),
				ColorSequenceKeypoint.new(1.00, Color3.fromRGB(26, 20, 12))
			}),
			["Color Hub 2"] = Color3.fromRGB(30, 24, 14),
			["Color Stroke"] = Color3.fromRGB(56, 45, 26),
			["Color Theme"] = Color3.fromRGB(190, 155, 90),
			["Color Text"] = Color3.fromRGB(250, 242, 225),
			["Color Dark Text"] = Color3.fromRGB(195, 172, 130)
		},
		Moonlight = {
			["Color Hub 1"] = ColorSequence.new({
				ColorSequenceKeypoint.new(0.00, Color3.fromRGB(12, 12, 24)),
				ColorSequenceKeypoint.new(0.50, Color3.fromRGB(16, 16, 34)),
				ColorSequenceKeypoint.new(1.00, Color3.fromRGB(12, 12, 24))
			}),
			["Color Hub 2"] = Color3.fromRGB(14, 14, 29),
			["Color Stroke"] = Color3.fromRGB(28, 28, 58),
			["Color Theme"] = Color3.fromRGB(200, 210, 255),
			["Color Text"] = Color3.fromRGB(232, 235, 255),
			["Color Dark Text"] = Color3.fromRGB(165, 170, 225)
		},
		Citrus = {
			["Color Hub 1"] = ColorSequence.new({
				ColorSequenceKeypoint.new(0.00, Color3.fromRGB(28, 24, 6)),
				ColorSequenceKeypoint.new(0.50, Color3.fromRGB(38, 34, 8)),
				ColorSequenceKeypoint.new(1.00, Color3.fromRGB(28, 24, 6))
			}),
			["Color Hub 2"] = Color3.fromRGB(33, 29, 7),
			["Color Stroke"] = Color3.fromRGB(60, 54, 14),
			["Color Theme"] = Color3.fromRGB(255, 225, 0),
			["Color Text"] = Color3.fromRGB(255, 252, 210),
			["Color Dark Text"] = Color3.fromRGB(210, 195, 130)
		},
		Lagoon = {
			["Color Hub 1"] = ColorSequence.new({
				ColorSequenceKeypoint.new(0.00, Color3.fromRGB(6, 22, 28)),
				ColorSequenceKeypoint.new(0.50, Color3.fromRGB(8, 30, 38)),
				ColorSequenceKeypoint.new(1.00, Color3.fromRGB(6, 22, 28))
			}),
			["Color Hub 2"] = Color3.fromRGB(7, 26, 33),
			["Color Stroke"] = Color3.fromRGB(14, 50, 64),
			["Color Theme"] = Color3.fromRGB(0, 210, 175),
			["Color Text"] = Color3.fromRGB(210, 255, 248),
			["Color Dark Text"] = Color3.fromRGB(130, 202, 192)
		},
		Phantom = {
			["Color Hub 1"] = ColorSequence.new({
				ColorSequenceKeypoint.new(0.00, Color3.fromRGB(10, 8, 16)),
				ColorSequenceKeypoint.new(0.50, Color3.fromRGB(14, 11, 22)),
				ColorSequenceKeypoint.new(1.00, Color3.fromRGB(10, 8, 16))
			}),
			["Color Hub 2"] = Color3.fromRGB(12, 9, 19),
			["Color Stroke"] = Color3.fromRGB(26, 20, 42),
			["Color Theme"] = Color3.fromRGB(130, 255, 200),
			["Color Text"] = Color3.fromRGB(218, 255, 240),
			["Color Dark Text"] = Color3.fromRGB(142, 210, 180)
		},
		Tangerine = {
			["Color Hub 1"] = ColorSequence.new({
				ColorSequenceKeypoint.new(0.00, Color3.fromRGB(32, 16, 6)),
				ColorSequenceKeypoint.new(0.50, Color3.fromRGB(44, 22, 8)),
				ColorSequenceKeypoint.new(1.00, Color3.fromRGB(32, 16, 6))
			}),
			["Color Hub 2"] = Color3.fromRGB(38, 19, 7),
			["Color Stroke"] = Color3.fromRGB(70, 36, 14),
			["Color Theme"] = Color3.fromRGB(255, 160, 0),
			["Color Text"] = Color3.fromRGB(255, 242, 215),
			["Color Dark Text"] = Color3.fromRGB(215, 178, 125)
		},
		Electric = {
			["Color Hub 1"] = ColorSequence.new({
				ColorSequenceKeypoint.new(0.00, Color3.fromRGB(6, 10, 30)),
				ColorSequenceKeypoint.new(0.50, Color3.fromRGB(8, 14, 42)),
				ColorSequenceKeypoint.new(1.00, Color3.fromRGB(6, 10, 30))
			}),
			["Color Hub 2"] = Color3.fromRGB(7, 12, 36),
			["Color Stroke"] = Color3.fromRGB(14, 24, 68),
			["Color Theme"] = Color3.fromRGB(60, 140, 255),
			["Color Text"] = Color3.fromRGB(215, 235, 255),
			["Color Dark Text"] = Color3.fromRGB(138, 178, 240)
		},
		Sepia = {
			["Color Hub 1"] = ColorSequence.new({
				ColorSequenceKeypoint.new(0.00, Color3.fromRGB(30, 22, 14)),
				ColorSequenceKeypoint.new(0.50, Color3.fromRGB(40, 30, 18)),
				ColorSequenceKeypoint.new(1.00, Color3.fromRGB(30, 22, 14))
			}),
			["Color Hub 2"] = Color3.fromRGB(35, 26, 16),
			["Color Stroke"] = Color3.fromRGB(64, 48, 30),
			["Color Theme"] = Color3.fromRGB(200, 160, 110),
			["Color Text"] = Color3.fromRGB(255, 242, 225),
			["Color Dark Text"] = Color3.fromRGB(200, 175, 145)
		},
		Haze = {
			["Color Hub 1"] = ColorSequence.new({
				ColorSequenceKeypoint.new(0.00, Color3.fromRGB(22, 16, 26)),
				ColorSequenceKeypoint.new(0.50, Color3.fromRGB(30, 22, 36)),
				ColorSequenceKeypoint.new(1.00, Color3.fromRGB(22, 16, 26))
			}),
			["Color Hub 2"] = Color3.fromRGB(26, 19, 31),
			["Color Stroke"] = Color3.fromRGB(48, 36, 58),
			["Color Theme"] = Color3.fromRGB(180, 140, 220),
			["Color Text"] = Color3.fromRGB(240, 230, 255),
			["Color Dark Text"] = Color3.fromRGB(178, 155, 210)
		},
		Iron = {
			["Color Hub 1"] = ColorSequence.new({
				ColorSequenceKeypoint.new(0.00, Color3.fromRGB(20, 20, 22)),
				ColorSequenceKeypoint.new(0.50, Color3.fromRGB(28, 28, 30)),
				ColorSequenceKeypoint.new(1.00, Color3.fromRGB(20, 20, 22))
			}),
			["Color Hub 2"] = Color3.fromRGB(24, 24, 26),
			["Color Stroke"] = Color3.fromRGB(48, 48, 52),
			["Color Theme"] = Color3.fromRGB(185, 195, 210),
			["Color Text"] = Color3.fromRGB(235, 238, 245),
			["Color Dark Text"] = Color3.fromRGB(162, 168, 182)
		},
		Meadow = {
			["Color Hub 1"] = ColorSequence.new({
				ColorSequenceKeypoint.new(0.00, Color3.fromRGB(12, 24, 14)),
				ColorSequenceKeypoint.new(0.50, Color3.fromRGB(17, 33, 19)),
				ColorSequenceKeypoint.new(1.00, Color3.fromRGB(12, 24, 14))
			}),
			["Color Hub 2"] = Color3.fromRGB(14, 28, 16),
			["Color Stroke"] = Color3.fromRGB(26, 52, 30),
			["Color Theme"] = Color3.fromRGB(120, 210, 90),
			["Color Text"] = Color3.fromRGB(222, 250, 214),
			["Color Dark Text"] = Color3.fromRGB(148, 202, 132)
		},
		Vapor = {
			["Color Hub 1"] = ColorSequence.new({
				ColorSequenceKeypoint.new(0.00, Color3.fromRGB(14, 8, 28)),
				ColorSequenceKeypoint.new(0.50, Color3.fromRGB(22, 12, 40)),
				ColorSequenceKeypoint.new(1.00, Color3.fromRGB(8, 14, 32))
			}),
			["Color Hub 2"] = Color3.fromRGB(18, 10, 34),
			["Color Stroke"] = Color3.fromRGB(36, 20, 64),
			["Color Theme"] = Color3.fromRGB(255, 80, 255),
			["Color Text"] = Color3.fromRGB(255, 220, 255),
			["Color Dark Text"] = Color3.fromRGB(210, 155, 225)
		},
		Nordic = {
			["Color Hub 1"] = ColorSequence.new({
				ColorSequenceKeypoint.new(0.00, Color3.fromRGB(16, 20, 28)),
				ColorSequenceKeypoint.new(0.50, Color3.fromRGB(22, 28, 38)),
				ColorSequenceKeypoint.new(1.00, Color3.fromRGB(16, 20, 28))
			}),
			["Color Hub 2"] = Color3.fromRGB(19, 24, 33),
			["Color Stroke"] = Color3.fromRGB(36, 46, 62),
			["Color Theme"] = Color3.fromRGB(100, 200, 240),
			["Color Text"] = Color3.fromRGB(220, 240, 252),
			["Color Dark Text"] = Color3.fromRGB(145, 185, 218)
		},
		Velvet = {
			["Color Hub 1"] = ColorSequence.new({
				ColorSequenceKeypoint.new(0.00, Color3.fromRGB(28, 8, 20)),
				ColorSequenceKeypoint.new(0.50, Color3.fromRGB(38, 11, 28)),
				ColorSequenceKeypoint.new(1.00, Color3.fromRGB(28, 8, 20))
			}),
			["Color Hub 2"] = Color3.fromRGB(33, 9, 24),
			["Color Stroke"] = Color3.fromRGB(62, 18, 46),
			["Color Theme"] = Color3.fromRGB(200, 50, 140),
			["Color Text"] = Color3.fromRGB(255, 218, 240),
			["Color Dark Text"] = Color3.fromRGB(210, 145, 185)
		},
		Dawn = {
			["Color Hub 1"] = ColorSequence.new({
				ColorSequenceKeypoint.new(0.00, Color3.fromRGB(36, 20, 16)),
				ColorSequenceKeypoint.new(0.50, Color3.fromRGB(48, 28, 22)),
				ColorSequenceKeypoint.new(1.00, Color3.fromRGB(28, 18, 24))
			}),
			["Color Hub 2"] = Color3.fromRGB(42, 24, 19),
			["Color Stroke"] = Color3.fromRGB(74, 44, 34),
			["Color Theme"] = Color3.fromRGB(255, 180, 130),
			["Color Text"] = Color3.fromRGB(255, 242, 232),
			["Color Dark Text"] = Color3.fromRGB(215, 180, 158)
		},
		Phosphor = {
			["Color Hub 1"] = ColorSequence.new({
				ColorSequenceKeypoint.new(0.00, Color3.fromRGB(6, 14, 8)),
				ColorSequenceKeypoint.new(0.50, Color3.fromRGB(8, 20, 11)),
				ColorSequenceKeypoint.new(1.00, Color3.fromRGB(6, 14, 8))
			}),
			["Color Hub 2"] = Color3.fromRGB(7, 17, 9),
			["Color Stroke"] = Color3.fromRGB(14, 36, 18),
			["Color Theme"] = Color3.fromRGB(50, 255, 80),
			["Color Text"] = Color3.fromRGB(200, 255, 210),
			["Color Dark Text"] = Color3.fromRGB(120, 205, 140)
		},
		Noir = {
			["Color Hub 1"] = ColorSequence.new({
				ColorSequenceKeypoint.new(0.00, Color3.fromRGB(6, 6, 6)),
				ColorSequenceKeypoint.new(0.50, Color3.fromRGB(10, 10, 10)),
				ColorSequenceKeypoint.new(1.00, Color3.fromRGB(6, 6, 6))
			}),
			["Color Hub 2"] = Color3.fromRGB(8, 8, 8),
			["Color Stroke"] = Color3.fromRGB(22, 22, 22),
			["Color Theme"] = Color3.fromRGB(240, 240, 240),
			["Color Text"] = Color3.fromRGB(248, 248, 248),
			["Color Dark Text"] = Color3.fromRGB(170, 170, 170)
		},
		Wildfire = {
			["Color Hub 1"] = ColorSequence.new({
				ColorSequenceKeypoint.new(0.00, Color3.fromRGB(32, 12, 4)),
				ColorSequenceKeypoint.new(0.50, Color3.fromRGB(44, 18, 6)),
				ColorSequenceKeypoint.new(1.00, Color3.fromRGB(28, 14, 8))
			}),
			["Color Hub 2"] = Color3.fromRGB(38, 15, 5),
			["Color Stroke"] = Color3.fromRGB(70, 28, 10),
			["Color Theme"] = Color3.fromRGB(255, 110, 20),
			["Color Text"] = Color3.fromRGB(255, 235, 218),
			["Color Dark Text"] = Color3.fromRGB(215, 165, 130)
		},
		Polar = {
			["Color Hub 1"] = ColorSequence.new({
				ColorSequenceKeypoint.new(0.00, Color3.fromRGB(18, 28, 40)),
				ColorSequenceKeypoint.new(0.50, Color3.fromRGB(24, 38, 55)),
				ColorSequenceKeypoint.new(1.00, Color3.fromRGB(18, 28, 40))
			}),
			["Color Hub 2"] = Color3.fromRGB(21, 33, 47),
			["Color Stroke"] = Color3.fromRGB(38, 60, 86),
			["Color Theme"] = Color3.fromRGB(180, 240, 255),
			["Color Text"] = Color3.fromRGB(228, 248, 255),
			["Color Dark Text"] = Color3.fromRGB(155, 200, 232)
		},
		Shadow = {
			["Color Hub 1"] = ColorSequence.new({
				ColorSequenceKeypoint.new(0.00, Color3.fromRGB(8, 8, 10)),
				ColorSequenceKeypoint.new(0.50, Color3.fromRGB(12, 12, 15)),
				ColorSequenceKeypoint.new(1.00, Color3.fromRGB(8, 8, 10))
			}),
			["Color Hub 2"] = Color3.fromRGB(10, 10, 12),
			["Color Stroke"] = Color3.fromRGB(24, 24, 30),
			["Color Theme"] = Color3.fromRGB(255, 255, 80),
			["Color Text"] = Color3.fromRGB(255, 255, 220),
			["Color Dark Text"] = Color3.fromRGB(200, 200, 145)
		},
		Prism = {
			["Color Hub 1"] = ColorSequence.new({
				ColorSequenceKeypoint.new(0.00, Color3.fromRGB(10, 14, 26)),
				ColorSequenceKeypoint.new(0.50, Color3.fromRGB(16, 20, 38)),
				ColorSequenceKeypoint.new(1.00, Color3.fromRGB(14, 10, 30))
			}),
			["Color Hub 2"] = Color3.fromRGB(13, 17, 32),
			["Color Stroke"] = Color3.fromRGB(26, 34, 64),
			["Color Theme"] = Color3.fromRGB(100, 255, 255),
			["Color Text"] = Color3.fromRGB(215, 252, 255),
			["Color Dark Text"] = Color3.fromRGB(138, 200, 220)
		},
		Cacao = {
			["Color Hub 1"] = ColorSequence.new({
				ColorSequenceKeypoint.new(0.00, Color3.fromRGB(24, 14, 8)),
				ColorSequenceKeypoint.new(0.50, Color3.fromRGB(33, 20, 11)),
				ColorSequenceKeypoint.new(1.00, Color3.fromRGB(24, 14, 8))
			}),
			["Color Hub 2"] = Color3.fromRGB(28, 17, 9),
			["Color Stroke"] = Color3.fromRGB(52, 32, 18),
			["Color Theme"] = Color3.fromRGB(175, 120, 80),
			["Color Text"] = Color3.fromRGB(255, 240, 228),
			["Color Dark Text"] = Color3.fromRGB(195, 162, 132)
		},
		Starlight = {
			["Color Hub 1"] = ColorSequence.new({
				ColorSequenceKeypoint.new(0.00, Color3.fromRGB(8, 8, 20)),
				ColorSequenceKeypoint.new(0.50, Color3.fromRGB(12, 12, 30)),
				ColorSequenceKeypoint.new(1.00, Color3.fromRGB(8, 8, 20))
			}),
			["Color Hub 2"] = Color3.fromRGB(10, 10, 25),
			["Color Stroke"] = Color3.fromRGB(22, 22, 52),
			["Color Theme"] = Color3.fromRGB(255, 240, 160),
			["Color Text"] = Color3.fromRGB(255, 252, 232),
			["Color Dark Text"] = Color3.fromRGB(210, 198, 155)
		},
		Seafoam = {
			["Color Hub 1"] = ColorSequence.new({
				ColorSequenceKeypoint.new(0.00, Color3.fromRGB(8, 24, 22)),
				ColorSequenceKeypoint.new(0.50, Color3.fromRGB(11, 33, 30)),
				ColorSequenceKeypoint.new(1.00, Color3.fromRGB(8, 24, 22))
			}),
			["Color Hub 2"] = Color3.fromRGB(9, 28, 26),
			["Color Stroke"] = Color3.fromRGB(18, 54, 50),
			["Color Theme"] = Color3.fromRGB(80, 230, 190),
			["Color Text"] = Color3.fromRGB(210, 255, 248),
			["Color Dark Text"] = Color3.fromRGB(130, 202, 190)
		},
		Lapis = {
			["Color Hub 1"] = ColorSequence.new({
				ColorSequenceKeypoint.new(0.00, Color3.fromRGB(10, 16, 44)),
				ColorSequenceKeypoint.new(0.50, Color3.fromRGB(14, 22, 60)),
				ColorSequenceKeypoint.new(1.00, Color3.fromRGB(10, 16, 44))
			}),
			["Color Hub 2"] = Color3.fromRGB(12, 19, 52),
			["Color Stroke"] = Color3.fromRGB(22, 36, 96),
			["Color Theme"] = Color3.fromRGB(80, 150, 255),
			["Color Text"] = Color3.fromRGB(215, 232, 255),
			["Color Dark Text"] = Color3.fromRGB(138, 172, 235)
		},
		Spice = {
			["Color Hub 1"] = ColorSequence.new({
				ColorSequenceKeypoint.new(0.00, Color3.fromRGB(30, 14, 8)),
				ColorSequenceKeypoint.new(0.50, Color3.fromRGB(40, 20, 10)),
				ColorSequenceKeypoint.new(1.00, Color3.fromRGB(30, 14, 8))
			}),
			["Color Hub 2"] = Color3.fromRGB(35, 17, 9),
			["Color Stroke"] = Color3.fromRGB(64, 32, 18),
			["Color Theme"] = Color3.fromRGB(225, 100, 50),
			["Color Text"] = Color3.fromRGB(255, 235, 220),
			["Color Dark Text"] = Color3.fromRGB(210, 160, 132)
		},
		Matrix = {
			["Color Hub 1"] = ColorSequence.new({
				ColorSequenceKeypoint.new(0.00, Color3.fromRGB(0, 10, 0)),
				ColorSequenceKeypoint.new(0.50, Color3.fromRGB(0, 14, 0)),
				ColorSequenceKeypoint.new(1.00, Color3.fromRGB(0, 10, 0))
			}),
			["Color Hub 2"] = Color3.fromRGB(0, 12, 0),
			["Color Stroke"] = Color3.fromRGB(0, 30, 0),
			["Color Theme"] = Color3.fromRGB(0, 255, 70),
			["Color Text"] = Color3.fromRGB(180, 255, 190),
			["Color Dark Text"] = Color3.fromRGB(0, 180, 44)
		},
		Bismuth = {
			["Color Hub 1"] = ColorSequence.new({
				ColorSequenceKeypoint.new(0.00, Color3.fromRGB(18, 16, 24)),
				ColorSequenceKeypoint.new(0.50, Color3.fromRGB(24, 22, 32)),
				ColorSequenceKeypoint.new(1.00, Color3.fromRGB(18, 16, 24))
			}),
			["Color Hub 2"] = Color3.fromRGB(21, 19, 28),
			["Color Stroke"] = Color3.fromRGB(40, 36, 54),
			["Color Theme"] = Color3.fromRGB(160, 210, 200),
			["Color Text"] = Color3.fromRGB(228, 242, 240),
			["Color Dark Text"] = Color3.fromRGB(155, 192, 185)
		},
		Glow = {
			["Color Hub 1"] = ColorSequence.new({
				ColorSequenceKeypoint.new(0.00, Color3.fromRGB(4, 8, 22)),
				ColorSequenceKeypoint.new(0.50, Color3.fromRGB(6, 12, 32)),
				ColorSequenceKeypoint.new(1.00, Color3.fromRGB(4, 8, 22))
			}),
			["Color Hub 2"] = Color3.fromRGB(5, 10, 27),
			["Color Stroke"] = Color3.fromRGB(10, 20, 54),
			["Color Theme"] = Color3.fromRGB(80, 200, 255),
			["Color Text"] = Color3.fromRGB(210, 240, 255),
			["Color Dark Text"] = Color3.fromRGB(130, 185, 230)
		},
		Terra = {
			["Color Hub 1"] = ColorSequence.new({
				ColorSequenceKeypoint.new(0.00, Color3.fromRGB(22, 16, 10)),
				ColorSequenceKeypoint.new(0.50, Color3.fromRGB(30, 22, 14)),
				ColorSequenceKeypoint.new(1.00, Color3.fromRGB(22, 16, 10))
			}),
			["Color Hub 2"] = Color3.fromRGB(26, 19, 12),
			["Color Stroke"] = Color3.fromRGB(48, 36, 22),
			["Color Theme"] = Color3.fromRGB(160, 120, 70),
			["Color Text"] = Color3.fromRGB(248, 238, 222),
			["Color Dark Text"] = Color3.fromRGB(192, 165, 130)
		},
		Rift = {
			["Color Hub 1"] = ColorSequence.new({
				ColorSequenceKeypoint.new(0.00, Color3.fromRGB(10, 6, 22)),
				ColorSequenceKeypoint.new(0.50, Color3.fromRGB(14, 8, 32)),
				ColorSequenceKeypoint.new(1.00, Color3.fromRGB(10, 6, 22))
			}),
			["Color Hub 2"] = Color3.fromRGB(12, 7, 27),
			["Color Stroke"] = Color3.fromRGB(24, 14, 54),
			["Color Theme"] = Color3.fromRGB(150, 80, 255),
			["Color Text"] = Color3.fromRGB(228, 215, 255),
			["Color Dark Text"] = Color3.fromRGB(158, 135, 220)
		},
		Basalt = {
			["Color Hub 1"] = ColorSequence.new({
				ColorSequenceKeypoint.new(0.00, Color3.fromRGB(16, 14, 12)),
				ColorSequenceKeypoint.new(0.50, Color3.fromRGB(22, 20, 17)),
				ColorSequenceKeypoint.new(1.00, Color3.fromRGB(16, 14, 12))
			}),
			["Color Hub 2"] = Color3.fromRGB(19, 17, 14),
			["Color Stroke"] = Color3.fromRGB(38, 34, 28),
			["Color Theme"] = Color3.fromRGB(160, 155, 145),
			["Color Text"] = Color3.fromRGB(240, 236, 230),
			["Color Dark Text"] = Color3.fromRGB(170, 162, 150)
		},
		Wildberry = {
			["Color Hub 1"] = ColorSequence.new({
				ColorSequenceKeypoint.new(0.00, Color3.fromRGB(30, 8, 20)),
				ColorSequenceKeypoint.new(0.50, Color3.fromRGB(42, 11, 28)),
				ColorSequenceKeypoint.new(1.00, Color3.fromRGB(30, 8, 20))
			}),
			["Color Hub 2"] = Color3.fromRGB(36, 9, 24),
			["Color Stroke"] = Color3.fromRGB(66, 18, 46),
			["Color Theme"] = Color3.fromRGB(240, 60, 140),
			["Color Text"] = Color3.fromRGB(255, 218, 238),
			["Color Dark Text"] = Color3.fromRGB(210, 145, 180)
		},
		White = {
			["Color Hub 1"] = ColorSequence.new({
				ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 255, 255)),
				ColorSequenceKeypoint.new(0.50, Color3.fromRGB(250, 250, 250)),
				ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 255, 255))
			}),
			["Color Hub 2"] = Color3.fromRGB(255, 255, 255),
			["Color Stroke"] = Color3.fromRGB(255, 255, 255),
			["Color Theme"] = Color3.fromRGB(255, 255, 255),
			["Color Text"] = Color3.fromRGB(255, 255, 255),
			["Color Dark Text"] = Color3.fromRGB(225, 225, 225),
			["Stroke Transparency"] = 1,
			["Panel Transparency"] = 0.85
		},

	},
	Info = {
		Version = "8.0.0"
	},
	Save = {
		UISize = {550, 380},
		TabSize = 135,
		TabHeight = 32,
		Theme = "Darker",
		Transparency = 0.03,
		MinimizeButtons = {},
		MainImage = ""
	},
	Settings = {},
	Connection = {},
	Instances = {},
	Elements = {},
	Options = {},
	Flags = {},
	Tabs = {},
	Icons = (function()
		return {
			["accessibility"] = "rbxassetid://10709751939",
			["activity"] = "rbxassetid://10709752035",
			["airvent"] = "rbxassetid://10709752131",
			["airplay"] = "rbxassetid://10709752254",
			["alarmcheck"] = "rbxassetid://10709752405",
			["alarmclock"] = "rbxassetid://10709752630",
			["alarmclockoff"] = "rbxassetid://10709752508",
			["alarmminus"] = "rbxassetid://10709752732",
			["alarmplus"] = "rbxassetid://10709752825",
			["album"] = "rbxassetid://10709752906",
			["alertcircle"] = "rbxassetid://10709752996",
			["alertoctagon"] = "rbxassetid://10709753064",
			["alerttriangle"] = "rbxassetid://10709753149",
			["aligncenter"] = "rbxassetid://10709753570",
			["aligncenterhorizontal"] = "rbxassetid://10709753272",
			["aligncentervertical"] = "rbxassetid://10709753421",
			["alignendhorizontal"] = "rbxassetid://10709753692",
			["alignendvertical"] = "rbxassetid://10709753808",
			["alignhorizontaldistributecenter"] = "rbxassetid://10747779791",
			["alignhorizontaldistributeend"] = "rbxassetid://10747784534",
			["alignhorizontaldistributestart"] = "rbxassetid://10709754118",
			["alignhorizontaljustifycenter"] = "rbxassetid://10709754204",
			["alignhorizontaljustifyend"] = "rbxassetid://10709754317",
			["alignhorizontaljustifystart"] = "rbxassetid://10709754436",
			["alignhorizontalspacearound"] = "rbxassetid://10709754590",
			["alignhorizontalspacebetween"] = "rbxassetid://10709754749",
			["alignjustify"] = "rbxassetid://10709759610",
			["alignleft"] = "rbxassetid://10709759764",
			["alignright"] = "rbxassetid://10709759895",
			["alignstarthorizontal"] = "rbxassetid://10709760051",
			["alignstartvertical"] = "rbxassetid://10709760244",
			["alignverticaldistributecenter"] = "rbxassetid://10709760351",
			["alignverticaldistributeend"] = "rbxassetid://10709760434",
			["alignverticaldistributestart"] = "rbxassetid://10709760612",
			["alignverticaljustifycenter"] = "rbxassetid://10709760814",
			["alignverticaljustifyend"] = "rbxassetid://10709761003",
			["alignverticaljustifystart"] = "rbxassetid://10709761176",
			["alignverticalspacearound"] = "rbxassetid://10709761324",
			["alignverticalspacebetween"] = "rbxassetid://10709761434",
			["anchor"] = "rbxassetid://10709761530",
			["angry"] = "rbxassetid://10709761629",
			["annoyed"] = "rbxassetid://10709761722",
			["aperture"] = "rbxassetid://10709761813",
			["apple"] = "rbxassetid://10709761889",
			["archive"] = "rbxassetid://10709762233",
			["archiverestore"] = "rbxassetid://10709762058",
			["armchair"] = "rbxassetid://10709762327",
			["arrowbigdown"] = "rbxassetid://10747796644",
			["arrowbigleft"] = "rbxassetid://10709762574",
			["arrowbigright"] = "rbxassetid://10709762727",
			["arrowbigup"] = "rbxassetid://10709762879",
			["arrowdown"] = "rbxassetid://10709767827",
			["arrowdowncircle"] = "rbxassetid://10709763034",
			["arrowdownleft"] = "rbxassetid://10709767656",
			["arrowdownright"] = "rbxassetid://10709767750",
			["arrowleft"] = "rbxassetid://10709768114",
			["arrowleftcircle"] = "rbxassetid://10709767936",
			["arrowleftright"] = "rbxassetid://10709768019",
			["arrowright"] = "rbxassetid://10709768347",
			["arrowrightcircle"] = "rbxassetid://10709768226",
			["arrowup"] = "rbxassetid://10709768939",
			["arrowupcircle"] = "rbxassetid://10709768432",
			["arrowupdown"] = "rbxassetid://10709768538",
			["arrowupleft"] = "rbxassetid://10709768661",
			["arrowupright"] = "rbxassetid://10709768787",
			["asterisk"] = "rbxassetid://10709769095",
			["atsign"] = "rbxassetid://10709769286",
			["award"] = "rbxassetid://10709769406",
			["axe"] = "rbxassetid://10709769508",
			["axis3d"] = "rbxassetid://10709769598",
			["baby"] = "rbxassetid://10709769732",
			["backpack"] = "rbxassetid://10709769841",
			["baggageclaim"] = "rbxassetid://10709769935",
			["banana"] = "rbxassetid://10709770005",
			["banknote"] = "rbxassetid://10709770178",
			["barchart"] = "rbxassetid://10709773755",
			["barchart2"] = "rbxassetid://10709770317",
			["barchart3"] = "rbxassetid://10709770431",
			["barchart4"] = "rbxassetid://10709770560",
			["barcharthorizontal"] = "rbxassetid://10709773669",
			["barcode"] = "rbxassetid://10747360675",
			["baseline"] = "rbxassetid://10709773863",
			["bath"] = "rbxassetid://10709773963",
			["battery"] = "rbxassetid://10709774640",
			["batterycharging"] = "rbxassetid://10709774068",
			["batteryfull"] = "rbxassetid://10709774206",
			["batterylow"] = "rbxassetid://10709774370",
			["batterymedium"] = "rbxassetid://10709774513",
			["beaker"] = "rbxassetid://10709774756",
			["bed"] = "rbxassetid://10709775036",
			["beddouble"] = "rbxassetid://10709774864",
			["bedsingle"] = "rbxassetid://10709774968",
			["beer"] = "rbxassetid://10709775167",
			["bell"] = "rbxassetid://10709775704",
			["bellminus"] = "rbxassetid://10709775241",
			["belloff"] = "rbxassetid://10709775320",
			["bellplus"] = "rbxassetid://10709775448",
			["bellring"] = "rbxassetid://10709775560",
			["bike"] = "rbxassetid://10709775894",
			["binary"] = "rbxassetid://10709776050",
			["bitcoin"] = "rbxassetid://10709776126",
			["bluetooth"] = "rbxassetid://10709776655",
			["bluetoothconnected"] = "rbxassetid://10709776240",
			["bluetoothoff"] = "rbxassetid://10709776344",
			["bluetoothsearching"] = "rbxassetid://10709776501",
			["bold"] = "rbxassetid://10747813908",
			["bomb"] = "rbxassetid://10709781460",
			["bone"] = "rbxassetid://10709781605",
			["book"] = "rbxassetid://10709781824",
			["bookopen"] = "rbxassetid://10709781717",
			["bookmark"] = "rbxassetid://10709782154",
			["bookmarkminus"] = "rbxassetid://10709781919",
			["bookmarkplus"] = "rbxassetid://10709782044",
			["bot"] = "rbxassetid://10709782230",
			["box"] = "rbxassetid://10709782497",
			["boxselect"] = "rbxassetid://10709782342",
			["boxes"] = "rbxassetid://10709782582",
			["briefcase"] = "rbxassetid://10709782662",
			["brush"] = "rbxassetid://10709782758",
			["bug"] = "rbxassetid://10709782845",
			["building"] = "rbxassetid://10709783051",
			["building2"] = "rbxassetid://10709782939",
			["bus"] = "rbxassetid://10709783137",
			["cake"] = "rbxassetid://10709783217",
			["calculator"] = "rbxassetid://10709783311",
			["calendar"] = "rbxassetid://10709789505",
			["calendarcheck"] = "rbxassetid://10709783474",
			["calendarcheck2"] = "rbxassetid://10709783392",
			["calendarclock"] = "rbxassetid://10709783577",
			["calendardays"] = "rbxassetid://10709783673",
			["calendarheart"] = "rbxassetid://10709783835",
			["calendarminus"] = "rbxassetid://10709783959",
			["calendaroff"] = "rbxassetid://10709788784",
			["calendarplus"] = "rbxassetid://10709788937",
			["calendarrange"] = "rbxassetid://10709789053",
			["calendarsearch"] = "rbxassetid://10709789200",
			["calendarx"] = "rbxassetid://10709789407",
			["calendarx2"] = "rbxassetid://10709789329",
			["camera"] = "rbxassetid://10709789686",
			["cameraoff"] = "rbxassetid://10747822677",
			["car"] = "rbxassetid://10709789810",
			["carrot"] = "rbxassetid://10709789960",
			["cast"] = "rbxassetid://10709790097",
			["charge"] = "rbxassetid://10709790202",
			["check"] = "rbxassetid://10709790644",
			["checkcircle"] = "rbxassetid://10709790387",
			["checkcircle2"] = "rbxassetid://10709790298",
			["checksquare"] = "rbxassetid://10709790537",
			["chefhat"] = "rbxassetid://10709790757",
			["cherry"] = "rbxassetid://10709790875",
			["chevrondown"] = "rbxassetid://10709790948",
			["chevronfirst"] = "rbxassetid://10709791015",
			["chevronlast"] = "rbxassetid://10709791130",
			["chevronleft"] = "rbxassetid://10709791281",
			["chevronright"] = "rbxassetid://10709791437",
			["chevronup"] = "rbxassetid://10709791523",
			["chevronsdown"] = "rbxassetid://10709796864",
			["chevronsdownup"] = "rbxassetid://10709791632",
			["chevronsleft"] = "rbxassetid://10709797151",
			["chevronsleftright"] = "rbxassetid://10709797006",
			["chevronsright"] = "rbxassetid://10709797382",
			["chevronsrightleft"] = "rbxassetid://10709797274",
			["chevronsup"] = "rbxassetid://10709797622",
			["chevronsupdown"] = "rbxassetid://10709797508",
			["chrome"] = "rbxassetid://10709797725",
			["circle"] = "rbxassetid://10709798174",
			["circledot"] = "rbxassetid://10709797837",
			["circleellipsis"] = "rbxassetid://10709797985",
			["circleslashed"] = "rbxassetid://10709798100",
			["citrus"] = "rbxassetid://10709798276",
			["clapperboard"] = "rbxassetid://10709798350",
			["clipboard"] = "rbxassetid://10709799288",
			["clipboardcheck"] = "rbxassetid://10709798443",
			["clipboardcopy"] = "rbxassetid://10709798574",
			["clipboardedit"] = "rbxassetid://10709798682",
			["clipboardlist"] = "rbxassetid://10709798792",
			["clipboardsignature"] = "rbxassetid://10709798890",
			["clipboardtype"] = "rbxassetid://10709798999",
			["clipboardx"] = "rbxassetid://10709799124",
			["clock"] = "rbxassetid://10709805144",
			["clock1"] = "rbxassetid://10709799535",
			["clock10"] = "rbxassetid://10709799718",
			["clock11"] = "rbxassetid://10709799818",
			["clock12"] = "rbxassetid://10709799962",
			["clock2"] = "rbxassetid://10709803876",
			["clock3"] = "rbxassetid://10709803989",
			["clock4"] = "rbxassetid://10709804164",
			["clock5"] = "rbxassetid://10709804291",
			["clock6"] = "rbxassetid://10709804435",
			["clock7"] = "rbxassetid://10709804599",
			["clock8"] = "rbxassetid://10709804784",
			["clock9"] = "rbxassetid://10709804996",
			["cloud"] = "rbxassetid://10709806740",
			["cloudcog"] = "rbxassetid://10709805262",
			["clouddrizzle"] = "rbxassetid://10709805371",
			["cloudfog"] = "rbxassetid://10709805477",
			["cloudhail"] = "rbxassetid://10709805596",
			["cloudlightning"] = "rbxassetid://10709805727",
			["cloudmoon"] = "rbxassetid://10709805942",
			["cloudmoonrain"] = "rbxassetid://10709805838",
			["cloudoff"] = "rbxassetid://10709806060",
			["cloudrain"] = "rbxassetid://10709806277",
			["cloudrainwind"] = "rbxassetid://10709806166",
			["cloudsnow"] = "rbxassetid://10709806374",
			["cloudsun"] = "rbxassetid://10709806631",
			["cloudsunrain"] = "rbxassetid://10709806475",
			["cloudy"] = "rbxassetid://10709806859",
			["clover"] = "rbxassetid://10709806995",
			["code"] = "rbxassetid://10709810463",
			["code2"] = "rbxassetid://10709807111",
			["codepen"] = "rbxassetid://10709810534",
			["codesandbox"] = "rbxassetid://10709810676",
			["coffee"] = "rbxassetid://10709810814",
			["cog"] = "rbxassetid://10709810948",
			["coins"] = "rbxassetid://10709811110",
			["columns"] = "rbxassetid://10709811261",
			["command"] = "rbxassetid://10709811365",
			["compass"] = "rbxassetid://10709811445",
			["component"] = "rbxassetid://10709811595",
			["conciergebell"] = "rbxassetid://10709811706",
			["connection"] = "rbxassetid://10747361219",
			["contact"] = "rbxassetid://10709811834",
			["contrast"] = "rbxassetid://10709811939",
			["cookie"] = "rbxassetid://10709812067",
			["copy"] = "rbxassetid://10709812159",
			["copyleft"] = "rbxassetid://10709812251",
			["copyright"] = "rbxassetid://10709812311",
			["cornerdownleft"] = "rbxassetid://10709812396",
			["cornerdownright"] = "rbxassetid://10709812485",
			["cornerleftdown"] = "rbxassetid://10709812632",
			["cornerleftup"] = "rbxassetid://10709812784",
			["cornerrightdown"] = "rbxassetid://10709812939",
			["cornerrightup"] = "rbxassetid://10709813094",
			["cornerupleft"] = "rbxassetid://10709813185",
			["cornerupright"] = "rbxassetid://10709813281",
			["cpu"] = "rbxassetid://10709813383",
			["croissant"] = "rbxassetid://10709818125",
			["crop"] = "rbxassetid://10709818245",
			["cross"] = "rbxassetid://10709818399",
			["crosshair"] = "rbxassetid://10709818534",
			["crown"] = "rbxassetid://10709818626",
			["cupsoda"] = "rbxassetid://10709818763",
			["curlybraces"] = "rbxassetid://10709818847",
			["currency"] = "rbxassetid://10709818931",
			["database"] = "rbxassetid://10709818996",
			["delete"] = "rbxassetid://10709819059",
			["diamond"] = "rbxassetid://10709819149",
			["dice1"] = "rbxassetid://10709819266",
			["dice2"] = "rbxassetid://10709819361",
			["dice3"] = "rbxassetid://10709819508",
			["dice4"] = "rbxassetid://10709819670",
			["dice5"] = "rbxassetid://10709819801",
			["dice6"] = "rbxassetid://10709819896",
			["dices"] = "rbxassetid://10723343321",
			["diff"] = "rbxassetid://10723343416",
			["disc"] = "rbxassetid://10723343537",
			["divide"] = "rbxassetid://10723343805",
			["dividecircle"] = "rbxassetid://10723343636",
			["dividesquare"] = "rbxassetid://10723343737",
			["dollarsign"] = "rbxassetid://10723343958",
			["download"] = "rbxassetid://10723344270",
			["downloadcloud"] = "rbxassetid://10723344088",
			["droplet"] = "rbxassetid://10723344432",
			["droplets"] = "rbxassetid://10734883356",
			["drumstick"] = "rbxassetid://10723344737",
			["edit"] = "rbxassetid://10734883598",
			["edit2"] = "rbxassetid://10723344885",
			["edit3"] = "rbxassetid://10723345088",
			["egg"] = "rbxassetid://10723345518",
			["eggfried"] = "rbxassetid://10723345347",
			["electricity"] = "rbxassetid://10723345749",
			["electricityoff"] = "rbxassetid://10723345643",
			["equal"] = "rbxassetid://10723345990",
			["equalnot"] = "rbxassetid://10723345866",
			["eraser"] = "rbxassetid://10723346158",
			["euro"] = "rbxassetid://10723346372",
			["expand"] = "rbxassetid://10723346553",
			["externallink"] = "rbxassetid://10723346684",
			["eye"] = "rbxassetid://10723346959",
			["eyeoff"] = "rbxassetid://10723346871",
			["factory"] = "rbxassetid://10723347051",
			["fan"] = "rbxassetid://10723354359",
			["fastforward"] = "rbxassetid://10723354521",
			["feather"] = "rbxassetid://10723354671",
			["figma"] = "rbxassetid://10723354801",
			["file"] = "rbxassetid://10723374641",
			["filearchive"] = "rbxassetid://10723354921",
			["fileaudio"] = "rbxassetid://10723355148",
			["fileaudio2"] = "rbxassetid://10723355026",
			["fileaxis3d"] = "rbxassetid://10723355272",
			["filebadge"] = "rbxassetid://10723355622",
			["filebadge2"] = "rbxassetid://10723355451",
			["filebarchart"] = "rbxassetid://10723355887",
			["filebarchart2"] = "rbxassetid://10723355746",
			["filebox"] = "rbxassetid://10723355989",
			["filecheck"] = "rbxassetid://10723356210",
			["filecheck2"] = "rbxassetid://10723356100",
			["fileclock"] = "rbxassetid://10723356329",
			["filecode"] = "rbxassetid://10723356507",
			["filecog"] = "rbxassetid://10723356830",
			["filecog2"] = "rbxassetid://10723356676",
			["filediff"] = "rbxassetid://10723357039",
			["filedigit"] = "rbxassetid://10723357151",
			["filedown"] = "rbxassetid://10723357322",
			["fileedit"] = "rbxassetid://10723357495",
			["fileheart"] = "rbxassetid://10723357637",
			["fileimage"] = "rbxassetid://10723357790",
			["fileinput"] = "rbxassetid://10723357933",
			["filejson"] = "rbxassetid://10723364435",
			["filejson2"] = "rbxassetid://10723364361",
			["filekey"] = "rbxassetid://10723364605",
			["filekey2"] = "rbxassetid://10723364515",
			["filelinechart"] = "rbxassetid://10723364725",
			["filelock"] = "rbxassetid://10723364957",
			["filelock2"] = "rbxassetid://10723364861",
			["fileminus"] = "rbxassetid://10723365254",
			["fileminus2"] = "rbxassetid://10723365086",
			["fileoutput"] = "rbxassetid://10723365457",
			["filepiechart"] = "rbxassetid://10723365598",
			["fileplus"] = "rbxassetid://10723365877",
			["fileplus2"] = "rbxassetid://10723365766",
			["filequestion"] = "rbxassetid://10723365987",
			["filescan"] = "rbxassetid://10723366167",
			["filesearch"] = "rbxassetid://10723366550",
			["filesearch2"] = "rbxassetid://10723366340",
			["filesignature"] = "rbxassetid://10723366741",
			["filespreadsheet"] = "rbxassetid://10723366962",
			["filesymlink"] = "rbxassetid://10723367098",
			["fileterminal"] = "rbxassetid://10723367244",
			["filetext"] = "rbxassetid://10723367380",
			["filetype"] = "rbxassetid://10723367606",
			["filetype2"] = "rbxassetid://10723367509",
			["fileup"] = "rbxassetid://10723367734",
			["filevideo"] = "rbxassetid://10723373884",
			["filevideo2"] = "rbxassetid://10723367834",
			["filevolume"] = "rbxassetid://10723374172",
			["filevolume2"] = "rbxassetid://10723374030",
			["filewarning"] = "rbxassetid://10723374276",
			["filex"] = "rbxassetid://10723374544",
			["filex2"] = "rbxassetid://10723374378",
			["files"] = "rbxassetid://10723374759",
			["film"] = "rbxassetid://10723374981",
			["filter"] = "rbxassetid://10723375128",
			["fingerprint"] = "rbxassetid://10723375250",
			["flag"] = "rbxassetid://10723375890",
			["flagoff"] = "rbxassetid://10723375443",
			["flagtriangleleft"] = "rbxassetid://10723375608",
			["flagtriangleright"] = "rbxassetid://10723375727",
			["flame"] = "rbxassetid://10723376114",
			["flashlight"] = "rbxassetid://10723376471",
			["flashlightoff"] = "rbxassetid://10723376365",
			["flaskconical"] = "rbxassetid://10734883986",
			["flaskround"] = "rbxassetid://10723376614",
			["fliphorizontal"] = "rbxassetid://10723376884",
			["fliphorizontal2"] = "rbxassetid://10723376745",
			["flipvertical"] = "rbxassetid://10723377138",
			["flipvertical2"] = "rbxassetid://10723377026",
			["flower"] = "rbxassetid://10747830374",
			["flower2"] = "rbxassetid://10723377305",
			["focus"] = "rbxassetid://10723377537",
			["folder"] = "rbxassetid://10723387563",
			["folderarchive"] = "rbxassetid://10723384478",
			["foldercheck"] = "rbxassetid://10723384605",
			["folderclock"] = "rbxassetid://10723384731",
			["folderclosed"] = "rbxassetid://10723384893",
			["foldercog"] = "rbxassetid://10723385213",
			["foldercog2"] = "rbxassetid://10723385036",
			["folderdown"] = "rbxassetid://10723385338",
			["folderedit"] = "rbxassetid://10723385445",
			["folderheart"] = "rbxassetid://10723385545",
			["folderinput"] = "rbxassetid://10723385721",
			["folderkey"] = "rbxassetid://10723385848",
			["folderlock"] = "rbxassetid://10723386005",
			["folderminus"] = "rbxassetid://10723386127",
			["folderopen"] = "rbxassetid://10723386277",
			["folderoutput"] = "rbxassetid://10723386386",
			["folderplus"] = "rbxassetid://10723386531",
			["foldersearch"] = "rbxassetid://10723386787",
			["foldersearch2"] = "rbxassetid://10723386674",
			["foldersymlink"] = "rbxassetid://10723386930",
			["foldertree"] = "rbxassetid://10723387085",
			["folderup"] = "rbxassetid://10723387265",
			["folderx"] = "rbxassetid://10723387448",
			["folders"] = "rbxassetid://10723387721",
			["forminput"] = "rbxassetid://10723387841",
			["forward"] = "rbxassetid://10723388016",
			["frame"] = "rbxassetid://10723394389",
			["framer"] = "rbxassetid://10723394565",
			["frown"] = "rbxassetid://10723394681",
			["fuel"] = "rbxassetid://10723394846",
			["functionsquare"] = "rbxassetid://10723395041",
			["gamepad"] = "rbxassetid://10723395457",
			["gamepad2"] = "rbxassetid://10723395215",
			["gauge"] = "rbxassetid://10723395708",
			["gavel"] = "rbxassetid://10723395896",
			["gem"] = "rbxassetid://10723396000",
			["ghost"] = "rbxassetid://10723396107",
			["gift"] = "rbxassetid://10723396402",
			["giftcard"] = "rbxassetid://10723396225",
			["gitbranch"] = "rbxassetid://10723396676",
			["gitbranchplus"] = "rbxassetid://10723396542",
			["gitcommit"] = "rbxassetid://10723396812",
			["gitcompare"] = "rbxassetid://10723396954",
			["gitfork"] = "rbxassetid://10723397049",
			["gitmerge"] = "rbxassetid://10723397165",
			["gitpullrequest"] = "rbxassetid://10723397431",
			["gitpullrequestclosed"] = "rbxassetid://10723397268",
			["gitpullrequestdraft"] = "rbxassetid://10734884302",
			["glass"] = "rbxassetid://10723397788",
			["glass2"] = "rbxassetid://10723397529",
			["glasswater"] = "rbxassetid://10723397678",
			["glasses"] = "rbxassetid://10723397895",
			["globe"] = "rbxassetid://10723404337",
			["globe2"] = "rbxassetid://10723398002",
			["grab"] = "rbxassetid://10723404472",
			["graduationcap"] = "rbxassetid://10723404691",
			["grape"] = "rbxassetid://10723404822",
			["grid"] = "rbxassetid://10723404936",
			["griphorizontal"] = "rbxassetid://10723405089",
			["gripvertical"] = "rbxassetid://10723405236",
			["hammer"] = "rbxassetid://10723405360",
			["hand"] = "rbxassetid://10723405649",
			["handmetal"] = "rbxassetid://10723405508",
			["harddrive"] = "rbxassetid://10723405749",
			["hardhat"] = "rbxassetid://10723405859",
			["hash"] = "rbxassetid://10723405975",
			["haze"] = "rbxassetid://10723406078",
			["headphones"] = "rbxassetid://10723406165",
			["heart"] = "rbxassetid://10723406885",
			["heartcrack"] = "rbxassetid://10723406299",
			["hearthandshake"] = "rbxassetid://10723406480",
			["heartoff"] = "rbxassetid://10723406662",
			["heartpulse"] = "rbxassetid://10723406795",
			["helpcircle"] = "rbxassetid://10723406988",
			["hexagon"] = "rbxassetid://10723407092",
			["highlighter"] = "rbxassetid://10723407192",
			["history"] = "rbxassetid://10723407335",
			["home"] = "rbxassetid://10723407389",
			["hourglass"] = "rbxassetid://10723407498",
			["icecream"] = "rbxassetid://10723414308",
			["image"] = "rbxassetid://10723415040",
			["imageminus"] = "rbxassetid://10723414487",
			["imageoff"] = "rbxassetid://10723414677",
			["imageplus"] = "rbxassetid://10723414827",
			["import"] = "rbxassetid://10723415205",
			["inbox"] = "rbxassetid://10723415335",
			["indent"] = "rbxassetid://10723415494",
			["indianrupee"] = "rbxassetid://10723415642",
			["infinity"] = "rbxassetid://10723415766",
			["info"] = "rbxassetid://10723415903",
			["inspect"] = "rbxassetid://10723416057",
			["italic"] = "rbxassetid://10723416195",
			["japaneseyen"] = "rbxassetid://10723416363",
			["joystick"] = "rbxassetid://10723416527",
			["key"] = "rbxassetid://10723416652",
			["keyboard"] = "rbxassetid://10723416765",
			["lamp"] = "rbxassetid://10723417513",
			["lampceiling"] = "rbxassetid://10723416922",
			["lampdesk"] = "rbxassetid://10723417016",
			["lampfloor"] = "rbxassetid://10723417131",
			["lampwalldown"] = "rbxassetid://10723417240",
			["lampwallup"] = "rbxassetid://10723417356",
			["landmark"] = "rbxassetid://10723417608",
			["languages"] = "rbxassetid://10723417703",
			["laptop"] = "rbxassetid://10723423881",
			["laptop2"] = "rbxassetid://10723417797",
			["lasso"] = "rbxassetid://10723424235",
			["lassoselect"] = "rbxassetid://10723424058",
			["laugh"] = "rbxassetid://10723424372",
			["layers"] = "rbxassetid://10723424505",
			["layout"] = "rbxassetid://10723425376",
			["layoutdashboard"] = "rbxassetid://10723424646",
			["layoutgrid"] = "rbxassetid://10723424838",
			["layoutlist"] = "rbxassetid://10723424963",
			["layouttemplate"] = "rbxassetid://10723425187",
			["leaf"] = "rbxassetid://10723425539",
			["library"] = "rbxassetid://10723425615",
			["lifebuoy"] = "rbxassetid://10723425685",
			["lightbulb"] = "rbxassetid://10723425852",
			["lightbulboff"] = "rbxassetid://10723425762",
			["linechart"] = "rbxassetid://10723426393",
			["link"] = "rbxassetid://10723426722",
			["link2"] = "rbxassetid://10723426595",
			["link2off"] = "rbxassetid://10723426513",
			["list"] = "rbxassetid://10723433811",
			["listchecks"] = "rbxassetid://10734884548",
			["listend"] = "rbxassetid://10723426886",
			["listminus"] = "rbxassetid://10723426986",
			["listmusic"] = "rbxassetid://10723427081",
			["listordered"] = "rbxassetid://10723427199",
			["listplus"] = "rbxassetid://10723427334",
			["liststart"] = "rbxassetid://10723427494",
			["listvideo"] = "rbxassetid://10723427619",
			["listx"] = "rbxassetid://10723433655",
			["loader"] = "rbxassetid://10723434070",
			["loader2"] = "rbxassetid://10723433935",
			["locate"] = "rbxassetid://10723434557",
			["locatefixed"] = "rbxassetid://10723434236",
			["locateoff"] = "rbxassetid://10723434379",
			["lock"] = "rbxassetid://10723434711",
			["login"] = "rbxassetid://10723434830",
			["logout"] = "rbxassetid://10723434906",
			["luggage"] = "rbxassetid://10723434993",
			["magnet"] = "rbxassetid://10723435069",
			["mail"] = "rbxassetid://10734885430",
			["mailcheck"] = "rbxassetid://10723435182",
			["mailminus"] = "rbxassetid://10723435261",
			["mailopen"] = "rbxassetid://10723435342",
			["mailplus"] = "rbxassetid://10723435443",
			["mailquestion"] = "rbxassetid://10723435515",
			["mailsearch"] = "rbxassetid://10734884739",
			["mailwarning"] = "rbxassetid://10734885015",
			["mailx"] = "rbxassetid://10734885247",
			["mails"] = "rbxassetid://10734885614",
			["map"] = "rbxassetid://10734886202",
			["mappin"] = "rbxassetid://10734886004",
			["mappinoff"] = "rbxassetid://10734885803",
			["maximize"] = "rbxassetid://10734886735",
			["maximize2"] = "rbxassetid://10734886496",
			["medal"] = "rbxassetid://10734887072",
			["megaphone"] = "rbxassetid://10734887454",
			["megaphoneoff"] = "rbxassetid://10734887311",
			["meh"] = "rbxassetid://10734887603",
			["menu"] = "rbxassetid://10734887784",
			["messagecircle"] = "rbxassetid://10734888000",
			["messagesquare"] = "rbxassetid://10734888228",
			["mic"] = "rbxassetid://10734888864",
			["mic2"] = "rbxassetid://10734888430",
			["micoff"] = "rbxassetid://10734888646",
			["microscope"] = "rbxassetid://10734889106",
			["microwave"] = "rbxassetid://10734895076",
			["milestone"] = "rbxassetid://10734895310",
			["minimize"] = "rbxassetid://10734895698",
			["minimize2"] = "rbxassetid://10734895530",
			["minus"] = "rbxassetid://10734896206",
			["minuscircle"] = "rbxassetid://10734895856",
			["minussquare"] = "rbxassetid://10734896029",
			["monitor"] = "rbxassetid://10734896881",
			["monitoroff"] = "rbxassetid://10734896360",
			["monitorspeaker"] = "rbxassetid://10734896512",
			["moon"] = "rbxassetid://10734897102",
			["morehorizontal"] = "rbxassetid://10734897250",
			["morevertical"] = "rbxassetid://10734897387",
			["mountain"] = "rbxassetid://10734897956",
			["mountainsnow"] = "rbxassetid://10734897665",
			["mouse"] = "rbxassetid://10734898592",
			["mousepointer"] = "rbxassetid://10734898476",
			["mousepointer2"] = "rbxassetid://10734898194",
			["mousepointerclick"] = "rbxassetid://10734898355",
			["move"] = "rbxassetid://10734900011",
			["move3d"] = "rbxassetid://10734898756",
			["movediagonal"] = "rbxassetid://10734899164",
			["movediagonal2"] = "rbxassetid://10734898934",
			["movehorizontal"] = "rbxassetid://10734899414",
			["movevertical"] = "rbxassetid://10734899821",
			["music"] = "rbxassetid://10734905958",
			["music2"] = "rbxassetid://10734900215",
			["music3"] = "rbxassetid://10734905665",
			["music4"] = "rbxassetid://10734905823",
			["navigation"] = "rbxassetid://10734906744",
			["navigation2"] = "rbxassetid://10734906332",
			["navigation2off"] = "rbxassetid://10734906144",
			["navigationoff"] = "rbxassetid://10734906580",
			["network"] = "rbxassetid://10734906975",
			["newspaper"] = "rbxassetid://10734907168",
			["octagon"] = "rbxassetid://10734907361",
			["option"] = "rbxassetid://10734907649",
			["outdent"] = "rbxassetid://10734907933",
			["package"] = "rbxassetid://10734909540",
			["package2"] = "rbxassetid://10734908151",
			["packagecheck"] = "rbxassetid://10734908384",
			["packageminus"] = "rbxassetid://10734908626",
			["packageopen"] = "rbxassetid://10734908793",
			["packageplus"] = "rbxassetid://10734909016",
			["packagesearch"] = "rbxassetid://10734909196",
			["packagex"] = "rbxassetid://10734909375",
			["paintbucket"] = "rbxassetid://10734909847",
			["paintbrush"] = "rbxassetid://10734910187",
			["paintbrush2"] = "rbxassetid://10734910030",
			["palette"] = "rbxassetid://10734910430",
			["palmtree"] = "rbxassetid://10734910680",
			["paperclip"] = "rbxassetid://10734910927",
			["partypopper"] = "rbxassetid://10734918735",
			["pause"] = "rbxassetid://10734919336",
			["pausecircle"] = "rbxassetid://10735024209",
			["pauseoctagon"] = "rbxassetid://10734919143",
			["pentool"] = "rbxassetid://10734919503",
			["pencil"] = "rbxassetid://10734919691",
			["percent"] = "rbxassetid://10734919919",
			["personstanding"] = "rbxassetid://10734920149",
			["phone"] = "rbxassetid://10734921524",
			["phonecall"] = "rbxassetid://10734920305",
			["phoneforwarded"] = "rbxassetid://10734920508",
			["phoneincoming"] = "rbxassetid://10734920694",
			["phonemissed"] = "rbxassetid://10734920845",
			["phoneoff"] = "rbxassetid://10734921077",
			["phoneoutgoing"] = "rbxassetid://10734921288",
			["piechart"] = "rbxassetid://10734921727",
			["piggybank"] = "rbxassetid://10734921935",
			["pin"] = "rbxassetid://10734922324",
			["pinoff"] = "rbxassetid://10734922180",
			["pipette"] = "rbxassetid://10734922497",
			["pizza"] = "rbxassetid://10734922774",
			["plane"] = "rbxassetid://10734922971",
			["play"] = "rbxassetid://10734923549",
			["playcircle"] = "rbxassetid://10734923214",
			["plus"] = "rbxassetid://10734924532",
			["pluscircle"] = "rbxassetid://10734923868",
			["plussquare"] = "rbxassetid://10734924219",
			["podcast"] = "rbxassetid://10734929553",
			["pointer"] = "rbxassetid://10734929723",
			["poundsterling"] = "rbxassetid://10734929981",
			["power"] = "rbxassetid://10734930466",
			["poweroff"] = "rbxassetid://10734930257",
			["printer"] = "rbxassetid://10734930632",
			["puzzle"] = "rbxassetid://10734930886",
			["quote"] = "rbxassetid://10734931234",
			["radio"] = "rbxassetid://10734931596",
			["radioreceiver"] = "rbxassetid://10734931402",
			["rectanglehorizontal"] = "rbxassetid://10734931777",
			["rectanglevertical"] = "rbxassetid://10734932081",
			["recycle"] = "rbxassetid://10734932295",
			["redo"] = "rbxassetid://10734932822",
			["redo2"] = "rbxassetid://10734932586",
			["refreshccw"] = "rbxassetid://10734933056",
			["refreshcw"] = "rbxassetid://10734933222",
			["refrigerator"] = "rbxassetid://10734933465",
			["regex"] = "rbxassetid://10734933655",
			["repeat"] = "rbxassetid://10734933966",
			["repeat1"] = "rbxassetid://10734933826",
			["reply"] = "rbxassetid://10734934252",
			["replyall"] = "rbxassetid://10734934132",
			["rewind"] = "rbxassetid://10734934347",
			["rocket"] = "rbxassetid://10734934585",
			["rockingchair"] = "rbxassetid://10734939942",
			["rotate3d"] = "rbxassetid://10734940107",
			["rotateccw"] = "rbxassetid://10734940376",
			["rotatecw"] = "rbxassetid://10734940654",
			["rss"] = "rbxassetid://10734940825",
			["ruler"] = "rbxassetid://10734941018",
			["russianruble"] = "rbxassetid://10734941199",
			["sailboat"] = "rbxassetid://10734941354",
			["save"] = "rbxassetid://10734941499",
			["scale"] = "rbxassetid://10734941912",
			["scale3d"] = "rbxassetid://10734941739",
			["scaling"] = "rbxassetid://10734942072",
			["scan"] = "rbxassetid://10734942565",
			["scanface"] = "rbxassetid://10734942198",
			["scanline"] = "rbxassetid://10734942351",
			["scissors"] = "rbxassetid://10734942778",
			["screenshare"] = "rbxassetid://10734943193",
			["screenshareoff"] = "rbxassetid://10734942967",
			["scroll"] = "rbxassetid://10734943448",
			["search"] = "rbxassetid://10734943674",
			["send"] = "rbxassetid://10734943902",
			["separatorhorizontal"] = "rbxassetid://10734944115",
			["separatorvertical"] = "rbxassetid://10734944326",
			["server"] = "rbxassetid://10734949856",
			["servercog"] = "rbxassetid://10734944444",
			["servercrash"] = "rbxassetid://10734944554",
			["serveroff"] = "rbxassetid://10734944668",
			["settings"] = "rbxassetid://10734950309",
			["settings2"] = "rbxassetid://10734950020",
			["share"] = "rbxassetid://10734950813",
			["share2"] = "rbxassetid://10734950553",
			["sheet"] = "rbxassetid://10734951038",
			["shield"] = "rbxassetid://10734951847",
			["shieldalert"] = "rbxassetid://10734951173",
			["shieldcheck"] = "rbxassetid://10734951367",
			["shieldclose"] = "rbxassetid://10734951535",
			["shieldoff"] = "rbxassetid://10734951684",
			["shirt"] = "rbxassetid://10734952036",
			["shoppingbag"] = "rbxassetid://10734952273",
			["shoppingcart"] = "rbxassetid://10734952479",
			["shovel"] = "rbxassetid://10734952773",
			["showerhead"] = "rbxassetid://10734952942",
			["shrink"] = "rbxassetid://10734953073",
			["shrub"] = "rbxassetid://10734953241",
			["shuffle"] = "rbxassetid://10734953451",
			["sidebar"] = "rbxassetid://10734954301",
			["sidebarclose"] = "rbxassetid://10734953715",
			["sidebaropen"] = "rbxassetid://10734954000",
			["sigma"] = "rbxassetid://10734954538",
			["signal"] = "rbxassetid://10734961133",
			["signalhigh"] = "rbxassetid://10734954807",
			["signallow"] = "rbxassetid://10734955080",
			["signalmedium"] = "rbxassetid://10734955336",
			["signalzero"] = "rbxassetid://10734960878",
			["siren"] = "rbxassetid://10734961284",
			["skipback"] = "rbxassetid://10734961526",
			["skipforward"] = "rbxassetid://10734961809",
			["skull"] = "rbxassetid://10734962068",
			["slack"] = "rbxassetid://10734962339",
			["slash"] = "rbxassetid://10734962600",
			["slice"] = "rbxassetid://10734963024",
			["sliders"] = "rbxassetid://10734963400",
			["slidershorizontal"] = "rbxassetid://10734963191",
			["smartphone"] = "rbxassetid://10734963940",
			["smartphonecharging"] = "rbxassetid://10734963671",
			["smile"] = "rbxassetid://10734964441",
			["smileplus"] = "rbxassetid://10734964188",
			["snowflake"] = "rbxassetid://10734964600",
			["sofa"] = "rbxassetid://10734964852",
			["sortasc"] = "rbxassetid://10734965115",
			["sortdesc"] = "rbxassetid://10734965287",
			["speaker"] = "rbxassetid://10734965419",
			["sprout"] = "rbxassetid://10734965572",
			["square"] = "rbxassetid://10734965702",
			["star"] = "rbxassetid://10734966248",
			["starhalf"] = "rbxassetid://10734965897",
			["staroff"] = "rbxassetid://10734966097",
			["stethoscope"] = "rbxassetid://10734966384",
			["sticker"] = "rbxassetid://10734972234",
			["stickynote"] = "rbxassetid://10734972463",
			["stopcircle"] = "rbxassetid://10734972621",
			["stretchhorizontal"] = "rbxassetid://10734972862",
			["stretchvertical"] = "rbxassetid://10734973130",
			["strikethrough"] = "rbxassetid://10734973290",
			["subscript"] = "rbxassetid://10734973457",
			["sun"] = "rbxassetid://10734974297",
			["sundim"] = "rbxassetid://10734973645",
			["sunmedium"] = "rbxassetid://10734973778",
			["sunmoon"] = "rbxassetid://10734973999",
			["sunsnow"] = "rbxassetid://10734974130",
			["sunrise"] = "rbxassetid://10734974522",
			["sunset"] = "rbxassetid://10734974689",
			["superscript"] = "rbxassetid://10734974850",
			["swissfranc"] = "rbxassetid://10734975024",
			["switchcamera"] = "rbxassetid://10734975214",
			["sword"] = "rbxassetid://10734975486",
			["swords"] = "rbxassetid://10734975692",
			["syringe"] = "rbxassetid://10734975932",
			["table"] = "rbxassetid://10734976230",
			["table2"] = "rbxassetid://10734976097",
			["tablet"] = "rbxassetid://10734976394",
			["tag"] = "rbxassetid://10734976528",
			["tags"] = "rbxassetid://10734976739",
			["target"] = "rbxassetid://10734977012",
			["tent"] = "rbxassetid://10734981750",
			["terminal"] = "rbxassetid://10734982144",
			["terminalsquare"] = "rbxassetid://10734981995",
			["textcursor"] = "rbxassetid://10734982395",
			["textcursorinput"] = "rbxassetid://10734982297",
			["thermometer"] = "rbxassetid://10734983134",
			["thermometersnowflake"] = "rbxassetid://10734982571",
			["thermometersun"] = "rbxassetid://10734982771",
			["thumbsdown"] = "rbxassetid://10734983359",
			["thumbsup"] = "rbxassetid://10734983629",
			["ticket"] = "rbxassetid://10734983868",
			["timer"] = "rbxassetid://10734984606",
			["timeroff"] = "rbxassetid://10734984138",
			["timerreset"] = "rbxassetid://10734984355",
			["toggleleft"] = "rbxassetid://10734984834",
			["toggleright"] = "rbxassetid://10734985040",
			["tornado"] = "rbxassetid://10734985247",
			["toybrick"] = "rbxassetid://10747361919",
			["train"] = "rbxassetid://10747362105",
			["trash"] = "rbxassetid://10747362393",
			["trash2"] = "rbxassetid://10747362241",
			["treedeciduous"] = "rbxassetid://10747362534",
			["treepine"] = "rbxassetid://10747362748",
			["trees"] = "rbxassetid://10747363016",
			["trendingdown"] = "rbxassetid://10747363205",
			["trendingup"] = "rbxassetid://10747363465",
			["triangle"] = "rbxassetid://10747363621",
			["trophy"] = "rbxassetid://10747363809",
			["truck"] = "rbxassetid://10747364031",
			["tv"] = "rbxassetid://10747364593",
			["tv2"] = "rbxassetid://10747364302",
			["type"] = "rbxassetid://10747364761",
			["umbrella"] = "rbxassetid://10747364971",
			["underline"] = "rbxassetid://10747365191",
			["undo"] = "rbxassetid://10747365484",
			["undo2"] = "rbxassetid://10747365359",
			["unlink"] = "rbxassetid://10747365771",
			["unlink2"] = "rbxassetid://10747397871",
			["unlock"] = "rbxassetid://10747366027",
			["upload"] = "rbxassetid://10747366434",
			["uploadcloud"] = "rbxassetid://10747366266",
			["usb"] = "rbxassetid://10747366606",
			["user"] = "rbxassetid://10747373176",
			["usercheck"] = "rbxassetid://10747371901",
			["usercog"] = "rbxassetid://10747372167",
			["userminus"] = "rbxassetid://10747372346",
			["userplus"] = "rbxassetid://10747372702",
			["userx"] = "rbxassetid://10747372992",
			["users"] = "rbxassetid://10747373426",
			["utensils"] = "rbxassetid://10747373821",
			["utensilscrossed"] = "rbxassetid://10747373629",
			["venetianmask"] = "rbxassetid://10747374003",
			["verified"] = "rbxassetid://10747374131",
			["vibrate"] = "rbxassetid://10747374489",
			["vibrateoff"] = "rbxassetid://10747374269",
			["video"] = "rbxassetid://10747374938",
			["videooff"] = "rbxassetid://10747374721",
			["view"] = "rbxassetid://10747375132",
			["voicemail"] = "rbxassetid://10747375281",
			["volume"] = "rbxassetid://10747376008",
			["volume1"] = "rbxassetid://10747375450",
			["volume2"] = "rbxassetid://10747375679",
			["volumex"] = "rbxassetid://10747375880",
			["wallet"] = "rbxassetid://10747376205",
			["wand"] = "rbxassetid://10747376565",
			["wand2"] = "rbxassetid://10747376349",
			["watch"] = "rbxassetid://10747376722",
			["waves"] = "rbxassetid://10747376931",
			["webcam"] = "rbxassetid://10747381992",
			["wifi"] = "rbxassetid://10747382504",
			["wifioff"] = "rbxassetid://10747382268",
			["wind"] = "rbxassetid://10747382750",
			["wraptext"] = "rbxassetid://10747383065",
			["wrench"] = "rbxassetid://10747383470",
			["x"] = "rbxassetid://10747384394",
			["xcircle"] = "rbxassetid://10747383819",
			["xoctagon"] = "rbxassetid://10747384037",
			["xsquare"] = "rbxassetid://10747384217",
			["zoomin"] = "rbxassetid://10747384552",
			["zoomout"] = "rbxassetid://10747384679"
		}
	end)()
}

local ViewportSize = workspace.CurrentCamera.ViewportSize
local UIScale = ViewportSize.Y / 450

local Settings = redzlib.Settings
local Flags = redzlib.Flags

local SetProps, SetChildren, InsertTheme, Create do
	InsertTheme = function(Instance, Type)
		table.insert(redzlib.Instances, {
			Instance = Instance,
			Type = Type
		})
		return Instance
	end

	SetChildren = function(Instance, Children)
		if Children then
			table.foreach(Children, function(_,Child)
				Child.Parent = Instance
			end)
		end
		return Instance
	end

	SetProps = function(Instance, Props)
		if Props then
			table.foreach(Props, function(prop, value)
				Instance[prop] = value
			end)
		end
		return Instance
	end

	Create = function(...)
		local args = {...}
		if type(args) ~= "table" then return end
		local new = Instance.new(args[1])
		local Children = {}

		if type(args[2]) == "table" then
			SetProps(new, args[2])
			SetChildren(new, args[3])
			Children = args[3] or {}
		elseif typeof(args[2]) == "Instance" then
			new.Parent = args[2]
			SetProps(new, args[3])
			SetChildren(new, args[4])
			Children = args[4] or {}
		end
		return new
	end

	local SaveRoot    = "smoothlib"
	local SaveFolder  = SaveRoot .. "/LibrarySettings"
	local SaveFile    = SaveFolder .. "/smooth library.json"
	local ImgCache    = SaveFolder .. "/images"

	local function EnsureFolders()
		if not makefolder then return end
		if not isfolder(SaveRoot)   then makefolder(SaveRoot)   end
		if not isfolder(SaveFolder) then makefolder(SaveFolder) end
		if not isfolder(ImgCache)   then makefolder(ImgCache)   end
	end

	local ImageAssetCache = {}

	local function FetchHttpImage(url)
		if ImageAssetCache[url] then return ImageAssetCache[url] end
		if not writefile or not makefolder then return url end
		EnsureFolders()
		local ext  = url:match("%.(%w+)%??[^%.]*$") or "png"
		local safe = url:gsub("[^%w%-_]", "_"):sub(1, 60) .. "." .. ext
		local path = ImgCache .. "/" .. safe
		if not isfile(path) then
			local ok, body = pcall(function()
				return game:HttpGet(url)
			end)
			if not ok or not body then return url end
			pcall(writefile, path, body)
		end
		if isfile(path) then
			local ok, asset = pcall(getcustomasset, path)
			if ok then
				ImageAssetCache[url] = asset
				return asset
			end
		end
		return url
	end

	redzlib.FetchHttpImage = FetchHttpImage

	local function Save(file)
		if readfile and isfile and isfile(file) then
			local decode = HttpService:JSONDecode(readfile(file))
			if type(decode) == "table" then
				if rawget(decode, "UISize") then redzlib.Save["UISize"] = decode["UISize"] end
				if rawget(decode, "TabSize") then redzlib.Save["TabSize"] = decode["TabSize"] end
				if rawget(decode, "TabHeight") then redzlib.Save["TabHeight"] = decode["TabHeight"] end
				if rawget(decode, "Theme") and VerifyTheme(decode["Theme"]) then redzlib.Save["Theme"] = decode["Theme"] end
				if rawget(decode, "Transparency") then redzlib.Save["Transparency"] = decode["Transparency"] end
				if rawget(decode, "MinimizeButtons") then redzlib.Save["MinimizeButtons"] = decode["MinimizeButtons"] end
				if rawget(decode, "MainImage") then redzlib.Save["MainImage"] = decode["MainImage"] end
			end
		end
	end

	EnsureFolders()
	pcall(Save, SaveFile)
end

local Funcs = {} do
	function Funcs:InsertCallback(tab, func)
		if type(func) == "function" then
			table.insert(tab, func)
		end
		return func
	end

	function Funcs:FireCallback(tab, ...)
		for _,v in ipairs(tab) do
			if type(v) == "function" then
				task.spawn(v, ...)
			end
		end
	end

	function Funcs:ToggleVisible(Obj, Bool)
		Obj.Visible = Bool ~= nil and Bool or not Obj.Visible
	end

	function Funcs:ToggleParent(Obj, Parent)
		if Bool ~= nil then
			Obj.Parent = Bool
		else
			Obj.Parent = not Obj.Parent and Parent
		end
	end

	function Funcs:GetConnectionFunctions(ConnectedFuncs, func)
		local Connected = { Function = func, Connected = true }

		function Connected:Disconnect()
			if self.Connected then
				table.remove(ConnectedFuncs, table.find(ConnectedFuncs, self.Function))
				self.Connected = false
			end
		end

		function Connected:Fire(...)
			if self.Connected then
				task.spawn(self.Function, ...)
			end
		end

		return Connected
	end

	function Funcs:GetCallback(Configs, index)
		local func = Configs[index] or Configs.Callback or function()end

		if type(func) == "table" then
			return ({function(Value) func[1][func[2]] = Value end})
		end
		return {func}
	end
end

local Connections, Connection = {}, redzlib.Connection do
	local function NewConnectionList(List)
		if type(List) ~= "table" then return end

		for _,CoName in ipairs(List) do
			local ConnectedFuncs, Connect = {}, {}
			Connection[CoName] = Connect
			Connections[CoName] = ConnectedFuncs
			Connect.Name = CoName

			function Connect:Connect(func)
				if type(func) == "function" then
					table.insert(ConnectedFuncs, func)
					return Funcs:GetConnectionFunctions(ConnectedFuncs, func)
				end
			end

			function Connect:Once(func)
				if type(func) == "function" then
					local Connected;
					local _NFunc;_NFunc = function(...)
						task.spawn(func, ...)
						Connected:Disconnect()
					end
					Connected = Funcs:GetConnectionFunctions(ConnectedFuncs, _NFunc)
					return Connected
				end
			end
		end
	end

	function Connection:FireConnection(CoName, ...)
		local Conn = type(CoName) == "string" and Connections[CoName] or Connections[CoName.Name]
		for _,Func in pairs(Conn) do
			task.spawn(Func, ...)
		end
	end

	NewConnectionList({"FlagsChanged", "ThemeChanged", "FileSaved", "ThemeChanging", "OptionAdded"})
end

local GetFlag, SetFlag, CheckFlag do
	CheckFlag = function(Name)
		return type(Name) == "string" and Flags[Name] ~= nil
	end

	GetFlag = function(Name)
		return type(Name) == "string" and Flags[Name]
	end

	SetFlag = function(Flag, Value)
		if Flag and (Value ~= Flags[Flag] or type(Value) == "table") then
			Flags[Flag] = Value
			Connection:FireConnection("FlagsChanged", Flag, Value)
		end
	end

	local db
	Connection.FlagsChanged:Connect(function(Flag, Value)
		local ScriptFile = Settings.ScriptFile
		if not db and ScriptFile and writefile then
			db=true;task.wait(0.1);db=false
			local Success, Encoded = pcall(function()
				return HttpService:JSONEncode(Flags)
			end)
			if Success then
				local ok = pcall(writefile, ScriptFile, Encoded)
				if ok then
					Connection:FireConnection("FileSaved", "Script-Flags", ScriptFile, Encoded)
				end
			end
		end
	end)
end

local ScreenGui = Create("ScreenGui", CoreGui, {
	Name = "smooth library",
}, {
	Create("UIScale", {
		Scale = UIScale,
		Name = "Scale"
	})
})

local ScreenFind = CoreGui:FindFirstChild(ScreenGui.Name)
if ScreenFind and ScreenFind ~= ScreenGui then
	ScreenFind:Destroy()
end

local function GetStr(val)
	if type(val) == "function" then
		return val()
	end
	return val
end

local function ConnectSave(Instance, func)
	Instance.InputBegan:Connect(function(Input)
		if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
			while UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) do task.wait() end
		end
		func()
	end)
end

local function CreateTween(Configs)
	local Inst = Configs[1] or Configs.Instance
	local Prop = Configs[2] or Configs.Prop
	local NewVal = Configs[3] or Configs.NewVal
	local Time = Configs[4] or Configs.Time or 0.5
	local TweenWait = Configs[5] or Configs.wait or false
	local Info = TweenInfo.new(Time, Enum.EasingStyle.Quint)
	local Tween = TweenService:Create(Inst, Info, {[Prop] = NewVal})
	Tween:Play()
	if TweenWait then
		Tween.Completed:Wait()
	end
	return Tween
end

local function MakeDrag(Instance)
	task.spawn(function()
		SetProps(Instance, {
			Active = true,
			AutoButtonColor = false
		})

		local DragStart, StartPos, InputOn

		local function Update(Input)
			local delta = Input.Position - DragStart
			local Position = UDim2.new(StartPos.X.Scale, StartPos.X.Offset + delta.X / UIScale, StartPos.Y.Scale, StartPos.Y.Offset + delta.Y / UIScale)
			CreateTween({Instance, "Position", Position, 0.35})
		end

		Instance.MouseButton1Down:Connect(function()
			InputOn = true
		end)

		Instance.InputBegan:Connect(function(Input)
			if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
				StartPos = Instance.Position
				DragStart = Input.Position
				while UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) do
					RunService.Heartbeat:Wait()
					if InputOn then
						Update(Input)
					end
				end
				InputOn = false
			end
		end)
	end)
	return Instance
end

local function VerifyTheme(Theme)
	for name,_ in pairs(redzlib.Themes) do
		if name == Theme then
			return true
		end
	end
end

local function BrightenColor(c, amount)
	amount = amount or 55
	return Color3.fromRGB(
		math.clamp(c.R * 255 + amount, 0, 255),
		math.clamp(c.G * 255 + amount, 0, 255),
		math.clamp(c.B * 255 + amount, 0, 255)
	)
end

local function SaveJson(save)
	if not writefile then return end
	local Root   = "smoothlib"
	local Folder = Root .. "/LibrarySettings"
	if makefolder then
		if not isfolder(Root)   then makefolder(Root)   end
		if not isfolder(Folder) then makefolder(Folder) end
	end
	local json = HttpService:JSONEncode(save)
	writefile(Folder .. "/smooth library.json", json)
end

local Theme = redzlib.Themes[redzlib.Save.Theme]

local CurrentTransparency = redzlib.Save.Transparency or 0.03
local _MainFrame = nil

local function AddEle(Name, Func)
	redzlib.Elements[Name] = Func
end

local function Make(Ele, Instance, props, ...)
	local Element = redzlib.Elements[Ele](Instance, props, ...)
	return Element
end

AddEle("Corner", function(parent, CornerRadius)
	local New = SetProps(Create("UICorner", parent, {
		CornerRadius = CornerRadius or UDim.new(0, 7)
	}), nil)
	return New
end)

AddEle("Stroke", function(parent, props, ...)
	local args = {...}
	local New = InsertTheme(SetProps(Create("UIStroke", parent, {
		Color = args[1] or Theme["Color Stroke"],
		Thickness = args[2] or 1,
		Transparency = Theme["Stroke Transparency"] or 0,
		ApplyStrokeMode = "Border"
	}), props), "Stroke")
	return New
end)

AddEle("ElementStroke", function(parent, props, ...)
	local args = {...}
	local New = InsertTheme(SetProps(Create("UIStroke", parent, {
		Color = args[1] or BrightenColor(Theme["Color Stroke"], 55),
		Thickness = args[2] or 1,
		Transparency = Theme["Stroke Transparency"] or 0,
		ApplyStrokeMode = "Border"
	}), props), "ElementStroke")
	return New
end)

AddEle("Button", function(parent, props, ...)
	local New = InsertTheme(SetProps(Create("TextButton", parent, {
		Text = "",
		Size = UDim2.fromScale(1, 1),
		BackgroundColor3 = Theme["Color Hub 2"],
		BackgroundTransparency = Theme["Panel Transparency"] or math.clamp(CurrentTransparency + 0.55, 0, 0.95),
		AutoButtonColor = false
	}), props), "Frame")


	return New
end)

AddEle("Gradient", function(parent, props, ...)
	local New = InsertTheme(SetProps(Create("UIGradient", parent, {
		Color = Theme["Color Hub 1"]
	}), props), "Gradient")
	return New
end)

local function MeasureWrappedTextHeight(text, textSize, font, width, lineHeightMultiplier)
	lineHeightMultiplier = lineHeightMultiplier or 1
	if not width or width <= 0 then width = 200 end
	local plain = text:gsub("<[^<>]->", "")
	if plain == "" then plain = " " end
	local size = TextService:GetTextSize(plain, textSize, font, Vector2.new(width, math.huge))
	return size.Y * lineHeightMultiplier
end

local function NeedsRichText(text)
	return type(text) == "string" and text:find("<", 1, true) ~= nil and text:find(">", 1, true) ~= nil
end

local function ButtonFrame(Instance, Title, Description, HolderSize)
	local H_SIMPLE = 25

	local hasDesc = type(Description) == "string" and Description:gsub(" ",""):len() > 0
	local frameH = hasDesc and 38 or H_SIMPLE

	local Frame = InsertTheme(Create("TextButton", Instance, {
		Size = UDim2.new(1, 0, 0, frameH),
		AutomaticSize = "None",
		Text = "",
		AutoButtonColor = false,
		BackgroundColor3 = Theme["Color Theme"],
		BackgroundTransparency = 0.85,
		Name = "Option"
	}), "Theme")
	Make("Corner", Frame, UDim.new(0, 6))

	local TitleL = InsertTheme(Create("TextLabel", Frame, {
		Font = Enum.Font.GothamMedium,
		TextColor3 = Theme["Color Text"],
		Size = HolderSize,
		Position = UDim2.new(0, 10, 0, 7),
		AnchorPoint = Vector2.new(0, 0),
		BackgroundTransparency = 1,
		TextTruncate = "AtEnd",
		TextSize = 10,
		TextXAlignment = "Left",
		TextYAlignment = "Center",
		Text = "",
		RichText = false
	}), "Text")

	local DescL = InsertTheme(Create("TextLabel", Frame, {
		Font = Enum.Font.Gotham,
		TextColor3 = Theme["Color Text"],
		Size = UDim2.new(1, -20, 0, 0),
		Position = UDim2.new(0, 10, 0, 21),
		AnchorPoint = Vector2.new(0, 0),
		BackgroundTransparency = 1,
		TextWrapped = true,
		TextSize = 9,
		LineHeight = 1.25,
		TextXAlignment = "Left",
		TextYAlignment = "Top",
		AutomaticSize = Enum.AutomaticSize.None,
		Text = "",
		RichText = false,
		Visible = false
	}), "Text")

	if not hasDesc then
		TitleL.Position = UDim2.new(0, 10, 0.5, 0)
		TitleL.AnchorPoint = Vector2.new(0, 0.5)
		TitleL.TextYAlignment = Enum.TextYAlignment.Center
	end

	local Label = {}

	function Label:SetTitle(v)
		if type(v) == "string" and v:gsub(" ",""):len() > 0 then
			TitleL.RichText = NeedsRichText(v)
			TitleL.Text = v
		end
	end

	local function MeasureDescHeight()
		local width = (Frame.AbsoluteSize.X - 20) / UIScale
		return MeasureWrappedTextHeight(DescL.Text, DescL.TextSize, DescL.Font, width, DescL.LineHeight)
	end

	local resizeConn
	local function updateFrameHeight()
		local descH = MeasureDescHeight()
		DescL.Size = UDim2.new(1, -20, 0, descH)
		Frame.Size = UDim2.new(1, 0, 0, 21 + descH + 8)
	end

	function Label:SetDesc(v)
		if resizeConn then
			resizeConn:Disconnect()
			resizeConn = nil
		end
		if type(v) == "string" and v:gsub(" ",""):len() > 0 then
			DescL.Visible = true
			DescL.RichText = NeedsRichText(v)
			DescL.Text = v
			TitleL.Position = UDim2.new(0, 10, 0, 9)
			TitleL.AnchorPoint = Vector2.new(0, 0)
			updateFrameHeight()
			resizeConn = Frame:GetPropertyChangedSignal("AbsoluteSize"):Connect(updateFrameHeight)
		else
			DescL.Visible = false
			DescL.Text = ""
			TitleL.Position = UDim2.new(0, 10, 0.5, 0)
			TitleL.AnchorPoint = Vector2.new(0, 0.5)
			Frame.Size = UDim2.new(1, 0, 0, H_SIMPLE)
		end
	end

	Label:SetTitle(Title)
	Label:SetDesc(Description)
	return Frame, Label
end

local function GetColor(Instance)
	if Instance:IsA("Frame") then
		return "BackgroundColor3"
	elseif Instance:IsA("ImageLabel") then
		return "ImageColor3"
	elseif Instance:IsA("ImageButton") then
		return "BackgroundColor3"
	elseif Instance:IsA("TextButton") then
		return "BackgroundColor3"
	elseif Instance:IsA("TextLabel") then
		return "TextColor3"
	elseif Instance:IsA("TextBox") then
		return "TextColor3"
	elseif Instance:IsA("ScrollingFrame") then
		return "ScrollBarImageColor3"
	elseif Instance:IsA("UIStroke") then
		return "Color"
	end
	return ""
end

function redzlib:GetIcon(index)
	if type(index) ~= "string" or #index == 0 then
		return index
	end

	if index:find("^https?://") then
		if redzlib.FetchHttpImage then
			return redzlib.FetchHttpImage(index)
		end
		return index
	end

	if index:find("rbxassetid://") then
		return index
	end

	local firstMatch = nil
	index = string.lower(index):gsub("lucide", ""):gsub("-", "")

	if self.Icons[index] then
		return self.Icons[index]
	end

	for Name, Icon in self.Icons do
		if Name == index then
			return Icon
		elseif not firstMatch and Name:find(index, 1, true) then
			firstMatch = Icon
		end
	end

	return firstMatch or index
end

function redzlib:SetTheme(NewTheme)
	if not VerifyTheme(NewTheme) then return end

	redzlib.Save.Theme = NewTheme
	SaveJson(redzlib.Save)
	Theme = redzlib.Themes[NewTheme]

	Connection:FireConnection("ThemeChanged", NewTheme)
	table.foreach(redzlib.Instances, function(_,Val)
		if not Val or not Val.Instance or not Val.Instance.Parent then return end
		local inst = Val.Instance
		if Val.Type == "Gradient" then
			inst.Color = Theme["Color Hub 1"]
			if inst.Parent == _MainFrame then
			end
		elseif Val.Type == "Frame" then
			inst.BackgroundColor3 = Theme["Color Hub 2"]
			inst.BackgroundTransparency = Theme["Panel Transparency"] or math.clamp(CurrentTransparency + 0.55, 0, 0.95)
		elseif Val.Type == "SectionFrame" then
			inst.BackgroundColor3 = Theme["Color Hub 2"]
			inst.BackgroundTransparency = Theme["Panel Transparency"] or math.clamp(CurrentTransparency + 0.35, 0, 0.95)
		elseif Val.Type == "Main" then
			inst.BackgroundColor3 = Theme["Color Hub 2"]
		elseif Val.Type == "Stroke" then
			local prop = GetColor(inst)
			if prop ~= "" then inst[prop] = Theme["Color Stroke"] end
			if inst:IsA("UIStroke") then inst.Transparency = Theme["Stroke Transparency"] or 0 end
		elseif Val.Type == "ElementStroke" then
			local prop = GetColor(inst)
			if prop ~= "" then inst[prop] = BrightenColor(Theme["Color Stroke"], 55) end
			if inst:IsA("UIStroke") then inst.Transparency = Theme["Stroke Transparency"] or 0 end
		elseif Val.Type == "Theme" then
			local prop = GetColor(inst)
			if prop ~= "" then inst[prop] = Theme["Color Theme"] end
		elseif Val.Type == "ThemeText" then
			local prop = GetColor(inst)
			if prop ~= "" then inst[prop] = BrightenColor(Theme["Color Theme"], 60) end
		elseif Val.Type == "Text" then
			local prop = GetColor(inst)
			if prop ~= "" then inst[prop] = Theme["Color Text"] end
		elseif Val.Type == "DarkText" then
			local prop = GetColor(inst)
			if prop ~= "" then inst[prop] = Theme["Color Dark Text"] end
		elseif Val.Type == "TabBG" then
			inst.BackgroundColor3 = Theme["Color Theme"]
		elseif Val.Type == "ScrollBar" then
			local prop = GetColor(inst)
			if prop ~= "" then inst[prop] = Theme["Color Theme"] end
		end
	end)
end

function redzlib:SetTransparency(value)
	value = math.clamp(tonumber(value) or 0, 0, 0.95)
	CurrentTransparency = value
	redzlib.Save.Transparency = value
	SaveJson(redzlib.Save)
	if _MainFrame then
		_MainFrame.BackgroundTransparency = value
		_MainFrame.ImageTransparency = value
	end
	table.foreach(redzlib.Instances, function(_,Val)
		if not Val or not Val.Instance or not Val.Instance.Parent then return end
		if Val.Type == "SectionFrame" then
			Val.Instance.BackgroundTransparency = math.clamp(value + 0.35, 0, 0.95)
		elseif Val.Type == "Frame" then
			Val.Instance.BackgroundTransparency = math.clamp(value + 0.55, 0, 0.95)
		end
	end)
end


function redzlib:SetScale(NewScale)
	NewScale = ViewportSize.Y / math.clamp(NewScale, 300, 2000)
	UIScale, ScreenGui.Scale.Scale = NewScale, NewScale
end

function redzlib:SetBackgroundImage(raw)
	local id = tostring(raw or ""):gsub("^%s+", ""):gsub("%s+$", "")
	if id ~= "" then
		id = redzlib:GetIcon(id)
	end
	if _MainFrame then
		_MainFrame.Image = id
		_MainFrame.ImageTransparency = CurrentTransparency
	end
	redzlib.Save.MainImage = id
	SaveJson(redzlib.Save)
end

function redzlib:MakeWindow(Configs)
	local WTitle = Configs[1] or Configs.Name or Configs.Title or "smooth library"
	local WMiniText = Configs[2] or Configs.SubTitle or "modified - ChDrago"

	local SaveFolder = Configs[3] or Configs.SaveFolder or false

	local function BuildScriptFile()
		if not SaveFolder then return false end
		if not makefolder or not isfolder or not writefile then return false end
		local PlayerName = Player.Name
		local Root = "smoothlib"
		local GameFolder = Root .. "/" .. tostring(SaveFolder)
		if not isfolder(Root) then makefolder(Root) end
		if not isfolder(GameFolder) then makefolder(GameFolder) end
		return GameFolder .. "/" .. PlayerName .. ".json"
	end

	Settings.ScriptFile = BuildScriptFile()

	local function LoadFile()
		local File = Settings.ScriptFile
		if type(File) ~= "string" then return end
		if not readfile or not isfile then return end
		local s, r = pcall(isfile, File)
		if s and r then
			local s2, _Flags = pcall(readfile, File)
			if s2 and type(_Flags) == "string" then
				local s3, r3 = pcall(function() return HttpService:JSONDecode(_Flags) end)
				Flags = s3 and r3 or {}
			end
		end
	end;LoadFile()

	local UISizeX, UISizeY = unpack(redzlib.Save.UISize)
	local MainFrame = InsertTheme(Create("ImageButton", ScreenGui, {
		Size = UDim2.fromOffset(UISizeX, UISizeY),
		Position = UDim2.new(0.5, -UISizeX/2, 0.5, -UISizeY/2),
		BackgroundTransparency = CurrentTransparency,
		ScaleType = Enum.ScaleType.Crop,
		Image = redzlib.Save.MainImage or "",
		ImageTransparency = CurrentTransparency,
		Name = "Hub"
	}), "Main")

	_MainFrame = MainFrame

	Make("Gradient", MainFrame, { Rotation = 45 })
	MakeDrag(MainFrame)

	local MainCorner = Make("Corner", MainFrame)

	local MainStroke = InsertTheme(Create("UIStroke", MainFrame, {
		Color = BrightenColor(Theme["Color Stroke"], 55),
		Thickness = 1.5,
		ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	}), "ElementStroke")

	local Components = Create("Folder", MainFrame, { Name = "Components" })
	local DropdownHolder = Create("Folder", ScreenGui, { Name = "Dropdown" })

	local TopBar = Create("Frame", Components, {
		Size = UDim2.new(1, 0, 0, 28),
		BackgroundTransparency = 1,
		Name = "Top Bar"
	})

	local Title = InsertTheme(Create("TextLabel", TopBar, {
		Position = UDim2.new(0, 15, 0.5),
		AnchorPoint = Vector2.new(0, 0.5),
		AutomaticSize = "X",
		Size = UDim2.new(0, 0, 0, 28),
		Text = WTitle,
		TextXAlignment = "Left",
		TextYAlignment = "Center",
		TextSize = 12,
		TextColor3 = BrightenColor(Theme["Color Theme"], 60),
		BackgroundTransparency = 1,
		Font = Enum.Font.GothamBold,
		Name = "Title"
	}), "ThemeText")

	local SubTitle = InsertTheme(Create("TextLabel", TopBar, {
		AutomaticSize = "X",
		Size = UDim2.new(0, 0, 0, 28),
		AnchorPoint = Vector2.new(0, 0.5),
		Position = UDim2.new(0, 15 + TextService:GetTextSize(WTitle, 12, Enum.Font.GothamBold, Vector2.new(9999, 28)).X + 8, 0.5),
		Text = WMiniText,
		TextColor3 = Theme["Color Dark Text"],
		BackgroundTransparency = 1,
		TextXAlignment = "Left",
		TextYAlignment = "Center",
		TextSize = 8,
		Font = Enum.Font.Gotham,
		Name = "SubTitle"
	}), "DarkText")

	local TagHolder = Create("Frame", TopBar, {
		AnchorPoint = Vector2.new(0, 0.5),
		Position = UDim2.new(0, 15 + TextService:GetTextSize(WTitle, 12, Enum.Font.GothamBold, Vector2.new(9999, 28)).X + 8 + TextService:GetTextSize(WMiniText, 8, Enum.Font.Gotham, Vector2.new(9999, 28)).X + 10, 0.5),
		Size = UDim2.new(0, 200, 0, 18),
		BackgroundTransparency = 1,
		Name = "TagHolder"
	}, {
		Create("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			Padding = UDim.new(0, 7),
			SortOrder = Enum.SortOrder.LayoutOrder
		})
	})

	local MainScroll = InsertTheme(Create("ScrollingFrame", Components, {
		Size = UDim2.new(0, redzlib.Save.TabSize, 1, -TopBar.Size.Y.Offset),
		ScrollBarImageColor3 = Theme["Color Theme"],
		Position = UDim2.new(0, 0, 1, 0),
		AnchorPoint = Vector2.new(0, 1),
		ScrollBarThickness = 1.5,
		BackgroundTransparency = 1,
		ScrollBarImageTransparency = 0.2,
		CanvasSize = UDim2.new(),
		AutomaticCanvasSize = "Y",
		ScrollingDirection = "Y",
		BorderSizePixel = 0,
		Name = "Tab Scroll"
	}, {
		Create("UIPadding", {
			PaddingLeft = UDim.new(0, 10),
			PaddingRight = UDim.new(0, 10),
			PaddingTop = UDim.new(0, 6),
			PaddingBottom = UDim.new(0, 10)
		}),
		Create("UIListLayout", { Padding = UDim.new(0, 5) })
	}), "ScrollBar")

	local Containers = Create("Frame", Components, {
		Size = UDim2.new(1, -MainScroll.Size.X.Offset, 1, -TopBar.Size.Y.Offset),
		AnchorPoint = Vector2.new(1, 1),
		Position = UDim2.new(1, 0, 1, 0),
		BackgroundTransparency = 1,
		ClipsDescendants = true,
		Name = "Containers"
	})

	local TopBarDivider = Create("Frame", Components, {
		Size = UDim2.new(0, 0, 0, 0),
		BackgroundTransparency = 1,
		Name = "TopBarDivider"
	})

	local SideDivider = Create("Frame", Components, {
		Size = UDim2.new(0, 0, 0, 0),
		BackgroundTransparency = 1,
		Name = "SideDivider"
	})

	local ControlSize1 = MakeDrag(Create("ImageButton", MainFrame, {
		Size = UDim2.new(0, 35, 0, 35),
		Position = MainFrame.Size,
		Active = true,
		AnchorPoint = Vector2.new(0.8, 0.8),
		BackgroundTransparency = 1,
		Name = "Control Hub Size"
	}))
	local ControlSize2 = MakeDrag(Create("ImageButton", MainFrame, {
		Size = UDim2.new(0, 20, 1, -30),
		Position = UDim2.new(0, MainScroll.Size.X.Offset, 1, 0),
		AnchorPoint = Vector2.new(0.5, 1),
		Active = true,
		BackgroundTransparency = 1,
		Name = "Control Tab Size"
	}))

	local function ControlSize()
		local Pos1, Pos2 = ControlSize1.Position, ControlSize2.Position
		ControlSize1.Position = UDim2.fromOffset(math.clamp(Pos1.X.Offset, 430, 1000), math.clamp(Pos1.Y.Offset, 200, 500))
		ControlSize2.Position = UDim2.new(0, math.clamp(Pos2.X.Offset, 135, 250), 1, 0)
		MainScroll.Size = UDim2.new(0, ControlSize2.Position.X.Offset, 1, -TopBar.Size.Y.Offset)
		Containers.Size = UDim2.new(1, -MainScroll.Size.X.Offset, 1, -TopBar.Size.Y.Offset)
		MainFrame.Size = ControlSize1.Position
		SideDivider.Position = UDim2.new(0, MainScroll.Size.X.Offset, 0, TopBar.Size.Y.Offset)
	end

	ControlSize1:GetPropertyChangedSignal("Position"):Connect(ControlSize)
	ControlSize2:GetPropertyChangedSignal("Position"):Connect(ControlSize)

	ConnectSave(ControlSize1, function()
		if not Minimized then
			redzlib.Save.UISize = {MainFrame.Size.X.Offset, MainFrame.Size.Y.Offset}
			SaveJson(redzlib.Save)
		end
	end)

	ConnectSave(ControlSize2, function()
		redzlib.Save.TabSize = MainScroll.Size.X.Offset
		SaveJson(redzlib.Save)
	end)

	local ButtonsFolder = Create("Folder", TopBar, { Name = "Buttons" })


	local CloseButton = Create("ImageButton", {
		Size = UDim2.new(0, 14, 0, 14),
		Position = UDim2.new(1, -10, 0.5),
		AnchorPoint = Vector2.new(1, 0.5),
		BackgroundTransparency = 1,
		Image = "rbxassetid://10747384394",
		AutoButtonColor = false,
		Name = "Close"
	})

	local MinimizeButton = SetProps(CloseButton:Clone(), {
		Position = UDim2.new(1, -35, 0.5),
		Image = "rbxassetid://10734896206",
		Name = "Minimize"
	})

	SetChildren(ButtonsFolder, { CloseButton, MinimizeButton })

	local Minimized, SaveSize, WaitClick, MinimizeBtnCustomImage
	local Window, FirstTab = {}, false

	function Window:CloseBtn()
		Window:Dialog({
			Title = "Close",
			Text = "You Want Close Ui?",
			Options = {
				{"Confirm", function() ScreenGui:Destroy() end},
				{"Cancel"}
			}
		})
	end
	function Window:MinimizeBtn()
		if WaitClick then return end
		WaitClick = true
		if Minimized then
			MinimizeButton.Image = MinimizeBtnCustomImage or "rbxassetid://10734896206"
			CreateTween({MainFrame, "Size", SaveSize, 0.25, true})
			ControlSize1.Visible = true
			ControlSize2.Visible = true
			TopBarDivider.Visible = true
			Minimized = false
		else
			MinimizeButton.Image = MinimizeBtnCustomImage or "rbxassetid://10734924532"
			SaveSize = MainFrame.Size
			ControlSize1.Visible = false
			ControlSize2.Visible = false
			TopBarDivider.Visible = false
			CreateTween({MainFrame, "Size", UDim2.fromOffset(MainFrame.Size.X.Offset, 28), 0.25, true})
			Minimized = true
		end
		WaitClick = false
	end
	function Window:Minimize()
		MainFrame.Visible = not MainFrame.Visible
	end
	function Window:AddMinimizeButton(Cfg)
		Cfg = Cfg or {}
		local BtnId     = Cfg.Flag or Cfg.Id or "default"
		local BtnCorner = (Cfg.Corner and Cfg.Corner.CornerRadius) or UDim.new(0.2, 0)
		local BtnPos    = Cfg.Position or UDim2.fromScale(0.05, 0.5)
		local BtnSize   = Cfg.Size or 40
		local BtnTrans  = Cfg.Transparency ~= nil and Cfg.Transparency or 0
		local BtnImage  = Cfg.Icon or Cfg.Image or "rbxassetid://10734895698"

		BtnImage = redzlib:GetIcon(tostring(BtnImage))

		if not redzlib.Save.MinimizeButtons then redzlib.Save.MinimizeButtons = {} end
		local Saved = redzlib.Save.MinimizeButtons[BtnId] or {}
		if Saved.posX and Saved.posY then
			BtnPos = UDim2.fromOffset(Saved.posX, Saved.posY)
		end

		local Button = MakeDrag(Create("ImageButton", ScreenGui, {
			Size                   = UDim2.fromOffset(BtnSize, BtnSize),
			Position               = BtnPos,
			BackgroundColor3       = Theme["Color Hub 2"],
			BackgroundTransparency = BtnTrans,
			Image                  = BtnImage,
			ScaleType              = Enum.ScaleType.Stretch,
			AutoButtonColor        = false,
			ZIndex                 = 10,
			Name                   = "MinimizeFloatBtn_" .. BtnId
		}))
		local BtnCornerInst = Make("Corner", Button, BtnCorner)
		Make("Stroke", Button)

		Button.MouseEnter:Connect(function()
			CreateTween({Button, "BackgroundTransparency", math.max(BtnTrans - 0.15, 0), 0.18})
		end)
		Button.MouseLeave:Connect(function()
			CreateTween({Button, "BackgroundTransparency", BtnTrans, 0.18})
		end)

		Button.Activated:Connect(Window.Minimize)

		local savePosDebounce = false
		Button:GetPropertyChangedSignal("Position"):Connect(function()
			if savePosDebounce then return end
			savePosDebounce = true
			task.delay(0.3, function()
				savePosDebounce = false
				local p = Button.Position
				redzlib.Save.MinimizeButtons[BtnId] = redzlib.Save.MinimizeButtons[BtnId] or {}
				redzlib.Save.MinimizeButtons[BtnId].posX = p.X.Offset
				redzlib.Save.MinimizeButtons[BtnId].posY = p.Y.Offset
				SaveJson(redzlib.Save)
			end)
		end)

		return {
			Button    = Button,
			SetImage  = function(_, img)
				img = tostring(img)
				if img:match("^%d+$") then img = "rbxassetid://" .. img end
				Button.Image = img
			end,
			SetSize   = function(_, sz)
				sz = math.clamp(math.floor(sz + 0.5), 20, 120)
				Button.Size = UDim2.fromOffset(sz, sz)
			end,
			SetTrans  = function(_, tr)
				Button.BackgroundTransparency = math.clamp(tr, 0, 1)
			end,
			SetCorner = function(_, udim)
				BtnCornerInst.CornerRadius = udim
			end,
			Destroy   = function(_)
				Button:Destroy()
			end
		}
	end

	function Window:Set(Val1, Val2)
		if type(Val1) == "string" and type(Val2) == "string" then
			Title.Text = Val1
			Title.SubTitle.Text = Val2
		elseif type(Val1) == "string" then
			Title.Text = Val1
		end
	end
	function Window:Dialog(Configs)
		if MainFrame:FindFirstChild("Dialog") then return end
		if Minimized then Window:MinimizeBtn() end

		local DTitle   = Configs[1] or Configs.Title or "Dialog"
		local DText    = Configs[2] or Configs.Text or "This is a Dialog"
		local DOptions = Configs[3] or Configs.Options or {}
		local DIcon    = Configs.Icon or ""
		local DType    = Configs.Type or "default"

		local function NormalizeImageId(raw)
			raw = tostring(raw or ""):gsub("^%s+",""):gsub("%s+$","")
			return raw
		end

		local baseW = DType == "theme" and 310 or DType == "image" and 290 or 270
		local baseH = DType == "theme" and 220 or DType == "image" and 200 or 160

		local Screen = InsertTheme(Create("Frame", MainFrame, {
			BackgroundTransparency = 1,
			Active = true,
			BackgroundColor3 = Theme["Color Stroke"],
			Size = UDim2.new(1, 0, 1, 0),
			Name = "Dialog"
		}), "Stroke")
		MainCorner:Clone().Parent = Screen

		local Frame = InsertTheme(Create("Frame", Screen, {
			Active = true,
			Size = UDim2.fromOffset(baseW * 1.06, baseH * 1.06),
			Position = UDim2.fromScale(0.5, 0.5),
			AnchorPoint = Vector2.new(0.5, 0.5),
			BackgroundTransparency = 0.08,
			BackgroundColor3 = Theme["Color Hub 2"],
			ClipsDescendants = true
		}), "Frame")
		Make("Gradient", Frame, {Rotation = 270})
		Make("Corner", Frame)

		local iconMap = {
			info    = "rbxassetid://10723415903",
			warning = "rbxassetid://10709753149",
			error   = "rbxassetid://10709752996",
			success = "rbxassetid://10709790387",
			theme   = "rbxassetid://10734950309",
			image   = "rbxassetid://10723415040",
		}
		local resolvedIcon = DIcon ~= "" and NormalizeImageId(DIcon)
			or iconMap[DType] or iconMap["info"]

		local TopBar = Create("Frame", Frame, {
			Size = UDim2.new(1, 0, 0, 36),
			BackgroundTransparency = 1,
			Position = UDim2.new(0, 0, 0, 0)
		})

		InsertTheme(Create("ImageLabel", TopBar, {
			Size = UDim2.fromOffset(16, 16),
			Position = UDim2.new(0, 12, 0.5),
			AnchorPoint = Vector2.new(0, 0.5),
			Image = resolvedIcon,
			ImageColor3 = Theme["Color Theme"],
			BackgroundTransparency = 1
		}), "Theme")

		InsertTheme(Create("TextLabel", TopBar, {
			Font = Enum.Font.GothamBold,
			Size = UDim2.new(1, -80, 1, 0),
			Text = DTitle,
			TextXAlignment = "Left",
			TextColor3 = Theme["Color Text"],
			TextSize = 13,
			Position = UDim2.fromOffset(34, 0),
			BackgroundTransparency = 1,
			TextTruncate = "AtEnd"
		}), "Text")

		local XBtn = Create("ImageButton", TopBar, {
			Size = UDim2.fromOffset(14, 14),
			Position = UDim2.new(1, -10, 0.5),
			AnchorPoint = Vector2.new(1, 0.5),
			Image = "rbxassetid://10747384394",
			ImageColor3 = Theme["Color Dark Text"],
			BackgroundTransparency = 1,
			AutoButtonColor = false
		})

		InsertTheme(Create("Frame", Frame, {
			Size = UDim2.new(1, -24, 0, 1),
			Position = UDim2.fromOffset(12, 36),
			BackgroundColor3 = Theme["Color Theme"],
			BackgroundTransparency = 0.75
		}), "Theme")

		InsertTheme(Create("TextLabel", Frame, {
			Font = Enum.Font.GothamMedium,
			Size = UDim2.new(1, -24, 0, 0),
			AutomaticSize = "Y",
			Text = DText,
			TextXAlignment = "Left",
			TextColor3 = Theme["Color Dark Text"],
			TextSize = 11,
			Position = UDim2.fromOffset(12, 44),
			BackgroundTransparency = 1,
			TextWrapped = true,
			RichText = NeedsRichText(DText)
		}), "DarkText")

		local ContentY = 44

		if DType == "theme" then
			ContentY = 95
			local themeNames = {}
			for k in pairs(redzlib.Themes) do table.insert(themeNames, k) end
			table.sort(themeNames)

			InsertTheme(Create("TextLabel", Frame, {
				Font = Enum.Font.GothamBold,
				Size = UDim2.new(1, -24, 0, 14),
				Position = UDim2.fromOffset(12, 72),
				Text = "Select Theme:",
				TextXAlignment = "Left",
				TextSize = 9,
				TextColor3 = Theme["Color Dark Text"],
				BackgroundTransparency = 1
			}), "DarkText")

			local ThemeScroll = InsertTheme(Create("ScrollingFrame", Frame, {
				Size = UDim2.new(1, -24, 0, 80),
				Position = UDim2.fromOffset(12, 88),
				BackgroundTransparency = 1,
				ScrollBarThickness = 2,
				ScrollBarImageColor3 = Theme["Color Theme"],
				BorderSizePixel = 0,
				CanvasSize = UDim2.new(),
				AutomaticCanvasSize = "Y",
				ScrollingDirection = "Y"
			}, {
				Create("UIGridLayout", {
					CellSize = UDim2.fromOffset(76, 22),
					CellPadding = UDim2.fromOffset(4, 4),
					SortOrder = "LayoutOrder"
				}),
				Create("UIPadding", {PaddingBottom = UDim.new(0, 4)})
			}), "ScrollBar")

			for _, tname in ipairs(themeNames) do
				local isActive = tname == redzlib.Save.Theme
				local TBtn = InsertTheme(Create("TextButton", ThemeScroll, {
					Size = UDim2.fromOffset(76, 22),
					BackgroundColor3 = Theme["Color Theme"],
					BackgroundTransparency = isActive and 0.6 or 0.85,
					Font = Enum.Font.GothamBold,
					Text = tname,
					TextSize = 8,
					TextColor3 = Theme["Color Text"],
					AutoButtonColor = false,
					Name = tname
				}), "Theme")
				Make("Corner", TBtn, UDim.new(0, 4))
				TBtn.Activated:Connect(function()
					redzlib:SetTheme(tname)
					for _, ch in ipairs(ThemeScroll:GetChildren()) do
						if ch:IsA("TextButton") then
							ch.BackgroundTransparency = ch.Name == tname and 0.6 or 0.85
						end
					end
				end)
			end

			InsertTheme(Create("TextLabel", Frame, {
				Font = Enum.Font.GothamBold,
				Size = UDim2.new(1, -24, 0, 14),
				Position = UDim2.fromOffset(12, 172),
				Text = "Custom Theme Image (rbxassetid / catbox):",
				TextXAlignment = "Left",
				TextSize = 8,
				TextColor3 = Theme["Color Dark Text"],
				BackgroundTransparency = 1,
				TextTruncate = "AtEnd"
			}), "DarkText")

			local ThemeImgHolder = InsertTheme(Create("Frame", Frame, {
				Size = UDim2.new(1, -24, 0, 24),
				Position = UDim2.fromOffset(12, 186),
				BackgroundColor3 = Theme["Color Theme"],
				BackgroundTransparency = 0.85
			}), "Theme")
			Make("Corner", ThemeImgHolder, UDim.new(0, 5))

			local ThemeImgInput = InsertTheme(Create("TextBox", ThemeImgHolder, {
				Size = UDim2.new(1, -10, 1, 0),
				Position = UDim2.fromOffset(5, 0),
				BackgroundTransparency = 1,
				Font = Enum.Font.Gotham,
				TextSize = 9,
				TextColor3 = Theme["Color Text"],
				PlaceholderText = "rbxassetid://...",
				PlaceholderColor3 = Theme["Color Dark Text"],
				Text = "",
				ClearTextOnFocus = false,
				TextXAlignment = "Left"
			}), "Text")

			local ThemePreview = Create("ImageLabel", Frame, {
				Size = UDim2.fromOffset(24, 24),
				Position = UDim2.new(1, -12, 0, 186),
				AnchorPoint = Vector2.new(1, 0),
				BackgroundTransparency = 1,
				Image = "",
				Visible = false
			})
			Make("Corner", ThemePreview, UDim.new(0, 4))

			ThemeImgInput.FocusLost:Connect(function()
				local id = NormalizeImageId(ThemeImgInput.Text)
				if id ~= "" then
					ThemePreview.Image = id
					ThemePreview.Visible = true
				end
			end)

		elseif DType == "image" then
			ContentY = 95
			InsertTheme(Create("TextLabel", Frame, {
				Font = Enum.Font.GothamBold,
				Size = UDim2.new(1, -24, 0, 14),
				Position = UDim2.fromOffset(12, 72),
				Text = "Minimize Button Image:",
				TextXAlignment = "Left",
				TextSize = 9,
				TextColor3 = Theme["Color Dark Text"],
				BackgroundTransparency = 1
			}), "DarkText")

			local ImgHolder = InsertTheme(Create("Frame", Frame, {
				Size = UDim2.new(1, -24, 0, 24),
				Position = UDim2.fromOffset(12, 88),
				BackgroundColor3 = Theme["Color Theme"],
				BackgroundTransparency = 0.85
			}), "Theme")
			Make("Corner", ImgHolder, UDim.new(0, 5))

			local ImgInput = InsertTheme(Create("TextBox", ImgHolder, {
				Size = UDim2.new(1, -10, 1, 0),
				Position = UDim2.fromOffset(5, 0),
				BackgroundTransparency = 1,
				Font = Enum.Font.Gotham,
				TextSize = 9,
				TextColor3 = Theme["Color Text"],
				PlaceholderText = "rbxassetid://...",
				PlaceholderColor3 = Theme["Color Dark Text"],
				Text = "",
				ClearTextOnFocus = false,
				TextXAlignment = "Left"
			}), "Text")

			InsertTheme(Create("TextLabel", Frame, {
				Font = Enum.Font.GothamBold,
				Size = UDim2.new(1, -24, 0, 14),
				Position = UDim2.fromOffset(12, 120),
				Text = "Main Frame Image:",
				TextXAlignment = "Left",
				TextSize = 9,
				TextColor3 = Theme["Color Dark Text"],
				BackgroundTransparency = 1
			}), "DarkText")

			local MainImgHolder = InsertTheme(Create("Frame", Frame, {
				Size = UDim2.new(1, -24, 0, 24),
				Position = UDim2.fromOffset(12, 136),
				BackgroundColor3 = Theme["Color Theme"],
				BackgroundTransparency = 0.85
			}), "Theme")
			Make("Corner", MainImgHolder, UDim.new(0, 5))

			local MainImgInput = InsertTheme(Create("TextBox", MainImgHolder, {
				Size = UDim2.new(1, -10, 1, 0),
				Position = UDim2.fromOffset(5, 0),
				BackgroundTransparency = 1,
				Font = Enum.Font.Gotham,
				TextSize = 9,
				TextColor3 = Theme["Color Text"],
				PlaceholderText = "rbxassetid://...",
				PlaceholderColor3 = Theme["Color Dark Text"],
				Text = "",
				ClearTextOnFocus = false,
				TextXAlignment = "Left"
			}), "Text")

			local Preview = Create("ImageLabel", Frame, {
				Size = UDim2.fromOffset(40, 40),
				Position = UDim2.new(0.5, 0, 0, 162),
				AnchorPoint = Vector2.new(0.5, 0),
				BackgroundColor3 = Theme["Color Theme"],
				BackgroundTransparency = 0.85,
				Image = "",
				Visible = false
			})
			Make("Corner", Preview, UDim.new(0, 6))

			ContentY = 210

			local function ApplyBtn(raw)
				local id = NormalizeImageId(raw)
				if id == "" then return end
				Preview.Image = id
				Preview.Visible = true
				MinimizeBtnCustomImage = id
				if MinimizeButton then
					MinimizeButton.Image = id
				end
				if redzlib.Save.MinimizeButtons then
					for _, btn in pairs(redzlib.Save.MinimizeButtons) do
						btn.image = id
					end
					SaveJson(redzlib.Save)
				end
			end

			local function ApplyMain(raw)
				local id = redzlib:GetIcon(NormalizeImageId(raw))
				if id == "" then return end
				Preview.Image = id
				Preview.Visible = true
				redzlib:SetBackgroundImage(id)
			end

			ImgInput.FocusLost:Connect(function() ApplyBtn(ImgInput.Text) end)
			MainImgInput.FocusLost:Connect(function() ApplyMain(MainImgInput.Text) end)
		end

		local ButtonsHolder = Create("Frame", Frame, {
			Size = UDim2.new(1, -20, 0, 30),
			Position = UDim2.new(0, 10, 1, -10),
			AnchorPoint = Vector2.new(0, 1),
			BackgroundTransparency = 1
		}, {
			Create("UIListLayout", {
				Padding = UDim.new(0, 8),
				VerticalAlignment = "Center",
				FillDirection = "Horizontal",
				HorizontalAlignment = "Center"
			})
		})

		CreateTween({Frame, "Size", UDim2.fromOffset(baseW, baseH), 0.25})
		CreateTween({Screen, "BackgroundTransparency", 0.35, 0.15})

		local ButtonCount, Dialog = 1, {}

		function Dialog:Button(Cfg)
			local Name = Cfg[1] or Cfg.Name or Cfg.Title or ""
			local Callback = Cfg[2] or Cfg.Callback or function()end
			local BtnColor = Cfg.Color
			ButtonCount = ButtonCount + 1
			local Btn = InsertTheme(Create("TextButton", ButtonsHolder, {
				BackgroundColor3 = BtnColor or Theme["Color Theme"],
				BackgroundTransparency = BtnColor and 0 or 0.7,
				Text = Name,
				Font = Enum.Font.GothamBold,
				TextColor3 = Theme["Color Text"],
				TextSize = 11,
				AutoButtonColor = false
			}), BtnColor and "Stroke" or "Theme")
			Make("Corner", Btn, UDim.new(0, 5))
			for _, B in pairs(ButtonsHolder:GetChildren()) do
				if B:IsA("TextButton") then
					B.Size = UDim2.new(1 / ButtonCount, -(((ButtonCount - 1) * 20) / ButtonCount), 0, 28)
				end
			end
			Btn.Activated:Connect(Dialog.Close)
			Btn.Activated:Connect(Callback)
		end

		function Dialog:Close()
			CreateTween({Frame, "Size", UDim2.fromOffset(baseW * 1.06, baseH * 1.06), 0.2})
			CreateTween({Screen, "BackgroundTransparency", 1, 0.15})
			task.delay(0.2, function() Screen:Destroy() end)
		end

		XBtn.Activated:Connect(Dialog.Close)
		XBtn.MouseEnter:Connect(function()
			CreateTween({XBtn, "ImageColor3", Color3.fromRGB(255, 80, 80), 0.15})
		end)
		XBtn.MouseLeave:Connect(function()
			CreateTween({XBtn, "ImageColor3", Theme["Color Dark Text"], 0.15})
		end)

		table.foreach(DOptions, function(_,B) Dialog:Button(B) end)
		return Dialog
	end
	function Window:SelectTab(TabSelect)
		if type(TabSelect) == "number" then
			redzlib.Tabs[TabSelect].func:Enable()
		else
			for _,Tab in pairs(redzlib.Tabs) do
				if Tab.Cont == TabSelect.Cont then
					Tab.func:Enable()
				end
			end
		end
	end

	function Window:SetTransparency(value)
		redzlib:SetTransparency(value)
	end

	function Window:SetTheme(name)
		redzlib:SetTheme(name)
	end

	function Window:SetBackgroundImage(value)
		redzlib:SetBackgroundImage(value)
	end

	local ContainerList = {}
	function Window:AddTag(Configs)
		Configs = Configs or {}
		local TTitle = Configs[1] or Configs.Title or Configs.Name or ""
		local TColor = Configs.Color or Color3.fromRGB(80, 80, 80)

		local function GetContrastColor(BgColor)
			local Luminance = (0.299 * BgColor.R + 0.587 * BgColor.G + 0.114 * BgColor.B)
			if Luminance > 0.6 then
				return Color3.new(0, 0, 0)
			else
				return Color3.new(1, 1, 1)
			end
		end

		local TTextColor = Configs.TextColor or GetContrastColor(TColor)

		local TagFrame = Create("Frame", TagHolder, {
			Size             = UDim2.new(0, 0, 0, 17),
			AutomaticSize    = "X",
			BackgroundColor3 = TColor,
			ClipsDescendants = true,
			Name             = "Tag",
		})
		Make("Corner", TagFrame, UDim.new(0, 3))

		Create("Frame", TagFrame, {
			Size                   = UDim2.new(1, 0, 0.5, 0),
			BackgroundColor3       = Color3.new(1, 1, 1),
			BackgroundTransparency = 0.82,
			BorderSizePixel        = 0,
			ZIndex                 = TagFrame.ZIndex + 1,
		})

		local Content = Create("Frame", TagFrame, {
			Size                   = UDim2.new(0, 0, 1, 0),
			AutomaticSize          = "X",
			BackgroundTransparency = 1,
			ZIndex                 = TagFrame.ZIndex + 2,
		})
		Create("UIListLayout", Content, {
			FillDirection       = Enum.FillDirection.Horizontal,
			VerticalAlignment   = Enum.VerticalAlignment.Center,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
		})
		Create("UIPadding", Content, {
			PaddingLeft  = UDim.new(0, 7),
			PaddingRight = UDim.new(0, 7),
		})

		local TextLabel = Create("TextLabel", Content, {
			Size                   = UDim2.new(0, 0, 1, 0),
			AutomaticSize          = "X",
			BackgroundTransparency = 1,
			Font                   = Enum.Font.GothamBold,
			TextSize               = 10,
			TextColor3             = TTextColor,
			Text                   = TTitle,
			ZIndex                 = TagFrame.ZIndex + 3,
		})

		local Tag = {}

		function Tag:SetTitle(New)
			if type(New) == "string" then
				TextLabel.Text = New
			end
		end

		function Tag:SetColor(New)
			if typeof(New) == "Color3" then
				TagFrame.BackgroundColor3 = New
				TextLabel.TextColor3 = GetContrastColor(New)
			end
		end

		function Tag:Visible(Bool)
			TagFrame.Visible = Bool ~= nil and Bool or not TagFrame.Visible
		end

		function Tag:Destroy()
			TagFrame:Destroy()
		end

		return Tag
	end
	function Window:MakeTab(paste, Configs)
		if type(paste) == "table" then Configs = paste end
		local TName = Configs[1] or Configs.Title or "Tab!"
		local TIcon = Configs[2] or Configs.Icon or Configs.Image or ""
		TIcon = redzlib:GetIcon(tostring(TIcon))
		if TIcon == "" then TIcon = false end

		local TabHeight = 23
		local TabSelect = InsertTheme(Create("TextButton", MainScroll, {
			Size = UDim2.new(1, 0, 0, TabHeight),
			BackgroundTransparency = 1,
			BackgroundColor3 = Theme["Color Theme"],
			Text = "",
			AutoButtonColor = false,
			Name = "TabBtn"
		}), "TabBG")
		Make("Corner", TabSelect, UDim.new(0, 3))

		local iconOffset = TIcon and 31 or 14
		local LabelTitle = InsertTheme(Create("TextLabel", TabSelect, {
			Size = UDim2.new(1, -iconOffset - 8, 1),
			Position = UDim2.fromOffset(iconOffset, 0),
			BackgroundTransparency = 1,
			Font = Enum.Font.GothamBold,
			Text = TName,
			TextColor3 = Theme["Color Text"],
			TextSize = 10,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextTransparency = 0,
			TextTruncate = "AtEnd"
		}), "Text")

		local LabelIcon = InsertTheme(Create("ImageLabel", TabSelect, {
			Position = UDim2.new(0, 10, 0.5),
			Size = UDim2.new(0, 14, 0, 14),
			AnchorPoint = Vector2.new(0, 0.5),
			Image = TIcon or "",
			BackgroundTransparency = 1,
			ImageTransparency = 0
		}), "Text")

		local Selected = InsertTheme(Create("Frame", TabSelect, {
			Size = FirstTab and UDim2.new(0, 3, 0, 0) or UDim2.new(0, 3, 0.6, 0),
			Position = UDim2.new(0, 0, 0.5),
			AnchorPoint = Vector2.new(0, 0.5),
			BackgroundColor3 = Theme["Color Theme"],
			BackgroundTransparency = FirstTab and 1 or 0
		}), "Theme")
		Make("Corner", Selected, UDim.new(0, 4))



		local Container = InsertTheme(Create("ScrollingFrame", {
			Size = UDim2.new(1, 0, 1, 0),
			Position = UDim2.new(0, 0, 1),
			AnchorPoint = Vector2.new(0, 1),
			ScrollBarThickness = 1.5,
			BackgroundTransparency = 1,
			ScrollBarImageTransparency = 0.2,
			ScrollBarImageColor3 = Theme["Color Theme"],
			AutomaticCanvasSize = "Y",
			ScrollingDirection = "Y",
			BorderSizePixel = 0,
			CanvasSize = UDim2.new(),
			Name = ("Container %i [ %s ]"):format(#ContainerList + 1, TName)
		}, {
			Create("UIPadding", {
				PaddingLeft = UDim.new(0, 6),
				PaddingRight = UDim.new(0, 6),
				PaddingTop = UDim.new(0, 6),
				PaddingBottom = UDim.new(0, 6)
			}),
			Create("UIListLayout", { Padding = UDim.new(0, 5) })
		}), "ScrollBar")

		table.insert(ContainerList, Container)
		if not FirstTab then Container.Parent = Containers end

		local function Tabs()
			if Container.Parent then return end
			for _, Tab in ipairs(redzlib.Tabs) do
				if Tab.Cont ~= Container then
					Tab.func:Disable()
				end
			end
			for _, Frame in ipairs(ContainerList) do
				if Frame:IsA("ScrollingFrame") and Frame ~= Container then
					Frame.Parent = nil
				end
			end
			Container.Size = UDim2.new(1, 0, 1, 0)
			Container.Parent = Containers
			TabSelect.BackgroundTransparency = 0.85
			TabSelect.BackgroundColor3 = Theme["Color Theme"]
			CreateTween({LabelTitle, "TextTransparency", 0, 0.25})
			CreateTween({LabelIcon, "ImageTransparency", 0, 0.25})
			CreateTween({Selected, "Size", UDim2.new(0, 3, 0.6, 0), 0.25})
			CreateTween({Selected, "BackgroundTransparency", 0, 0.25})
		end
		TabSelect.Activated:Connect(Tabs)

		if not FirstTab then
			task.defer(function()
				TabSelect.BackgroundTransparency = 0.85
				TabSelect.BackgroundColor3 = Theme["Color Theme"]
			end)
		end

		FirstTab = true
		local Tab = {}
		table.insert(redzlib.Tabs, {TabInfo = {Name = TName, Icon = TIcon}, func = Tab, Cont = Container})
		Tab.Cont = Container

		function Tab:Disable()
			Container.Parent = nil
			TabSelect.BackgroundTransparency = 1
			CreateTween({LabelTitle, "TextTransparency", 0, 0.35})
			CreateTween({LabelIcon, "ImageTransparency", 0, 0.35})
			CreateTween({Selected, "Size", UDim2.new(0, 3, 0, 0), 0.35})
			CreateTween({Selected, "BackgroundTransparency", 1, 0.35})
		end
		function Tab:Enable() Tabs() end
		function Tab:Visible(Bool)
			Funcs:ToggleVisible(TabSelect, Bool)
			Funcs:ToggleParent(Container, Bool, Containers)
		end
		function Tab:Destroy() TabSelect:Destroy(); Container:Destroy() end

		function Tab:AddDivider(Configs)
			local DText = type(Configs) == "string" and Configs
				or (type(Configs) == "table" and (Configs[1] or Configs.Text or Configs.Title or Configs.Name))
				or nil
			local DIcon = type(Configs) == "table" and (Configs.Icon or Configs.Image) or nil
			if DIcon then DIcon = redzlib:GetIcon(tostring(DIcon)); if DIcon == "" then DIcon = nil end end

			local DividerFrame = Create("Frame", Container, {
				Size = UDim2.new(1, 0, 0, DText and 20 or 10),
				BackgroundTransparency = 1,
				Name = "Option"
			})

			if DText then
				local labelX = 10
				if DIcon then
					InsertTheme(Create("ImageLabel", DividerFrame, {
						Size               = UDim2.new(0, 11, 0, 11),
						Position           = UDim2.new(0, 10, 0.5, 0),
						AnchorPoint        = Vector2.new(0, 0.5),
						Image              = DIcon,
						BackgroundTransparency = 1,
						ImageColor3        = Theme["Color Text"],
					}), "Text")
					labelX = 28
				end
				InsertTheme(Create("TextLabel", DividerFrame, {
					Font             = Enum.Font.GothamBold,
					Text             = DText,
					TextColor3       = Theme["Color Text"],
					TextSize         = 11,
					Size             = UDim2.new(1, -labelX - 4, 1, 0),
					Position         = UDim2.new(0, labelX, 0, 0),
					BackgroundTransparency = 1,
					TextXAlignment   = Enum.TextXAlignment.Left,
					TextYAlignment   = Enum.TextYAlignment.Center,
					Name             = "DividerLabel"
				}), "Text")
			else
				InsertTheme(Create("Frame", DividerFrame, {
					Size             = UDim2.new(1, 0, 0, 1),
					Position         = UDim2.new(0, 0, 0.5, 0),
					AnchorPoint      = Vector2.new(0, 0.5),
					BackgroundColor3 = Theme["Color Stroke"]
				}), "Stroke")
			end

			local Divider = {}
			function Divider:Visible(Bool)
				if Bool == nil then DividerFrame.Visible = not DividerFrame.Visible return end
				DividerFrame.Visible = Bool
			end
			function Divider:Destroy() DividerFrame:Destroy() end
			return Divider
		end

		function Tab:AddSection(Configs)
			Configs = type(Configs) == "string" and { Name = Configs } or (Configs or {})
			local SectionName = Configs[1] or Configs.Name or Configs.Title or Configs.Section or "Section"
			local StartOpen   = Configs[2] or Configs.Open or Configs.Default or false
			local SIcon = Configs.Icon or Configs.Image or nil
			if SIcon then SIcon = redzlib:GetIcon(tostring(SIcon)); if SIcon == "" then SIcon = nil end end

			local SectionWrapper = Create("Frame", Container, {
				Size             = UDim2.new(1, 0, 0, 23),
				BackgroundTransparency = 1,
				ClipsDescendants = false,
				Name             = "Option"
			})

			local HeaderBtn = InsertTheme(Create("TextButton", SectionWrapper, {
				Size             = UDim2.new(1, 0, 0, 23),
				BackgroundColor3 = Theme["Color Theme"],
				BackgroundTransparency = 0.85,
				Text             = "",
				AutoButtonColor  = false,
				Name             = "SectionHeader"
			}), "Theme")
			Make("Corner", HeaderBtn, UDim.new(0, 3))

			local labelLeftOffset = 12
			if SIcon then
				InsertTheme(Create("ImageLabel", HeaderBtn, {
					Size               = UDim2.new(0, 12, 0, 12),
					Position           = UDim2.new(0, 10, 0.5, 0),
					AnchorPoint        = Vector2.new(0, 0.5),
					Image              = SIcon,
					BackgroundTransparency = 1,
					ImageColor3        = Theme["Color Text"],
					Name               = "SectionIcon"
				}), "Text")
				labelLeftOffset = 29
			end

			local HeaderLabel = InsertTheme(Create("TextLabel", HeaderBtn, {
				Font             = Enum.Font.GothamBold,
				Text             = SectionName,
				TextColor3       = Theme["Color Text"],
				TextSize         = 10,
				TextXAlignment   = Enum.TextXAlignment.Left,
				Size             = UDim2.new(1, -40, 1, 0),
				Position         = UDim2.new(0, labelLeftOffset, 0, 0),
				BackgroundTransparency = 1,
				TextTruncate     = Enum.TextTruncate.AtEnd,
				Name             = "SectionTitle"
			}), "Text")

			local ArrowLabel = InsertTheme(Create("ImageLabel", HeaderBtn, {
				Image            = "rbxassetid://10709791437",
				ImageColor3      = Theme["Color Dark Text"],
				Size             = UDim2.new(0, 16, 0, 16),
				Position         = UDim2.new(1, -5, 0.5, 0),
				AnchorPoint      = Vector2.new(1, 0.5),
				BackgroundTransparency = 1,
				Rotation         = 0,
				Name             = "ArrowLabel"
			}), "DarkText")

			local BottomLine = InsertTheme(Create("Frame", SectionWrapper, {
				Size             = UDim2.new(1, 0, 0, 2),
				Position         = UDim2.new(0, 0, 0, 25.5),
				BackgroundColor3 = Theme["Color Theme"],
				BackgroundTransparency = 1,
				Name             = "BottomLine"
			}), "Theme")
			Make("Corner", BottomLine, UDim.new(0.5, 0))
			Create("UIGradient", BottomLine, {
				Transparency = NumberSequence.new({
					NumberSequenceKeypoint.new(0.00, 1),
					NumberSequenceKeypoint.new(0.15, 0),
					NumberSequenceKeypoint.new(0.85, 0),
					NumberSequenceKeypoint.new(1.00, 1)
				})
			})

			local ClipFrame = Create("Frame", SectionWrapper, {
				Size             = UDim2.new(1, 0, 0, 0),
				Position         = UDim2.new(0, 0, 0, 25),
				BackgroundTransparency = 1,
				ClipsDescendants = true,
				Name             = "SectionClip",
			})

			local InnerContainer = Create("Frame", ClipFrame, {
				Size             = UDim2.new(1, 0, 0, 0),
				Position         = UDim2.new(0, 0, 0, 0),
				BackgroundTransparency = 1,
				Name             = "SectionInner",
				ClipsDescendants = false,
			})
			Create("UIListLayout", InnerContainer, {
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding   = UDim.new(0, 5)
			})
			Create("UIPadding", InnerContainer, {
				PaddingTop    = UDim.new(0, 5),
				PaddingBottom = UDim.new(0, 5),
			})

			local elementHeights = {}
			local elementOrder   = {}
			local GAP = 5
			local PAD_TOP = 5
			local PAD_BOT = 0.5

			local function CalcInnerHeight()
				local total = 0
				local count = 0
				for _, id in ipairs(elementOrder) do
					if elementHeights[id] then
						total = total + elementHeights[id]
						count = count + 1
					end
				end
				if count == 0 then return 0 end
				return total + (count - 1) * GAP + PAD_TOP + PAD_BOT
			end

			local isOpen = false

			local function ApplySizes()
				if isOpen then
					local h = CalcInnerHeight()
					InnerContainer.Size = UDim2.new(1, 0, 0, h)
					ClipFrame.Size     = UDim2.new(1, 0, 0, h)
					SectionWrapper.Size = UDim2.new(1, 0, 0, 25 + h)
				else
					InnerContainer.Size = UDim2.new(1, 0, 0, 0)
					ClipFrame.Size     = UDim2.new(1, 0, 0, 0)
					SectionWrapper.Size = UDim2.new(1, 0, 0, 23)
				end
			end

			local function updateElementHeight(id, newHeight)
				elementHeights[id] = newHeight
				ApplySizes()
			end

			local function SetOpen(newState)
				isOpen = newState
				CreateTween({ ArrowLabel, "Rotation", isOpen and 90 or 0, 0.18 })
				CreateTween({ BottomLine, "BackgroundTransparency", isOpen and 0 or 1, 0.15 })
				if isOpen then
					local h = CalcInnerHeight()
					InnerContainer.Size = UDim2.new(1, 0, 0, 0)
					ClipFrame.Size     = UDim2.new(1, 0, 0, 0)
					SectionWrapper.Size = UDim2.new(1, 0, 0, 23)
					CreateTween({ InnerContainer, "Size", UDim2.new(1, 0, 0, h), 0.2 })
					CreateTween({ ClipFrame,      "Size", UDim2.new(1, 0, 0, h), 0.2 })
					CreateTween({ SectionWrapper, "Size", UDim2.new(1, 0, 0, 25 + h), 0.2 })
				else
					CreateTween({ InnerContainer, "Size", UDim2.new(1, 0, 0, 0), 0.2 })
					CreateTween({ ClipFrame,      "Size", UDim2.new(1, 0, 0, 0), 0.2 })
					CreateTween({ SectionWrapper, "Size", UDim2.new(1, 0, 0, 23), 0.2 })
				end
			end


			HeaderBtn.Activated:Connect(function()
				SetOpen(not isOpen)
			end)

			if StartOpen then
				task.defer(function() SetOpen(true) end)
			else
				ArrowLabel.Rotation = 0
				BottomLine.BackgroundTransparency = 1
				SectionWrapper.Size = UDim2.new(1, 0, 0, 23)
				ClipFrame.Size     = UDim2.new(1, 0, 0, 0)
				InnerContainer.Size = UDim2.new(1, 0, 0, 0)
				isOpen = false
			end

			local Section = {}
			table.insert(redzlib.Options, { type = "Section", Name = SectionName, func = Section })

			function Section:Set(New)
				if New then HeaderLabel.Text = GetStr(New) end
			end
			function Section:Visible(Bool)
				if Bool == nil then SectionWrapper.Visible = not SectionWrapper.Visible return end
				SectionWrapper.Visible = Bool
			end
			function Section:Destroy() SectionWrapper:Destroy() end
			function Section:Toggle() SetOpen(not isOpen) end
			function Section:Open(Bool) SetOpen(Bool ~= nil and Bool or true) end

			local function WithInner(method, defaultHeight, cfg)
				local before = {}
				for _, c in ipairs(InnerContainer:GetChildren()) do
					before[c] = true
				end

				local prev = Container
				Container = InnerContainer
				local result = method(Tab, cfg)
				Container = prev

				local id = #elementOrder + 1
				elementOrder[id] = id
				elementHeights[id] = defaultHeight

				local frame = nil
				for _, c in ipairs(InnerContainer:GetChildren()) do
					if not before[c] and (c:IsA("Frame") or c:IsA("TextButton")) then
						frame = c
						break
					end
				end

				if frame then
					local h = frame.Size.Y.Offset
					if h > 0 then
						elementHeights[id] = h
					end

					frame:GetPropertyChangedSignal("Size"):Connect(function()
						local newH = frame.Size.Y.Offset
						if newH > 0 and newH ~= elementHeights[id] then
							elementHeights[id] = newH
							ApplySizes()
						end
					end)
				end

				ApplySizes()
				return result
			end

			function Section:AddButton(cfg)        return WithInner(Tab.AddButton,        25, cfg) end
			function Section:AddToggle(cfg)        return WithInner(Tab.AddToggle,        25, cfg) end
			function Section:AddSlider(cfg)        return WithInner(Tab.AddSlider,        25, cfg) end
			function Section:AddDropdown(cfg)      return WithInner(Tab.AddDropdown,      25, cfg) end
			function Section:AddTextBox(cfg)       return WithInner(Tab.AddTextBox,       25, cfg) end
			function Section:AddParagraph(cfg)     return WithInner(Tab.AddParagraph,     38, cfg) end
			function Section:AddDivider(cfg)       return WithInner(Tab.AddDivider,       10, cfg) end
			function Section:AddDiscordInvite(cfg) return WithInner(Tab.AddDiscordInvite, 80, cfg) end

			return Section
		end


		function Tab:AddParagraph(Configs)
			local PName = Configs[1] or Configs.Title or "Paragraph"
			local Paragraph = {}

			local isMulti = false
			local multiLines = {}

			if type(Configs.Text) == "table" then
				isMulti = true
				for _, v in ipairs(Configs.Text) do
					table.insert(multiLines, tostring(v))
				end
			elseif type(Configs.Text) ~= "string" then
				local i = 1
				while Configs["Text"..i] do
					table.insert(multiLines, tostring(Configs["Text"..i]))
					i = i + 1
				end
				if #multiLines > 0 then isMulti = true end
			end

			if isMulti and #multiLines > 0 then
				local outerFrame = InsertTheme(Create("TextButton", Container, {
					Size = UDim2.new(1, 0, 0, 25),
					AutomaticSize = Enum.AutomaticSize.None,
					Text = "",
					AutoButtonColor = false,
					BackgroundColor3 = Theme["Color Theme"],
					BackgroundTransparency = 0.85,
					Name = "Option"
				}), "Theme")
				Make("Corner", outerFrame, UDim.new(0, 6))

				local innerLayout = Create("Frame", outerFrame, {
					Size = UDim2.new(1, -20, 0, 0),
					Position = UDim2.new(0, 10, 0, 7),
					BackgroundTransparency = 1,
					AutomaticSize = Enum.AutomaticSize.None,
					Name = "InnerLayout"
				})
				Create("UIListLayout", innerLayout, {
					SortOrder = Enum.SortOrder.LayoutOrder,
					Padding = UDim.new(0, 2)
				})

				InsertTheme(Create("TextLabel", innerLayout, {
					Size = UDim2.new(1, 0, 0, 14),
					BackgroundTransparency = 1,
					Font = Enum.Font.GothamMedium,
					TextColor3 = Theme["Color Text"],
					TextSize = 10,
					TextXAlignment = Enum.TextXAlignment.Left,
					RichText = NeedsRichText(PName),
					Text = PName,
					LayoutOrder = 0,
					Name = "Title"
				}), "Text")

				local lineLabels = {}
				for idx, lineText in ipairs(multiLines) do
					local lbl = InsertTheme(Create("TextLabel", innerLayout, {
						Size = UDim2.new(1, 0, 0, 0),
						BackgroundTransparency = 1,
						Font = Enum.Font.Gotham,
						TextColor3 = Theme["Color Text"],
						TextSize = 9,
						TextXAlignment = Enum.TextXAlignment.Left,
						TextWrapped = true,
						RichText = NeedsRichText(lineText),
						Text = lineText,
						LayoutOrder = idx,
						Name = "Line"..idx
					}), "Text")
					table.insert(lineLabels, lbl)
				end

				local LINE_PADDING = 2
				local TOP_PADDING = 7
				local BOTTOM_PADDING = 7

				local function RecalcParagraph()
					local width = (outerFrame.AbsoluteSize.X - 20) / UIScale

					local total = 14
					for _, lbl in ipairs(lineLabels) do
						local h = MeasureWrappedTextHeight(lbl.Text, lbl.TextSize, lbl.Font, width, lbl.LineHeight)
						lbl.Size = UDim2.new(1, 0, 0, h)
						total = total + LINE_PADDING + h
					end

					innerLayout.Size = UDim2.new(1, -20, 0, total)
					outerFrame.Size = UDim2.new(1, 0, 0, TOP_PADDING + total + BOTTOM_PADDING)
				end

				RecalcParagraph()
				outerFrame:GetPropertyChangedSignal("AbsoluteSize"):Connect(RecalcParagraph)

				function Paragraph:Visible(...) Funcs:ToggleVisible(outerFrame, ...) end
				function Paragraph:Destroy() outerFrame:Destroy() end
				return Paragraph
			end

			local PDesc = Configs.Text or Configs[2] or ""
			local Frame, LabelFunc = ButtonFrame(Container, PName, PDesc, UDim2.new(1, -20))

			function Paragraph:Visible(...) Funcs:ToggleVisible(Frame, ...) end
			function Paragraph:Destroy() Frame:Destroy() end
			function Paragraph:SetTitle(Val) LabelFunc:SetTitle(GetStr(Val)) end
			function Paragraph:SetDesc(Val) LabelFunc:SetDesc(GetStr(Val)) end
			function Paragraph:Set(Val1, Val2)
				if Val1 and Val2 then
					LabelFunc:SetTitle(GetStr(Val1))
					LabelFunc:SetDesc(GetStr(Val2))
				elseif Val1 then
					LabelFunc:SetDesc(GetStr(Val1))
				end
			end
			return Paragraph
		end

		function Tab:AddButton(Configs)
			local BName = Configs[1] or Configs.Name or Configs.Title or "Button!"
			local BDescription = Configs.Desc or Configs.Description or ""
			local Callback = Funcs:GetCallback(Configs, 2)

			local FButton, LabelFunc = ButtonFrame(Container, BName, BDescription, UDim2.new(1, -20))

			local ButtonIcon = Create("ImageLabel", FButton, {
				Size = UDim2.new(0, 14, 0, 14),
				Position = UDim2.new(1, -10, 0.5),
				AnchorPoint = Vector2.new(1, 0.5),
				BackgroundTransparency = 1,
				Image = "rbxassetid://90807822312318"
			})

			FButton.Activated:Connect(function()
				Funcs:FireCallback(Callback)
			end)

			local Button = {}
			function Button:Visible(...) Funcs:ToggleVisible(FButton, ...) end
			function Button:Destroy() FButton:Destroy() end
			function Button:Callback(...) Funcs:InsertCallback(Callback, ...) end
			function Button:Set(Val1, Val2)
				if type(Val1) == "string" and type(Val2) == "string" then
					LabelFunc:SetTitle(Val1); LabelFunc:SetDesc(Val2)
				elseif type(Val1) == "string" then
					LabelFunc:SetTitle(Val1)
				elseif type(Val1) == "function" then
					Callback = Val1
				end
			end
			return Button
		end

		function Tab:AddToggle(Configs)
			local TName = Configs[1] or Configs.Name or Configs.Title or "Toggle"
			local TDesc = Configs.Desc or Configs.Description or ""
			local Callback = Funcs:GetCallback(Configs, 3)
			local Flag = Configs[4] or Configs.Flag or false
			local Default = Configs[2] or Configs.Default or false
			if CheckFlag(Flag) then Default = GetFlag(Flag) end

			local Button, LabelFunc = ButtonFrame(Container, TName, TDesc, UDim2.new(1, -38))

			local ToggleHolder = InsertTheme(Create("Frame", Button, {
				Size = UDim2.new(0, 35, 0, 18),
				Position = UDim2.new(1, -10, 0.5),
				AnchorPoint = Vector2.new(1, 0.5),
				BackgroundColor3 = Theme["Color Theme"],
				BackgroundTransparency = 0.85,
			}), "Theme")
			Make("Corner", ToggleHolder, UDim.new(0.5, 0))

			local Slider = Create("Frame", ToggleHolder, {
				BackgroundTransparency = 1,
				Size = UDim2.new(0.8, 0, 0.8, 0),
				Position = UDim2.new(0.5, 0, 0.5, 0),
				AnchorPoint = Vector2.new(0.5, 0.5)
			})

			local ToggleKnob = InsertTheme(Create("Frame", Slider, {
				Size = UDim2.new(0, 12, 0, 12),
				Position = UDim2.new(0, 0, 0.5),
				AnchorPoint = Vector2.new(0, 0.5),
				BackgroundColor3 = Theme["Color Theme"]
			}), "Theme")
			Make("Corner", ToggleKnob, UDim.new(0.5, 0))

			local WaitToggle
			local function SetToggle(Val)
				if WaitToggle then return end
				WaitToggle, Default = true, Val
				SetFlag(Flag, Default)
				Funcs:FireCallback(Callback, Default)
				if Default then
					CreateTween({ToggleKnob, "Position", UDim2.new(1, 0, 0.5), 0.25})
					CreateTween({ToggleKnob, "BackgroundTransparency", 0, 0.25})
					CreateTween({ToggleKnob, "AnchorPoint", Vector2.new(1, 0.5), 0.25})
				else
					CreateTween({ToggleKnob, "Position", UDim2.new(0, 0, 0.5), 0.25})
					CreateTween({ToggleKnob, "BackgroundTransparency", 0.8, 0.25})
					CreateTween({ToggleKnob, "AnchorPoint", Vector2.new(0, 0.5), 0.25})
				end
				WaitToggle = false
			end
			task.spawn(SetToggle, Default)

			Button.Activated:Connect(function()
				SetToggle(not Default)
			end)

			local Toggle = {}
			function Toggle:Visible(...) Funcs:ToggleVisible(Button, ...) end
			function Toggle:Destroy() Button:Destroy() end
			function Toggle:Callback(...) Funcs:InsertCallback(Callback, ...)() end
			function Toggle:Set(Val1, Val2)
				if type(Val1) == "string" and type(Val2) == "string" then
					LabelFunc:SetTitle(Val1); LabelFunc:SetDesc(Val2)
				elseif type(Val1) == "string" then
					LabelFunc:SetTitle(Val1)
				elseif type(Val1) == "boolean" then
					if WaitToggle and Val2 then
						repeat task.wait() until not WaitToggle
					end
					task.spawn(SetToggle, Val1)
				elseif type(Val1) == "function" then
					Callback = Val1
				end
			end
			return Toggle
		end

		function Tab:AddDropdown(Configs)
			local DName = Configs[1] or Configs.Name or Configs.Title or "Dropdown"
			local DDesc = Configs.Desc or Configs.Description or ""
			local DOptions = Configs[2] or Configs.Options or {}
			local OpDefault = Configs[3] or Configs.Default or {}
			local Flag = Configs[5] or Configs.Flag or false
			local DMultiSelect = Configs.MultiSelect or false
			local Callback = Funcs:GetCallback(Configs, 4)

			local Button, LabelFunc = ButtonFrame(Container, DName, DDesc, UDim2.new(1, -180))

			local SelectedFrame = InsertTheme(Create("Frame", Button, {
				Size = UDim2.new(0, 150, 0, 18),
				Position = UDim2.new(1, -10, 0.5),
				AnchorPoint = Vector2.new(1, 0.5),
				BackgroundColor3 = Theme["Color Theme"],
				BackgroundTransparency = 0.85,
			}), "Theme")
			Make("Corner", SelectedFrame, UDim.new(0, 4))

			local ActiveLabel = InsertTheme(Create("TextLabel", SelectedFrame, {
				Size = UDim2.new(0.85, 0, 0.85, 0),
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.new(0.5, 0, 0.5, 0),
				BackgroundTransparency = 1,
				Font = Enum.Font.GothamBold,
				TextScaled = true,
				TextColor3 = Theme["Color Text"],
				Text = "..."
			}), "Text")

			local Arrow = Create("ImageLabel", SelectedFrame, {
				Size = UDim2.new(0, 15, 0, 15),
				Position = UDim2.new(0, -5, 0.5),
				AnchorPoint = Vector2.new(1, 0.5),
				Image = "rbxassetid://10709791523",
				BackgroundTransparency = 1
			})

			local NoClickFrame = Create("TextButton", DropdownHolder, {
				Name = "AntiClick",
				Size = UDim2.new(1, 0, 1, 0),
				BackgroundTransparency = 1,
				Visible = false,
				Text = ""
			})

			local DropFrame = Create("Frame", NoClickFrame, {
				Size = UDim2.new(0, 152, 0, 0),
				BackgroundTransparency = 0.1,
				BackgroundColor3 = Color3.fromRGB(255, 255, 255),
				AnchorPoint = Vector2.new(0, 1),
				Name = "DropdownFrame",
				ClipsDescendants = true,
				Active = true
			})
			Make("Corner", DropFrame)
			Make("Stroke", DropFrame)
			Make("Gradient", DropFrame, {Rotation = 60})

			local SearchHolder = InsertTheme(Create("Frame", DropFrame, {
				Size = UDim2.new(1, -10, 0, 22),
				Position = UDim2.new(0, 5, 0, 4),
				BackgroundColor3 = Theme["Color Stroke"],
				Name = "SearchHolder"
			}), "Stroke")
			Make("Corner", SearchHolder, UDim.new(0, 4))

			local SearchIcon = Create("ImageLabel", SearchHolder, {
				Size = UDim2.new(0, 12, 0, 12),
				Position = UDim2.new(0, 5, 0.5),
				AnchorPoint = Vector2.new(0, 0.5),
				BackgroundTransparency = 1,
				Image = "rbxassetid://10734943674",
				ImageColor3 = Theme["Color Dark Text"]
			})

			local SearchBox = InsertTheme(Create("TextBox", SearchHolder, {
				Size = UDim2.new(1, -24, 1, 0),
				Position = UDim2.new(0, 20, 0, 0),
				BackgroundTransparency = 1,
				Font = Enum.Font.Gotham,
				TextSize = 9,
				TextColor3 = Theme["Color Text"],
				PlaceholderText = "Search...",
				PlaceholderColor3 = Theme["Color Dark Text"],
				Text = "",
				ClearTextOnFocus = false,
				TextXAlignment = "Left"
			}), "Text")

			local ScrollFrame = InsertTheme(Create("ScrollingFrame", DropFrame, {
				ScrollBarImageColor3 = Theme["Color Theme"],
				Size = UDim2.new(1, 0, 1, -30),
				Position = UDim2.new(0, 0, 0, 30),
				ScrollBarThickness = 1.5,
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				CanvasSize = UDim2.new(),
				ScrollingDirection = "Y",
				AutomaticCanvasSize = "Y",
				Active = true
			}, {
				Create("UIPadding", {
					PaddingLeft = UDim.new(0, 8),
					PaddingRight = UDim.new(0, 8),
					PaddingTop = UDim.new(0, 5),
					PaddingBottom = UDim.new(0, 5)
				}),
				Create("UIListLayout", { Padding = UDim.new(0, 4) })
			}), "ScrollBar")

			local ScrollSize, WaitDrop = 5

			local function Disable()
				WaitDrop = true
				CreateTween({Arrow, "Rotation", 0, 0.2})
				CreateTween({DropFrame, "Size", UDim2.new(0, 152, 0, 0), 0.2, true})
				CreateTween({Arrow, "ImageColor3", Color3.fromRGB(255, 255, 255), 0.2})
				Arrow.Image = "rbxassetid://10709791523"
				NoClickFrame.Visible = false
				SearchBox.Text = ""
				WaitDrop = false
			end

			local function GetFrameSize()
				return UDim2.fromOffset(152, ScrollSize + 30)
			end

			local function CalculateSize()
				local Count = 0
				for _,Frame in pairs(ScrollFrame:GetChildren()) do
					if Frame:IsA("TextButton") or (Frame:IsA("Frame") and Frame.Name == "Option") then
						if Frame.Visible then Count = Count + 1 end
					end
				end
				ScrollSize = (math.clamp(Count, 0, 10) * 25) + 10
				if NoClickFrame.Visible then
					CreateTween({DropFrame, "Size", GetFrameSize(), 0.2})
				end
			end

			local function Minimize()
				if WaitDrop then return end
				WaitDrop = true
				if NoClickFrame.Visible then
					Arrow.Image = "rbxassetid://10709791523"
					CreateTween({Arrow, "ImageColor3", Color3.fromRGB(255, 255, 255), 0.2})
					CreateTween({DropFrame, "Size", UDim2.new(0, 152, 0, 0), 0.2, true})
					NoClickFrame.Visible = false
					SearchBox.Text = ""
				else
					NoClickFrame.Visible = true
					Arrow.Image = "rbxassetid://10709790948"
					CreateTween({Arrow, "ImageColor3", Theme["Color Theme"], 0.2})
					CreateTween({DropFrame, "Size", GetFrameSize(), 0.2, true})
				end
				WaitDrop = false
			end

			local function CalculatePos()
				local FramePos = SelectedFrame.AbsolutePosition
				local ScreenSize = ScreenGui.AbsoluteSize
				local ClampX = math.clamp((FramePos.X / UIScale), 0, ScreenSize.X / UIScale - DropFrame.Size.X.Offset)
				local ClampY = math.clamp((FramePos.Y / UIScale), 0, ScreenSize.Y / UIScale)
				local NewPos = UDim2.fromOffset(ClampX, ClampY)
				local AnchorPoint = FramePos.Y > ScreenSize.Y / 1.4 and 1 or ScrollSize > 80 and 0.5 or 0
				DropFrame.AnchorPoint = Vector2.new(0, AnchorPoint)
				CreateTween({DropFrame, "Position", NewPos, 0.1})
			end

			local AddNewOptions, GetOptions, AddOption, RemoveOption, Selected do
				local savedFlag = CheckFlag(Flag) and GetFlag(Flag) or nil
				local Default = type(OpDefault) ~= "table" and {OpDefault} or OpDefault
				local MultiSelect = DMultiSelect
				local Options = {}

				if MultiSelect then
					Selected = {}
					local source = savedFlag or Default
					if type(source) == "table" then
						for _, v in ipairs(source) do
							if type(v) == "string" then
								Selected[v] = true
							end
						end
					end
				else
					if type(savedFlag) == "string" then
						Selected = savedFlag
					else
						Selected = Default[1] or nil
					end
				end

				local SelectedValues = {}
				if MultiSelect then
					for k, v in pairs(Selected) do
						if v then table.insert(SelectedValues, k) end
					end
				end

				local function CallbackSelected()
					if MultiSelect then
						SetFlag(Flag, SelectedValues)
						Funcs:FireCallback(Callback, SelectedValues)
					else
						SetFlag(Flag, tostring(Selected or ""))
						Funcs:FireCallback(Callback, Selected)
					end
				end

				local function UpdateLabel()
					if MultiSelect then
						if #SelectedValues == 0 then
							ActiveLabel.Text = "..."
						else
							local maxW = SelectedFrame.AbsoluteSize.X - 30
							local full = table.concat(SelectedValues, ", ")
							local fitted = full
							if TextService:GetTextSize(full, 8, Enum.Font.GothamBold, Vector2.new(9999, 20)).X > maxW then
								fitted = ""
								for i, v in ipairs(SelectedValues) do
									local candidate = fitted == "" and v or (fitted .. ", " .. v)
									local withDots = candidate .. (i < #SelectedValues and "..." or "")
									if TextService:GetTextSize(withDots, 8, Enum.Font.GothamBold, Vector2.new(9999, 20)).X > maxW then
										fitted = fitted .. "..."
										break
									end
									fitted = candidate
								end
							end
							ActiveLabel.Text = fitted
						end
					else
						ActiveLabel.Text = tostring(Selected or "...")
					end
				end

				local function UpdateSelected()
					if MultiSelect then
						for _,v in pairs(Options) do
							local nodes = v.nodes
							local on = Selected[v.Name] == true
							CreateTween({nodes[2], "BackgroundTransparency", on and 0 or 0.8, 0.35})
							CreateTween({nodes[2], "Size", on and UDim2.fromOffset(4, 12) or UDim2.fromOffset(4, 4), 0.35})
							CreateTween({nodes[3], "TextTransparency", on and 0 or 0.4, 0.35})
						end
					else
						for _,v in pairs(Options) do
							local on = v.Value == Selected
							local nodes = v.nodes
							CreateTween({nodes[2], "BackgroundTransparency", on and 0 or 1, 0.35})
							CreateTween({nodes[2], "Size", on and UDim2.fromOffset(4, 14) or UDim2.fromOffset(4, 4), 0.35})
							CreateTween({nodes[3], "TextTransparency", on and 0 or 0.4, 0.35})
						end
					end
					UpdateLabel()
				end

				local function SelectOpt(Opt)
					if MultiSelect then
						local on = not (Selected[Opt.Name] == true)
						Selected[Opt.Name] = on
						if on then
							if not table.find(SelectedValues, Opt.Name) then
								table.insert(SelectedValues, Opt.Name)
							end
						else
							local idx = table.find(SelectedValues, Opt.Name)
							if idx then table.remove(SelectedValues, idx) end
						end
					else
						Selected = Opt.Value
					end
					CallbackSelected()
					UpdateSelected()
				end

				AddOption = function(index, Value)
					local Name = tostring(type(index) == "string" and index or Value)
					if Options[Name] then return end

					Options[Name] = {
						index = index,
						Value = Value,
						Name = Name,
					}

					if MultiSelect then
						if Selected[Name] == nil then Selected[Name] = false end
						local on = Selected[Name]
						if on and not table.find(SelectedValues, Name) then
							table.insert(SelectedValues, Name)
						end
					end

					local Btn = Make("Button", ScrollFrame, {
						Name = "Option",
						Size = UDim2.new(1, 0, 0, 21),
					})
					Make("Corner", Btn, UDim.new(0, 4))

					local IsSelectedDot = InsertTheme(Create("Frame", Btn, {
						Position = UDim2.new(0, 1, 0.5),
						Size = UDim2.new(0, 4, 0, 4),
						BackgroundColor3 = Theme["Color Theme"],
						BackgroundTransparency = 1,
						AnchorPoint = Vector2.new(0, 0.5)
					}), "Theme")
					Make("Corner", IsSelectedDot, UDim.new(0.5, 0))

					local OptLabel = InsertTheme(Create("TextLabel", Btn, {
						Size = UDim2.new(1, 0, 1),
						Position = UDim2.new(0, 10),
						Text = Name,
						TextColor3 = Theme["Color Text"],
						Font = Enum.Font.GothamBold,
						TextXAlignment = "Left",
						BackgroundTransparency = 1,
						TextTransparency = 0.4
					}), "Text")

					Btn.Activated:Connect(function()
						SelectOpt(Options[Name])
					end)

					Options[Name].nodes = {Btn, IsSelectedDot, OptLabel}
				end

				RemoveOption = function(index, Value)
					local Name = tostring(type(index) == "string" and index or Value)
					if Options[Name] then
						if MultiSelect then
							Selected[Name] = nil
							local idx = table.find(SelectedValues, Name)
							if idx then table.remove(SelectedValues, idx) end
						else
							if Selected == Name then Selected = nil end
						end
						Options[Name].nodes[1]:Destroy()
						table.clear(Options[Name])
						Options[Name] = nil
					end
				end

				GetOptions = function()
					return Options
				end

				AddNewOptions = function(List, Clear)
					if Clear then
						for k, v in pairs(Options) do
							if v.nodes and v.nodes[1] then
								v.nodes[1]:Destroy()
							end
							table.clear(Options[k])
							Options[k] = nil
						end
						table.clear(Options)
						if MultiSelect then
							table.clear(Selected)
							table.clear(SelectedValues)
						else
							Selected = nil
						end
						UpdateLabel()
					end
					table.foreach(List, AddOption)
					CallbackSelected()
					UpdateSelected()
				end

				table.foreach(DOptions, AddOption)
				CallbackSelected()
				UpdateSelected()

				SearchBox:GetPropertyChangedSignal("Text"):Connect(function()
					local query = SearchBox.Text:lower()
					for Name, Opt in pairs(Options) do
						if Opt.nodes and Opt.nodes[1] then
							local matches = query == "" or tostring(Name):lower():find(query, 1, true)
							Opt.nodes[1].Visible = matches ~= nil and matches ~= false
						end
					end
					CalculateSize()
				end)
			end

			Button.Activated:Connect(Minimize)
			NoClickFrame.MouseButton1Down:Connect(function()
				local mouse = PlayerMouse
				local df = DropFrame.AbsolutePosition
				local ds = DropFrame.AbsoluteSize
				if mouse.X >= df.X and mouse.X <= df.X + ds.X and mouse.Y >= df.Y and mouse.Y <= df.Y + ds.Y then return end
				Disable()
			end)
			NoClickFrame.MouseButton1Click:Connect(function()
				local mouse = PlayerMouse
				local df = DropFrame.AbsolutePosition
				local ds = DropFrame.AbsoluteSize
				if mouse.X >= df.X and mouse.X <= df.X + ds.X and mouse.Y >= df.Y and mouse.Y <= df.Y + ds.Y then return end
				Disable()
			end)
			MainFrame:GetPropertyChangedSignal("Visible"):Connect(Disable)
			SelectedFrame:GetPropertyChangedSignal("AbsolutePosition"):Connect(CalculatePos)
			Button.Activated:Connect(CalculateSize)
			ScrollFrame.ChildAdded:Connect(CalculateSize)
			ScrollFrame.ChildRemoved:Connect(CalculateSize)
			CalculatePos()
			CalculateSize()

			local Dropdown = {}
			function Dropdown:Visible(...) Funcs:ToggleVisible(Button, ...) end
			function Dropdown:Destroy() Button:Destroy() end
			function Dropdown:Callback(...) Funcs:InsertCallback(Callback, ...)(DMultiSelect and SelectedValues or Selected) end

			function Dropdown:Add(...)
				local NewOptions = {...}
				if type(NewOptions[1]) == "table" then
					table.foreach(NewOptions[1], function(_,Name) AddOption(Name) end)
				else
					table.foreach(NewOptions, function(_,Name) AddOption(Name) end)
				end
			end

			function Dropdown:Remove(Option)
				for index, Value in pairs(GetOptions()) do
					if type(Option) == "number" and index == Option or Value.Name == Option then
						RemoveOption(index, Value.Value)
					end
				end
			end

			function Dropdown:Select(Option)
				local Options = GetOptions()
				if DMultiSelect then
					if type(Option) == "table" then
						for name in pairs(Selected) do Selected[name] = false end
						SelectedValues = {}
						for _, opt in pairs(Option) do
							local name = tostring(opt)
							if Options[name] then
								Selected[name] = true
								table.insert(SelectedValues, name)
							end
						end
					else
						local name = tostring(Option)
						if Options[name] then
							local on = not (Selected[name] == true)
							Selected[name] = on
							if on then
								if not table.find(SelectedValues, name) then
									table.insert(SelectedValues, name)
								end
							else
								local idx = table.find(SelectedValues, name)
								if idx then table.remove(SelectedValues, idx) end
							end
						end
					end
				else
					if type(Option) == "string" then
						for _,Val in pairs(Options) do
							if Val.Name == Option then
								Selected = Val.Value
							end
						end
					elseif type(Option) == "number" then
						local i = 0
						for _, Val in pairs(Options) do
							i = i + 1
							if i == Option then
								Selected = Val.Value
								break
							end
						end
					end
				end
				local Options2 = GetOptions()
				if not DMultiSelect then
					for _, v in pairs(Options2) do
						local on = v.Value == Selected
						local nodes = v.nodes
						CreateTween({nodes[2], "BackgroundTransparency", on and 0 or 1, 0.35})
						CreateTween({nodes[2], "Size", on and UDim2.fromOffset(4, 14) or UDim2.fromOffset(4, 4), 0.35})
						CreateTween({nodes[3], "TextTransparency", on and 0 or 0.4, 0.35})
					end
				else
					for _, v in pairs(Options2) do
						local on = Selected[v.Name] == true
						local nodes = v.nodes
						CreateTween({nodes[2], "BackgroundTransparency", on and 0 or 0.8, 0.35})
						CreateTween({nodes[2], "Size", on and UDim2.fromOffset(4, 12) or UDim2.fromOffset(4, 4), 0.35})
						CreateTween({nodes[3], "TextTransparency", on and 0 or 0.4, 0.35})
					end
				end
				if DMultiSelect then
					ActiveLabel.Text = #SelectedValues > 0 and table.concat(SelectedValues, ", ") or "..."
				else
					ActiveLabel.Text = tostring(Selected or "...")
				end
				SetFlag(Flag, DMultiSelect and SelectedValues or tostring(Selected or ""))
			end

			function Dropdown:Set(Val1, Clear)
				if type(Val1) == "table" then
					AddNewOptions(Val1, not Clear)
				elseif type(Val1) == "function" then
					Callback = Val1
				end
			end

			return Dropdown
		end

		function Tab:AddSlider(Configs)
			local SName = Configs[1] or Configs.Name or Configs.Title or "Slider!"
			local SDesc = Configs.Desc or Configs.Description or ""
			local Min = Configs[2] or Configs.MinValue or Configs.Min or 0
			local Max = Configs[3] or Configs.MaxValue or Configs.Max or 100
			local Increase = Configs[4] or Configs.Increase or 1
			local Callback = Funcs:GetCallback(Configs, 6)
			local Flag = Configs[7] or Configs.Flag or false
			local Default = Configs[5] or Configs.Default or Min
			if CheckFlag(Flag) then Default = GetFlag(Flag) end
			Default = math.clamp(tonumber(Default) or Min, Min, Max)

			local Button, LabelFunc = ButtonFrame(Container, SName, SDesc, UDim2.new(1, -180))

			local CONTROL_WIDTH = 150
			local RIGHT_MARGIN = 10
			local INPUT_WIDTH = 38
			local GAP = 8
			local SLIDER_WIDTH = CONTROL_WIDTH - INPUT_WIDTH - GAP

			local SliderHolder = Create("TextButton", Button, {
				Size = UDim2.new(0, SLIDER_WIDTH, 1, 0),
				Position = UDim2.new(1, -RIGHT_MARGIN, 0, 0),
				AnchorPoint = Vector2.new(1, 0),
				AutoButtonColor = false,
				Text = "",
				BackgroundTransparency = 1
			})

			local SliderBar = InsertTheme(Create("Frame", SliderHolder, {
				BackgroundColor3 = Theme["Color Theme"],
				BackgroundTransparency = 0.85,
				Size = UDim2.new(1, 0, 0, 6),
				Position = UDim2.new(1, 0, 0.5, 0),
				AnchorPoint = Vector2.new(1, 0.5)
			}), "Theme")
			Make("Corner", SliderBar)

			local Indicator = InsertTheme(Create("Frame", SliderBar, {
				BackgroundColor3 = Theme["Color Theme"],
				Size = UDim2.fromScale(0, 1),
				BorderSizePixel = 0
			}), "Theme")
			Make("Corner", Indicator)

			local SliderIcon = Create("Frame", SliderBar, {
				Size = UDim2.new(0, 6, 0, 12),
				BackgroundColor3 = Color3.fromRGB(220, 220, 220),
				Position = UDim2.fromScale(0, 0.5),
				AnchorPoint = Vector2.new(0.5, 0.5),
				BackgroundTransparency = 0.2
			})
			Make("Corner", SliderIcon)

			local InputHolder = InsertTheme(Create("Frame", Button, {
				Size = UDim2.new(0, INPUT_WIDTH, 0, 18),
				Position = UDim2.new(1, -(RIGHT_MARGIN + SLIDER_WIDTH + GAP), 0.5),
				AnchorPoint = Vector2.new(1, 0.5),
				BackgroundColor3 = Theme["Color Theme"],
				BackgroundTransparency = 0.85,
			}), "Theme")
			Make("Corner", InputHolder, UDim.new(0, 4))

			local ValueInput = InsertTheme(Create("TextBox", InputHolder, {
				Size = UDim2.new(1, -6, 0.85, 0),
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.new(0.5, 0, 0.5, 0),
				BackgroundTransparency = 1,
				Font = Enum.Font.FredokaOne,
				TextScaled = true,
				TextColor3 = Theme["Color Text"],
				Text = tostring(Default),
				ClearTextOnFocus = true,
				TextXAlignment = "Center"
			}), "Text")

			local currentValue = Default
			local isFocused = false

			local function ValueToScale(v)
				if Max == Min then return 0 end
				return (v - Min) / (Max - Min)
			end

			local function GetDecimals(n)
				local s = tostring(n)
				local dot = s:find("%.")
				if not dot then return 0 end
				return #s - dot
			end
			local Decimals = GetDecimals(Increase)

			local function RoundTo(val, inc)
				local factor = 10 ^ Decimals
				return math.floor(val / inc + 0.5) * inc
			end

			local function FormatValue(v)
				if Decimals == 0 then
					return tostring(math.floor(v))
				end
				return string.format("%." .. Decimals .. "f", v)
			end

			local function ScaleToValue(s)
				local raw = s * (Max - Min) + Min
				local factor = 10 ^ Decimals
				local stepped = math.floor(raw / Increase + 0.5) * Increase
				stepped = math.floor(stepped * factor + 0.5) / factor
				return math.clamp(stepped, Min, Max)
			end

			local function ApplyVisual(scale)
				local c = math.clamp(scale, 0, 1)
				SliderIcon.Position = UDim2.new(c, 0, 0.5, 0)
				Indicator.Size = UDim2.fromScale(c, 1)
			end

			local function SetSlider(newVal, skipCallback)
				if type(newVal) ~= "number" then return end
				newVal = math.clamp(newVal, Min, Max)
				local factor = 10 ^ Decimals
				newVal = math.floor(newVal / Increase + 0.5) * Increase
				newVal = math.floor(newVal * factor + 0.5) / factor
				currentValue = newVal
				ApplyVisual(ValueToScale(newVal))
				if not isFocused then
					ValueInput.Text = FormatValue(newVal)
				end
				if not skipCallback then
					SetFlag(Flag, newVal)
					Funcs:FireCallback(Callback, newVal)
				end
			end

			local function ControlPos()
				local mouseX = Player:GetMouse().X
				local barLeft = SliderBar.AbsolutePosition.X
				local barWidth = SliderBar.AbsoluteSize.X
				local scale = math.clamp((mouseX - barLeft) / barWidth, 0, 1)
				local newVal = ScaleToValue(scale)
				SetSlider(newVal)
			end

			SliderHolder.MouseButton1Down:Connect(function()
				Container.ScrollingEnabled = false
				while UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) do
					task.wait()
					ControlPos()
				end
				Container.ScrollingEnabled = true
			end)

			ValueInput:GetPropertyChangedSignal("Text"):Connect(function()
				local clean = ValueInput.Text:gsub("[^%d%.%-]", "")
				if clean ~= ValueInput.Text then
					pcall(function() ValueInput.Text = clean end)
				end
			end)

			ValueInput.Focused:Connect(function()
				isFocused = true
				Container.ScrollingEnabled = false
			end)

			ValueInput.FocusLost:Connect(function()
				isFocused = false
				Container.ScrollingEnabled = true
				local num = tonumber(ValueInput.Text)
				if num then
					SetSlider(num)
				else
					ValueInput.Text = FormatValue(currentValue)
				end
			end)

			local loadedFromFlag = CheckFlag(Flag)
			SetSlider(Default, not loadedFromFlag)
			SetFlag(Flag, Default)

			local Slider = {}
			function Slider:Set(NewVal1, NewVal2)
				if NewVal1 and NewVal2 then
					LabelFunc:SetTitle(NewVal1)
					LabelFunc:SetDesc(NewVal2)
				elseif type(NewVal1) == "string" then
					LabelFunc:SetTitle(NewVal1)
				elseif type(NewVal1) == "function" then
					Callback = NewVal1
				elseif type(NewVal1) == "number" then
					SetSlider(NewVal1)
				end
			end
			function Slider:Callback(...) Funcs:InsertCallback(Callback, ...)(currentValue) end
			function Slider:Visible(...) Funcs:ToggleVisible(Button, ...) end
			function Slider:Destroy() Button:Destroy() end
			return Slider
		end

		function Tab:AddTextBox(Configs)
			local TName = Configs[1] or Configs.Name or Configs.Title or "Text Box"
			local TDesc = Configs.Desc or Configs.Description or ""
			local TDefault = Configs[2] or Configs.Default or ""
			local TPlaceholderText = Configs[5] or Configs.PlaceholderText or "Input"
			local TClearText = Configs[3] or Configs.ClearText or false
			local Callback = Funcs:GetCallback(Configs, 4)
			local Flag = Configs.Flag or Configs[6] or false

			if CheckFlag(Flag) then
				local saved = GetFlag(Flag)
				if type(saved) == "string" then TDefault = saved end
			end

			if type(TDefault) ~= "string" then TDefault = "" end

			local Button, LabelFunc = ButtonFrame(Container, TName, TDesc, UDim2.new(1, -38))

			local SelectedFrame = InsertTheme(Create("Frame", Button, {
				Size = UDim2.new(0, 150, 0, 18),
				Position = UDim2.new(1, -10, 0.5),
				AnchorPoint = Vector2.new(1, 0.5),
				BackgroundColor3 = Theme["Color Theme"],
				BackgroundTransparency = 0.85,
			}), "Theme")
			Make("Corner", SelectedFrame, UDim.new(0, 4))

			local TextBoxInput = InsertTheme(Create("TextBox", SelectedFrame, {
				Size = UDim2.new(0.85, 0, 0.85, 0),
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.new(0.5, 0, 0.5, 0),
				BackgroundTransparency = 1,
				Font = Enum.Font.GothamBold,
				TextScaled = true,
				TextColor3 = Theme["Color Text"],
				ClearTextOnFocus = TClearText,
				PlaceholderText = TPlaceholderText,
				Text = TDefault
			}), "Text")

			local TextBox = {}
			local function Input()
				local Text = TextBoxInput.Text
				if Text:gsub(" ", ""):len() > 0 then
					if TextBox.OnChanging then Text = TextBox.OnChanging(Text) or Text end
					Funcs:FireCallback(Callback, Text)
					TextBoxInput.Text = Text
					SetFlag(Flag, Text)
				end
			end

			TextBoxInput.FocusLost:Connect(Input)

			if TDefault ~= "" then
				task.defer(function()
					Funcs:FireCallback(Callback, TDefault)
					SetFlag(Flag, TDefault)
				end)
			end

			TextBox.OnChanging = false
			function TextBox:Visible(...) Funcs:ToggleVisible(Button, ...) end
			function TextBox:Destroy() Button:Destroy() end
			function TextBox:Set(Val)
				if type(Val) == "string" then
					TextBoxInput.Text = Val
					SetFlag(Flag, Val)
					Funcs:FireCallback(Callback, Val)
				elseif type(Val) == "function" then
					Callback = {Val}
				end
			end
			return TextBox
		end

		function Tab:AddDiscordInvite(Configs)
			local InvTitle = Configs[1] or Configs.Name or Configs.Title or "Discord"
			local Desc     = Configs.Desc or Configs.Description or ""
			local Logo     = Configs[2] or Configs.Logo or ""
			local Invite   = Configs[3] or Configs.Invite or ""

			local hasLogo = type(Logo) == "string" and Logo:gsub(" ", ""):len() > 0
			if hasLogo then Logo = redzlib:GetIcon(Logo) end

			local Card = InsertTheme(Create("Frame", Container, {
				Size = UDim2.new(1, 0, 0, 80),
				BackgroundColor3 = Theme["Color Theme"],
				BackgroundTransparency = 0.85,
				Name = "Option"
			}), "Theme")
			Make("Corner", Card, UDim.new(0, 6))

			if hasLogo then
				local IconFrame = InsertTheme(Create("Frame", Card, {
					Size = UDim2.new(0, 34, 0, 34),
					Position = UDim2.new(0, 8, 0, 8),
					BackgroundColor3 = Theme["Color Theme"],
					BackgroundTransparency = 0.75,
					Name = "LogoFrame"
				}), "Theme")
				Make("Corner", IconFrame, UDim.new(0, 5))

				Create("ImageLabel", IconFrame, {
					Size = UDim2.new(1, -6, 1, -6),
					Position = UDim2.new(0, 3, 0, 3),
					BackgroundTransparency = 1,
					Image = Logo,
					ScaleType = Enum.ScaleType.Fit
				})
			end

			local textX = hasLogo and 50 or 10

			InsertTheme(Create("TextLabel", Card, {
				Font = Enum.Font.GothamBold,
				TextColor3 = Theme["Color Text"],
				Size = UDim2.new(1, -(textX + 10), 0, 14),
				Position = UDim2.new(0, textX, 0, 9),
				BackgroundTransparency = 1,
				TextTruncate = "AtEnd",
				TextSize = 11,
				TextXAlignment = "Left",
				Text = InvTitle
			}), "Text")

			InsertTheme(Create("TextLabel", Card, {
				Font = Enum.Font.Gotham,
				TextColor3 = Theme["Color Dark Text"],
				Size = UDim2.new(1, -(textX + 10), 0, 22),
				Position = UDim2.new(0, textX, 0, 24),
				BackgroundTransparency = 1,
				TextWrapped = true,
				TextTruncate = "None",
				TextSize = 9,
				TextXAlignment = "Left",
				TextYAlignment = "Top",
				Text = Desc
			}), "DarkText")

			local JoinBtn = InsertTheme(Create("TextButton", Card, {
				Size = UDim2.new(1, -16, 0, 18),
				Position = UDim2.new(0, 8, 1, -26),
				AnchorPoint = Vector2.new(0, 0),
				Text = "Join",
				Font = Enum.Font.GothamBold,
				TextSize = 10,
				TextColor3 = Theme["Color Text"],
				BackgroundColor3 = Theme["Color Theme"],
				BackgroundTransparency = 0.65,
				AutoButtonColor = false
			}), "Theme")
			Make("Corner", JoinBtn, UDim.new(0, 5))

			local ClickDelay
			JoinBtn.Activated:Connect(function()
				if ClickDelay then return end
				setclipboard(Invite)
				ClickDelay = true
				SetProps(JoinBtn, {
					Text = "Copied!",
					BackgroundColor3 = Color3.fromRGB(80, 80, 80),
					BackgroundTransparency = 0,
					TextColor3 = Color3.fromRGB(150, 150, 150)
				})
				task.wait(3)
				SetProps(JoinBtn, {
					Text = "Join",
					BackgroundColor3 = Theme["Color Theme"],
					BackgroundTransparency = 0.65,
					TextColor3 = Theme["Color Text"]
				})
				ClickDelay = false
			end)

			local DiscordInvite = {}
			function DiscordInvite:Visible(...) Funcs:ToggleVisible(Card, ...) end
			function DiscordInvite:Destroy() Card:Destroy() end
			return DiscordInvite
		end

		return Tab
	end


	CloseButton.Activated:Connect(Window.CloseBtn)
	MinimizeButton.Activated:Connect(Window.MinimizeBtn)
	return Window
end

return redzlib
