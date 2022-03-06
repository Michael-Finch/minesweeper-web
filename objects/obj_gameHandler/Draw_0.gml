/// @description Draw game
for(i = 0; i < columns; ++i)
{
	for(j = 0; j < rows; ++j)
	{
		//Draw appropriate sprite
		if(board[i,j] == CELLTYPES.emptyHidden)
			draw_sprite(spr_cellHidden, 0, i*cellSize, j*cellSize)
		else if(board[i,j] == CELLTYPES.emptyRevealed)
			draw_sprite(spr_cellEmpty, adjacentMines[i,j], i*cellSize, j*cellSize)
		else if(board[i,j] == CELLTYPES.emptyFlagged)
			draw_sprite(spr_cellFlagged, 0, i*cellSize, j*cellSize)
		else if(board[i,j] == CELLTYPES.mineHidden)
			draw_sprite(spr_cellHidden, 0, i*cellSize, j*cellSize)
		else if(board[i,j] == CELLTYPES.mineRevealed)
			draw_sprite(spr_cellMine, 0, i*cellSize, j*cellSize)
		else if(board[i,j] == CELLTYPES.mineFlagged)
			draw_sprite(spr_cellFlagged, 0, i*cellSize, j*cellSize)
	}
}