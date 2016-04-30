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
