class Figure
{
  int _rowMultiplier;
  int _colMultiplier;
  float _width;
  float _d;
  float _r;
  Curve _curve;
  float _angle_inc;

  public Figure(int row, int col, float w, float inset, float increment, float hue)
  {
    _rowMultiplier = row;
    _colMultiplier = col;
    _curve = new Curve(hue, row, col, increment);
    _width = w;
    _d = _width - inset;
    _r = _d / 2;
    _angle_inc = increment;
  }

  public void tick(float angle)
  {
    float cx = _colMultiplier * _width + _width / 2;
    float cy = _rowMultiplier * _width + _width / 2;
    float x = _r * cos(angle * (_colMultiplier + 1) - HALF_PI);
    float y = _r * sin(angle * (_rowMultiplier + 1) - HALF_PI);
    _curve.setX(cx + x);
    _curve.setY(cy + y);
    _curve.addPoint();
  }

  public void generate()
  {
    float angle = 0;

    while (angle > -TWO_PI)
    {
      float cx = _colMultiplier * _width + _width / 2;
      float cy = _rowMultiplier * _width + _width / 2;
      float x = _r * cos(angle * (_colMultiplier + 1) - HALF_PI);
      float y = _r * sin(angle * (_rowMultiplier + 1) - HALF_PI);
      _curve.setX(cx + x);
      _curve.setY(cy + y);
      _curve.addPoint();
      angle -= _angle_inc;
    }
  }

  public void show()
  {
    _curve.show();
  }
}
