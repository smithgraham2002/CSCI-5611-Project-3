public class Skeleton {
  public Vec2 r_shoulder;
  public Vec2 l_shoulder;
  public Vec2 r_elbow;
  public Vec2 l_elbow;
  public Vec2 r_hand;
  public Vec2 l_hand;
  public Vec2 r_finger;
  public Vec2 l_finger;
  public Line lUpperArm, lLowerArm, lHand;
  public Line rUpperArm, rLowerArm, rHand;
  
  //public Skeleton(Vec2 s, Vec2 re, Vec2 le, Vec2 rh, Vec2 lh) {
  //  shoulder = s;
  //  r_elbow = re;
  //  l_elbow = le;
  //  r_hand = rh;
  //  l_hand = lh;
  //}
  
  public Skeleton() {
    r_shoulder = new Vec2(6.0, 5.0);
    l_shoulder = new Vec2(4.0, 5.0);
    r_elbow = new Vec2(8.0, 7.0);
    l_elbow = new Vec2(2.0, 7.0);
    r_hand = new Vec2(8.0, 9.0);
    l_hand = new Vec2(2.0, 9.0);
    r_finger = new Vec2(8.0, 10.0);
    l_finger = new Vec2(2.0, 10.0);
    
    rUpperArm = new Line(r_shoulder, r_elbow);
    rLowerArm = new Line(r_elbow, r_hand);
    rHand = new Line(r_hand, r_finger);
    
    lUpperArm = new Line(l_shoulder, l_elbow);
    lLowerArm = new Line(l_elbow, l_hand);
    lHand = new Line(l_hand, l_finger);
  }
}
