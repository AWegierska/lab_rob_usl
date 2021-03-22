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
String textValue = "";

void setup() {
  size(700,400);
  
  PFont font = createFont("arial",20);
  
  cp5 = new ControlP5(this);
  
  cp5.addTextfield("input") //utworzenie pola tekstowego o nazwie input
     .setPosition(200,100)  //ustawienie polozenia pola tekstowego x,y
     .setSize(200,40)       //ustawienie rozmiaru pola tekstowego 
     .setFont(font)         //ustawienie czcionki
     .setColor(color(255,0,0))  //ustawienie koloru wpisywanego tekstu
     ;
                 
  cp5.addTextfield("textValue")
     .setPosition(200,170)
     .setSize(200,40)
     .setFont(createFont("arial",20))  //zamiast wykorzystania zmiennej od razu wywołana metoda do ustawienia typu i rozmiaru czcionki
     .setAutoClear(false)       //wyłączenie natychmiastowego czyszczenia pola po zatwierdzeniu enterem wprowadzonego tekstu
     ;
       
  cp5.addBang("clear")      //utworzenie przycisku o nazwie "clear" do czyszczenia tekstu w polu TEXTVALUE
     .setPosition(240,250)
     .setSize(80,40)
     .getCaptionLabel().align(ControlP5.CENTER, ControlP5.CENTER)  //umieszczenie na srodku przycisku jego nazwy
     ;    
     
  textFont(font);
}

void draw() {
  background(0);
  fill(255);
  text(cp5.get(Textfield.class,"input").getText(), 460,130); //odbieranie wartosci z pola typu Textfield o nazwie "input" wprowadzonego tekstu i wyswietlanie go
  text(textValue, 460,200); //wyswietlanie ostatnio wprowadzonego i zatwierdzonego tekstu w polu TEXTVALUE
}

public void clear() {// funkcja wywolana po wcisnieciu przycisku o nazwie clear, ma taka sama nazwe jak nazwa przycisku
  cp5.get(Textfield.class,"textValue").clear(); //czyszczenie wprowadzonego tekstu w polu, ale nie nastepuje zmiana ostatnio zapamietanej wartosci dotyczacej tekstu
}

void controlEvent(ControlEvent theEvent) { //odebrano akcje pochodzaca od dowolnego przycisku
  if(theEvent.isAssignableFrom(Textfield.class)) { //jesli przypisano zdarzenie pochodzace od przycisku typu Textfield
    println("controlEvent: uzycie kontrolera '"
            +theEvent.getName()+"' wartosc: "
            +theEvent.getStringValue()
            ); //wyswietlenie informacji w konsoli o zrodle zdarzenia i wartosci wpisanej w polu
  }
}


public void input(String theText) {//funkcja wywolywana po wprowadzeniu i zatwierdzeniu tekstu enterem
  // automatically receives results from controller input
  println("wartosc pola 'input' : "+theText);
}
