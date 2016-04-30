blk = [align_blkv0, align_blkv1, align_blkv2, align_blkv3, align_blkv4, align_blkv5, align_blkv6, align_blkv7, align_blkv8, align_blkv9, align_blkv10, align_blkv11, align_blkv12, align_blkv13, align_blkv14, align_blkv15];

blk_per_line = 21;
idx = 11;
imgline = 1;
img2 = 0;


while (idx <= length(blk))
    
    blk_offset = 0;
    while (blk_offset < blk_per_line & idx <= length(blk))
    
        if (blk_ready(idx)==1)
            img2(imgline,(blk_offset * 16 + 1):(blk_offset * 16 + 16)) = blk(idx,:);
            blk_offset = blk_offset + 1;
        end

        idx = idx + 1;
    end
    imgline = imgline + 1;
    
end


figure();
image(img2);
