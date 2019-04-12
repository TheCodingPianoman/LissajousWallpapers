int cols;
int rows;
int w = 200;
float x_offset;
float y_offset; 
float angle = 0;
boolean shouldStop;
Curve[][] curves;
Figure[][] figures;
float stepwidth = 0.01;
boolean canRender;

void setup()
{
  fullScreen(P2D);
  pixelDensity(displayDensity());
  colorMode(HSB);

  cols = width / w;
  rows = height / w;
  x_offset = (width - (float)cols * w) / 2;
  y_offset = (height - (float)rows * w) / 2;
  figures = new Figure[rows][cols];

  float hue = 0;
  float hue_inc = 255.0 / (float)(rows * cols);

  for (int row = 0; row < rows; row++)
  {
    for (int col = 0; col < cols; col++)
    {
      figures[row][col] = new Figure(row, col, w, 20, 0.01, x_offset, y_offset, hue);
      hue += hue_inc;
    }
  }

  canRender = false;
  thread("generateFigures");
}

void generateFigures()
{
  for (int row = 0; row < rows; row++)
  {
    for (int col = 0; col < cols; col++)
    {
      figures[row][col].generate();
    }
  }
  canRender = true;
}

void draw()
{  
  background(0);
  noFill();

  if (canRender)
  {
    for (int row = 0; row < rows; row++)
    {
      for (int col = 0; col < cols; col++)
      {
        figures[row][col].show();
      }
    }

    saveFrame("lissajous.png");
    exit();
  }
}
