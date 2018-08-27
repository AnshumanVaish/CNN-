matrix fromArray(float[] arr){
matrix x=new matrix(arr.length,1);
for(int i =0;i<arr.length;i++){
x.m[i][0]=arr[i];
}
return x;
}


class nuralNetwork{
int in,hn,on;
matrix weightsIh,weightsHo,biasH,biasO,q,w,e,r,t,z,n;
float lr;

nuralNetwork(int ino,int hno,int ono){
in=ino;
hn=hno;
on=ono;
weightsIh= new matrix(hn,in);
weightsHo= new matrix(on,hn);
weightsIh.randomize();
weightsHo.randomize();
float lo=sqrt(1/in);
float lp=sqrt(1/hn);
weightsIh.multiply(lo);
weightsHo.multiply(lp);

biasH= new matrix(hn,1);
biasO= new matrix(on,1);
biasH.randomize();
biasO.randomize();
lr=0.01;
}

matrix feedforward(float[] f){
 matrix input=fromArray(f);
 z=weightsIh.mmultiply(input);
 z. maddition(biasH);
 z.activation();
 n=weightsHo.mmultiply(z);
 n.maddition(biasO);
 n.activation();
 return  n;
}
void train(float[] input,float[] targets){   
 matrix inputs=fromArray(input);
 q=weightsIh.mmultiply(inputs);
 q. maddition(biasH);
 q.activation();
 w=weightsHo.mmultiply(q);
 w.maddition(biasO);
 w.activation();
  
  
  
  
  
 matrix in= inputs;
 matrix x=  w;
 matrix y= fromArray(targets);
 matrix errO=y.subtract(x);
 matrix hot=weightsHo.transpose();
 e=hot.mmultiply(errO);
 matrix errH=e;
 matrix grad=w.grad();
 grad.emul(errO);
 grad.multiply(lr);
 biasO.maddition(grad);
 matrix Htrans= q.transpose();
 matrix dwho=grad.mmultiply(Htrans);
 
 weightsHo.maddition(dwho);
 matrix gradh=q.grad();
 gradh.emul(errH);
 gradh.multiply(lr);
 biasH.maddition(gradh); 
 matrix Itrans= in.transpose();
 r=gradh.mmultiply(Itrans);
 matrix dwih=r;
 weightsIh.maddition(dwih);
}

   
}