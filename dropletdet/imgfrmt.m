align_blk0 = typecast(align_blk0, 'int8');
align_blk1 = typecast(align_blk1, 'int8');
align_blk2 = typecast(align_blk2, 'int8');
align_blk3 = typecast(align_blk3, 'int8');

align_blk4 = typecast(align_blk4, 'int8');
align_blk5 = typecast(align_blk5, 'int8');
align_blk6 = typecast(align_blk6, 'int8');
align_blk7 = typecast(align_blk7, 'int8');


align_blk8 = typecast(align_blk8, 'int8');
align_blk9 = typecast(align_blk9, 'int8');
align_blk10 = typecast(align_blk10, 'int8');
align_blk11 = typecast(align_blk11, 'int8');

align_blk12 = typecast(align_blk12, 'int8');
align_blk13 = typecast(align_blk13, 'int8');
align_blk14 = typecast(align_blk14, 'int8');
align_blk15 = typecast(align_blk15, 'int8');



blk = [align_blk0, align_blk1, align_blk2, align_blk3, align_blk4, align_blk5, align_blk6, align_blk7, align_blk8, align_blk9, align_blk10, align_blk11, align_blk12, align_blk13, align_blk14, align_blk15];


blk_per_line = 21;
idx = 1;
imgline = 1;
img = 0;

while (idx <= length(blk))
    
    blk_offset = 0;
    while (blk_offset < blk_per_line & idx <= length(blk))
        if (blk_ready(idx)==1)
            img(imgline,(blk_offset * 16 + 1):(blk_offset * 16 + 16)) = blk(idx,:);
            blk_offset = blk_offset + 1;
        end
        idx = idx + 1;
    end
    imgline = imgline + 1;
    
end


figure();
image(img);
