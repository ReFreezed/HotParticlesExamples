--[[
module = {
	{
		system=particleSystem1,
		kickStartSteps=steps1, kickStartDt=dt1, emitAtStart=count1,
		blendMode=blendMode1, shader=shader1,
		texturePreset=preset1, texturePath=path1,
		shaderPath=path1, shaderFilename=filename1
	},
	{ system=particleSystem2, ... },
	...
}
]]
local LG        = love.graphics
local particles = {}

local image1 = LG.newImage("rainbow.png")
image1:setFilter("linear", "linear")
local image2 = LG.newImage("lightDot.png")
image2:setFilter("linear", "linear")

local ps = LG.newParticleSystem(image1, 39)
ps:setColors(1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 0.40151515603065, 1, 1, 1, 0)
ps:setDirection(-1.5707963705063)
ps:setEmissionArea("none", 0, 0, 0, false)
ps:setEmissionRate(16.715366363525)
ps:setEmitterLifetime(-1)
ps:setInsertMode("top")
ps:setLinearAcceleration(0, 0, 0, 0)
ps:setLinearDamping(0.23776942491531, 0.23776942491531)
ps:setOffset(18.5, 5)
ps:setParticleLifetime(1.7999999523163, 2.2000000476837)
ps:setRadialAcceleration(0, 0)
ps:setRelativeRotation(true)
ps:setRotation(1.5707963705063, 1.5707963705063)
ps:setSizes(1.3073788881302)
ps:setSizeVariation(0)
ps:setSpeed(140.23544311523, 140.23544311523)
ps:setSpin(0, 0)
ps:setSpinVariation(0)
ps:setSpread(1.0087683200836)
ps:setTangentialAcceleration(0, 0)
table.insert(particles, {system=ps, kickStartSteps=100, kickStartDt=0.022000000476837, emitAtStart=0, blendMode="add", shader=nil, texturePath="rainbow.png", texturePreset="light", shaderPath="", shaderFilename=""})

local ps = LG.newParticleSystem(image2, 149)
ps:setColors(0.1704545468092, 0.88688015937805, 1, 0, 0.1704545468092, 0.6983470916748, 1, 1, 0.1704545468092, 0.32128098607063, 1, 0)
ps:setDirection(0)
ps:setEmissionArea("normal", 115.8286819458, 115.8286819458, 0, false)
ps:setEmissionRate(13.435894012451)
ps:setEmitterLifetime(-1)
ps:setInsertMode("top")
ps:setLinearAcceleration(0, 0, 0, 0)
ps:setLinearDamping(0, 0)
ps:setOffset(90, 90)
ps:setParticleLifetime(1.5527799129486, 2.0179927349091)
ps:setRadialAcceleration(0, 0)
ps:setRelativeRotation(false)
ps:setRotation(0, 0)
ps:setSizes(0.10301292687654)
ps:setSizeVariation(0)
ps:setSpeed(0, 0)
ps:setSpin(0, 0)
ps:setSpinVariation(0)
ps:setSpread(0)
ps:setTangentialAcceleration(0, 0)
table.insert(particles, {system=ps, kickStartSteps=0, kickStartDt=0, emitAtStart=120, blendMode="add", shader=nil, texturePath="lightDot.png", texturePreset="lightDot", shaderPath="", shaderFilename=""})

return particles
