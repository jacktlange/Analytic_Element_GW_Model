
model = Model();
river = River('river1.csv');
model.addRiver(river);



nRows = model.nSinks;
nColumns = model.nSinks+1;
A =zeros (nRows,nColumns);

sinks = model.Sinks() ;%uggo


for r = 1:nRows
    for c = 1:nColumns
        if c == nColumns
            A(r,c) = 1;
        else
            z = sinks(c).mp;
            
            A(r,c) =real(sinks(c).Omega(z)) ;
        end
    end
end