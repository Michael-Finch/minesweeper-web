/// @description Initialize
cellSize = 10					//How large the cells are in pixels
rows = global.rows				//How many rows the board has
columns = global.columns		//How many columns the board has
totalMines = global.totalMines	//How many mines the board has
flags = 0						//How many flags have been set

//Initialize an empty board
//0 = hidden, 1 = revealed empty, 2 = mine
for(i = 0; i < rows*columns; ++i)
{
	board[i] = CELLTYPES.hidden
}

//Seed board with mines
minesPlaced = 0
while(minesPlaced < totalMines)
{
	//Pick a random cell and make it a mine if it is not already
	rand = irandom(rows*columns - 1)
	if(board[rand] != CELLTYPES.mine)
	{
		board[rand] = CELLTYPES.mine
		minesPlaced++
	}
}