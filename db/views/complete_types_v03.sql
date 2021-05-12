SELECT t.id AS type_id,
       t.t_name AS type_name,
       t.t_description AS type_description,
       t.active AS type_active,
       st.parent_id,
       pst.st_name AS parent_name,
       pst.st_description AS parent_description,
       pst.active AS parent_active,
       st.id,
       st.st_name AS name,
       st.st_description AS description,
       st.active
FROM types t
         LEFT JOIN subtypes st ON t.id = st.type_id
         LEFT JOIN subtypes pst ON st.parent_id = pst.id;