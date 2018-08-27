class convnet{
filtr[] f1=new filtr[4];
int num1=4;
float[] a=new float[676];

nuralNetwork nn;
convnet(){
  nn= new nuralNetwork(676,60,3);
for(int i=0;i<num1;i++)
{
  f1[i]=new filtr();
  
}
}
matrix ff(float[] g){
int  loc=0;
for(int i=0;i<4;i++)
f1[i].apply(g,28,28);
for(int i=0;i<4;i++)
f1[i].maxpooling();
 for(int i=0;i<4;i++)
  {
   for(int j=0;j<169;j++){
   a[loc]=f1[i].max[j]; 
   loc++;
   }
  }
matrix x=nn.feedforward(a);
return x;
}
void tr(float[] g,float[] targets){
int  loc=0;
for(int i=0;i<4;i++)
f1[i].apply(g,28,28);
for(int i=0;i<4;i++)
f1[i].maxpooling();
 for(int i=0;i<4;i++)
  {
   for(int j=0;j<169;j++){
   a[loc]=f1[i].max[j]; 
   loc++;
   
   }
  }
  
 nn.train(a,targets);
 for(int i=0;i<3;i++)
f1[i].update();



}



}