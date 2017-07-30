/// IsAny(val, v1, v2, ...)

for(var i = 1; i < argument_count; i++) {
    if(argument[0] == argument[i])
        return true;
}

return false;
