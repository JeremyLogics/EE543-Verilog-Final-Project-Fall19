//2-to-1 mux, this is directly from class notes


module MUX2 (i0, i1, sel, out); //your declaration determines how to put the port list when you make instance 
//input and output ports declaration
input i0, i1, sel;
output out;

//local variables
wire o1, o2, o3;

//build-in gate
not g1 (o1, sel);
and g2 (o2, i1, sel);
and g3 (o3, o1, i0);
or g4 (out, o2, o3);

endmodule