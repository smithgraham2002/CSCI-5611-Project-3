public class Vec2 {
  public float x, y;
  
  public Vec2(float x, float y){
    this.x = x;
    this.y = y;
  }
  
  public float length(){
    return sqrt(x*x+y*y);
  }
  
  public float lengthSqr(){
    return x * x + y * y;
  }
  
  public Vec2 plus(Vec2 vec){
    return new Vec2(x+vec.x, y+vec.y);
  }
  
  public void add(Vec2 vec){
    x += vec.x;
    y += vec.y;
  }
  
  public Vec2 minus(Vec2 vec){
    return new Vec2(x-vec.x, y-vec.y);
  }
  
  public void subtract(Vec2 vec){
    x -= vec.x;
    y -= vec.y;
  }
  
  public Vec2 times(float scal){
    return new Vec2(x*scal, y*scal);
  }
  
  public void mul(float scal){
    x *= scal;
    y *= scal;
  }
  
  public void clampToLength(float max){
    float mag = sqrt(x*x+y*y);
    if (mag > max){
      x *= max/mag;
      y *= max/mag;
    }
  }
  
  public void setToLength(float len){
    float mag = sqrt(x*x+y*y);
    x *= len/mag;
    y *= len/mag;
  }
  
  public void normalize(){
    float mag = sqrt(x*x+y*y);
    x /= mag;
    y /= mag;
  }
  
  public Vec2 normalized(){
    float mag = sqrt(x*x+y*y);
    return new Vec2(x/mag, y/mag);
  }
  
  public float distanceTo(Vec2 vec){
    float dx = vec.x - x;
    float dy = vec.y - y;
    return sqrt(dx*dx + dy*dy);
  }
}

float dot(Vec2 a, Vec2 b){
  return a.x*b.x+a.y*b.y;
}

float cross(Vec2 v1, Vec2 v2){
  return v1.x*v2.y-v1.y*v2.x;
}
