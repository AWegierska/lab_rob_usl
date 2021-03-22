/**
 * ControlP5 Checkbox
 * an example demonstrating the use of a checkbox in controlP5. 
 * CheckBox extends the RadioButton class.
 * to control a checkbox use: 
 * activate(), deactivate(), activateAll(), deactivateAll(), toggle(), getState()
 *
 * find a list of public methods available for the Checkbox Controller 
 * at the bottom of this sketch's source code
 *
 * by Andreas Schlegel, 2012
 * www.sojamo.de/libraries/controlP5
 *
 */
import controlP5.*;
ControlP5 cp5;
CheckBox checkbox;
int myColorBackground;

void setup() {
  size(700, 400);
  smooth();
  cp5 = new ControlP5(this);
  checkbox = cp5.addCheckBox("checkBox")  //checkbox, pole wielokrotnego wyboru
                .setPosition(100, 200) //poczatkowe polozenie pola
                .setColorForeground(color(120)) //ustaienie koloru dla niewybranej opcji
                .setColorActive(color(255)) //ustawienie koloru dla zaznaczonej opcji
                .setColorLabel(color(255))
                .setSize(40, 40)  //rozmiar checkboxa
                .setItemsPerRow(3) //liczba opcji w wierszu
                .setSpacingColumn(30) //odstep pomiedzy kolumnami
                .setSpacingRow(20) //odstep pomiedzy kolejnymi wierszami opcji
                .addItem("0", 0) //dodawanie nowych opcji nazwa,wartosc
                .addItem("50", 50)
                .addItem("100", 100)
                .addItem("150", 150)
                .addItem("200", 200)
                .addItem("255", 255)
                ;
}

void keyPressed() { //obsluga akcji z przyciskow klawiatury
  if (key==' ') { //wcisnieta spacja
    checkbox.deactivateAll(); //odznaczenie wszystkich zaznaczonych pol
  } 
  else {
    for (int i=0;i<6;i++) {
      // check if key 0-5 have been pressed and toggle
      // the checkbox item accordingly.
      if (keyCode==(48 + i)) { 
        // the index of checkbox items start at 0
        checkbox.toggle(i);
        println("toggle "+checkbox.getItem(i).getName());
        // also see 
        // checkbox.activate(index);
        // checkbox.deactivate(index);
      }
    }
  }
}

void draw() {
  background(0);
  pushMatrix();
  translate(width/2 + 200, height/2);
  stroke(255);
  strokeWeight(2);
  fill(myColorBackground);
  ellipse(0,0,200,200);
  popMatrix();
}

void controlEvent(ControlEvent theEvent) { //obsluga zdarzen od przyciskow
  if (theEvent.isFrom(checkbox)) { //sprawdzenie warunku czy zdarzenie pochodzi od obiektu checkbox
    myColorBackground = 0;
    print("got an event from "+checkbox.getName()+"\t\n");
    // checkbox uses arrayValue to store the state of 
    // individual checkbox-items. usage:
    println(checkbox.getArrayValue()); //odbior tablicy wartosci kolejnych pol
    int col = 0;
    for (int i=0;i<checkbox.getArrayValue().length;i++) { //petla odpowiadajaca za wyswietlanie kolejnych wartsci tablicy wraz z informacja czy pole jest zaznaczone (1) czy tez nie (0(
      int n = (int)checkbox.getArrayValue()[i];
      print(n);
      if(n==1) {
        myColorBackground += checkbox.getItem(i).internalValue(); //odebranie wartosci pola dla checkboxa o numerze i
      }
    }
    println();    
  }
}

void checkBox(float[] a) {
  println(a);
}
