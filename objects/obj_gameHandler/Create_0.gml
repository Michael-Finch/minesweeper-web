/// @description Initialize
rows = 9			//How many rows the board has
columns = 9			//How many columns the board has
totalMines = 10		//How many mines the board has
flags = 0			//How many flags have been set

//Initialize an empty board
for(i = 0; i < rows*columns; ++i)
{
	board[i] = 0
}