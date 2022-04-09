--[[
Author: Nitin Patel
Logitech G604 
Gesture Beta
]]--

 
-- The button your gestures are mapped to G1 = 1, G2 = 2 etc..
gestureButtonNumberOne = 5;

-- The button navigation actions are mapped to G1 = 1, G2 = 2 etc..
gestureButtonNumberTwo = 8;
gestureButtonNumberThree = 9

-- The minimal horizontal/vertical distance your mouse needs to be moved for the gesture to recognize in pixels
minimalHorizontalMovement = 1000;
minimalVerticalMovement = 1000;

-- Default values for 
horizontalStartingPosistion = 0;
verticalStartingPosistion = 0;
horizontalEndingPosistion = 0;
verticalEndingPosistion = 0;

-- Delay between keypresses in millies
delay = 100

-- Here you can enable/disable features of the script
GestureTwo = true
applicationWindowsEnabled = true
moveBetweenSpacesEnabled = true
GestureOne = true
GestureThree = true

-- Toggles debugging messages
debuggingEnabeld = true

-- Event detection
function OnEvent(event, arg, family)
	if event == "MOUSE_BUTTON_PRESSED" and (arg == gestureButtonNumberOne or arg == gestureButtonNumberTwo or arg == gestureButtonNumberThree) then
		if debuggingEnabeld then OutputLogMessage("\nEvent: " .. event .. " for button: " .. arg .. "\n") end
		
		-- Get stating mouse posistion
		horizontalStartingPosistion, verticalStartingPosistion = GetMousePosition()
		
		if debuggingEnabeld then 
			OutputLogMessage("Horizontal starting posistion: " .. horizontalStartingPosistion .. "\n") 
			OutputLogMessage("Vertical starting posistion: " .. verticalStartingPosistion .. "\n") 
		end
	end

	if event == "MOUSE_BUTTON_RELEASED" and (arg == gestureButtonNumberOne or arg == gestureButtonNumberTwo or arg == gestureButtonNumberThree) then
		if debuggingEnabeld then OutputLogMessage("\nEvent: " .. event .. " for button: " .. arg .. "\n") end
		
		-- Get ending mouse posistion
		horizontalEndingPosistion, verticalEndingPosistion = GetMousePosition()
		
		if debuggingEnabeld then 
			OutputLogMessage("Horizontal ending posistion: " .. horizontalEndingPosistion .. "\n") 
			OutputLogMessage("Vertical ending posistion: " .. verticalEndingPosistion .. "\n") 
		end

		-- Calculate differences between start and end posistions
		horizontalDifference = horizontalStartingPosistion - horizontalEndingPosistion
		verticalDifference = verticalStartingPosistion - verticalEndingPosistion

		-- Determine the direction of the mouse and if the mouse moved far enough
		if horizontalDifference > minimalHorizontalMovement then mouseMovedLeft(arg) end
		if horizontalDifference < -minimalHorizontalMovement then mouseMovedRight(arg) end
		if verticalDifference > minimalVerticalMovement then mouseMovedUp(arg) end
		if verticalDifference < -minimalVerticalMovement then mouseMovedDown(arg) end
	end
end

-- Mouese Moved
function mouseMovedUp(buttonNumber)
	if debuggingEnabeld then OutputLogMessage("mouseMovedUp\n") end
	
	if buttonNumber == gestureButtonNumberOne and GestureTwo then 
		performgestureButtonNumberOneGestureUp()
	end
	if buttonNumber == gestureButtonNumberTwo and GestureOne then 
		performgestureButtonNumberTwoGestureUp()
	end
	if buttonNumber == gestureButtonNumberThree and GestureThree then 
		performgestureButtonNumberThreeGestureUp()
	end
end

function mouseMovedDown(buttonNumber)
	if debuggingEnabeld then OutputLogMessage("mouseMovedDown\n") end
	
	if buttonNumber == gestureButtonNumberOne and applicationWindowsEnabled then 
		performgestureButtonNumberOneGestureDown()
	end
	if buttonNumber == gestureButtonNumberTwo and GestureOne then 
		performgestureButtonNumberTwoGestureDown()
	end
	if buttonNumber == gestureButtonNumberThree and GestureThree then 
		performgestureButtonNumberThreeGestureDown()
	end
end

function mouseMovedLeft(buttonNumber)
	if debuggingEnabeld then OutputLogMessage("mouseMovedLeft\n") end
	
	if buttonNumber == gestureButtonNumberOne and moveBetweenSpacesEnabled then 
		performgestureButtonNumberOneGestureLeft()
	end
	if buttonNumber == gestureButtonNumberTwo and GestureOne then 
		performgestureButtonNumberTwoGestureLeft()
	end
	if buttonNumber == gestureButtonNumberThree and GestureThree then 
		performgestureButtonNumberThreeGestureLeft()
	end
end

function mouseMovedRight(buttonNumber)
	if debuggingEnabeld then OutputLogMessage("mouseMovedRight\n") end
	
	if buttonNumber == gestureButtonNumberOne and moveBetweenSpacesEnabled then 
		performgestureButtonNumberOneGestureRight()
	end
	if buttonNumber == gestureButtonNumberTwo and GestureOne then 
		performgestureButtonNumberTwoGestureRight()
	end
	if buttonNumber == gestureButtonNumberThree and GestureThree then 
		performgestureButtonNumberThreeGestureRight()
	end
end

-- gestureButtonNumberOne Functions
function performgestureButtonNumberOneGestureUp()
	if debuggingEnabeld then OutputLogMessage("performgestureButtonNumberOneGestureUp\n") end
	firstKey = "lctrl"
	secondKey = "lshift"
	thirdKey = "h"
	PressKey(firstKey)
Sleep(delay)
	PressKey(secondKey)
Sleep(delay)
	PressAndReleaseKey(thirdKey )
	ReleaseKey(firstKey)
	ReleaseKey(secondKey)



end

function performgestureButtonNumberOneGestureDown()
	if debuggingEnabeld then OutputLogMessage("performgestureButtonNumberOneGestureDown\n") end
	firstKey = "lctrl"
	secondKey = "u"
	PressKey(firstKey)
Sleep(delay)
	PressAndReleaseKey(secondKey)
	ReleaseKey(firstKey)


end

function performgestureButtonNumberOneGestureLeft()
	if debuggingEnabeld then OutputLogMessage("performgestureButtonNumberOneGestureLeft\n") end
	firstKey = "lctrl"
	secondKey = "i"
	PressKey(firstKey)
Sleep(delay)
	PressAndReleaseKey(secondKey)
	ReleaseKey(firstKey)
end

function performgestureButtonNumberOneGestureRight()
	if debuggingEnabeld then OutputLogMessage("performgestureButtonNumberOneGestureRight\n") end
	firstKey = "lctrl"
	secondKey = "b"
	PressKey(firstKey)
Sleep(delay)
	PressAndReleaseKey(secondKey)
	ReleaseKey(firstKey)
end

-- gestureButtonNumberTwo Functions
function performgestureButtonNumberTwoGestureUp()
	if debuggingEnabeld then OutputLogMessage("performgestureButtonNumberTwoGestureUp\n") end
	firstKey = "Backspace"
	PressAndReleaseKey(firstKey)

end

function performgestureButtonNumberTwoGestureDown()
	if debuggingEnabeld then OutputLogMessage("performgestureButtonNumberTwoGestureDown\n") end
	firstKey = "Enter"
	PressAndReleaseKey(firstKey)

	
end

function performgestureButtonNumberTwoGestureLeft()
	if debuggingEnabeld then OutputLogMessage("performgestureButtonNumberTwoGestureLeft\n") end
	firstKey = "lshift"
	secondKey = "Tab"
	PressKey(firstKey)
	Sleep(delay)

	PressAndReleaseKey(secondKey)
	ReleaseKey(firstKey)


end

function performgestureButtonNumberTwoGestureRight()
	if debuggingEnabeld then OutputLogMessage("performgestureButtonNumberTwoGestureRight\n") end
	firstKey = "Tab"

	PressAndReleaseKey(firstKey)

end

-- gestureButtonNumberThree Functions
function performgestureButtonNumberThreeGestureUp()
	if debuggingEnabeld then OutputLogMessage("performgestureButtonNumberThreeGestureUp\n") end
	firstKey = "lctrl"
	secondKey = "lshift"
	thirdKey = "5"
	PressKey(firstKey)
	PressKey(secondKey )
	PressAndReleaseKey(thirdKey)
	ReleaseKey(firstKey)
	ReleaseKey(secondKey )
end

function performgestureButtonNumberThreeGestureDown()
	if debuggingEnabeld then OutputLogMessage("performgestureButtonNumberThreeGestureDown\n") end
	firstKey = "lctrl"
	secondKey = "lshift"
	thirdKey = "6"
	PressKey(firstKey)
	PressKey(secondKey )
	PressAndReleaseKey(thirdKey)
	ReleaseKey(firstKey)
	ReleaseKey(secondKey )
end

function performgestureButtonNumberThreeGestureLeft()
	if debuggingEnabeld then OutputLogMessage("performgestureButtonNumberThreeGestureLeft\n") end
	firstKey = "lctrl"
	secondKey = "lshift"
	thirdKey = "7"
	PressKey(firstKey)
	PressKey(secondKey )
	PressAndReleaseKey(thirdKey)
	ReleaseKey(firstKey)
	ReleaseKey(secondKey )
end

function performgestureButtonNumberThreeGestureRight()
	if debuggingEnabeld then OutputLogMessage("performgestureButtonNumberThreeGestureRight\n") end
	firstKey = "lalt"
	thirdKey = "6"
	PressKey(firstKey)
	PressAndReleaseKey(thirdKey)
	ReleaseKey(firstKey)
end