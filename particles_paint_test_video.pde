// Baseado na ideia de Daniel Shiffman:
// https://github.com/CodingTrain/Rainbow-Code/tree/master/Tutorials/Processing/11_video/sketch_15_6_frog_particles
//  https://youtu.be/WH31daSj4nc?t=14m53s

import processing.video.*;

Particle[] particles;

Movie movie;

void setup()
{ 
  size(1280,720); // use o mesmo tamanho do seu video
  movie = new Movie(this, "tiago_brizolara.mp4"); // esta na pasta data
  movie.loop();

  particles = new Particle [2500];//100];
  for (int i = 0; i < particles.length; i++) {
    particles[i] = new Particle();
  }
  background(0);
}

void draw()
{

  if (movie.available() == true) {
    movie.read();
    movie.loadPixels();
  }
  
  for (int i = 0; i < particles.length; i++) {
    particles[i].display();
    particles[i].move();
  }
  
  //  Descomentando a chamada abaixo, sera criada uma pasta frames para onde serao copiados
  //os frames da execucao. Va no menu Ferramentas->Movie Maker para transformar esses
  //frames em video. http://www.computacaocriativa.com.br/2017/08/20/processing-movie-maker/
  //saveFrame("/frames/teste_Brizo_####.png");
}