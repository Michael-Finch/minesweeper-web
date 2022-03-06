/// @description Draw game
for(i = 0; i < columns; ++i)
{
	for(j = 0; j < rows; ++j)
	{
		//Draw appropriate sprite
		if(board[i,j] == CELLTYPES.hidden)
			draw_sprite(spr_cellHidden, 0, i*cellSize, j*cellSize)
		else if(board[i,j] == CELLTYPES.revealed)
			draw_sprite(spr_cellRevealed, adjacentMines[i,j], i*cellSize, j*cellSize)
		else if(board[i,j] == CELLTYPES.mine)
			if(gameLost)
				draw_sprite(spr_cellMine, 0, i*cellSize, j*cellSize)
			else
				draw_sprite(spr_cellHidden, 0, i*cellSize, j*cellSize)
		//Flags
		else if(board[i,j] == CELLTYPES.hiddenFlagged)
			draw_sprite(spr_cellFlagged, 0, i*cellSize, j*cellSize)
		else if(board[i,j] == CELLTYPES.mineFlagged)
			draw_sprite(spr_cellFlagged, 0, i*cellSize, j*cellSize)
	}
}