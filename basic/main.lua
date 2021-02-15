function love.load(args)
	-- The default exporter (defaultLuaModule.lua) exports a module that returns
	-- an array. Let's store the array in a global for easy access later.
	particleDatas = require("colorful")
end

function love.update(dt)
	-- Each array item contains various information about the respective
	-- particle system for each "layer". What we're mostly interested in is
	-- the .system field which contains the actual ParticleSystem object that
	-- we can use in LÖVE.
	for _, particleData in ipairs(particleDatas) do
		particleData.system:update(dt)
	end
end

function love.draw()
	local w, h = love.graphics.getDimensions()

	-- Draw all particle systems in the middle of the screen.
	for _, particleData in ipairs(particleDatas) do
		love.graphics.setBlendMode(particleData.blendMode)
		love.graphics.draw(particleData.system, w/2, h/2)
	end
end
