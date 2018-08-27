class filtr{
float[] out,mid,m;
float[][] w,dw;
float[] max,er;
int rw,rh,b=0;
float lr=.007;
 filtr(){  
  w=new float[3][3];
  for(int i=0;i<3;i++)
  {
   for(int j=0;j<3;j++){
   w[i][j]=random(-1,1);   
   }
  }
 }
void apply(float[] q,int wid,int hei){
  out=new float[(wid-2)*(hei-2)];
  int l=0;
  mid=q;
  rw=wid-2;
  rh=hei-2;
     for(int y=1;y<hei-1;y++){
       for(int x=1;x<wid-1;x++){
       int loc=x+y*wid;
       float sum=0;
       int l1=(x-1)+(y-1)*wid;
       int l2=(x)+(y-1)*wid; 
       int l3=(x+1)+(y-1)*wid;
       int l4=(x-1)+(y)*wid;
       int l5=(x)+(y)*wid;
       int l6=(x+1)+(y)*wid;
       int l7=(x-1)+(y+1)*wid;
       int l8=(x)+(y+1)*wid;
       int l9=(x+1)+(y+1)*wid;
       sum=q[l1]*w[0][0];
       sum=sum+(q[l2]*w[0][1]);
       sum=sum+(q[l3]*w[0][2]);
       sum=sum+(q[l4]*w[1][0]);
       sum=sum+(q[l5]*w[1][1]);
       sum=sum+(q[l6]*w[1][2]);
       sum=sum+(q[l7]*w[2][0]);
       sum=sum+(q[l8]*w[2][1]);
       sum=sum+(q[l9]*w[2][2]);
       out[l]=sum;
       l++;
       
       }

  }
  act();
  //return out;

}
void act(){
  for(int i=0;i<out.length;i++)
 out[i]=1/(1+exp(-out[i]));
}
void maxpooling(){
  int p=0;
  max =new float[13*13];
  er=new float[rw*rh];
  for(int i=0;i<er.length;i++)
  er[i]=0;
  
    for(int y=0;y<rh;){
       for(int x=0;x<rw;){
       int loc=x+y*rw;
       int l1=(x+1)+y*rw;
       int l2=x+(y+1)*rw;
       int l3=(x+1)+(y+1)*rw;
       if(out[loc]>out[l1] &&out[loc]>out[l2] &&out[loc]>out[l3]){
       max[p]=out[loc];
       er[loc]=1;
       }
       if(out[l1]>out[loc] &&out[l1]>out[l2] &&out[l1]>out[l3]){
       max[p]=out[l1];
       er[l1]=1;
       }
       if(out[l2]>out[l1] &&out[l2]>out[loc] &&out[l2]>out[l3]){
       max[p]=out[l2];
       er[l2]=1;
       }
       if(out[l3]>out[l1] &&out[l3]>out[l2] &&out[l3]>out[loc]){
       max[p]=out[l3];
       er[l3]=1;
       }
       
       x=x+2;
       p++;
       }
       y=y+2;
    }
   // return max;

 }
 void update(){
 dw=new float[3][3];
  for(int i=0;i<3;i++)
  {
   for(int j=0;j<3;j++){
   dw[i][j]=0;   
   }
  }
 b=0;
 grad();
 
  for(int y=1;y<28-1;y++){
       for(int x=1;x<28-1;x++){
       int loc=x+y*rw;
       //float sum=0;
       int l1=(x-1)+(y-1)*28;
       int l2=(x)+(y-1)*28; 
       int l3=(x+1)+(y-1)*28;
       int l4=(x-1)+(y)*28;
       int l5=(x)+(y)*28;
       int l6=(x+1)+(y)*28;
       int l7=(x-1)+(y+1)*28;
       int l8=(x)+(y+1)*28;
       int l9=(x+1)+(y+1)*28;
      dw[0][0]=dw[0][0]+(m[b]*lr*er[b]*mid[l1]);
      dw[0][1]=dw[0][1]+(m[b]*lr*er[b]*mid[l2]);
      dw[0][0]=dw[0][2]+(m[b]*lr*er[b]*mid[l3]);
      dw[0][0]=dw[1][0]+(m[b]*lr*er[b]*mid[l4]);
      dw[0][0]=dw[1][1]+(m[b]*lr*er[b]*mid[l5]);
      dw[0][0]=dw[1][2]+(m[b]*lr*er[b]*mid[l6]);
      dw[0][0]=dw[2][0]+(m[b]*lr*er[b]*mid[l7]);
      dw[0][0]=dw[2][1]+(m[b]*lr*er[b]*mid[l8]);
      dw[0][0]=dw[2][2]+(m[b]*lr*er[b]*mid[l9]);
      b++;
       }

  }
   for(int i=0;i<3;i++)
  {
   for(int j=0;j<3;j++){
   w[i][j]=w[i][j]+dw[i][j];   
   }
  }
  
 
 
 }
void grad(){
  m=new float[out.length];
  for(int i=0;i<out.length;i++)
  m[i]=out[i]*(1-out[i]);



}

}