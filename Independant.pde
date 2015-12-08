//no.,year,america,china,japan,india
class Independant
{
  String country;
  int ConsumptionAmerica;
  int ConsumptionChina;
  int ConsumptionJapan;
  int ConsumptionIndia;
  
  Independant(String line)
  {
    String[] parts = line.split(",");
    country = parts[1];
    ConsumptionAmerica = Integer.parseInt(parts[2]);
    ConsumptionChina = Integer.parseInt(parts[3]);
    ConsumptionJapan = Integer.parseInt(parts[4]);
    ConsumptionIndia = Integer.parseInt(parts[5]); 
  }
}

float windowRange = (width - (border * 2.0f));

void america()
{
  for (Independant temp2:independant)
  {
    if (temp2.ConsumptionAmerica < min)
    {
      min = temp2.ConsumptionAmerica;
    }
    if (temp2.ConsumptionAmerica > max)
    {
      max = temp2.ConsumptionAmerica;
    }    
  }
  
   for (int i = 1 ; i < independant.size(); i ++)
  {
    stroke(0, 255, 255);
    float x1 = map(i - 1, 0, independant.size() - 1, border, width - border);
    float y1 = map(independant.get(i - 1).ConsumptionAmerica, (int)min, (int)max, height - border, border);
    float x2 = map(i, 0, independant.size() - 1, border, width - border);
    float y2 = map(independant.get(i).ConsumptionAmerica, min, max, height - border, border);
    line(x1, y1, x2, y2);
  }
}

void china()
{
  for (Independant temp2:independant)
  {
    if (temp2.ConsumptionChina < min)
    {
      min = temp2.ConsumptionChina;
    }
    if (temp2.ConsumptionChina > max)
    {
      max = temp2.ConsumptionChina;
    }    
  }
  
   for (int i = 1 ; i < independant.size() ; i ++)
  {
    stroke(255, 0, 0);
    float x1 = map(i - 1, 0, independant.size() - 1, border, width - border);
    float y1 = map(independant.get(i - 1).ConsumptionChina, min, max, height - border, border);
    float x2 = map(i, 0, independant.size() - 1, border, width - border);
    float y2 = map(independant.get(i).ConsumptionChina, min, max, height - border, border);
    line(x1, y1, x2, y2);
  }
}

void japan()
{
  for (Independant temp2:independant)
  {
    if (temp2.ConsumptionJapan < min)
    {
      min = temp2.ConsumptionJapan;
    }
    if (temp2.ConsumptionJapan > max)
    {
      max = temp2.ConsumptionJapan;
    }    
  }
  
   for (int i = 1 ; i < independant.size() ; i ++)
  {
    stroke(255, 0, 255);
    float x1 = map(i - 1, 0, independant.size() - 1, border, width - border);
    float y1 = map(independant.get(i - 1).ConsumptionJapan, min, max, height - border, border);
    float x2 = map(i, 0, independant.size() - 1, border, width - border);
    float y2 = map(independant.get(i).ConsumptionJapan, min, max, height - border, border);
    line(x1, y1, x2, y2);
  }
}

void india()
{
  for (Independant temp2:independant)
  {
    if (temp2.ConsumptionIndia < min)
    {
      min = temp2.ConsumptionIndia;
    }
    if (temp2.ConsumptionIndia > max)
    {
      max = temp2.ConsumptionIndia;
    }    
  }
  
   for (int i = 1 ; i < independant.size(); i ++)
  {
    stroke(255, 255, 0);
    float x1 = map(i - 1, 0, independant.size() - 1, border, width - border);
    float y1 = map(independant.get(i - 1).ConsumptionIndia, min, max, height - border, border);
    float x2 = map(i, 0, independant.size() - 1, border, width - border);
    float y2 = map(independant.get(i).ConsumptionIndia, min, max, height - border, border);
    line(x1, y1, x2, y2);
  }
}

void drawGDPAmount()
{
  for(int i = 0; i < independant.size(); i++)
  {
    if (mouseX >= border && mouseX <= width - border)
    {
      stroke(255, 0, 0);
      fill(255, 0, 0);
      line(mouseX, border, mouseX, height - border);
      int j = (int) map(mouseX, border, width - border, 0, independant.size() - 1);
      fill(0, 255, 255);
      text("America : " + independant.get(j).ConsumptionAmerica, 200, 50);
      fill(255, 0, 0);
      text("China : " + independant.get(j).ConsumptionChina, 200, 70);
      fill(255, 0, 255);
      text("Japan : " + independant.get(j).ConsumptionJapan, 200, 90);
      fill(255, 255, 0);
      text("India : " + independant.get(j).ConsumptionIndia, 200, 110);
    }
  }
}