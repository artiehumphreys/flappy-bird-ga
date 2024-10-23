Bird a1;
ArrayList<Pipes> listOfPipes;

void setup() {
  size(3000, 1500);
  a1 = new Bird();
  listOfPipes = new ArrayList<Pipes>();

  for (int i = 0; i < 5; i++) {
    listOfPipes.add(new Pipes(1000 + i * 750));
  }
}

boolean game = true;

void draw() {

  //game mechanics

  if (game) { //while the sprite hasn't touched a pipe
    background(135, 206, 235);
    a1.fall();
    a1.update();

    for (int i = 0; i < listOfPipes.size(); i++) {
      listOfPipes.get(i).advance();
    }

    //redrawing pipes

    if (listOfPipes.get(0).x <= -300) {
      listOfPipes.add(new Pipes(listOfPipes.get(4).x + 750));
      listOfPipes.remove(0);
    }

    //drawing

    fill(255, 245, 0);
    rect(a1.x, a1.y, a1.width, a1.height);

    fill(0, 255, 245);
    for (int i = 0; i < 5; i++) {
      Pipes pipes = listOfPipes.get(i);
      rect(pipes.x, - 100, pipes.width, 100 + pipes.y-(pipes.space/2));
      rect(pipes.x, pipes.y+(pipes.space/2), pipes.width, 200 + height - (pipes.y + pipes.space/2));
    }

    //collision detection

    Pipes pipes = listOfPipes.get(0);

    if (a1.isIntersecting(pipes)){
      game = false;
    }
  }
}

void keyPressed() {
  if (keyCode == UP) a1.flap();
}
