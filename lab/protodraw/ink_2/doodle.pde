class doodle{
  int num = 10000;
  float mx[] = new float[num];
  float my[] = new float[num];
  int mstroke[] = new int[num];
  color mcolor[] = new color[num];
  
  doodle(){
  }

  void display(){
    for(int i=0; i<num-1; i++) {
      strokeWeight(mstroke[i]);
      stroke(mcolor[i]);
      if (mx[i] > 0 && my[i] > 0 && mx[i+1] > 0 && my[i+1] > 0)line(mx[i],my[i],mx[i+1],my[i+1]);
    }
  }
}
