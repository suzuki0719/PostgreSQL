drop function if exists func_hello;
drop function if exists func_hell;
create function func_hello(IN a text, IN b text, OUT c text,OUT d text) as $$
declare
    text_a text := a;
    text_b text := b;
begin
    c := concat(text_a,'-',text_b);
    d := concat(text_a,'*',text_b);
    return;
end; $$ LANGUAGE plpgsql;

select func_hello('hello','world');

