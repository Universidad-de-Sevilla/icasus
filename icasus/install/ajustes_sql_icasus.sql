// Cuidado al aplicar este script porque puede modificar el comportamiento de otras aplicaciones usando el mismo servidor

SET sql_mode=(SELECT REPLACE(@@sql_mode, 'ONLY_FULL_GROUP_BY', ''));