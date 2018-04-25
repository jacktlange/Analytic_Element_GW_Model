
%NO WELLS
%%%%%%%%%%%%%%%%%%%

model = Model();


refPhi = 4600000;
refz =  4.6390e+05+ 4.9765e+06i;




mississippi = River('miss+mn.csv');
%minnesota = River('minnesota.csv');
hiawatha = Lake('hiawatha.csv');
nokomis = Lake ('nokomis.csv');
taft = Lake('mother.csv');
mother =Lake('taft.csv');
minnetonka=Lake('minnetonka.csv');

%minnesota.setPhi(0);
mississippi.setPhi(0);

hiawatha.setPhi(247.22*247.22*.5*152.4);
nokomis.setPhi(248.09*248.09*.5*152.4);
taft.setPhi(248.59*248.59*.5*152.4);
mother.setPhi(248.54*248.54*.5*152.4);
minnetonka.setPhi(282.08*282.08*.5*152.4);

model.addRiver(mississippi);
%model.addRiver(minnesota);
model.addLake(nokomis);
model.addLake(hiawatha);
 model.addLake(mother);
model.addLake(taft);
model.addLake(minnetonka);


b = Populate_b(model, refPhi); 

A = Populate_A(model,refz);

s= A\b;

ContourMe_flow_net(476800,487600 , 400, 4965500, 4976400, 400, @(z)Omega_total(z,model,s),100);
mississippi.plotElement()
nokomis.plotElement()
hiawatha.plotElement()
taft.plotElement()
mother.plotElement()
minnetonka.plotElement()


for i = 1:model.nSinks

model.Sinks(i).sigma = s(i);

end


Ql = zeros(model.nLakes,1);
for i = 1:model.nLakes
    for j = 1:length(model.Lakes(i).LineSinks)
    
    Ql(i) = Ql(i) + model.Lakes(i).LineSinks(j).sigma;
    end
end


