DROP TABLE IF EXISTS public.types_prod CASCADE;

CREATE TABLE public.types_prod (
  id BIGSERIAL,
  t_name VARCHAR NOT NULL,
  t_description TEXT,
  created_at TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP NOT NULL,
  updated_at TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP NOT NULL,
  active BOOLEAN DEFAULT true,
  created_by BIGINT,
  updated_by BIGINT,
  CONSTRAINT types_prod_pkey PRIMARY KEY(id)
);

INSERT INTO public.types_prod ("id", "t_name", "t_description", "created_by", "updated_by") VALUES
(1, E'Estructura de Investigación - Estado', E'Estados de las extructuras de investigación', 1, 1),
(2, E'Estructura de Investigación - Tipo', NULL, 1, 1),
(3, E'Producto - Tipología', NULL, 1, 1),
(5, E'Artículo - Tipo', NULL, 1, 1),
(6, E'Patente - Estado', NULL, 1, 1),
(7, E'Ciclo - Tipo', NULL, 1, 1),
(8, E'Petición - Estado', NULL, 1, 1),
(9, E'Obra -Tipo', NULL, 1, 1),
(10, E'Área y/o Especialidad de Conocimiento', NULL, 1, 1),
(11, E'Artículo - Categoría', NULL, 1, 1),
(12, E'Libros resultados de investigación - Categoría', NULL, 1, 1),
(13, E'Capítulo de Libro - Categoría', NULL, 1, 1),
(14, E'Patente - Tipo', NULL, 1, 1),
(15, E'Patente - Categoría', NULL, 1, 1),
(16, E'Variedad Vegetal - Categoría', NULL, 1, 1),
(17, E'Nueva Raza Animal - Categoría', NULL, 1, 1),
(18, E'Poblaciones mejoradas de razas pecuarias - Categoría', NULL, 1, 1),
(19, E'Obras o productos de investigación-creación en Artes Arquitectura y Diseño - Categoría', NULL, 1, 1),
(20, E'Nota Científica - Categoría', NULL, 1, 1),
(21, E'Estructura de Investigación - Documento', NULL, 1, 1),
(22, E'Artículo - Documento', NULL, 1, 1),
(23, E'Libros resultado de investigación - Documento', NULL, 1, 1),
(24, E'Capítulo de Libro - Documento', NULL, 1, 1),
(25, E'Patente - Documento', NULL, 1, 1),
(26, E'Variedad Vegetal - Documento', NULL, 1, 1),
(27, E'Nueva Raza Animal - Documento', NULL, 1, 1),
(28, E'Poblaciones mejoradas de razas pecuarias - Documento', NULL, 1, 1),
(29, E'Obras o productos de investigación-creación en Artes Arquitectura y Diseño - Documento', NULL, 1, 1),
(30, E'Nota Científica - Documento', NULL, 1, 1),
(31, E'Participante - Tipo', NULL, 1, 1),
(32, E'Diseño Industrial - Categoría', NULL, 1, 1),
(33, E'Esquema de circuito integrado - Categoría', NULL, 1, 1),
(34, E'Software - Categoría', NULL, 1, 1),
(35, E'Planta piloto - Categoría', NULL, 1, 1),
(36, E'Prototipo industrial - Categoría', NULL, 1, 1),
(37, E'Signos distintivos - Categoría', NULL, 1, 1),
(38, E'Productos nutraceúticos - Categoría', NULL, 1, 1),
(39, E'Colección científica - Categoría', NULL, 1, 1),
(40, E'Nuevo registro científico - Categoría', NULL, 1, 1),
(41, E'Planta piloto y Prototipo industrial - Tipo', NULL, 1, 1),
(42, E'Diseño Industrial - Documento', NULL, 1, 1),
(43, E'Esquema de circuito integrado - Documento', NULL, 1, 1),
(44, E'Software - Documento', NULL, 1, 1),
(45, E'Planta piloto - Documento', NULL, 1, 1),
(46, E'Prototipo industrial - Documento', NULL, 1, 1),
(47, E'Signos distintivos - Documento', NULL, 1, 1),
(48, E'Productos nutraceúticos - Documento', NULL, 1, 1),
(49, E'Colección científica - Documento', NULL, 1, 1),
(50, E'Nuevo registro científico - Documento', NULL, 1, 1),
(51, E'Evento - Tipo', NULL, 1, 1),
(52, E'Dirección de Tesis y Trabajo de Grado - Tipo', NULL, 1, 1),
(53, E'Estructura de Investigación - Línea de Investigación', NULL, 1, 1),
(54, E'Convocatoria -Tipología', NULL, 1, 1),
(55, E'Certificado de radicación-avalada por la OTRI-Bogotá', E'Certificado de radicación de tramite ante la entidad correspondiente (ICA, 1, 1), avalada por la OTRI-Bogotá', 1, 1),
(56, E'Secreto empresarial - Documento', NULL, 1, 1),
(57, E'Secreto empresarial - Categoría', NULL, 1, 1),
(58, E'Empresa de base tecnológica - Documento', E'Empresa de base tecnológica (Spin- off y Start-up)', 1, 1),
(59, E'Empresa de base tecnológica - Categoría', NULL, 1, 1),
(60, E'Nueva Raza Animal - Estado', NULL, 1, 1),
(61, E'Variedad vegetal- Ciclo', NULL, 1, 1),
(63, E'Innovación generada en la gestión empresarial - Documento', NULL, 1, 1),
(64, E'Variedad vegetal - Estado', NULL, 1, 1),
(65, E'Evento - Participación', E'Evento - Participación', 1, 1),
(66, E'Empresas creativas y culturales - Documento', NULL, 1, 1),
(67, E'Productos resultados de la creación o investigación-creación - Documento', E'Productos resultados - Documentos', 1, 1),
(69, E'Certificado de curaduría o reconocimiento recibido por la obra', NULL, 1, 1),
(70, E'Productos resultados de la creación o investigación-creación - Categoría', NULL, 1, 1),
(71, E'Naturaleza - Tipo', NULL, 1, 1),
(72, E'Empresas creativas y culturales - Categoría', NULL, 1, 1),
(73, E'Innovación generada en la gestión empresarial - Categoría', NULL, 1, 1),
(74, E'Innovación en procedimiento y servicio - Documento', NULL, 1, 1),
(75, E'Innovación en procedimiento y servicio - Categoría', NULL, 1, 1),
(76, E'Norma - Categoría', NULL, 1, 1),
(77, E'Norma - Documento', NULL, 1, 1),
(78, E'Reglamentos - Documento', NULL, 1, 1),
(79, E'Reglamentos - Categoría', NULL, 1, 1),
(80, E'Legislaciones - Documento', NULL, 1, 1),
(81, E'Legislaciones - Categoría', NULL, 1, 1),
(82, E'Guías práctica clínica - Categoría', NULL, 1, 1),
(83, E'Guías práctica clínica - Documento', NULL, 1, 1),
(84, E'Guías manejo clínico forense - Categoría', NULL, 1, 1),
(85, E'Guías manejo clínico forense - Documento', NULL, 1, 1),
(86, E'Manuales y Modelos de atención diferencial a víctimas - Categoría', NULL, 1, 1),
(87, E'Manuales y Modelos de atención diferencial a víctimas - Documento', NULL, 1, 1),
(88, E'Protocolos de atención a usuarios/víctimas (pacientes) - Categoría', NULL, 1, 1),
(89, E'Protocolos de atención a usuarios/víctimas (pacientes) - Documento', NULL, 1, 1),
(90, E'Protocolos de vigilancia epidemiológica - Categoría', NULL, 1, 1),
(91, E'Protocolos de vigilancia epidemiológica - Documento', NULL, 1, 1),
(92, E'Actos de Ley - Categoría', NULL, 1, 1),
(93, E'Actos de Ley - Documento', NULL, 1, 1),
(94, E'Proyectos de ley - Categorìa', NULL, 1, 1),
(95, E'Proyectos de ley - Documento', NULL, 1, 1),
(96, E'Conceptos técnicos - Categoría', NULL, 1, 1),
(97, E'Conceptos técnicos - Documento', NULL, 1, 1),
(98, E'Registros de Acuerdos de licencia - Categoría', NULL, 1, 1),
(99, E'Registros de Acuerdos de licencia - Documento', NULL, 1, 1),
(100, E'Procesos de apropiacion social del conocimiento para el fortalecimiento o solucion de asuntos de interes - Categoría', NULL, 1, 1),
(101, E'Procesos de apropiacion social del conocimiento para el fortalecimiento o solucion de asuntos de interes - Documento', NULL, 1, 1),
(102, E'Procesos de apropiación social del conocimiento para la generación de insumos de política pública y normatividad - Documento', NULL, 1, 1),
(103, E'Procesos de apropiación social del conocimiento para la generación de insumos de política pública y normatividad - Categoría', NULL, 1, 1),
(104, E'Procesos de Apropiación social del conocimiento para el fortalecimiento de cadenas productivas - Categoría', NULL, 1, 1),
(105, E'Procesos de Apropiación social del conocimiento para el fortalecimiento de cadenas productivas - Documento', NULL, 1, 1),
(106, E'Procesos de apropiación social del conocimiento resultado del trabajo conjunto entre un Centro de Ciencia y un grupo de Investigación - Categoría', NULL, 1, 1),
(107, E'Procesos de apropiación social del conocimiento resultado del trabajo conjunto entre un Centro de Ciencia y un grupo de Investigación - Documento', NULL, 1, 1),
(108, E'Eventos científicos con componentes de apropiación - Categoría', NULL, 1, 1),
(110, E'Eventos científicos con componentes de apropiación - Documento', NULL, 1, 1),
(111, E'Red de conocimiento especializado  - Categoría', NULL, 1, 1),
(112, E'Red de conocimiento especializado  - Documento', NULL, 1, 1),
(113, E'Talleres de Creación - Categoría', NULL, 1, 1),
(114, E'Talleres de Creación - Documento', NULL, 1, 1),
(115, E'Eventos artísticos, de arquitectura o de diseño - Documento', E'Eventos artísticos, de arquitectura o de diseño con componentes de apropiación', 1, 1),
(116, E'Eventos artísticos, de arquitectura o de diseño - Categoría', NULL, 1, 1),
(117, E'Documento de trabajo (Working paper) - Categoría', NULL, 1, 1),
(118, E'Documento de trabajo (Working paper) - Documento', NULL, 1, 1),
(119, E'Nueva Secuencia Genética - Categoría', NULL, 1, 1),
(120, E'Nueva Secuencia Genética - Documento', NULL, 1, 1),
(121, E'Ediciones de revista o libro de divulgación científica - Categoría', NULL, 1, 1),
(122, E'Ediciones de revista o libro de divulgación científica - Documento', NULL, 1, 1),
(123, E'Informe Final de Investigación - Categoría', NULL, 1, 1),
(124, E'Informe Final de Investigación - Documento', NULL, 1, 1),
(125, E'Informes técnicos - Categoría', NULL, 1, 1),
(126, E'Informes técnicos - Documento', NULL, 1, 1),
(127, E'Consultorías científicas- tecnologías  - Categoría', NULL, 1, 1),
(128, E'Consultorías científicas- tecnologías - Documento', NULL, 1, 1),
(129, E'Consultorías en arte, arquitectura y diseño - Categoría', NULL, 1, 1),
(130, E'Consultorías en arte, arquitectura y diseño - Documento', NULL, 1, 1),
(131, E'Libro - Tipo', E'Son los tipos de libros que permiten clasificar un libro (pueden ser de diferentes tipologías', 1, 1),
(132, E'Publicaciones editoriales no especializadas - Categoría', NULL, 1, 1),
(133, E'Publicaciones editoriales no especializadas - Documento', NULL, 1, 1),
(134, E'Producciones de contenido digital - Categoría', NULL, 1, 1),
(135, E'Producciones de contenido digital - Documentos', NULL, 1, 1),
(136, E'Producción de estrategias y contenido transmedia - Categoría', NULL, 1, 1),
(137, E'Producción de estrategias y contenido transmedia - Documento', NULL, 1, 1),
(138, E'Desarrollos web - Categoría', NULL, 1, 1),
(139, E'Desarrollos web - Documento', NULL, 1, 1),
(140, E'Libro de divulgación o compilación de divulgación - Categoría', NULL, 1, 1),
(141, E'Libro de divulgación o compilación de divulgación - Documento', NULL, 1, 1),
(142, E'Libros de formación (Q2 y Q3) - Categoría', NULL, 1, 1),
(143, E'Libros de formación (Q2 y Q3) - Documento', NULL, 1, 1),
(144, E'Manuales y guías especializados - Categoría', NULL, 1, 1),
(145, E'Manuales y guías especializados - Documento', NULL, 1, 1),
(146, E'Generaciones de Contenidos - Categoría', NULL, 1, 1),
(147, E'Generaciones de Contenidos - Documento', NULL, 1, 1),
(148, E'Boletines divulgativos - Categoría', NULL, 1, 1),
(149, E'Boletines divulgativos - Documento', NULL, 1, 1),
(150, E'Libros de creación (piloto) - Categoría', NULL, 1, 1),
(151, E'Libros de creación (piloto) - Documento', NULL, 1, 1),
(152, E'Dirección de Tesis de Doctorado - Categoría', NULL, 1, 1),
(153, E'Dirección de Tesis de Doctorado - Documento', NULL, 1, 1),
(154, E'Dirección de Trabajo de Grado de Maestría - Categoría', NULL, 1, 1),
(155, E'Dirección de Trabajo de Grado de Maestría - Documento', NULL, 1, 1),
(156, E'Proyecto de Investigación y Desarrollo - Categoría', NULL, 1, 1),
(157, E'Proyecto de Investigación y Desarrollo - Documentos', NULL, 1, 1),
(158, E'Proyecto de Investigación- Creación - Categoría', NULL, 1, 1),
(159, E'Proyecto de Investigación- Creación -Documento', NULL, 1, 1),
(160, E'Dirección de Trabajos de grado de Pregrado - Categoría', NULL, 1, 1),
(161, E'Dirección de Trabajos de grado de Pregrado - Documento', NULL, 1, 1),
(162, E'Proyecto ID+I con formación - Categoría', NULL, 1, 1),
(163, E'Proyecto ID+I con formación - Documento', NULL, 1, 1),
(164, E'Proyecto de extensión y responsabilidad social en CTeI - Categoría', NULL, 1, 1),
(165, E'Proyecto de extensión y responsabilidad social en CTeI - Documento', NULL, 1, 1),
(166, E'Apoyo a creación programa o curso de formación de investigadores - categoría', NULL, 1, 1),
(167, E'Apoyo a creación programa o curso de formación de investigadores - Documento', NULL, 1, 1),
(168, E'Acompañamiento y asesoría de línea temática del Programa Ondas - Categoría', NULL, 1, 1),
(169, E'Acompañamiento y asesoría de línea temática del Programa Ondas - Documento', NULL, 1, 1),
(170, E'Proyecto', NULL, 1, 1),
(171, E'Facultad', NULL, 1, 1),
(172, E'Informe-Tipo', NULL, 1, 1),
(173, E'Consultoría - Tipo', NULL, 1, 1),
(174, E'Publicación - Tipos', E'Tipos de publicación para la sección formularios', 1, 1),
(175, E'Duración - Tipo', NULL, 1, 1),
(176, E'Libro Simple - Tipo', NULL, 1, 1),
(177, E'Generaciones de Contenidos - Tipo', NULL, 1, 1),
(178, E'Empresa - Tipo', NULL, 1, 1),
(179, E'Innovación - Tipo', NULL, 1, 1),
(180, E'Normatividad - Tipo', NULL, 1, 1),
(181, E'Guías y Manuales - Tipo', NULL, 1, 1),
(182, E'Protocolo y Acto - Tipo', NULL, 1, 1),
(184, E'Norma - Tipo', NULL, 1, 1),
(185, E'Reglamentos - Tipo', NULL, 1, 1),
(186, E'Legislacion - Tipo', NULL, 1, 1),
(187, E'Regulacion - Tipo', NULL, 1, 1),
(188, E'Regulacion - Categoria', NULL, 1, 1),
(189, E'Regulacion - Documentos', NULL, 1, 1),
(190, E'Procesos de apropiación social - Tipo', NULL, 1, 1),
(191, E'Proyecto de Investigación Desarrollo y Creación - Tipos', NULL, 1, 1),
(192, E'Libro Formacion - Categoría', NULL, 1, 1),
(193, E'Libro Formacion - Documento', NULL, 1, 1);
