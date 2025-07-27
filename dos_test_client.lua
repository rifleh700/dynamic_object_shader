
local shaderObject = nil
local functionObject = nil

function createShaderObject(id)

	if shaderObject ~= nil and isElement(shaderObject) then
		destroyElement(shaderObject)
	end

	shaderObject = createTestObject(id)
	attachElements(shaderObject, localPlayer, 0, 1, 0)

	return true
end

function createFunctionObject(id)

	if functionObject ~= nil and isElement(functionObject) then
		destroyElement(functionObject)
	end

	functionObject = createTestObject(id)

	return true
end

function createTestObject(id)

	local x, y, z = getElementPosition(localPlayer)
	local int = getElementInterior(localPlayer)
	local dim = getElementDimension(localPlayer)

	local object = createObject(id, x, y + 2, z)
	setElementInterior(object, int)
	setElementDimension(object, dim)
	setElementCollisionsEnabled(object, false)

	return object
end

addEventHandler("onClientPedsProcessed", root,
	function()

		if not functionObject then return end

		local x, y, z = getElementPosition(localPlayer)
		setElementPosition(functionObject, x, y - 1, z)
		setElementLighting(functionObject, getElementLighting(localPlayer))
	end
)

addCommandHandler("dos",
	function(cmd, model)

		if not model then
			outputChatBox("[dos] type model ID (examle: dos 371)")
			return
		end

		createShaderObject(model)
		createFunctionObject(model)

		outputChatBox("[dos] test objects ("..model..") recreated")
	end
)