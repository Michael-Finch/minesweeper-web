/// @description Draw game
for(i = 0; i < rows; ++i)
{
	for(j = 0; j < columns; ++j)
	{
		draw_set_color(c_gray)
		draw_rectangle(j*10,i*10,j*10+10,i*10+10,false)
		draw_set_color(c_dkgray)
		draw_rectangle(j*10,i*10,j*10+10,i*10+10,true)
	}
}