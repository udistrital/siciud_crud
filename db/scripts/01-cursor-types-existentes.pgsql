DROP FUNCTION IF EXISTS cursor_types;

CREATE FUNCTION cursor_types() RETURNS VOID AS
$BODY$
DECLARE
    item RECORD;
		sql TEXT;
    cur_items CURSOR FOR 
			-- Registros existentes
			SELECT * FROM public.types WHERE id IN (SELECT id FROM public.types_prod ORDER BY id) ORDER BY id;
BEGIN
	FOR item IN cur_items LOOP
		sql := 'UPDATE public.types SET t_name=''' || item.t_name || '''';
		IF length(item.t_description) > 4 THEN
			sql := sql || ', t_description=''' || item.t_description || '''';
		ELSE
			sql := sql || ', t_description=NULL';
		END IF;
		sql := sql || ' WHERE id=' || item.id;
		RAISE NOTICE '%;', sql;
	END LOOP;
	RETURN;
END
$BODY$
LANGUAGE 'plpgsql';


