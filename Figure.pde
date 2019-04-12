class Figure
{
  int _rowMultiplier;
  int _colMultiplier;
  Curve _curve;
  
  public Figure(int col, int row, float hue)
  {
    _rowMultiplier = row;
    _colMultiplier = col;
    _curve = new Curve(hue);
  }
  
  public void tick()
  {
    
  }
  
  public void show()
  {
    _curve.show();
  }
}
