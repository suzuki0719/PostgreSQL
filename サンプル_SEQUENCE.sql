/*
CREATE SEQUENCE シーケンス名
    [ INCREMENT BY 増分 ]
    [ MINVALUE 最小値 | NO MINVALUE ]
    [ MAXVALUE 最大値 | NO MAXVALUE ]
    [ START WITH 開始値 ]
    [ CACHE キャッシュ数 ]
    [ CYCLE | NO CYCLE ];
*/
drop sequence if exists seq_sequence;
create sequence seq_sequence
start with 100
increment 10
MAXVALUE 150
CYCLE;

do $$
declare
    i integer;
    r integer;
begin
    for i in 0..10 loop
        select nextval('seq_sequence') into r;
        raise info '%',r;
    end loop;
end; $$ LANGUAGE plpgsql;

