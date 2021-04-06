/**
 * ControlP5 ScrollableList
 *
 * replaces DropdownList and and ListBox. 
 * List can be scrolled by dragging the list or using the scroll-wheel. 
 *
 * by Andreas Schlegel, 2014
 * www.sojamo.de/libraries/controlp5
 *
 */


import controlP5.*;
import java.util.*;

ScrollableList lista_wyboru;

ControlP5 cp5;

void setup() {
  size(400, 400);
  cp5 = new ControlP5(this);
  List l = Arrays.asList("a", "b", "c", "d", "e", "f", "g", "h");
  /* add a ScrollableList, by default it behaves like a DropdownList */
  lista_wyboru = cp5.addScrollableList("dropdown")
     .setPosition(100, 100)
     .setSize(200, 100)
     .setBarHeight(20)
     .setItemHeight(20)
     .addItems(l)
     .setType(ScrollableList.DROPDOWN) // currently supported DROPDOWN and LIST
     ;
  lista_wyboru.close();
     
}

void draw() {
  background(240);
}

void dropdown(int n) {
  /* request the selected item based on index n */
  println(n, cp5.get(ScrollableList.class, "dropdown").getItem(n));   
  println(n, cp5.get(ScrollableList.class, "dropdown").getItem(n).get("name"));  // wyswietlenie wybranej wartosci z listy 
}
