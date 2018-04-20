classdef Model < handle
    %MODEL Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        nRivers
        nLakes
        nSinks
        nElements
        
        Elements
        Rivers
        Lakes
        
    end
    
    methods
        function obj = Model()
            obj.nRivers = 0;
            obj.nLakes = 0;
            obj.nSinks = 0;
            obj.Rivers = River.empty(0);
            obj.Lakes = Lake.empty(0);
            obj.nElements = 0;
            obj.Elements = ModelElement.empty(0);

        end
        
        function addRiver(obj,river)
            
           obj.nRivers = obj.nRivers + 1;
           obj.Rivers(obj.nRivers)= river;
           obj.nSinks = obj.nSinks + river.n;
           obj.nElements = obj.nElements +1;
           obj.Elements(obj.nElements) = river; 
        end 
        
        function addLake(obj,lake)
             obj.nLakes = obj.nLakes +1;
             obj.Lakes(obj.nLakes) = lake;
             obj.nSinks = obj.nSinks + lake.n;
             obj.nElements = obj.nElements +1;
             obj.Elements(obj.nElements) = lake; 

        %%need function that divides line sinks in entire model and updates
        %%nSinks
        
        
        end
        
        function sinks = Sinks(obj)
            
            sinks = LineSink.empty(obj.nSinks,0);
            counter = 1;
            for i = 1:obj.nElements
                for j = 1: obj.Elements(i).n
                    
                sinks(counter) = obj.Elements(i).LineSinks(j);
                counter = counter  + 1;
                end
            end
                                             
        end
    end
    
end

