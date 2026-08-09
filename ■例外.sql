DROP PROCEDURE IF EXISTS P2;
drop procedure if exists p;
drop table if exists t;
create table t(
    id integer unique,
    name text
);

create procedure p() as $$
DECLARE
BEGIN
    insert into t(id,name) values (1,'ttt');
    insert into t(id,name) values (1,'ttt');
EXCEPTION
    WHEN UNIQUE_VIOLATION THEN
        RAISE EXCEPTION SQLSTATE '99999' USING MESSAGE = 'SQLSTATE:' || SQLSTATE || ',SQLERRM:' || SQLERRM,
        HINT ='[HINT**]',
        DETAIL='[DETAIL**]',
        COLUMN='DEPT**',
        CONSTRAINT='DEP_KEY**',
        DATATYPE='CHAR(5)**',
        TABLE='DEPT**',
        SCHEMA='TEST**';

END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE PROCEDURE p2() AS $$
DECLARE    
    text_var1 TEXT;
    text_var2 TEXT;
    text_var3 TEXT;
    text_var4 TEXT;
    text_var5 TEXT;
    text_var6 TEXT;
    text_var7 TEXT;
    text_var8 TEXT;
    text_var9 TEXT;
    text_var10 TEXT;
BEGIN    

    CALL p();

EXCEPTION
    WHEN OTHERS THEN 
          GET STACKED DIAGNOSTICS text_var1 = RETURNED_SQLSTATE,
                       text_var2 = COLUMN_NAME,
                       text_var3 = CONSTRAINT_NAME,
                       text_var4 = PG_DATATYPE_NAME,
                       text_var5 = MESSAGE_TEXT,
                       text_var6 = TABLE_NAME,
                       text_var7 = SCHEMA_NAME,
                       text_var8 = PG_EXCEPTION_DETAIL,
                       text_var9 = PG_EXCEPTION_HINT,
                       text_var10 = PG_EXCEPTION_CONTEXT;
        raise info '=--------------------';
        RAISE INFO 'RETURNED_SQLSTATE:%',text_var1;
        RAISE INFO 'COLUMN_NAME:%',text_var2;
        RAISE INFO 'CONSTRAINT_NAME:%',text_var3;
        RAISE INFO 'PG_DATATYPE_NAME:%',text_var4;
        RAISE INFO 'MESSAGE_TEXT:%',text_var5;
        RAISE INFO 'TABLE_NAME:%',text_var6;
        RAISE INFO 'SCHEMA_NAME:%',text_var7;
        RAISE INFO 'PG_EXCEPTION_DETAIL:%',text_var8;
        RAISE INFO 'PG_EXCEPTION_HINT:%',text_var9;
        RAISE INFO 'PG_EXCEPTION_CONTEXT:%',text_var10;
END;    
$$ LANGUAGE plpgsql;


call p2();