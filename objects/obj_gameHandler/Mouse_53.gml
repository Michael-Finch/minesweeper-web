/// @description Detect left click

//Get click position on screen and offset
clickX = device_mouse_x(0)
clickY = device_mouse_y(0)

//Convert to a row and column
clickColumn = floor(clickX/cellSize)
clickRow = floor(clickY/cellSize)

show_debug_message("left click detected at (" + string(clickX) + "," + string(clickY) + ")")

//Check if a valid location is clicked
if((clickRow < rows) && (clickColumn < columns) && (clickRow >= 0) && (clickColumn >= 0))
{
	//If this is the first click, seed the board with mines
	if(gameStarted == false)
	{
		minesPlaced = 0
		while(minesPlaced < totalMines)
		{
			//Pick a random cell and make it a mine if it is not already
			randColumn = irandom(columns-1)
			randRow = irandom(rows-1)
			//Calculate distance from clicked cell
			distanceColumn = abs(randColumn - clickColumn)
			distanceRow = abs(randRow - clickRow)
			//Do not place a mine within 1 tile of the initial click or on an already placed mine
			if((distanceColumn > 1 || distanceRow > 1) && board[randColumn,randRow] != CELLTYPES.mineHidden)
			{
				board[randColumn,randRow] = CELLTYPES.mineHidden
				minesPlaced++
		
				//Update neighboring cells' adjacent mine count
				up = false
				down = false
				left = false
				right = false
				//Check Up
				if(randRow - 1 >= 0)
					up = true
				//Check Down
				if(randRow + 1 < rows)
					down = true
				//Check Left
				if(randColumn - 1 >= 0)
					left = true
				//Check Right
				if(randColumn + 1 < columns)
					right = true
		
				//Increment valid neighbors
				if(up)
					adjacentMines[randColumn,randRow - 1] += 1
				if(down)
					adjacentMines[randColumn,randRow + 1] += 1
				if(left)
					adjacentMines[randColumn - 1,randRow] += 1
				if(right)
					adjacentMines[randColumn + 1,randRow] += 1
				if(up && left)
					adjacentMines[randColumn - 1,randRow - 1] += 1
				if(up && right)
					adjacentMines[randColumn + 1,randRow - 1] += 1
				if(down && left)
					adjacentMines[randColumn - 1,randRow + 1] += 1
				if(down && right)
					adjacentMines[randColumn + 1,randRow + 1] += 1
			}
		}
		//The board has now been seeded and the game has started
		gameStarted = true
	}
	
	//Determine what was clicked and respond accordingly
	clickedCellType = board[clickColumn,clickRow]
	show_debug_message("corresponding cell (" + string(clickColumn) + "," + string(clickRow) + ")")
	
	//Reveal a hidden cell
	if(clickedCellType == CELLTYPES.emptyHidden)
	{
		board[clickColumn,clickRow] = CELLTYPES.emptyRevealed
	}
	//Game lost off cell is a mine
	else if(clickedCellType == CELLTYPES.mineHidden)
	{
		gameLost = true
	}
}


