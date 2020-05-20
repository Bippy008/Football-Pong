final int BALL_SIZE = 30;
final int BALL_HALF_SIZE = BALL_SIZE/2;

int ballX;
int ballY;
int ballDX = 5;
int ballDY = 5;

void drawBall() {
  
  fill(255);
  image(ballImage, ballX, ballY, BALL_SIZE, BALL_SIZE);
  
  ballX += ballDX;
  ballY += ballDY;
  
  if (ballX - BALL_HALF_SIZE >= width) {
    leftPlayerScore++;
    ballX = width/2;
    ballY = height/2;
    ballDX *= -1;
  }
  if (ballX + BALL_HALF_SIZE < 0) {
    rightPlayerScore++;
    ballX = width/2;
    ballY = height/2;
    ballDX *= -1;
  }
  if (ballY + BALL_HALF_SIZE >= height || ballY - BALL_HALF_SIZE < 0) {
    ballDY *= -1;
  }
  
}

void ballSpawn() {
  ballX = width/2;
  ballY = height/2;
}
