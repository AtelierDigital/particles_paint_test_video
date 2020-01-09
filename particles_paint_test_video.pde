// Baseado na ideia de Daniel Shiffman:
// https://github.com/CodingTrain/Rainbow-Code/tree/master/Tutorials/Processing/11_video/sketch_15_6_frog_particles
//  https://youtu.be/WH31daSj4nc?t=14m53s

import processing.video.*;

Particle[] particles;

Capture video;

void setup()
{ 
  size(1280,720); // use o mesmo tamanho da captura de video
  
  startCameraCapture();

  particles = new Particle [2500];//100];
  for (int i = 0; i < particles.length; i++) {
    particles[i] = new Particle();
  }
  background(0);
}

void draw()
{

  if (video.available() == true) {
    video.read();
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

void startCameraCapture()
{
  String[] cameras = Capture.list();

  if (cameras == null) {
    println("Failed to retrieve the list of available cameras, will try the default...");
    video = new Capture(this, 640, 480);
  } if (cameras.length == 0) {
    println("There are no cameras available for capture.");
    exit();
  } else {
    println("Available cameras:");
    printArray(cameras);

    // The camera can be initialized directly using an element
    // from the array returned by list():
    video = new Capture(this, cameras[0]);
    // Or, the settings can be defined based on the text in the list
    //cam = new Capture(this, 640, 480, "Built-in iSight", 30);
    
    // Start capturing the images from the camera
    video.start();
  }
}
