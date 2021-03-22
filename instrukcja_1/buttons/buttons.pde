/**
 * ControlP5 Button
 * this example shows how to create buttons with controlP5.
 * 
 * find a list of public methods available for the Button Controller 
 * at the bottom of this sketch's source code
 *
 * by Andreas Schlegel, 2012
 * www.sojamo.de/libraries/controlp5
 *
 */
 
import controlP5.*; //importowanie biblioteki od kontrolek

ControlP5 cp5;
color currentColor = color(0,0,0);

void setup() {
  size(400,600);
  noStroke();
  cp5 = new ControlP5(this);
  
  cp5.addButton("colorRed") //utworzenie kontrolki button o nazwie colorRed
     .setValue(0) //ustawienie wartosci kontrolki na 0
     .setPosition(100,100) //polozenie kontrolki na ekranie
     .setSize(200,19) //rozmiar kontrolki
     ;
  
  cp5.addButton("colorGreen")
     .setPosition(100,120)
     .setSize(200,19)
     ;

  PImage[] imgs = {loadImage("button1.PNG"),loadImage("button2.PNG"),loadImage("button3.PNG")}; //zmienna tablicowa przechowujaca nazwy grafik
  cp5.addButton("play") //utworzenie przycisku play
     .setValue(128)
     .setPosition(140,300)
     .setImages(imgs)  //ustawienie zdjec jako wyglad przycisku
     .updateSize()    //zmiana rozmiwaru przycisku, dopasowanie do zdjecia
     ;
}

void draw() {
  background(currentColor);
}

public void controlEvent(ControlEvent theEvent) { //wywołanie funkcji, gdy zarejestrowano akcje zwiazana z dowolna kontrolka
  println(theEvent.getController().getName());
}

// function colorRed will receive changes from 
// controller with name colorRed
public void colorRed(int theValue) {
  println("a button event from colorRed: "+theValue);
  currentColor = color(255,0,0);
}

// function colorGreen will receive changes from 
// controller with name colorGreen
public void colorGreen(int theValue) {
  println("a button event from colorGreen: "+theValue);  //wyswietlenie wartosci przekazanej przez przycisk
  currentColor = color(0,255,0);
}
