DROP FUNCTION IF EXISTS cursor_types;

CREATE FUNCTION cursor_types() RETURNS VOID AS
$BODY$
DECLARE
    item RECORD;
		sql TEXT;
    cur_items CURSOR FOR 
			-- Registros nuevos
			SELECT * FROM public.subtypes WHERE id NOT IN (SELECT id FROM public.subtypes_prod ORDER BY id) ORDER BY id;
BEGIN
	FOR item IN cur_items LOOP
		sql := 'INSERT INTO public.subtypes (id, st_name, st_description, parent_id, type_id, created_by, updated_by) VALUES ('|| item.id ||', E''' || item.st_name || '''';
		IF length(item.st_description) > 4 THEN
			sql := sql || ', E''' || item.st_description || '''';
		ELSE
			sql := sql || ', NULL';
		END IF;
		IF item.parent_id IS NOT NULL THEN
			sql := sql || ', ' || item.parent_id;
		ELSE
			sql := sql || ', NULL';
		END IF;
		sql := sql || ',' || item.type_id || ', 1, 1);';
		RAISE NOTICE '%', sql;
	END LOOP;
	RETURN;
END
$BODY$
LANGUAGE 'plpgsql';


