DROP FUNCTION IF EXISTS cursor_types;

CREATE FUNCTION cursor_types() RETURNS VOID AS
$BODY$
DECLARE
    item RECORD;
		sql TEXT;
    cur_items CURSOR FOR 
			-- Registros existentes
			SELECT * FROM public.subtypes WHERE id IN (SELECT id FROM public.subtypes_prod ORDER BY id) ORDER BY id;
BEGIN
	FOR item IN cur_items LOOP
		sql := 'UPDATE public.subtypes SET st_name=''' || item.st_name || '''';
		IF length(item.st_description) > 4 THEN
			sql := sql || ', st_description=''' || item.st_description || '''';
		ELSE
			sql := sql || ', st_description=NULL';
		END IF;
		IF item.parent_id IS NOT NULL THEN
			sql := sql || ', parent_id=' || item.parent_id;
		ELSE
			sql := sql || ', parent_id=NULL';
		END IF;
		sql := sql || ', type_id='|| item.type_id ||' WHERE id=' || item.id;
		RAISE NOTICE '%;', sql;
	END LOOP;
	RETURN;
END
$BODY$
LANGUAGE 'plpgsql';


