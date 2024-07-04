import gifAnimation.*;
import ddf.minim.*;

Gif img;
PImage[] band = new PImage[4]; 
float bandScale = 0.9; 
Minim minim;
AudioPlayer player;

void setup() {
  size(1000, 600);
  smooth();
  
  // Inisialisasi GIF dan gambar band
  img = new Gif(this, "panggung.gif");
  img.loop();
  band[0] = loadImage("band00.gif");
  band[1] = loadImage("band01.gif");
  band[2] = loadImage("band02.gif");
  band[3] = loadImage("band03.gif");

  // Inisialisasi Minim dan muat file audio
  minim = new Minim(this);
  player = minim.loadFile("musik.mp3"); // Ganti dengan nama file audio Anda
  player.loop();
}

void draw() {
  image(img, 0, 0, width, height);
  
  pushMatrix();
  scale(bandScale);
  image(band[frameCount % 4], 270 / bandScale,99 / bandScale); // Menggunakan % 4 karena hanya ada 4 gambar
  popMatrix();
}

void stop() {
  // Hentikan player dan tutup Minim saat sketch dihentikan
  player.close();
  minim.stop();
  super.stop();
}
