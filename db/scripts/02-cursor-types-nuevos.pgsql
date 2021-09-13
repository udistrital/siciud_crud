DROP FUNCTION IF EXISTS cursor_types;

CREATE FUNCTION cursor_types() RETURNS VOID AS
$BODY$
DECLARE
    item RECORD;
		sql TEXT;
    cur_items CURSOR FOR 
			-- Registros nuevos
			SELECT * FROM public.types WHERE id NOT IN (SELECT id FROM public.types_prod ORDER BY id) ORDER BY id;
BEGIN
	FOR item IN cur_items LOOP
		sql := 'INSERT INTO public.types (id, t_name, t_description) VALUES ('|| item.id ||', E''' || item.t_name || '''';
		IF length(item.t_description) > 4 THEN
			sql := sql || ', E''' || item.t_description || ''');';
		ELSE
			sql := sql || ', NULL);';
		END IF;
		RAISE NOTICE '%', sql;
	END LOOP;
	RETURN;
END
$BODY$
LANGUAGE 'plpgsql';


