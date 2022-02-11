/// @description Detect click

//Get click position on screen
clickX = device_mouse_x(0)
clickY = device_mouse_y(0)

//Convert to a row and column
clickColumn = floor(clickX/10)
clickRow = floor(clickY/10)

show_debug_message("click detected at (" + string(clickX) + "," + string(clickY) + ")")

//Reveal click cell if valid
if((clickRow < rows) && (clickColumn < columns) && (clickRow >= 0) && (clickColumn >= 0))
{
	show_debug_message("corresponding cell (" + string(clickColumn) + "," + string(clickRow) + ")")
	if(board[clickRow * columns + clickColumn] != CELLTYPES.revealed)
	{
		board[clickRow * columns + clickColumn] = CELLTYPES.revealed
	}
}


