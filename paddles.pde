final int PADDLES_WIDTH = 40;
final int PADDLES_HEIGHT = 160;
final int PADDLES_HALF_WIDTH = PADDLES_WIDTH/2;
final int PADDLES_HALF_HEIGHT = PADDLES_HEIGHT/2;

int leftPaddleX;
int leftPaddleY;
int leftPaddleDY = 30; 

int rightPaddleX;
int rightPaddleY;
int rightPaddleDY = 30;

void drawPaddles() {
  image(leftPaddleImage, leftPaddleX, leftPaddleY, PADDLES_WIDTH, PADDLES_HEIGHT);
  image(rightPaddleImage, rightPaddleX, rightPaddleY, PADDLES_WIDTH, PADDLES_HEIGHT);
  
  if (abs(ballX - leftPaddleX) < BALL_HALF_SIZE + PADDLES_HALF_WIDTH &&
      abs(ballY - leftPaddleY) < BALL_HALF_SIZE + PADDLES_HALF_HEIGHT ||
      abs(ballX - rightPaddleX) < BALL_HALF_SIZE + PADDLES_HALF_WIDTH &&
      abs(ballY - rightPaddleY) < BALL_HALF_SIZE + PADDLES_HALF_HEIGHT) {
    ballDX *= -1;
    collisionSound.play();
    collisionSound.rewind();
  }
}

void paddleSpawn() {
  leftPaddleX = PADDLES_HALF_WIDTH;
  rightPaddleX = width - 2*PADDLES_HALF_WIDTH;
  leftPaddleY = rightPaddleY = height/2;
}
