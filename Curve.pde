class Curve
{
  ArrayList<PVector> _path;
  PVector _current;
  float _hue;
  boolean _closed;
  
  
  public Curve(float hue)
  {
    _path = new ArrayList<PVector>();
    _current = new PVector();
    _hue = hue;
    _closed = false;
  }
  
  public void addPoint()
  {
    if(_path.isEmpty() || _current.x != _path.get(0).x && _current.y != _path.get(0).y)
    {
      _path.add(_current);
    }
    else
    {
      _closed = true;
    }
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
    
    //strokeWeight(8);
    //point(_path.get(_path.size() - 1).x, _path.get(_path.size() - 1).y); 
  }
}
