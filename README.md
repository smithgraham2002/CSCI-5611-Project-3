# CSCI-5611-Project-3
Graham Smith

![image](https://github.com/smithgraham2002/CSCI-5611-Project-3/assets/103609167/7476dcb2-8d2b-42be-88c1-0d0c14dbd8a3)

Single Arm IK: I implemented inverse kinematics to allow one arm to move freely. The arm has three segments and two joints. It is held in place by a root at the shoulder, and the orientation of the arm is changed using an end effector at the hand.
Multi-Arm IK: I added a second arm to the skeleton to make it appear more humanlike. The second arm employs reverse kinematics in the same way that the first arm does.
Joint Limits: In order to make the skeleton's movement more realistic, I added limits to the joints to prevent them from rotating past a certain point. This change causes the skeleton's movement to appear more realistic.
IK Obstacles: I added several circles to the scene that the skeleton can interact with.
User Interaction: By moving the mouse, the user can control where the arms point to. By pressing the arrow keys, the user can move the skeleton's body, including the roots of the arms.
Moving IK: The skeleton's body can be moved entirely. This causes the roots of the arms to move.

[![Full Demo](https://img.youtube.com/vi/<VIDEO_ID>/hqdefault.jpg)](https://youtu.be/ejL32UBxWD8)

When I was creating the skeleton simulation, I found that it was very difficult to get the arms to remain the same length while moving the end effector. After changing the variables representing the length of each limb to have an initial value, the simultation ran much more smoothly. In addition, the mouse inputs were originally unreliable, though after taking another look at the inverse kinematics code I have written, I was able to fix the issue. Finally, adding limits to the joints to prevent them from bending past certain angles and looking unrealistic was quite challenging. It took some experimentation to find the angles that looked best for both arms. 
