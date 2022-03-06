/// @description Initialize
//Randmize the game seed
randomize()

//Variables for keeping track of the game
cellSize = sprite_get_height(spr_cellHidden)	//How large the cells are in pixels
rows = global.rows								//How many rows the board has
columns = global.columns						//How many columns the board has
totalMines = global.totalMines					//How many mines the board has
flags = 0										//How many flags have been set
gameStarted = false								//Whether or not the player has clicked the first cell and seeded the board
gameLost = false								//Whether or not the player has clicked a mine and lost

//Set camera to center of board
camOffsetX = columns/2 * cellSize - view_wport[0] / 2
camOffsetY = rows/2 * cellSize - view_hport[0] / 2
camera_set_view_pos(view_camera[0], camOffsetX, camOffsetY);

//Initialize an empty board
//0 = hidden empty, 1 = revealed empty, 2 = mine, 3 = hidden flagged, 4 = mine flagged
for(i = 0; i < columns; ++i)
{
	for(j = 0; j < rows; ++j)
	{
		board[i,j] = CELLTYPES.hidden
		adjacentMines[i,j] = 0
	}
}