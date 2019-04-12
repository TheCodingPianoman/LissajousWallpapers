class Figure
{
  int _rowMultiplier;
  int _colMultiplier;
  float _width;
  float _d;
  float _r;
  Curve _curve;
  float _angle_inc;
  float _x_offset;
  float _y_offset;
  
  public Figure(int col, int row, float w, float inset, float x_offset, float y_offset, float increment,float hue)
  {
    _rowMultiplier = row;
    _colMultiplier = col;
    _curve = new Curve(hue);
    _width = w;
    _d = _width - inset;
    _r = _d / 2;
    _angle_inc = increment;
    _x_offset = x_offset;
    _y_offset = y_offset;
  }
  
  public void tick()
  {
    
  }
  
  public void generate()
  {
    float angle = 0;
    
    while(angle > -TWO_PI && !_curve.isClosed())
    {
      float cx = _x_offset + _colMultiplier * _width + _width / 2;
      float cy = _y_offset + _rowMultiplier * _width + _width / 2;
      float x = _r * cos(angle * (_rowMultiplier + 1) - HALF_PI);
      float y = _r * sin(angle * (_colMultiplier + 1) - HALF_PI);
      _curve.setX(cx + x);
      _curve.setY(cy + y);
      _curve.addPoint();
      angle += _angle_inc;
    }
  }
  
  public void show()
  {
    _curve.show();
  }
}
