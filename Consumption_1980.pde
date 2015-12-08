class Consumption
{
  String country;
  float consumption;
  String country2013;
  float consumption2013;
  color colour;
  
  Consumption(String line)
  {
    String[] parts = line.split(",");
    country = parts[1];
    consumption = Float.parseFloat(parts[2]);
    country2013 = parts[3];
    consumption2013 = Float.parseFloat(parts[4]);
    colour = color(random(0, 255), random(1, 255), random(0, 255));
  }
}

//first option
void draw_one()
{
  float border = 60;
  float max = Float.MIN_VALUE;
  
  for (Consumption temp1:consumption)//for(data type(Expense) expense)
  {
    if (temp1.consumption > max)
    {
      max = temp1.consumption;
    }
  }
  
  //width of each bat
  float gap = map(1, 0, 50, 0, width - border - border);//checking the width of each bar
   
  //drawing bar 
  float scaleFactor = map(1, 0, max, 0, height - border - border);
  for (int i = 0 ; i < consumption.size() ; i ++)
  {
    Consumption temp1 = consumption.get(i);
    stroke(temp1.colour);
    fill(temp1.colour);
    float x = i * gap;
    rect(x + border, height - border, gap, - (temp1.consumption * scaleFactor));
    stroke(255);
    fill(255);
    
    line(border, border , border, height - border);
    line(border, height - border, width - border, height - border);
    
    //text on y axis
    float y = height - 150;
    pushMatrix();
    translate(x,y);
    rotate(HALF_PI);
    translate(-x,-y);
    text(temp1.country, x - border, y - border - 5);
    popMatrix();
  }
  
  for (int i = 0 ; i <= 10 ; i ++)
  {
    float y = map(i, 0, 10, height - border,  border);
    line(border - (border * 0.1f), y, border, y);
    float hAxisLabel = map(i, 0, 10, 0, 19000);
        
    textAlign(RIGHT, CENTER);  
    text((int)hAxisLabel, border - ((border * 0.1f) * 2.0f), y);
  }
  
  if (mouseX > border && mouseX < (width - border))
  {
    textAlign(LEFT, BASELINE); 
    int i = (int) map(mouseX, border, width - border, 0, consumption.size());
    
    textSize(14);
    text("Country: " + consumption.get(i).country, mouseX - 80, mouseY - 20);
    text("Consumption: " + consumption.get(i).consumption, mouseX - 80, mouseY - 6);
  }
  textAlign(LEFT, BASELINE); 
  textSize(100);
  fill(255, 0, 0);
  text("1980", 800, 100);
}

//***********************************************************************************
//second option
void draw_two()
{
  float border = 60;
  float max = Float.MIN_VALUE;
  
  for (Consumption temp1:consumption)//for(data type(Expense) expense)
  {
    if (temp1.consumption2013 > max)
    {
      max = temp1.consumption2013;
    }
  }
  
  float gap = map(1, 0, 50, 0, width - border - border);//checking the width of each bar
   
  float scaleFactor = map(1, 0, max, 0, height - border - border);
  for (int i = 0 ; i < consumption.size() ; i ++)
  {
    Consumption temp1 = consumption.get(i);
    stroke(temp1.colour);
    fill(temp1.colour);
    float x = i * gap;
    rect(x + border, height - border, gap, - (temp1.consumption2013 * scaleFactor));
    stroke(255);
    fill(255);
    //text(temp1.country, x, height - 20);
    
    line(border, border , border, height - border);
    line(border, height - border, width - border, height - border); 
    
    float y = height - 150;
    pushMatrix();
    translate(x,y);
    rotate(HALF_PI);
    translate(-x,-y);
    text(temp1.country2013, x - border, y - border - 5);
    popMatrix();
  }
  
  for (int i = 0 ; i <= 10 ; i ++)
  {
    float y = map(i, 0, 10, height - border,  border);
    line(border - (border * 0.1f), y, border, y);
    float hAxisLabel = map(i, 0, 10, 0, 19000);
        
    textAlign(RIGHT, CENTER);  
    text((int)hAxisLabel, border - ((border * 0.1f) * 2.0f), y);
  }    
  
  if (mouseX > border && mouseX < (width - border))
  {
    textAlign(LEFT, BASELINE);
    int i = (int) map(mouseX, border, width - border, 0, consumption.size());
    
    textSize(14);
    text("Country: " + consumption.get(i).country2013, mouseX - 80, mouseY - 20);
    text("Consumption: " + consumption.get(i).consumption2013, mouseX - 80, mouseY - 6);
  }
  textAlign(LEFT, BASELINE);
  textSize(100);
  fill(255, 0, 0);
  text("2013", 800, 100);
}

//third option
void bubble()
{
  //co-ordinates of where the bibbles go
  float[] locationx = {130, 915, 1065, 830, 825, 330, 690, 165, 555, 1020, 95, 735, 520, 1025, 525
,565, 943, 500, 931, 1055};
  float[] locationy = {280, 330, 320, 390, 195, 565, 385, 180, 260, 315, 380, 345, 280, 510, 240
,300, 475, 310, 422, 590};

  float scale = 0.01;
  
  for (int i = 0 ; i < 20 ; i ++)
  {
    Consumption temp1 = consumption.get(i);
    fill(temp1.colour);
    stroke(temp1.colour);
    
    float r = scale * consumption.get(i).consumption2013;
    ellipse(locationx[i],locationy[i],r,r);
 
    //hovering over to display text
    if(dist(mouseX,mouseY,locationx[i],locationy[i]) < r/2)
    {
     
      fill(0);
      textSize(20);
      text("Country: " + consumption.get(i).country2013, 720, 650);
      text("Consumption: " + consumption.get(i).consumption2013, 720, 675);
    }
  }
}
    