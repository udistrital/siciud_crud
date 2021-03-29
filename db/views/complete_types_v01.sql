SELECT st.type_id,
       t.t_name AS type_name,
       t.t_description AS type_description,
       t.active AS type_active,
       st.parent_id,
       p.st_name AS parent_name,
       p.st_description AS parent_description,
       p.type_id AS parent_type_id,
       pt.t_name AS parent_type_name,
       pt.active AS parent_type_active,
       st.id,
       st.st_name AS name,
       st.st_description AS description,
       st.active
FROM types t
         RIGHT JOIN subtypes st ON t.id = st.type_id
         LEFT JOIN subtypes p ON st.parent_id = p.id
         LEFT JOIN types pt ON p.type_id = pt.id;