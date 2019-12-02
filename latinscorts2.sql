CREATE TABLE `pais` (
`id_pais` int NOT NULL AUTO_INCREMENT COMMENT 'Es la llave que identifica el pais ',
`Nombre` varchar(70) NOT NULL COMMENT 'Este es el nombre del pais ',
PRIMARY KEY (`id_pais`) 
);
CREATE TABLE `departamento` (
`id_departamento` int NOT NULL AUTO_INCREMENT,
`id_pais` int NOT NULL,
`nombre` varchar(250) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NULL DEFAULT NULL COMMENT 'Nombre del departamento',
PRIMARY KEY (`id_departamento`, `id_pais`) 
);
CREATE TABLE `ciudad` (
`id_ciudad` int NOT NULL AUTO_INCREMENT,
`id_departamento` int NOT NULL,
`id_pais` int NOT NULL,
PRIMARY KEY (`id_ciudad`, `id_departamento`, `id_pais`) 
);
CREATE TABLE `usuario` (
`id_usuario` int NOT NULL AUTO_INCREMENT,
`nickname` varchar(150) NOT NULL,
`correo` varchar(150) NOT NULL,
`fecha_registro` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
`id_ciudad` int NULL,
`tipo` varchar(100) NOT NULL,
`ip_usuario` varchar(250) NULL,
PRIMARY KEY (`id_usuario`) 
);
CREATE TABLE `catador` (
`id_usuario_catador` int NOT NULL,
`cantidad_catadas` int(100) NULL,
PRIMARY KEY (`id_usuario_catador`) 
);
CREATE TABLE `tipo_usuario` (
`nombre` varchar(255) NOT NULL COMMENT 'Nombre del tipo de usuario al que corresponde',
`descripcion` varchar(255) NOT NULL,
PRIMARY KEY (`nombre`) 
);
CREATE TABLE `anunciante` (
`id_usuario_anunciante` int NOT NULL,
`telefono` numeric(10,0) NOT NULL,
`edad` int(4) NULL,
`descriptcion_perfil` longtext NULL COMMENT 'descripcion del perfil',
`foto_perfil` varchar(250) CHARACTER SET utf8 NULL COMMENT 'Esta sera la foto que tomaremos como perfil',
`sexo` int NULL,
`verificado` binary(1) NULL DEFAULT 0,
`valoracion` double(5,2) NULL,
PRIMARY KEY (`id_usuario_anunciante`) 
);
CREATE TABLE `hotel` (
`id_hotel_usuario` int NOT NULL,
`nombre` varchar(200) NOT NULL,
`direccion` varchar(200) CHARACTER SET utf8 NOT NULL,
`telefono` numeric(11,0) NOT NULL,
PRIMARY KEY (`id_hotel_usuario`) 
);
CREATE TABLE `moderador` (
`id_moderador_usuario` int NOT NULL,
`nombre` varchar(100) NULL,
`nivel` int NOT NULL,
`telefono` int(11) NOT NULL,
`documento` int(20) NOT NULL,
`direccion` varchar(200) NOT NULL,
PRIMARY KEY (`id_moderador_usuario`) 
);
CREATE TABLE `sexo` (
`id_sexo` int NOT NULL AUTO_INCREMENT,
`descripcion` varchar(50) NOT NULL COMMENT 'Aqui se indicara el nombre del sexo',
PRIMARY KEY (`id_sexo`) 
);
CREATE TABLE `categoria` (
`id_categoria` int NOT NULL AUTO_INCREMENT,
`descripcion` varchar(200) NOT NULL,
PRIMARY KEY (`id_categoria`) 
);
CREATE TABLE `nivel` (
`id_nivel` int NOT NULL AUTO_INCREMENT,
`descripcion` varchar(50) NOT NULL,
PRIMARY KEY (`id_nivel`) 
);
CREATE TABLE `galeria` (
`id_galeria_usuario` int NOT NULL,
`id_galeria` int NOT NULL AUTO_INCREMENT,
`url_carpeta` varchar(0) NOT NULL,
`fecha` datetime NULL ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (`id_galeria`) 
);
CREATE TABLE `anuncio` (
`id_anuncio` int NOT NULL AUTO_INCREMENT,
`id_anuncio_usuario` int NOT NULL,
`telefono` numeric(11,0) NOT NULL,
`titulo` varchar(80) NOT NULL,
`descripcion` varchar(100) NULL,
`texto` longtext NULL,
`fecha_creacion` datetime NULL ON UPDATE CURRENT_TIMESTAMP,
`fecha_actualizacion` datetime NULL ON UPDATE CURRENT_TIMESTAMP,
`estado` int NOT NULL,
`tipo_anuncio` int NOT NULL,
`url_marco` varchar(250) NULL,
`categoria` int NULL,
`packete_descripcion` int NULL,
`url_web` varchar(200) NULL,
PRIMARY KEY (`id_anuncio`, `id_anuncio_usuario`) 
);
CREATE TABLE `foto` (
`id_foto` int NOT NULL AUTO_INCREMENT,
`id_foto_anuncio` int NULL,
`url` varchar(250) NOT NULL,
`fecha` datetime NULL ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (`id_foto`) 
);
CREATE TABLE `paquete_descripcion` (
`id_paquete` int NOT NULL AUTO_INCREMENT,
`titulo` varchar(80) NOT NULL,
`descripcion` varchar(100) NULL,
`texto` longtext NOT NULL,
PRIMARY KEY (`id_paquete`) 
);
CREATE TABLE `factura` (
`id_facura` int NOT NULL AUTO_INCREMENT,
`id_factura_anuncio` int NOT NULL,
`id_factura_usuario` int NOT NULL,
`fecha_facturacion` datetime NULL ON UPDATE CURRENT_TIMESTAMP,
`pago_verificado` binary(0) NULL,
`tipo_tipoanuncio_factura` int NOT NULL,
PRIMARY KEY (`id_facura`) 
);
CREATE TABLE `tipo_anuncioTOP` (
`id_tipo` int NOT NULL AUTO_INCREMENT,
`nombre` varchar(100) NOT NULL,
`descripcion` varchar(250) NOT NULL,
PRIMARY KEY (`id_tipo`) 
);
CREATE TABLE `estadisticas` (
`id_estadistica` int NOT NULL AUTO_INCREMENT,
`id_anuncio` int NOT NULL,
`fecha` datetime NULL ON UPDATE CURRENT_TIMESTAMP,
`numero_listada` int(100) NOT NULL,
`numero_llamado_lista` int(100) NULL,
`numero_llamado_expandidas` int(100) NULL,
`numero_expandidas` int(100) NULL,
`numero_whatsapp1` int(100) NULL,
`numero_whatsapp2` int  NULL,
PRIMARY KEY (`id_estadistica`) 
);
CREATE TABLE `historico_estadistica` (
`id_estadistica` int NOT NULL,
`id_anuncio` int NOT NULL,
`fecha` datetime NULL ON UPDATE CURRENT_TIMESTAMP,
`numero_listada` int(100) NOT NULL,
`numero_llamado_lista` int(100) NULL,
`numero_llamado_expandidas` int(100) NULL,
`numero_expandidas` int(100) NULL,
`numero_whatsapp1` int(100) NULL,
`numero_whatsapp2` int  NULL,
PRIMARY KEY (`id_estadistica`) 
);
CREATE TABLE `estado` (
`id` int NOT NULL AUTO_INCREMENT,
`nombre` varchar(0) NOT NULL,
`descripcion` varchar(0) NOT NULL,
PRIMARY KEY (`id`) 
);
CREATE TABLE `blacklist` (
`ip` varchar(250) NULL,
`telefono` varchar(250) NULL,
`correo` varchar(250) NULL,
`usuario` int NOT NULL,
PRIMARY KEY (`usuario`) 
);
CREATE TABLE `redes_sociales` (
`id` int NOT NULL AUTO_INCREMENT,
`id_redesociales_usuario` int NOT NULL,
`nombre` varchar(100) NOT NULL,
`url` varchar(250) NOT NULL,
PRIMARY KEY (`id`) 
);
CREATE TABLE `resenas` (
`id_articulo` int NOT NULL AUTO_INCREMENT,
`id_articulo_usuario` int NOT NULL,
`id_articulo_digido` int NOT NULL,
`descripcion` longtext NOT NULL,
`fecha_realizada` datetime NULL ON UPDATE CURRENT_TIMESTAMP,
`estado` int NOT NULL,
PRIMARY KEY (`id_articulo`) 
);
CREATE TABLE `comentario` (
`id_comentario` int NOT NULL AUTO_INCREMENT,
`texto` longtext NOT NULL,
`id_comentario_escritor` int NOT NULL,
`id_comentario_anuncio` int NULL,
`id_comentario_habitacion` int NULL,
`id_comentario_resena` int NULL,
`fecha` datetime NULL ON UPDATE CURRENT_TIMESTAMP,
`estado` int NOT NULL,
PRIMARY KEY (`id_comentario`) 
);
CREATE TABLE `respuesta` (
`id_comentario` int NOT NULL,
`id_comentario_respuesta` int NOT NULL,
`id_escritor` int NOT NULL,
PRIMARY KEY (`id_comentario`) 
);
CREATE TABLE `habitacion` (
`id_hotel` int NOT NULL,
`id_habitacion` int NOT NULL AUTO_INCREMENT,
`nombre` varchar(100) NOT NULL,
`descripcion` varchar(200) NOT NULL,
`cupo_max` int NOT NULL,
`precio` int NOT NULL,
`estado` int NULL,
PRIMARY KEY (`id_habitacion`, `id_hotel`) 
);
CREATE TABLE `servicio_adicional` (
`id_servicio` int NOT NULL AUTO_INCREMENT,
`nombre` varchar(100) NOT NULL,
`descripcion` varchar(250) NULL,
`precio` int(100) NULL,
PRIMARY KEY (`id_servicio`) 
);
CREATE TABLE `reservacion` (
`id_reservacion` int NOT NULL AUTO_INCREMENT,
`id_habitacion` int NOT NULL,
`fecha` datetime NULL ON UPDATE CURRENT_TIMESTAMP,
`fecha_reserva` datetime NULL ON UPDATE CURRENT_TIMESTAMP,
`pago` int NOT NULL DEFAULT 0,
PRIMARY KEY (`id_reservacion`, `id_habitacion`) 
);
CREATE TABLE `factura_hotel` (
`id_hotel` int NOT NULL,
`id_factura` int NOT NULL AUTO_INCREMENT,
`fecha` datetime NULL ON UPDATE CURRENT_TIMESTAMP,
`pago` int NULL,
PRIMARY KEY (`id_factura`) 
);
CREATE TABLE `tags` (
`id_tag` int NOT NULL AUTO_INCREMENT,
`nombre` varchar(100) NOT NULL,
`descipcion` varchar(200) NOT NULL,
`tipo` varchar(255) NOT NULL,
PRIMARY KEY (`id_tag`) 
);
CREATE TABLE `anuncio_vs_tag` (
`id_referencia` int NOT NULL,
`id_anuncio` int NOT NULL,
`id_tag` int NOT NULL,
PRIMARY KEY (`id_referencia`, `id_anuncio`, `id_tag`) 
);
CREATE TABLE `habitacion_vs_tag` (
`id_referencia` int NOT NULL,
`id_habitacion` int NOT NULL,
`id_tag` int NOT NULL,
PRIMARY KEY (`id_referencia`, `id_habitacion`, `id_tag`) 
);
CREATE TABLE `habitacion_vs_servicio` (
`id_servicio` int NOT NULL,
`id_habitacion` int NOT NULL,
PRIMARY KEY (`id_servicio`, `id_habitacion`) 
);
CREATE TABLE `estado_habitacion` (
`id_estado` int NOT NULL AUTO_INCREMENT,
`nombre` varchar(100) NOT NULL,
PRIMARY KEY (`id_estado`) 
);
CREATE TABLE `cambo_nivel` (
`id_moderador_cambio` int NOT NULL,
`id_moderado_nivel-cambio` int NOT NULL,
`descripcion` varchar(200) NOT NULL,
`fecha_realizacion` datetime NULL ON UPDATE CURRENT_TIMESTAMP,
`nivel_nuevo` int NOT NULL,
`nivel_anterior` int NOT NULL,
PRIMARY KEY (`id_moderador_cambio`, `id_moderado_nivel-cambio`) 
);
CREATE TABLE `tipo_moderacion` (
`id_moderacion` int NOT NULL,
`descripcion` varchar(100) NOT NULL,
`fecha` datetime NULL ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (`id_moderacion`) 
);
CREATE TABLE `moderacion` (
`id_moderador` int NOT NULL,
`fecha` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
`tipo_moderacion` int NOT NULL,
`descripcion` varchar(200) NOT NULL,
`moderacion_id-anuncio` int NULL,
`moderacion_id-comentario` int NULL,
`moderacion_id-resena` int NULL
);

ALTER TABLE `departamento` ADD CONSTRAINT `id_pais` FOREIGN KEY (`id_pais`) REFERENCES `pais` (`id_pais`) ON DELETE NO ACTION ON UPDATE CASCADE;
ALTER TABLE `ciudad` ADD CONSTRAINT `fk_departamento` FOREIGN KEY (`id_departamento`) REFERENCES `departamento` (`id_departamento`) ON DELETE NO ACTION ON UPDATE CASCADE;
ALTER TABLE `usuario` ADD CONSTRAINT `fk_usuario_ciudad` FOREIGN KEY (`id_ciudad`) REFERENCES `ciudad` (`id_ciudad`) ON DELETE NO ACTION ON UPDATE CASCADE;
ALTER TABLE `usuario` ADD CONSTRAINT `fk_usuario_tipo` FOREIGN KEY (`tipo`) REFERENCES `tipo_usuario` (`nombre`) ON DELETE NO ACTION ON UPDATE CASCADE;
ALTER TABLE `catador` ADD CONSTRAINT `fk_catador_usuario` FOREIGN KEY (`id_usuario_catador`) REFERENCES `usuario` (`id_usuario`) ON DELETE NO ACTION ON UPDATE CASCADE;
ALTER TABLE `anunciante` ADD CONSTRAINT `fk_anunciante_usuario` FOREIGN KEY (`id_usuario_anunciante`) REFERENCES `usuario` (`id_usuario`) ON DELETE NO ACTION ON UPDATE CASCADE;
ALTER TABLE `hotel` ADD CONSTRAINT `fk_hotel_usuario` FOREIGN KEY (`id_hotel_usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE NO ACTION ON UPDATE CASCADE;
ALTER TABLE `moderador` ADD CONSTRAINT `fk_moderado_usuario` FOREIGN KEY (`id_moderador_usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE NO ACTION ON UPDATE CASCADE;
ALTER TABLE `anunciante` ADD CONSTRAINT `fk_anunciante_sexo` FOREIGN KEY (`sexo`) REFERENCES `sexo` (`id_sexo`) ON DELETE NO ACTION ON UPDATE CASCADE;
ALTER TABLE `moderador` ADD CONSTRAINT `fk_moderador_nivel` FOREIGN KEY (`nivel`) REFERENCES `nivel` (`id_nivel`) ON DELETE NO ACTION ON UPDATE CASCADE;
ALTER TABLE `galeria` ADD CONSTRAINT `fk_galeria_usuario` FOREIGN KEY (`id_galeria_usuario`) REFERENCES `anunciante` (`id_usuario_anunciante`) ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE `anuncio` ADD CONSTRAINT `fk_anuncio_anunciante` FOREIGN KEY (`id_anuncio_usuario`) REFERENCES `anunciante` (`id_usuario_anunciante`) ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE `anuncio` ADD CONSTRAINT `fk_anuncio_categori` FOREIGN KEY (`categoria`) REFERENCES `categoria` (`id_categoria`) ON DELETE NO ACTION ON UPDATE CASCADE;
ALTER TABLE `foto` ADD CONSTRAINT `fk_foto_anuncio` FOREIGN KEY (`id_foto_anuncio`) REFERENCES `anuncio` (`id_anuncio`) ON DELETE NO ACTION ON UPDATE CASCADE;
ALTER TABLE `factura` ADD CONSTRAINT `fk_factura_id-usuario` FOREIGN KEY (`id_factura_usuario`) REFERENCES `anunciante` (`id_usuario_anunciante`) ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE `factura` ADD CONSTRAINT `fk_factura_anuncio` FOREIGN KEY (`id_factura_anuncio`) REFERENCES `anuncio` (`id_anuncio`) ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE `anuncio` ADD CONSTRAINT `fk_anuncio_tipoanuncio` FOREIGN KEY (`tipo_anuncio`) REFERENCES `tipo_anuncioTOP` (`id_tipo`) ON DELETE NO ACTION ON UPDATE CASCADE;
ALTER TABLE `factura` ADD CONSTRAINT `fk_factura_tipoanuncio` FOREIGN KEY (`tipo_tipoanuncio_factura`) REFERENCES `tipo_anuncioTOP` (`id_tipo`) ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE `estadisticas` ADD CONSTRAINT `fk_estadistica_anuncio` FOREIGN KEY (`id_anuncio`) REFERENCES `anuncio` (`id_anuncio`) ON DELETE NO ACTION ON UPDATE CASCADE;
ALTER TABLE `historico_estadistica` ADD CONSTRAINT `fk_historicoestadisticas_anuncio` FOREIGN KEY (`id_anuncio`) REFERENCES `anuncio` (`id_anuncio`) ON DELETE NO ACTION ON UPDATE CASCADE;
ALTER TABLE `anuncio` ADD CONSTRAINT `fk_anuncio_paquete` FOREIGN KEY (`packete_descripcion`) REFERENCES `paquete_descripcion` (`id_paquete`) ON DELETE NO ACTION ON UPDATE CASCADE;
ALTER TABLE `anuncio` ADD CONSTRAINT `fk_anuncio_estado` FOREIGN KEY (`estado`) REFERENCES `estado` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;
ALTER TABLE `redes_sociales` ADD CONSTRAINT `fk_redessociales_usuario` FOREIGN KEY (`id_redesociales_usuario`) REFERENCES `anunciante` (`id_usuario_anunciante`) ON DELETE NO ACTION ON UPDATE CASCADE;
ALTER TABLE `resenas` ADD CONSTRAINT `fk_articulo_usuario` FOREIGN KEY (`id_articulo_usuario`) REFERENCES `catador` (`id_usuario_catador`) ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE `resenas` ADD CONSTRAINT `fk_articulo_anunciante` FOREIGN KEY (`id_articulo_digido`) REFERENCES `anunciante` (`id_usuario_anunciante`) ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE `comentario` ADD CONSTRAINT `fk_comentario_anunciante` FOREIGN KEY (`id_comentario_escritor`) REFERENCES `anunciante` (`id_usuario_anunciante`) ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE `comentario` ADD CONSTRAINT `fk_comentario_catador` FOREIGN KEY (`id_comentario_escritor`) REFERENCES `catador` (`id_usuario_catador`) ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE `comentario` ADD CONSTRAINT `fk_comentario_anuncio` FOREIGN KEY (`id_comentario_anuncio`) REFERENCES `anuncio` (`id_anuncio`) ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE `resenas` ADD CONSTRAINT `fk_articulo_hotel` FOREIGN KEY (`id_articulo_digido`) REFERENCES `hotel` (`id_hotel_usuario`) ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE `comentario` ADD CONSTRAINT `fk_comentario_resena` FOREIGN KEY (`id_comentario_resena`) REFERENCES `resenas` (`id_articulo`) ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE `comentario` ADD CONSTRAINT `fk_comentario_estado` FOREIGN KEY (`estado`) REFERENCES `estado` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE `resenas` ADD CONSTRAINT `fk_articulo_estado` FOREIGN KEY (`estado`) REFERENCES `estado` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE `habitacion` ADD CONSTRAINT `fk_hatibacion_hotel` FOREIGN KEY (`id_hotel`) REFERENCES `hotel` (`id_hotel_usuario`) ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE `tags` ADD CONSTRAINT `fk_tag_tipo` FOREIGN KEY (`tipo`) REFERENCES `tipo_usuario` (`nombre`) ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE `anuncio_vs_tag` ADD CONSTRAINT `fk_anuncio-vs-tag_anuncio` FOREIGN KEY (`id_anuncio`) REFERENCES `anuncio` (`id_anuncio`) ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE `anuncio_vs_tag` ADD CONSTRAINT `fk_anuncio-vs-tag_tag` FOREIGN KEY (`id_tag`) REFERENCES `tags` (`id_tag`) ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE `habitacion_vs_tag` ADD CONSTRAINT `fk_habitacion-vs-tag_habitacion` FOREIGN KEY (`id_habitacion`) REFERENCES `habitacion` (`id_hotel`) ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE `habitacion_vs_tag` ADD CONSTRAINT `fk_habitacion-vs-tag_tag` FOREIGN KEY (`id_tag`) REFERENCES `tags` (`id_tag`) ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE `reservacion` ADD CONSTRAINT `fk_reserva_habitacion` FOREIGN KEY (`id_habitacion`) REFERENCES `habitacion` (`id_habitacion`) ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE `habitacion_vs_servicio` ADD CONSTRAINT `fk_habitacion` FOREIGN KEY (`id_habitacion`) REFERENCES `habitacion` (`id_habitacion`) ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE `habitacion_vs_servicio` ADD CONSTRAINT `fk_servicio` FOREIGN KEY (`id_servicio`) REFERENCES `servicio_adicional` (`id_servicio`) ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE `habitacion` ADD CONSTRAINT `fk_habitacion_estado` FOREIGN KEY (`estado`) REFERENCES `estado_habitacion` (`id_estado`) ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE `factura_hotel` ADD CONSTRAINT `fk_hotel` FOREIGN KEY (`id_hotel`) REFERENCES `hotel` (`id_hotel_usuario`) ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE `respuesta` ADD CONSTRAINT `fk_respuesta_comentario` FOREIGN KEY (`id_comentario`) REFERENCES `comentario` (`id_comentario`) ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE `respuesta` ADD CONSTRAINT `fk_respuesta_id-escritor` FOREIGN KEY (`id_escritor`) REFERENCES `comentario` (`id_comentario_escritor`) ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE `comentario` ADD CONSTRAINT `fk_comentario_habitacion` FOREIGN KEY (`id_comentario_habitacion`) REFERENCES `habitacion` (`id_habitacion`) ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE `cambo_nivel` ADD CONSTRAINT `fk_cambio-nivel_cambio` FOREIGN KEY (`nivel_nuevo`) REFERENCES `nivel` (`id_nivel`) ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE `cambo_nivel` ADD CONSTRAINT `fk_cambio-nivel_anterior` FOREIGN KEY (`nivel_anterior`) REFERENCES `nivel` (`id_nivel`) ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE `cambo_nivel` ADD CONSTRAINT `fl_cambio-nivel_moderado-hizo-cambio` FOREIGN KEY (`id_moderador_cambio`) REFERENCES `moderador` (`id_moderador_usuario`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `cambo_nivel` ADD CONSTRAINT `fk_cambio-nivel_moderador_cambiado` FOREIGN KEY (`id_moderado_nivel-cambio`) REFERENCES `moderador` (`id_moderador_usuario`) ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE `blacklist` ADD CONSTRAINT `fk_ip_usuario` FOREIGN KEY (`usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE `moderacion` ADD CONSTRAINT `fk_moderacion_moderador` FOREIGN KEY (`id_moderador`) REFERENCES `moderador` (`id_moderador_usuario`) ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE `moderacion` ADD CONSTRAINT `fk_moderacion_tipo` FOREIGN KEY (`tipo_moderacion`) REFERENCES `tipo_moderacion` (`id_moderacion`) ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE `moderacion` ADD CONSTRAINT `fk_moderacion_id-resena` FOREIGN KEY (`moderacion_id-resena`) REFERENCES `resenas` (`id_articulo`) ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE `moderacion` ADD CONSTRAINT `fk_moderacion_id-comentario` FOREIGN KEY (`moderacion_id-comentario`) REFERENCES `comentario` (`id_comentario`) ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE `moderacion` ADD CONSTRAINT `fk_moderacion_id-anuncio` FOREIGN KEY (`id_moderador`) REFERENCES `anuncio` (`id_anuncio`) ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE `galeria` ADD CONSTRAINT `fk_galeria_hotel` FOREIGN KEY (`id_galeria_usuario`) REFERENCES `hotel` (`id_hotel_usuario`) ON DELETE RESTRICT ON UPDATE CASCADE;

