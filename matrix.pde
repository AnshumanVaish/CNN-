class matrix{
  int r,c;
  float[][] m; 
  
matrix(int rows,int cols){
  r=rows;
  c=cols;
  m=new float[r][c];
}
void multiply(float a){
for(int i=0;i<r;i++){
  for(int j=0;j<c;j++){
    m[i][j]=m[i][j]*a;
  }
}

}
void addition(float a){
for(int i=0;i<r;i++){
  for(int j=0;j<c;j++){
    m[i][j]=m[i][j]+a;
  }
}

}

void randomize(){
for(int i=0;i<r;i++){
  for(int j=0;j<c;j++){
    m[i][j]=random(-1,1);
  }
}

}

void maddition(matrix a){
for(int i=0;i<r;i++){
  for(int j=0;j<c;j++){
    m[i][j]=m[i][j]+a.m[i][j];
  }
}

}

matrix mmultiply(matrix a){
 matrix result;
  if(c!=a.r){
  println ("undefine"); 
  }
 
   result=new matrix(r,a.c); 
for(int i=0;i<r;i++){
  for(int j=0;j<a.c;j++){
 float sum =0;
 for(int k=0;k<c;k++){
 sum +=m[i][k]*a.m[k][j];
 }
 result.m[i][j]=sum;
  }
}
return result;
}
void show(){
  for(int i=0;i<r;i++){
  for(int j=0;j<c;j++){
 println(m[i][j]);
  }
}

}
void activation(){

 for(int i=0;i<r;i++){
  for(int j=0;j<c;j++){
 m[i][j]=1/(1+exp(-m[i][j]));
  }
}

}
matrix fromArray(float[] arr){
matrix x=new matrix(arr.length,1);
for(int i =0;i<arr.length;i++){
x.m[i][0]=arr[i];
}
return x;
}


 matrix subtract(matrix a){
   matrix x=new matrix(r,c);
for(int i=0;i<r;i++){
  for(int j=0;j<c;j++){
    x.m[i][j]=m[i][j]-a.m[i][j];
  }
}
return x;
}

float[] toArray(){
float[] arr;
arr=new float[r*c];
int k=0;
for(int i=0;i<r;i++){
for(int j=0;j<c;j++){
arr[k]=m[i][j];
k++;
}

}
return arr;
}
matrix transpose(){
matrix x=new matrix(c,r);
for(int i=0;i<r;i++){
  for(int j=0;j<c;j++){
    x.m[j][i]=m[i][j];
  }
}
return x;

}
matrix grad(){
  matrix x=new matrix(r,c);
for(int i=0;i<r;i++){
  for(int j=0;j<c;j++){
    x.m[i][j]=m[i][j]*(1-m[i][j]);
  }
}
return x;

}
void emul(matrix x){

for(int i=0;i<r;i++){
  for(int j=0;j<c;j++){
    m[i][j]=m[i][j]*x.m[i][j];
  }

}
}
int ind(){
int max=0;

if(m[0][0]>m[1][0] && m[0][0]>m[2][0])
max=0;
if(m[1][0]>m[0][0] && m[1][0]>m[2][0])
max=1;
if(m[2][0]>m[1][0] && m[2][0]>m[0][0])
max=2;
return max;




}

}