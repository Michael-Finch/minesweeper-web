/// @description Initialize
cellSize = 10					//How large the cells are in pixels
rows = global.rows				//How many rows the board has
columns = global.columns		//How many columns the board has
totalMines = global.totalMines	//How many mines the board has
flags = 0						//How many flags have been set
gameLost = false				//Whether or not the player has clicked a mine and lost

//Initialize an empty board
//0 = hidden, 1 = revealed empty, 2 = mine
for(i = 0; i < rows; ++i)
{
	for(j = 0; j < columns; ++j)
	{
		board[i,j] = CELLTYPES.hidden
		neighbors[i,j] = 0
	}
}

//Seed board with mines
minesPlaced = 0
while(minesPlaced < totalMines)
{
	//Pick a random cell and make it a mine if it is not already
	randRow = irandom(rows-1)
	randColumn = irandom(columns-1)
	if(board[randRow,randColumn] != CELLTYPES.mine)
	{
		board[randRow,randColumn] = CELLTYPES.mine
		minesPlaced++
	}
}