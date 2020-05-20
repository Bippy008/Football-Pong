import ddf.minim.*;

Minim minim;
AudioPlayer collisionSound;
AudioPlayer transitionSound;

void loadSounds() {
  minim = new Minim(this);
  collisionSound = minim.loadFile("collision.wav");
  transitionSound = minim.loadFile("transition.wav");
}
