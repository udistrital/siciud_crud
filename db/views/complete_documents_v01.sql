SELECT doc.id,
       doc.documentable_type AS product_type,
       doc.documentable_id   AS product_type_id,
       doc.doc_name,
       doc.doc_path,
       doc.doc_size,
       doc.document_type_id,
       dt.st_name              AS document_type_name,
       doc.active,
       doc.created_by,
       doc.updated_by,
       doc.created_at,
       doc.updated_at
FROM documents doc
         LEFT JOIN subtypes dt on dt.id = doc.document_type_id;