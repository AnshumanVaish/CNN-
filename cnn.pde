float[][] catt=new float[1000][784] ,aircraftt=new float[1000][784],rainbowt=new float[1000][784];
convnet nn=new convnet();
void setup(){
size(280,280);
background(0);
byte[] cat=loadBytes("cats.npy");
byte[] aircraft=loadBytes("aircraft.npy");
byte[] rainbow=loadBytes("rainbow.npy");
for(int i=0;i<1000;i++){
  int start=80+i*784;
  for (int j =0;j<784;j++){
     int index=j+start;
     catt[i][j]=(cat[index] &0xff)/255 ;
     aircraftt[i][j]=(aircraft[index] & 0xff)/255;
     rainbowt[i][j]=(rainbow[index] & 0xff)/255;

  }
}

for(int i=0;i<500000;i++){
int x=floor(random(0,2.99));
int y=floor(random(0,800));
float[] training=new float[784];
float[] label=new float[3];
if(x==0){
  for(int k=0;k<784;k++){
  training[k]=catt[y][k];
  label[0]=1;
  label[1]=0;
  label[2]=0;
  }
}
if(x==1){
  for(int k=0;k<784;k++){
  training[k]=aircraftt[y][k];
  label[0]=0;
  label[1]=1;
  label[2]=0;
  }
}
if(x==2){
  for(int k=0;k<784;k++){
  training[k]=rainbowt[y][k];
  label[0]=0;
  label[1]=0;
  label[2]=1;
  }
}
nn.tr(training,label);
}
float v=0;
float[] test=new float[784];
for(int n=0;n<3;n++){
  
  for(int m=0;m<800;m++){
    
     for(int i=0;i<784;i++){
       if(n==0)
        test[i]=catt[m][i];
        if(n==1)
        test[i]=aircraftt[m][i];
        if(n==2)
         test[i]=rainbowt[m][i];
       
    }
   
        matrix q=nn.ff(test);
        int res=q.ind();
        if(res==n)
        v++;
  }
}
float percent=(v/2400)*100;
println(percent);
v=0;
for(int n=0;n<3;n++){
  
  for(int m=0;m<50;m++){
    
     for(int i=0;i<784;i++){
       if(n==0)
        test[i]=catt[800+m][i];
        if(n==1)
        test[i]=aircraftt[800+m][i];
        if(n==2)
         test[i]=rainbowt[800+m][i];
       
    }
   
        matrix q=nn.ff(test);
        int res=q.ind();
        if(res==n)
        v++;
  }
}
 percent=(v/150)*100;
println(percent);
}




void draw(){
strokeWeight(4);
stroke(255);
if (mousePressed){
line(pmouseX,pmouseY,mouseX,mouseY);
}


}
void keyPressed(){
  if(key=='b'){
  float[] c=new float[784];
PImage img=get();
img.resize(28,28);
for(int i=0;i<img.pixels.length;i++){
float r=red(img.pixels[i]);
float g=green(img.pixels[i]);
float b=blue(img.pixels[i]);
c[i]=(r+g+b)/3;
c[i]=c[i]/255;
}

 matrix q=nn.ff(c);
 int res=q.ind();
 if(res==0)
println("cat");
 if(res==1)
println("star");
 if(res==2)
println("rainbow");}
if(key=='n'){
background(0);

}
}