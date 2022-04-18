% Recomienda imagen entre 1000 y 2000
% a = imread('banda.png')
% diezmar (mirar cómo)
% azul = uint8(round(a./(2^4)));
% azul = uint8(round(azul./(2^4)));
% azul = imwrite(azul,'azul.png');

%%%%%%%%%%%%Pasar la imagen rgb a monobanda:
# 2.1
% gris= rgb2gray(img)
% también se puede con rgb to hsv y quedarse con v
% gris = imread('bn2graydiezma.png');
% h = histo(gris);
% hay que revisar ploteo. (bars)
#
# 2.2
# expansion = span(gris,60,120);
#
#
# 2.3
#
#
#