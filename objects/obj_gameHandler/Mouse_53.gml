/// @description Detect left click

//Only continue if the game is not lost
if(gameLost == false)
{
	//Get click position on screen and offset
	clickX = device_mouse_x(0)
	clickY = device_mouse_y(0)

	//Convert to a row and column
	clickColumn = floor(clickX/cellSize)
	clickRow = floor(clickY/cellSize)

	show_debug_message("left click detected at (" + string(clickX) + "," + string(clickY) + ")")
	show_debug_message("corresponding cell (" + string(clickColumn) + "," + string(clickRow) + ")")

	//Check if a valid location is clicked
	if((clickRow < rows) && (clickColumn < columns) && (clickRow >= 0) && (clickColumn >= 0))
	{
		//If this is the first click, seed the board with mines
		if(gameStarted == false)
		{
			show_debug_message("First click detected, seeding board")
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
				if((distanceColumn > 1 || distanceRow > 1) && ds_grid_get(global.board, randColumn, randRow) != CELLTYPES.mineHidden)
				{
					ds_grid_set(global.board, randColumn, randRow, CELLTYPES.mineHidden)
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
						ds_grid_add(global.adjacentMines, randColumn, randRow - 1, 1)
					if(down)
						ds_grid_add(global.adjacentMines, randColumn, randRow + 1, 1)
					if(left)
						ds_grid_add(global.adjacentMines, randColumn - 1, randRow, 1)
					if(right)
						ds_grid_add(global.adjacentMines, randColumn + 1, randRow, 1)
					if(up && left)
						ds_grid_add(global.adjacentMines, randColumn - 1, randRow - 1, 1)
					if(up && right)
						ds_grid_add(global.adjacentMines, randColumn + 1, randRow - 1, 1)
					if(down && left)
						ds_grid_add(global.adjacentMines, randColumn - 1, randRow + 1, 1)
					if(down && right)
						ds_grid_add(global.adjacentMines, randColumn + 1, randRow + 1, 1)
				}
			}
			//The board has now been seeded and the game has started
			gameStarted = true
			show_debug_message("Seeding done, game started")
		}
		
		//Determine what was clicked and respond accordingly
		clickedCellType = ds_grid_get(global.board, clickColumn, clickRow)
	
		//Reveal a hidden cell and flood fill reveal neighbors
		if(clickedCellType == CELLTYPES.emptyHidden)
		{
			reveal_cell(clickColumn,clickRow)
		}
		//Game lost off cell is a mine
		else if(clickedCellType == CELLTYPES.mineHidden)
		{
			gameLost = true
			//Reveal all mines
			for(i = 0; i < columns; ++i)
			{
				for(j = 0; j < rows; ++j)
				{
					if(ds_grid_get(global.board, i, j) == CELLTYPES.mineHidden || ds_grid_get(global.board, i, j) == CELLTYPES.mineFlagged)
					{
						ds_grid_set(global.board, i, j, CELLTYPES.mineRevealed)
					}
				}
			}
		}
	}
}