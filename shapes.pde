public class Circle {
  public Vec2 pos;
  public float r;
  
  public Circle(Vec2 p, float rad) {
    pos = p;
    r = rad;
  }
}

public class Line {
  public Vec2 pos1;
  public Vec2 pos2;
  
  public Line(Vec2 p1, Vec2 p2) {
    pos1 = p1;
    pos2 = p2;
  }
}
