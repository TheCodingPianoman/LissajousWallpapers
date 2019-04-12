# LissajousWallpapers
A wallpaper generator that draws Lissajous figures in rainbow colors.

# TODO:
OOP this by using the Figure class. 
A Figure represents a Lissajous figure represented by a curve that holds the PVectors that are used to draw the figure. 
A figure is initialised with its row and col where it should be drawn in the grid. 
From this it derives at which speed the drawing circles have to rotate. 
The Lissajous sketch will then only call tick on the figure classes in order to step forward the angle by the given width.
