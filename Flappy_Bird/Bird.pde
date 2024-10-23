class Bird {
  int x = 250;
  int y = 300;
  int g = 7;
  int width = 25;
  int height = 25;

  void flap() {
    g = g * -1 - 8;
  }

  void fall() {
    if (g < 7) g+=1;
  }

  void update() {
    y += g;
  }

  boolean isIntersecting(Pipes pipe) {
    int screenHeight = 1500;
    float birdX = this.x;
    float birdY = this.y;
    float birdWidth = this.width;
    float birdHeight = this.height;

    float topPipeX = pipe.x;
    float topPipeY = -100;
    float topPipeWidth = pipe.width;
    float topPipeHeight = 100 + pipe.y - (pipe.space / 2);

    float bottomPipeX = pipe.x;
    float bottomPipeY = pipe.y + (pipe.space / 2);
    float bottomPipeWidth = pipe.width;
    float bottomPipeHeight = 200 + screenHeight - (pipe.y + (pipe.space / 2));

    boolean collisionWithTop = rectsOverlap(birdX, birdY, birdWidth, birdHeight,
      topPipeX, topPipeY, topPipeWidth, topPipeHeight);

    boolean collisionWithBottom = rectsOverlap(birdX, birdY, birdWidth, birdHeight,
      bottomPipeX, bottomPipeY, bottomPipeWidth, bottomPipeHeight);

    return collisionWithTop || collisionWithBottom;
  }

  boolean rectsOverlap(float x1, float y1, float w1, float h1,
    float x2, float y2, float w2, float h2) {
    return x1 < x2 + w2 &&
      x1 + w1 > x2 &&
      y1 < y2 + h2 &&
      y1 + h1 > y2;
  }
}
