/**
* ControlP5 Tab
*
*
* find a list of public methods available for the Tab Controller
* at the bottom of this sketch.
*
* by Andreas Schlegel, 2012
* www.sojamo.de/libraries/controlp5
*
*/

import controlP5.*;

ControlP5 cp5;
int myColorBackground = color(128);
int sliderValue = 100;

void setup() {
  size(700,400);
  noStroke();
  cp5 = new ControlP5(this);
  
  // By default all controllers are stored inside Tab 'default' 
  // add a second tab with name 'extra'
  
  cp5.addTab("page_2")
     .setColorBackground(color(0, 160, 100))
     .setColorLabel(color(255))
     .setColorActive(color(255,128,0))
     .activateEvent(true)
     .setLabel("page 2")
     .setId(2)
     .setHeight(50)
     .setWidth(100) 
     ;
     
  // if you want to receive a controlEvent when
  // a  tab is clicked, use activeEvent(true)
  
  cp5.getTab("default")
     .activateEvent(true)
     .setLabel("my default tab")
     .setHeight(50)
     .setWidth(100) 
     .setId(1)
     ;
  cp5.getTab("page_2");  
  // create a few controllers
  cp5.addButton("button")
     .setBroadcast(false)
     .setPosition(100,100)
     .setSize(80,40)
     .setValue(1)
     .setBroadcast(true)
     .getCaptionLabel().align(CENTER,CENTER)
     ;
     
  cp5.addButton("buttonValue")
     .setBroadcast(false)
     .setPosition(220,100)
     .setSize(80,40)
     .setValue(2)
     .setBroadcast(true)
     .getCaptionLabel().align(CENTER,CENTER)
     ;
  
  cp5.addSlider("slider")
     .setBroadcast(false)
     .setRange(100,200)
     .setValue(128)
     .setPosition(100,160)
     .setSize(200,20)
     .setBroadcast(true)
     ;
  
     
  // arrange controller in separate tabs
  
  cp5.getController("button").moveTo("page_2"); //przypisanie elementu button do karty page_2
  cp5.getController("slider").moveTo("global"); //przypisanie elementu slider do wszystkich kart
  // przycisk buttonValue domyslnie przypisany jest do zakladki default i nie ma koniecznosci ponownego
  //jego przypisania do karty
  // Tab 'global' is a tab that lies on top of any 
  // other tab and is always visible
  
}

void draw() {
  background(myColorBackground);
  //fill(sliderValue);
}

void controlEvent(ControlEvent theControlEvent) {
  if (theControlEvent.isTab()) {
    println("got an event from tab : "+theControlEvent.getTab().getName()+" with id "+theControlEvent.getTab().getId());
  }
}

void slider(int theColor) { //zmienna theColor przechowuje informacje o wartosci odczytanej ze slidera
  myColorBackground = color(theColor);
  println("a slider event. setting background to "+theColor);
}


void keyPressed() {
  if(keyCode==TAB) {
    cp5.getTab("page_2").bringToFront(); //programowe przelaczenie do innej zakladki. Jesli jest aktywna karta default
    //to po wcisnieciu tab nastepuje przelaczenie na karte page_2
  }
}
