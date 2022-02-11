/// @description Draw game
for(i = 0; i < rows; ++i)
{
	for(j = 0; j < columns; ++j)
	{
		//Draw in appropriate color
		if(board[i * columns + j] == CELLTYPES.hidden)
			draw_set_color(c_gray)
		else if(board[i * columns + j] == CELLTYPES.revealed)
			draw_set_color(c_ltgray)
		else if(board[i * columns + j] == CELLTYPES.mine)
			draw_set_color(c_red)
		draw_rectangle(j*10,i*10,j*10+10,i*10+10,false)
		
		//Draw outline
		draw_set_color(c_dkgray)
		draw_rectangle(j*10,i*10,j*10+10,i*10+10,true)
	}
}