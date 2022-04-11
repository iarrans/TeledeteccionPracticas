#Lab 5
%{
  r = (1:4:7589,1:4:8012) (reducir imagen)

  Conversión a png está en boletín de prácticas
  Falso color:
  recibe imagen compuesta por 3 bandas y sauqe primer banda rojo, segunda verde, tercera azul
  color verdadero cuando colores corresponden con rgb
  
  1) Cargamos los 3 colores
  
  r = imread('imagenroja');
  g = imread('imagenverde');
  a = imread('imagenazul');
  
  -----Color verdadero-----------------------
  tc = r; primera banda (equivalente a  tc(;,;,1) = r;
  tc(;,;,2) = g; segunda banda
  tc(;,;,3) = b; tercera banda
  imshow(tc);
  -----Falso color---EJ:1--------------------- (ref pag 49 del tema 2)
  
  cargamos verde, roja e infrarroja cercana nir-g-r
  nir = imread('imageninfrarrojacercana');
  
  fc1 = nir; primera banda (equivalente a  fc1(;,;,1) = nir; BANDA ROJA
  fc1(;,;,2) = r; segunda banda BANDA VERDE
  fc1(;,;,3) = g; tercera banda BANDA AZUL
  
  imshow(fc1);
 
  En el boletín, justo después, necesitamos un CORTE DE COLAS.
  
  -----Pseudocolor---EJ:2--------------------- (ref pag 49 del tema 2)
  Se suele usar para colorear una minoría de píxeles.
  
  Recomienda: sacar histograma para ajustar mejor los colores de este ejercicio.
  Objetivo es que coloreemos con algún criterio.
  hn= histo(n);
  hg= histo(g);
  Para cargar una imagen al lado de la otra:
  subplot(1,2,1);histo(n); 
  subplot(1,2,2);histo(g); 
  
  función seudo.
  sprintf(Procesando fila %d, f) para printear por pantalla y debuggear
  density slicing es parecido a seudo, pero fijándose en más pasos/nds.
  Mirar gamas colores estándar rgb en internet.
  En pseudocolor, normalmente, no se colorea todo.--> seudosobreimagen
  
    -----Calcular índice vegetación---EJ:3--------------------- 
  RVI = Infrarrojo cercano / Rojo (Ratio Vegetation Index)
  Datos dan resultado entre 0 y 1.
  Si las 2 bandas están en la misma resolución de bits, no hace falta normalizar para pasar al rango 0/1.
  Pero hay que convertirlos a double antes de hacer la cuenta para que no de error de redondeo. 
  Si no, hay que dividir el número que sea entre 255.
  NIR etre 0 y 1 
  función RVI
  
  NDVI, Aunque va de -1 a 1, no suele llegar a los extremos.
  función ndvi
  
 
  
}%