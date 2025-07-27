# dynamic_object_shader


> [!IMPORTANT]  
> New function **[setElementLighting](https://wiki.multitheftauto.com/wiki/SetElementLighting)** is available (since 1.6.0 r22862)!
> Please just use **client-side** script below instead of this shader.
>	```lua
>	
>	addEventHandler("onClientPedsProcessed", root,
>		function()
>			for i, object in ipairs(getElementsByType("object", root, true)) do
>				local attachedTo = getElementAttachedTo(object)
>				if attachedTo then
>					local lighting = getElementLighting(attachedTo)
>					if lighting then
>						setElementLighting(object, lighting)
>					end
>				end
>			end
>		end
>	)
>	```

> [!NOTE]  
> Also I found a little difference between shader and function. If you want check it - start this resource and use `dos [modelID]` command.


MTA:SA dynamic object shader resource. It fixes attached objects lighting. Works with ped/player/vehicle/etc.

![screenshot](https://i.imgur.com/XsOJTJq.png)
