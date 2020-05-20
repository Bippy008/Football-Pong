PFont mainFont;

PImage ballImage;
PImage rightPaddleImage;
PImage fieldImage;
PImage menuBackgroundImage;
PImage pauseBackgroundImage;
PImage leftPaddleImage;

void loadImages() {
  ballImage = loadImage("ball.png");
  rightPaddleImage = loadImage("rightPaddle.png");
  fieldImage = loadImage("field.png");
  menuBackgroundImage = loadImage("menuBackground.jpg");
  pauseBackgroundImage = loadImage("pauseBackground.jpg");
  leftPaddleImage = loadImage("leftPaddle.png");
}

void loadFonts() {
  mainFont = createFont("footballShrift.otf", 32);
  textFont(mainFont);
}
