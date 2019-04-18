int cols;
int rows;
int w = 400;
int inset = 200;
float x_offset;
float y_offset; 
float angle = 0;
boolean shouldStop;
Figure[][] figures;
float stepwidth = 0.01;
boolean canRender;
boolean figuresGenerating;

PFont font;

void setup()
{
  fullScreen(P2D);
  pixelDensity(displayDensity());
  colorMode(HSB);
  font = createFont("Arial", 38, true);

  cols = width / w;
  rows = height / w;
  x_offset = ((width - (float)cols * w) / 2);
  y_offset = ((height - (float)rows * w) / 2);

  figures = new Figure[rows][cols];

  float hue = 0;
  float hue_inc = 255.0 / (float)(rows * cols);

  for (int row = 0; row < rows; row++)
  {
    for (int col = 0; col < cols; col++)
    {
      figures[row][col] = new Figure(row, col, w, inset, stepwidth, hue);
      hue += hue_inc;
    }
  }

  canRender = false;
  figuresGenerating = false;
}

void generateFigures()
{
  figuresGenerating = true;
  for (int row = 0; row < rows; row++)
  {
    for (int col = 0; col < cols; col++)
    {
      figures[row][col].generate();
    }
  }
  figuresGenerating = false;
  canRender = true;
}

void draw()
{  
  if (!canRender)
  {
    background(0);
    textAlign(CENTER);
    textFont(font);
    fill(255);
    text("Generating figures...", width/2, height/2);
  }

  //In order to be able to draw something while figures are generated, we need to start
  //the thread from within the draw-Loop. Figures only need to be generated, if
  //figures are not generating yet and also cannot be rendered yet.
  if (!figuresGenerating && !canRender)
  {
    thread("generateFigures");
  }

  if (canRender)
  {
    background(0);
    noFill();
    translate(x_offset, y_offset);

    for (int row = 0; row < rows; row++)
    {
      for (int col = 0; col < cols; col++)
      {
        figures[row][col].show();
      }
    }
    saveFrame("lissajous.png");
    stop();
  }
}
