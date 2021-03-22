/**
* ControlP5 Textfield
*
*
* find a list of public methods available for the Textfield Controller
* at the bottom of this sketch.
*
* by Andreas Schlegel, 2012
* www.sojamo.de/libraries/controlp5
*
*/
import controlP5.*;

ControlP5 cp5;

int redColor = 255;
int blueColor = 255;

void setup() {
  size(1000,500);
  noStroke();
  PFont pfont = createFont("Arial",20,true); // use true/false for smooth/no-smooth
  ControlFont font = new ControlFont(pfont,25); //obiekt klasy PFont, drugi argument to rozmiar
  
  /* new instance of ControlP5 */
  cp5 = new ControlP5(this);
  /* add 2 controllers and give each of them a unique id. */   
  cp5.addSlider("slider_red")
     .setRange(0,255)
     .setValue(redColor)
     .setPosition(100,220)
     .setSize(500,40)
     .setId(1); //id kontrolki
     
  cp5.addSlider("slider_blue")
     .setRange(0,255)
     .setValue(blueColor)
     .setPosition(100,300)
     .setSize(500,40)
     .setId(2);
}

void draw() {
  background(redColor,0,blueColor);
}

void controlEvent(ControlEvent theEvent) {
  /* events triggered by controllers are automatically forwarded to 
     the controlEvent method. by checking the id of a controller one can distinguish
     which of the controllers has been changed.
  */
  println("Slider id event "+theEvent.getController().getId()); //wyswietlenie id aktualnie uzywanego kontrolera w konsoli Processingu
  switch(theEvent.getController().getId()) {
    case(1):
    /* controller slider1 with id 1 */
    redColor = (int)theEvent.getValue(); //przypisanie wartosci ze slidera 1 do zmiennej redColor; rzutowanie wartości do int bo takie wartości przyjmują kolory, a ze slidera mogą wychdzić wartości zmiennoprzecinkowe 
    break;
    case(2):
    /* controller slider1 with id 2 */
    blueColor = (int)theEvent.getValue();
    break;  
  }
}
