function [ values ] = decode( text )
str = '';
j = 1;
values=[];
len = length(text);
previous_value = 0;

for i = 1:1:len
    
    if (or(text(i) > 47 & text(i) < 58,text(i) > 64 & text(i) < 71))
        str(j)=text(i);
        j=j+1;
    else
         value = hex2dec(str);
         if value > 4095
             value = previous_value;
         end
         value = value - 2048;
         values = [values, value];
         str='';
         j=1;
         previous_value = value;
         end
     end
        
    
end

