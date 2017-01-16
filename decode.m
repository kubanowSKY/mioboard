function [ values ] = decode( text )
str = '';
j = 1;
values=[];
len = length(text);
for i = 1:1:len
    if (or(text(i) > 47 & text(i) < 58,text(i) > 64 & text(i) < 71))
        str(j)=text(i);
        j=j+1;
    else
        value = hex2dec(str);
        values = [values, value];
        str='';
        j=1;
    end
        
    
end

