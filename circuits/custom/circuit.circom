pragma circom 2.0.0;

/*This circuit template checks that c is the multiplication of a and b.*/  

template custom () {  
   signal input A;
   signal input B;

   signal X;
   signal Y;

   signal output Q;

   component and=AND();
   component or=OR();
   component not=NOT();

   not.in <== B ;
   Y <== not.out;

   or.a <== A ;
   or.b <== Y ;
   X <== or.out ;

   

   and.a <== X;
   and.b <== Y;
   Q <== and.out;

}

template AND() {
    signal input a;
    signal input b;
    signal output out;

    out <== a*b;
}

template OR() {
    signal input a;
    signal input b;
    signal output out;

    out <== a + b - a*b;
}

template NOT() {
    signal input in;
    signal output out;

    out <== 1 + in - 2*in;
}

component main = custom();