lineArray = [concat_blk0, concat_blk1, concat_blk2, concat_blk3, concat_blk4, concat_blk5, concat_blk6, concat_blk7, concat_blk8, concat_blk9, concat_blk10, concat_blk11, concat_blk12, concat_blk13, concat_blk14, concat_blk15, concat_blk16, concat_blk17, concat_blk18, concat_blk19, concat_blk20];


line = 1;
imgline = 1;
img = 0;

while (line <= length(concat_rdy))
    if (concat_rdy(line)==1)
        blk_offset = 0;
        i = 1;
        % get a blk
        while(i <= 21)
            blkfi=lineArray(line, i);
            blkbin = blkfi.bin();
            
            blk = [bin2dec(blkbin(1:8)), bin2dec(blkbin(9:16)), bin2dec(blkbin(17:24)), bin2dec(blkbin(25:32)), bin2dec(blkbin(33:40)), bin2dec(blkbin(41:48)), bin2dec(blkbin(49:56)), bin2dec(blkbin(57:64)), bin2dec(blkbin(65:72)), bin2dec(blkbin(73:80)), bin2dec(blkbin(81:88)), bin2dec(blkbin(89:96)), bin2dec(blkbin(97:104)),bin2dec(blkbin(105:112)), bin2dec(blkbin(113:120)), bin2dec(blkbin(121:128))];
            
            blk = typecast(uint8(blk), 'int8');
            
            img(imgline,(blk_offset * 16 + 1):(blk_offset * 16 + 16)) = blk;
            blk_offset = blk_offset + 1;
            
            i = i + 1;
            
        end
        
        imgline = imgline + 1;
    end
    line = line + 1;

end



figure();
image(img);
