/// @description Initialize
cellSize = 10					//How large the cells are in pixels
rows = global.rows				//How many rows the board has
columns = global.columns		//How many columns the board has
totalMines = global.totalMines	//How many mines the board has
flags = 0						//How many flags have been set
gameLost = false				//Whether or not the player has clicked a mine and lost

//Initialize an empty board
//0 = hidden, 1 = revealed empty, 2 = mine
for(i = 0; i < columns; ++i)
{
	for(j = 0; j < rows; ++j)
	{
		board[i,j] = CELLTYPES.hidden
		adjacentMines[i,j] = 0
	}
}

//Seed board with mines
minesPlaced = 0
while(minesPlaced < totalMines)
{
	//Pick a random cell and make it a mine if it is not already
	randColumn = irandom(columns-1)
	randRow = irandom(rows-1)
	if(board[randColumn,randRow] != CELLTYPES.mine)
	{
		board[randColumn,randRow] = CELLTYPES.mine
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
			adjacentMines[randColumn - 1,randRow] += 1
		if(down)
			adjacentMines[randColumn + 1,randRow] += 1
		if(left)
			adjacentMines[randColumn,randRow - 1] += 1
		if(right)
			adjacentMines[randColumn,randRow + 1] += 1
		if(up && left)
			adjacentMines[randColumn - 1,randRow - 1] += 1
		if(up && right)
			adjacentMines[randColumn - 1,randRow + 1] += 1
		if(down && left)
			adjacentMines[randColumn + 1,randRow - 1] += 1
		if(down && right)
			adjacentMines[randColumn + 1,randRow + 1] += 1
	}
}