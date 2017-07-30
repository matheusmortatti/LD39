/// Approach(start, end, shift);

argument2 = abs(argument2);

if (argument0 < argument1)
    return min(argument0 + argument2, argument1); 
else
    return max(argument0 - argument2, argument1);
