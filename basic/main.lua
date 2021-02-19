local allParticleData

local function initializeOrResetParticles()
	for _, particleData in ipairs(allParticleData) do
		-- Note that particle systems are already started when created, so we
		-- don't need to call particleSystem:start() at any point.
		local particleSystem = particleData.system

		particleSystem:reset()
		particleSystem:setPosition(allParticleData.x+particleData.x, allParticleData.y+particleData.y)

		for step = 1, particleData.kickStartSteps do -- kickStartSteps may be 0.
			particleSystem:update(particleData.kickStartDt)
		end

		particleSystem:emit(particleData.emitAtStart) -- emitAtStart may be 0.
	end
end

function love.load(args)
	-- The default exporter (defaultLuaModule.lua) exports a module that
	-- returns an array. Let's store the array in a variable for easy access
	-- later in this file.
	allParticleData = require("colorful")

	-- Each array item contains various information about the respective
	-- particle system for each "layer". The most important part of each item
	-- is the .system field which contains the actual ParticleSystem object
	-- that we can use in LÖVE.

	-- Let's initialize all particle systems.
	initializeOrResetParticles()
end

function love.keypressed(key)
	if key == "space" then
		initializeOrResetParticles()
	end
end

function love.update(dt)
	for _, particleData in ipairs(allParticleData) do
		particleData.system:update(dt)
	end
end

function love.draw()
	local w, h = love.graphics.getDimensions()

	love.graphics.print("Press space to reset particles")

	-- Draw all particle systems in the middle of the screen.
	for _, particleData in ipairs(allParticleData) do
		love.graphics.setBlendMode(particleData.blendMode)
		love.graphics.setShader(particleData.shader) -- The .shader field is always nil in this example, so this line actually does nothing.
		love.graphics.draw(particleData.system, w/2, h/2)
	end
end
