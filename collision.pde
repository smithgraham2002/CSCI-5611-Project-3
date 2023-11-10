void collision(Circle cir, Line l) {
  Vec2 toCircle = cir.pos.minus(l.pos1);
  Vec2 l_dir = l.pos2.minus(l.pos1);
  float l_len = l_dir.length();
  l_dir.normalize();
  
  float a = 1;
  float b = -2 * dot(l_dir, toCircle);
  float c = toCircle.lengthSqr() - (cir.r * cir.r);
  
  float d = b * b - 4 * a * c;
  
  if (d >= 0) {
    float t1 = (-b - sqrt(d)) / (2 * a);
    if (t1 > 0 && t1 < l_len && t1 < 9999999) {
      cir.pos.subtract(toCircle.normalize);
    }
  } 
}
