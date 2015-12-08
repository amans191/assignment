// assigment
// 7/12/15
// Amandeep Singh

import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
 
Minim minim;
AudioPlayer player;

ArrayList<Consumption> consumption = new ArrayList<Consumption>();
ArrayList<Independant> independant  = new ArrayList<Independant>();

PImage world;

void setup()
{
  size(1250, 750);
  background(0);
  loadData();
  
  minim = new Minim(this);
  player = minim.loadFile("Darude - Sandstorm.mp3");

  //image for option 3
  world = loadImage("world.gif");
}

float min = 0, max = 0, border = 60;

void loadData()
{
  //laoding first data
  String[] lines = loadStrings("Total_Petroleum_Consumption_1980.csv");
  for (int i = 0; i < lines.length; i++)
  {
    Consumption temp1 = new Consumption(lines[i]);
    consumption.add(temp1);
  }

  //loading second data
  String[] lines1 = loadStrings("independant.csv");
  for (int i = 0; i < lines1.length; i++)
  {
    Independant temp2 = new Independant(lines1[i]);
    independant.add(temp2);
  }
}
//****************************************************************************



//*****************************************************************************

void draw()
{
  //main menu
  textAlign(LEFT, BASELINE);
  background(0);
  textSize(100);
  fill(0, 102, 153);
  text("Protroleum Consumption", 20, 100);

  textSize(32);
  fill(255);
  text("Protroleum Consumption in 1980: Coin", 100, 200);
  text("Protroleum Consumption in 2013: Apple", 100, 250);
  text("Protroleum Consumption in 2013 for top 20 countries: Key Ring", 100, 300);
  text("Protroleum Consumption from 1980 - 2013 in top 4 countries: clay", 100, 350);
  text("To come back to the menu: Banana", 100, 400);
  text("*Note: All consumption values are meadured in thousand barrels per day", 100 , 550);
  
  //menu options
  if (keyPressed == true);
  {
    switch(keyCode) 
    {
    case 'W':
      {
        background(0);
        textSize(14);
        draw_one();
        player.play();
        break;
      }

    case 'A':
      {
        background(0);
        textSize(14);
        draw_two();
        player.play();
        break;
      }

    case 'S':
      {
        image(world, 0, 0, width, height);
        textSize(14);
        fill(255, 0, 0);
        bubble();
        if (mousePressed) {
          println(mouseX, mouseY);
        }    
        break;
      }

    case 'D':
      {
        background(0);
        textSize(14);
        stroke(255);
        line(border, border, border, height - border);
        line(border, height - border, width - border, height - border);
        //horizontal axis
        for (int i = 0; i <= independant.size(); i ++)
        {   
          // Draw the ticks
          float x = map(i, 0, independant.size(), border, border + (width - (border * 2.0f)));
          line(x, height - (border - (border * 0.1f)), x, (height - border));             
          textAlign(CENTER, CENTER);   
          float textY = height - (border * 0.5f); 

          pushMatrix();
          translate(x, textY);
          rotate(HALF_PI);
          translate(-x, -textY);
          text((int) map(i, 0, independant.size(), 1980, 2013), x, textY);
          popMatrix();
        }
        //vertical lines
        for (int i = 0; i <= independant.size(); i ++)
        {
          float y = map(i, 0, independant.size(), height - border, border);
          line(border - (border * 0.1f), y, border, y);
          float hAxisLabel = map(i, 0, independant.size(), 0, 21000);

          textAlign(RIGHT, CENTER);  
          text((int)hAxisLabel, border - ((border * 0.1f) * 2.0f), y);
        }    

        america();
        china();
        japan();
        india();
        drawGDPAmount();
        break;
      }
    }
  }
}