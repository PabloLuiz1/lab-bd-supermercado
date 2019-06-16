set verify off
set serveroutput on
declare
  v_owner varchar2(30) := '&owner';
  v_tab_comm varchar2(4000);
begin
  dbms_output.put_line('Lista de Tabelas e Colunas Comentadas do Esquema ' || v_owner);
  dbms_output.put_line('');
  for rec_table in (select table_name from all_all_tables where owner = v_owner) loop
    dbms_output.put_line('----------------------------------------------------------------------------------------------');
    SELECT comments
    into v_tab_comm
    FROM sys.dba_tab_comments
    WHERE OWNER = v_owner and table_name = rec_table.table_name;
    dbms_output.put_line('Tabela ' || rec_table.table_name || ': ' || v_tab_comm);  
    dbms_output.put_line(' ');
    dbms_output.put_line('Lista de Colunas');
    dbms_output.put_line('Nome' || CHR(9) || '|' || CHR(9) || 'Tipo' || CHR(9) || '|' || CHR(9) || 'Preenchimento' || CHR(9) || '|' || CHR(9) || 'Comentário');
    for rec_colunm in (SELECT t.column_name
          , initcap(data_type)
          || DECODE(data_type, 'CHAR', '('
          || char_length
          ||')', 'VARCHAR', '('
          || char_length
          ||')', 'VARCHAR2', '('
          || char_length
          ||')', 'NCHAR', '('
          || char_length
          ||')', 'NVARCHAR', '('
          || char_length
          ||')', 'NVARCHAR2', '('
          || char_length
          ||')', 'NUMBER', '('
          || NVL(data_precision,data_length)
          || DECODE(data_scale,NULL,NULL, ','
          ||data_scale)
          ||')', NULL) Tipo
          , CASE t.nullable
              WHEN 'Y' THEN 'Opcional'
              WHEN 'N' THEN 'Obrigatório'
            END nullable 
          , c.comments 
          FROM sys.all_tab_columns t join sys.all_col_comments c 
          on (t.table_name = c.table_name and t.owner = c.owner and t.column_name = c.column_name)
          WHERE t.owner = v_owner and t.table_name = rec_table.table_name
      ) loop
       
     
      dbms_output.put_line(rec_colunm.column_name || CHR(9) || '|' || CHR(9) || rec_colunm.Tipo || CHR(9) || '|' || CHR(9) || rec_colunm.nullable || CHR(9) || '|' || CHR(9) || rec_colunm.comments); 
    end loop;
    
    dbms_output.put_line('');
  end loop; 
end;