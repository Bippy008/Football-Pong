final int MENU_STATE = 1;
final int GAME_STATE = 2;
final int PAUSE_STATE = 3;

int state = MENU_STATE;

final int SCORE_TEXT_SIZE = 150;
final int SCORE_MARGIN_TOP = 100;
final int SCORE_MARGIN_SIDE = 200;

int leftPlayerScore; 
int rightPlayerScore;


void setup() {
  fullScreen();
  background(0);
  noStroke();
  imageMode(CENTER);
  
  ballSpawn();
  paddleSpawn();
  loadSounds();
  loadImages();
  loadFonts();
}

void draw() {
  background(0);
  
  switch (state) {
    case MENU_STATE:
      drawMenu();
      break;
    case GAME_STATE:
      drawGame();
      break;
    case PAUSE_STATE:
      drawPause();
      break;
  }
}

void drawMenu() {
  image(menuBackgroundImage, width/2, height/2, width, height);
  
  fill(255);
  textSize(100);
  textAlign(CENTER, CENTER);
  text("Football-pong!", width/2, height/2);
  
  fill(200);
  textSize(50);
  text("Press UP and DOWN to control the right footballers", width/2, height/2 + 100);
  text("Press W and S to control the left footballers", width/2, height/2 + 150);
}

void drawPause() {
  image(pauseBackgroundImage, width/2, height/2, width, height);
  
  fill(255);
  textSize(100);
  textAlign(CENTER, CENTER);
  text("You paused the game", width/2, height/2);
  
  textSize(50);
  text("If you want to return, press the spacebar", width/2, height/2 + 100);
}

void drawGame() {
  image(fieldImage, width/2, height/2, width, height);
  
  drawBall();
  drawPaddles();
  
  textSize(SCORE_TEXT_SIZE);
  textAlign(CENTER, CENTER);
  text(leftPlayerScore, SCORE_MARGIN_SIDE, SCORE_MARGIN_TOP);
  text(rightPlayerScore, width - SCORE_MARGIN_SIDE, SCORE_MARGIN_TOP);
}

void keyPressed() {
  switch (state) {
    case MENU_STATE:
      keyPressedInMenu();
      break;
    case GAME_STATE:
      keyPressedInGame();
      break;
    case PAUSE_STATE:
      keyPressedOnPause();
      break;
  }
}

void keyPressedInMenu() {
  if (keyCode == ENTER) {
    state = GAME_STATE;
    leftPlayerScore = 0; 
    rightPlayerScore = 0;
    transitionSound.play();
    transitionSound.rewind();
  }
}

void keyPressedInGame() {
  switch (keyCode) {
    case UP:
      rightPaddleY -= rightPaddleDY;
    break;
    case DOWN:
      rightPaddleY += rightPaddleDY;
      
    break;
  }
  switch (key) {
    case 'w':
    case 'W':
      leftPaddleY -= leftPaddleDY;
    break;
    case 's':
    case 'S':
      leftPaddleY += leftPaddleDY;
    break;
  }
    leftPaddleY = constrain(leftPaddleY, PADDLES_HALF_HEIGHT, height - PADDLES_HALF_HEIGHT);
    rightPaddleY = constrain(rightPaddleY, PADDLES_HALF_HEIGHT, height - PADDLES_HALF_HEIGHT);  
  if (key == ' ') {
    state = PAUSE_STATE;
    transitionSound.play();
    transitionSound.rewind();
  }
}

void keyPressedOnPause() {
  if (key == ' ') {
    state = GAME_STATE;
    transitionSound.play();
    transitionSound.rewind();
  }
}
