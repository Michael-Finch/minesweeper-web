/// @description Detect right click

//Get click position on screen and offset
clickX = device_mouse_x(0)
clickY = device_mouse_y(0)

//Convert to a row and column
clickColumn = floor(clickX/cellSize)
clickRow = floor(clickY/cellSize)

show_debug_message("right click detected at (" + string(clickX) + "," + string(clickY) + ")")

//Check if a valid location is clicked
if((clickRow < rows) && (clickColumn < columns) && (clickRow >= 0) && (clickColumn >= 0))
{
	//Don't continue if the game hasn't started yet
	if(gameStarted == true)
	{
		//Determine what was clicked and respond accordingly
		clickedCellType = board[clickColumn,clickRow]
		show_debug_message("corresponding cell (" + string(clickColumn) + "," + string(clickRow) + ")")
		
		//Flag an unflagged cell
		if(clickedCellType == CELLTYPES.hidden)
		{
			board[clickColumn,clickRow] = CELLTYPES.hiddenFlagged
			flags++
		}
		else if(clickedCellType == CELLTYPES.mine)
		{
			board[clickColumn,clickRow] = CELLTYPES.mineFlagged
			flags++
		}
		//Unflag a flagged cell
		else if(clickedCellType == CELLTYPES.hiddenFlagged)
		{
			board[clickColumn,clickRow] = CELLTYPES.hidden
			flags--
		}
		else if(clickedCellType == CELLTYPES.mineFlagged)
		{
			board[clickColumn,clickRow] = CELLTYPES.mine
			flags--
		}
	}
}