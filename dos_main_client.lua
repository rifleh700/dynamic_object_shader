
local SHADER_PATH = "dos.fx"

local shaders = {}

local function removeShader(object)

	local shader = shaders[object]
	if not shader then
		return false
	end

	shaders[object] = nil

	if isElement(shader) then
		destroyElement(shader)
	end
	return true
end

local function updateShader(object, attachedTo)

	local shader = shaders[object]
	if not shader then
		shader = dxCreateShader(SHADER_PATH, 0, 0, false, "object")
		engineApplyShaderToWorldTexture(shader, "*", object, false)
		shaders[object] = shader
	end

	dxSetShaderValue(shader, "lighting", getElementLighting(attachedTo))

	return true
end

addEventHandler("onClientRender", root,
	function()

		for i, object in ipairs(getElementsByType("object", root, true)) do
			local attachedTo = getElementAttachedTo(object)
			if attachedTo and getElementLighting(attachedTo) then
				updateShader(object, attachedTo)
			else
				removeShader(object)
			end
		end
	end
)

addEventHandler("onClientElementStreamOut", root,
	function()

		removeShader(source)
	end
)

addEventHandler("onClientElementDestroy", root,
	function()

		removeShader(source)
	end
)
