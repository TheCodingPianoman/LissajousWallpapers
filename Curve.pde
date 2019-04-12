class Curve
{
  ArrayList<PVector> _path;
  PVector _current;
  float _hue;
  boolean _closed;
  int _row;
  int _col;
  float _stepwidth;
  
  
  public Curve(float hue, int row, int col, float stepwidth)
  {
    _path = new ArrayList<PVector>();
    _current = new PVector();
    _hue = hue;
    _closed = false;
    _row = row;
    _col = col;
    _stepwidth = stepwidth;
  }
  
  public void addPoint()
  {
    _path.add(_current);
    _current = new PVector();
  }
  
  public void setX(float x)
  {
    _current.x = x;
  }
  
  public void setY(float y)
  {
    _current.y = y;
  }
  
  public boolean isClosed()
  {
    return _closed;
  }
  
  public void show()
  {
    stroke(_hue, 128, 255);
    strokeWeight(2);
    noFill();
    beginShape();
    for(PVector v: _path)
    {
      vertex(v.x, v.y);
    }
    endShape();
  }
}
