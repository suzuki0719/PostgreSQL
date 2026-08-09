drop table if exists get_row_count;
CREATE OR REPLACE FUNCTION get_row_count(target_table text) 
RETURNS integer AS $$
DECLARE
    query_str text;
    row_cnt integer;
BEGIN
    -- クエリ文字列を組み立てる (%I はテーブル名や列名のエスケープ用)
    query_str := format('SELECT count(*) FROM %I', target_table);
    
    -- INTO を使って結果を変数に格納する
    EXECUTE query_str INTO row_cnt;
    
    RETURN row_cnt;
END;
$$ LANGUAGE plpgsql;

-- 使い方
SELECT get_row_count('actor');
drop table if exists get_row_count;

