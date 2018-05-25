INSERT INTO `icasus_tipo_agregacion` (`id`, `descripcion`, `operador`, `explicacion`)
VALUES
  (0, 'No agregado', NULL, 'Su total se recoge del valor de la unidad en la que se mide el indicador/dato y del total anual o bienal en agregaciones temporales.'),
  (1, 'Media', 'AVG', 'Media de los valores.'),
  (2, 'Sumatorio', 'SUM', 'Sumatorio de los valores.'),
  (3, 'Máximo', 'MAX', 'Máximo de los valores.'),
  (4, 'Manual', 'MANUAL', 'Se introduce manualmente'),
  (5, 'Evolutivo', 'LAST', 'Último valor recogido.'),
  (6, 'Heredado', 'INHERIT', 'Sólo para indicadores/datos  calculados: el total se calcula en función del total de los indicadores/datos influyentes y no en función de los valores de las subunidades.');
