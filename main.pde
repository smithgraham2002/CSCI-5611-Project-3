float scene_scale;
Skeleton s;
float ra0, ra1, ra2;
float rl0, rl1, rl2;
float la0, la1, la2;
float ll0, ll1, ll2;
Vec2 chest;
Circle c1;
Circle c2;

void setup() {
  size(500, 500);
  scene_scale = width / 10.0f;
  s = new Skeleton();
  c1 = new Circle(new Vec2(7.0, 7.0), 1.0);
  c2 = new Circle(new Vec2(3.0, 7.0), 1.0);
  updateArms();
  ra0 = 0.3;
  ra1 = 0.3;
  ra2 = 0.3;
  rl2 = s.r_hand.distanceTo(s.r_finger);
  rl1 = s.r_elbow.distanceTo(s.r_hand);
  rl0 = s.r_shoulder.distanceTo(s.r_elbow);
  la0 = 0.3;
  la1 = 0.3;
  la2 = 0.3;
  ll2 = s.l_hand.distanceTo(s.l_finger);
  ll1 = s.l_elbow.distanceTo(s.l_hand);
  ll0 = s.l_shoulder.distanceTo(s.l_elbow);
}

void rfk() {
  s.r_elbow = new Vec2(cos(ra0) * rl0, sin(ra0) * rl0).plus(s.r_shoulder);
  s.r_hand = new Vec2(cos(ra0 + ra1) * rl1, sin(ra0 + ra1) * rl1).plus(s.r_elbow);
  s.r_finger = new Vec2(cos(ra0 + ra1 + ra2) * rl2, sin(ra0 + ra1 + ra2) * rl2).plus(s.r_hand);
}

void lfk() {
  s.l_elbow = new Vec2(cos(la0) * ll0, sin(la0) * ll0).plus(s.l_shoulder);
  s.l_hand = new Vec2(cos(la0 + la1) * ll1, sin(la0 + la1) * ll1).plus(s.l_elbow);
  s.l_finger = new Vec2(cos(la0 + la1 + la2) * ll2, sin(la0 + la1 + la2) * ll2).plus(s.l_hand);
}

float clamp(float val, float c1, float c2) {
  if (val < c1) {
    val = c1;
  } else if (val > c2) {
    val = c2;
  }
  return val;
}

void r_solve() {
  Vec2 goal = new Vec2(mouseX / scene_scale, mouseY / scene_scale);
  Vec2 correction;
  Vec2 toCircle;
  
  Vec2 startToGoal = goal.minus(s.r_hand);
  Vec2 startToEndEffector = s.r_finger.minus(s.r_hand);
  float dotProd = dot(startToGoal.normalized(), startToEndEffector.normalized());
  dotProd = clamp(dotProd, -1, 1);
  if (cross(startToGoal, startToEndEffector) < 0) {
    ra2 += acos(dotProd);
  } else {
    ra2 -= acos(dotProd);
  }
  if (ra2 > 2.5) {
    ra2 = 2.5;
  }
  if (ra2 < 0.0) {
    ra2 = 0.0;
  }
  rfk();
  
  startToGoal = goal.minus(s.r_elbow);
  startToEndEffector = s.r_finger.minus(s.r_elbow);
  dotProd = dot(startToGoal.normalized(), startToEndEffector.normalized());
  dotProd = clamp(dotProd, -1, 1);
  if (cross(startToGoal, startToEndEffector) < 0) {
    ra1 += acos(dotProd);
  } else {
    ra1 -= acos(dotProd);
  }
  if (ra1 > 3.0) {
    ra1 = 3.0;
  }
  if (ra1 < 0.2) {
    ra1 = 0.2;
  }
  rfk();
  
  startToGoal = goal.minus(s.r_shoulder);
  startToEndEffector = s.r_finger.minus(s.r_shoulder);
  dotProd = dot(startToGoal.normalized(), startToEndEffector.normalized());
  dotProd = clamp(dotProd, -1, 1);
  if (cross(startToGoal, startToEndEffector) < 0) {
    ra0 += acos(dotProd);
  } else {
    ra0 -= acos(dotProd);
  }
  if (ra0 > 1.5) {
    ra0 = 1.5;
  }
  if (ra0 < 0.1) {
    ra0 = 0.1;
  }
  rfk();
}

void l_solve() {
  Vec2 goal = new Vec2(mouseX / scene_scale, mouseY / scene_scale);
  Vec2 correction;
  
  Vec2 startToGoal = goal.minus(s.l_hand);
  Vec2 startToEndEffector = s.l_finger.minus(s.l_hand);
  float dotProd = dot(startToGoal.normalized(), startToEndEffector.normalized());
  dotProd = clamp(dotProd, -1, 1);
  if (cross(startToGoal, startToEndEffector) < 0) {
    la2 += acos(dotProd);
  } else {
    la2 -= acos(dotProd);
  }
  if (la2 > 0) {
    la2 = 0;
  }
  if (la2 < -2.5) {
    la2 = -2.5;
  }
  lfk();
  
  startToGoal = goal.minus(s.l_elbow);
  startToEndEffector = s.l_finger.minus(s.l_elbow);
  dotProd = dot(startToGoal.normalized(), startToEndEffector.normalized());
  dotProd = clamp(dotProd, -1, 1);
  if (cross(startToGoal, startToEndEffector) < 0) {
    la1 += acos(dotProd);
  } else {
    la1 -= acos(dotProd);
  }
  if (la1 > -0.2) {
    la1 = -0.2;
  }
  if (la1 < -3.0) {
    la1 = -3.0;
  }
  lfk();
  
  startToGoal = goal.minus(s.l_shoulder);
  startToEndEffector = s.l_finger.minus(s.l_shoulder);
  dotProd = dot(startToGoal.normalized(), startToEndEffector.normalized());
  dotProd = clamp(dotProd, -1, 1);
  if (cross(startToGoal, startToEndEffector) < 0) {
    la0 += acos(dotProd);
  } else {
    la0 -= acos(dotProd);
  }
  if (la0 > 3.0) {
    la0 = 3.0;
  }
  if (la0 < 1.6) {
    la0 = 1.6;
  }
  lfk();
}

void keyPressed() {
  if (keyCode == UP) {
    s.r_shoulder.y -= 1.0 / scene_scale;
    s.l_shoulder.y -= 1.0 / scene_scale;
  }
  if (keyCode == DOWN) {
    s.r_shoulder.y += 1.0 / scene_scale;
    s.l_shoulder.y += 1.0 / scene_scale;
  }
  if (keyCode == LEFT) {
    s.r_shoulder.x -= 1.0 / scene_scale;
    s.l_shoulder.x -= 1.0 / scene_scale;
  }
  if (keyCode == RIGHT) {
    s.r_shoulder.x += 1.0 / scene_scale;
    s.l_shoulder.x += 1.0 / scene_scale;
  }
}

void updateArms() {
  s.rUpperArm.pos1 = s.r_shoulder;
  s.rUpperArm.pos2 = s.r_elbow;
  s.rLowerArm.pos1 = s.r_elbow;
  s.rLowerArm.pos2 = s.r_hand;
  s.rHand.pos1 = s.r_hand;
  s.rHand.pos2 = s.r_finger;
  
  s.lUpperArm.pos1 = s.l_shoulder;
  s.lUpperArm.pos2 = s.l_elbow;
  s.lLowerArm.pos1 = s.l_elbow;
  s.lLowerArm.pos2 = s.l_hand;
  s.lHand.pos1 = s.l_hand;
  s.lHand.pos2 = s.l_finger;
}

void draw() {
  r_solve();
  l_solve();
  updateArms();
  collision(c1, s.lUpperArm);
  collision(c1, s.lLowerArm);
  collision(c1, s.lHand);
  collision(c1, s.rUpperArm);
  collision(c1, s.rLowerArm);
  collision(c1, s.rHand);
  chest = new Vec2((s.r_shoulder.x + s.l_shoulder.x) / 2, s.r_shoulder.y);
  background(255);
  stroke(0);
  strokeWeight(0.2 * scene_scale);
  line(s.l_shoulder.x * scene_scale, s.l_shoulder.y * scene_scale, s.r_shoulder.x * scene_scale, s.r_shoulder.y * scene_scale);
  line(s.r_shoulder.x * scene_scale, s.r_shoulder.y * scene_scale, s.r_elbow.x * scene_scale, s.r_elbow.y * scene_scale);
  line(s.l_shoulder.x * scene_scale, s.l_shoulder.y * scene_scale, s.l_elbow.x * scene_scale, s.l_elbow.y * scene_scale);
  line(s.r_elbow.x * scene_scale, s.r_elbow.y * scene_scale, s.r_hand.x * scene_scale, s.r_hand.y * scene_scale);
  line(s.l_elbow.x * scene_scale, s.l_elbow.y * scene_scale, s.l_hand.x * scene_scale, s.l_hand.y * scene_scale);
  line(s.r_hand.x * scene_scale, s.r_hand.y * scene_scale, s.r_finger.x * scene_scale, s.r_finger.y * scene_scale);
  line(s.l_hand.x * scene_scale, s.l_hand.y * scene_scale, s.l_finger.x * scene_scale, s.l_finger.y * scene_scale);
  line(chest.x * scene_scale, (chest.y - 1.0) * scene_scale, chest.x * scene_scale, (chest.y + 3.0) * scene_scale);
  ellipse(chest.x * scene_scale, (chest.y - 1.5) * scene_scale, 1.0 * scene_scale, 1.0 * scene_scale);
  ellipse(c1.pos.x * scene_scale, c1.pos.y * scene_scale, c1.r * scene_scale, c1.r * scene_scale);
  ellipse(c2.pos.x * scene_scale, c2.pos.y * scene_scale, c2.r * scene_scale, c2.r * scene_scale);
}
