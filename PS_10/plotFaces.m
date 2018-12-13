function plotFaces(X,numPerLine,numLines)

faceW = 32; 
faceH = 32; 

Y = zeros(faceH*numLines,faceW*numPerLine); 
for i=0:numLines-1 
  	for j=0:numPerLine-1 
    	 Y(i*faceH+1:(i+1)*faceH,j*faceW+1:(j+1)*faceW) = reshape(X(:,i*numPerLine+j+1),[faceH,faceW]); 
  	end 
end 

figure()
imagesc(Y);
colormap(gray);
axis off;
axis equal;
