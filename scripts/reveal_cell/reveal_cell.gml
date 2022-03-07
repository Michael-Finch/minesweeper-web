//This function recursively flood-fills to reveal neighbors of a revealed empty cell
function reveal_cell(col, row){
	//Make sure cell is within the board
	if(col >= 0 && col < global.columns && row >= 0 && row < global.rows)
	{
		//Make sure this is a hidden empty cell
		if(ds_grid_get(global.board, col, row) == CELLTYPES.emptyHidden)
		{
			//Reveal this cell
			ds_grid_set(global.board, col, row, CELLTYPES.emptyRevealed)
			//Recursively reveal neighbors
			if(ds_grid_get(global.adjacentMines, col, row) == 0)
			{
				reveal_cell(col,row-1)
				reveal_cell(col,row+1)
				reveal_cell(col-1,row)
				reveal_cell(col+1,row)
				reveal_cell(col-1,row-1)
				reveal_cell(col+1,row-1)
				reveal_cell(col-1,row+1)
				reveal_cell(col+1,row+1)
			}
		}
	}
}