/// @description Draw game
for(i = 0; i < columns; ++i)
{
	for(j = 0; j < rows; ++j)
	{
		//Draw in appropriate color
		if(board[i,j] == CELLTYPES.hidden)
			draw_set_color(c_gray)
		else if(board[i,j] == CELLTYPES.revealed)
			draw_set_color(c_ltgray)
		else if(board[i,j] == CELLTYPES.mine)
			if(gameLost)
				draw_set_color(c_red)
			else
				draw_set_color(c_gray)
		draw_rectangle(i*cellSize,j*cellSize,i*cellSize+cellSize,j*cellSize+cellSize,false)
		
		//Draw outline
		draw_set_color(c_dkgray)
		draw_rectangle(i*cellSize,j*cellSize,i*cellSize+cellSize,j*cellSize+cellSize,true)
		
		//Draw adjacent mines if revealed
		if(board[i,j] == CELLTYPES.revealed && adjacentMines[i,j] != 0)
			draw_text(i*cellSize + cellSize/2,j*cellSize,string(adjacentMines[i,j]))
	}
}