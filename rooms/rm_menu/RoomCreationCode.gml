enum CELLTYPES
{
    emptyHidden = 0,
    emptyRevealed = 1,
	emptyFlagged = 2,
	mineHidden = 3,
	mineRevealed = 4,
	mineFlagged = 5,
}
global.rows = 0
global.columns = 0
global.totalMines = 0
global.board = ds_grid_create(0,0)
global.adjacentMines = ds_grid_create(0,0)