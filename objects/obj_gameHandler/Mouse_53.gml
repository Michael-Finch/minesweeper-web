/// @description Detect click

//Get click position on screen and offset
clickX = device_mouse_x(0)
clickY = device_mouse_y(0)

//Convert to a row and column
clickColumn = floor(clickX/cellSize)
clickRow = floor(clickY/cellSize)

show_debug_message("click detected at (" + string(clickX) + "," + string(clickY) + ")")

//Reveal click cell if valid
if((clickRow < rows) && (clickColumn < columns) && (clickRow >= 0) && (clickColumn >= 0))
{
	clickedCellType = board[clickColumn,clickRow]
	show_debug_message("corresponding cell (" + string(clickColumn) + "," + string(clickRow) + ")")
	
	//Reveal a hidden cell
	if(clickedCellType == CELLTYPES.hidden)
		board[clickColumn,clickRow] = CELLTYPES.revealed
	//Game lost off cell is a mine
	else if(clickedCellType == CELLTYPES.mine)
		gameLost = true
}


