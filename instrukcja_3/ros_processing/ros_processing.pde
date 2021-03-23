/*
** Basic advertise and publish from ROS
*/
import controlP5.*; //importowanie biblioteki od kontrolek
import rosprocessing.*;
ROSProcessing rp; 
JSONObject json;

ControlP5 cp5;

void setup() {
  setupRos();
  size(400,600);
  noStroke();
  cp5 = new ControlP5(this);
  
  cp5.addButton("text1") //utworzenie kontrolki button o nazwie text1
     .setPosition(100,100) //ustawienie kontrolki na ekranie
     .setSize(200,19) //rozmiar kontrolki
     ;
  
  cp5.addButton("text2")
     .setPosition(100,120)
     .setSize(200,19)
     ;
  cp5.addButton("pub_ros_pose_string") // Odpowiada za opublikowanie wiadomosci typu geometry_msgs/Pose na topicu /new_button_pose
     .setPosition(100,140)
     .setSize(200,19)
     ;
  cp5.addButton("pub_ros_pose_json") // Odpowiada za opublikowanie wiadomosci typu geometry_msgs/Pose na topicu /new_button_pose
     .setPosition(100,160)
     .setSize(200,19)
     ;
}

void draw() {
  background(0);
}

void setupRos() {
  //It would be nice if every message object have a "toJson()" method.
  //For the moment we use JSONObject instead.
  try {
    println("ROSProcessing connecting");
    rp = new ROSProcessing(this, "0.0.0.0", 8080); // polaczenie po websocket z ROS
    rp.connect();
    rp.advertise("/chatter", "std_msgs/String"); // utworzenie Publishera ROS, pierwszy argument nazwa topicu, drugi typ wiadomosci
    rp.advertise("/new_button_pose", "geometry_msgs/Pose");
    rp.subscribe("/example_vector", "get_vector"); // utworzenie Subscriber'a ROS, pierwszy argument - nazwa topicu, drugi argument 
                                                   // nazwa funkcji, ktora bedzie natychmiast wywolana po odebraniu wiadomosci na topicu
  }catch(Exception e) {
    println(e);
  }
  
}

public void text1(int theValue) { // obsluga akcji dla przycisku text1, opublikowanie wiadomosci tekstowej
  json = new JSONObject();
  json.setString("data", "text 1");
  rp.publish("/chatter", json.toString()); // opublikowanie wiadomosci do ROS, pierwszy argument nazwa topicu, drugi argument string 
                                           // w postaci json z danym odpowiadajacy wysylanej wiadomosci
}

public void text2(int theValue) {
  json = new JSONObject();
  json.setString("data", "Nowy text 2");
  print(json.toString());
  rp.publish("/chatter", json.toString());
}

public void pub_ros_pose_string(int theValue) { // wysylanie bardziej skomplikowanych i zagniezdzonych wiadomosci, wyslanie jako tekst
  String msg = "{\"position\": {\"x\":0, \"y\":0, \"z\":0}, \"orientation\": {\"x\":0, \"y\":0, \"z\":0, \"w\":1}}";
  print(msg);
  rp.publish("/new_button_pose", msg);
}

public void pub_ros_pose_json(int theValue) { // j.w. tylko wykorzystanie json
  json = new JSONObject();
  JSONObject json_position = new JSONObject();
  JSONObject json_orientation = new JSONObject();
  json_position.put("x", 0);
  json_position.put("y", 0);
  json_position.put("z", 0);
  json_orientation.put("x",0);
  json_orientation.put("y",0);
  json_orientation.put("z", 0);
  json_orientation.put("w", 1);
  json.put("position", json_position);
  json.put("orientation", json_orientation);
  print(json.toString());
  rp.publish("/new_button_pose", json.toString());
}

void get_vector(Vector3 data){ // odbior danych na topicu /example_vector, przykladowy publisher znajduje sie w instrukcji 2_Topics
  print(data.getX()); // odczyt danych z odpowiednich pol wiadomosci
  print(data.getY());
  print(data.getZ());
  print("\n");
}
