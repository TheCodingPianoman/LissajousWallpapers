int cols;
int rows;
int w = 200;
float x_offset;
float y_offset; 
float angle = 0;
boolean shouldStop;
Curve[][] curves;
float stepwidth = 0.01;

void setup()
{
  fullScreen(P2D);
  pixelDensity(displayDensity());
  colorMode(HSB);
  
  cols = width / w;
  rows = height / w;
  x_offset = (width - (float)cols * w) / 2;
  y_offset = (height - (float)rows * w) / 2;
  curves = new Curve[rows][cols];
  
  shouldStop = false;
  
  float hue = 0;
  float hue_inc = 255.0 / (float)(rows * cols);

  for (int row = 0; row < rows; row++)
  {
    for (int col = 0; col < cols; col++)
    {
      curves[row][col] = new Curve(hue);
      hue += hue_inc;
    }
  }
}

void draw()
{
  if(shouldStop)
  {
    exit();
  }
  
  background(0);
  noFill();

  float d = w - 10;
  float r = d/ 2;

  //draw cols
  for (int i = 0; i < cols; i++)
  {
    float cx = x_offset + i * w + w / 2; //w + i * w + w / 2;
    float cy = w / 2;
    //stroke(255, 80);
    //strokeWeight(1);
    //ellipse(cx, cy, d, d);

    float x = r * cos(angle * (i + 1) - HALF_PI);
    float y = r * sin(angle * (i + 1) - HALF_PI);

    //strokeWeight(8);
    //stroke(255);
    //point(cx + x, cy + y);

    //stroke(255, 50);
    //strokeWeight(1);
    //line(cx + x, 0, cx + x, height);

    for (int row = 0; row < rows; row++)
    {
      curves[row][i].setX(cx + x);
    }
  }

  //draw rows
  for (int i = 0; i < rows; i++)
  {
    float cy = y_offset + i * w + w / 2; //w + i * w + w / 2;
    float cx = w / 2;
    //stroke(255, 80);
    //strokeWeight(1);
    //ellipse(cx, cy, d, d);

    float x = r * cos(angle * (i + 1) - PI / 2);
    float y = r * sin(angle * (i + 1) - PI / 2);

    //strokeWeight(8);
    //stroke(255);
    //point(cx + x, cy + y);

    //stroke(255, 50);
    //strokeWeight(1);
    //line(0, cy + y, width, cy + y);

    for (int col = 0; col < cols; col++)
    {
      curves[i][col].setY(cy + y);
    }
  }

  //draw the figures
  for (int row = 0; row < rows; row++)
  {
    for (int col = 0; col < cols; col++)
    {
      curves[row][col].addPoint();
      curves[row][col].show();
    }
  }

  angle -= stepwidth;

  if (angle < -TWO_PI)
  {
    saveFrame("lissajous.png");
    shouldStop = true;
  }
}
