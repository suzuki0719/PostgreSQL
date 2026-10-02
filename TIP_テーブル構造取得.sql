SELECT 
    column_name, 
    data_type, 
    character_maximum_length, 
    column_default, 
    is_nullable
FROM 
    information_schema.columns
WHERE 
    table_schema = 'public'  -- 必要に応じてスキーマ名
    AND table_name = 'actor'
ORDER BY 
    ordinal_position;