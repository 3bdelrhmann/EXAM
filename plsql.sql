declare 
    cursor  cr is
        SELECT * FROM hr.employees;

    rw hr.employees%rowtype;
begin
    
    open cr;
    
        loop 
            fetch cr into rw;
            exit when cr%notfound;
            
            dbms_output.put_line(rw.employee_id || ' ' || rw.first_name || ' ' || rw.last_name);
        
        end loop;
    
    close cr;
    
end;


________________________________________________________________________________________________


create or replace function summition(num1 number, num2 number) return number as
    begin
        return num1+num2;
    end summition;
/

begin
    dbms_output.put_line(summition(5,6));

end;
/


________________________________________________________________________________________________


declare
    cursor dp_cr is
        SELECT * FROM HR.DEPARTMENTS;

    dp_rw HR.DEPARTMENTS%rowtype;
    
begin
    
    open dp_cr;
    
        loop
            fetch dp_cr into dp_rw;
            exit when dp_cr%notfound;
            
                dbms_output.put_line(dp_rw.department_id);
        
        end loop;
    
    
    close dp_cr;

end;
/


________________________________________________________________________________________________



create or replace function multy(num1 number, num2 number) return number as
    begin
        
        return num1*num2;
        
    end multy;
/

declare 

begin 
    
    dbms_output.put_line(multy(1,20));

end;/



________________________________________________________________________________________________



declare 
 
    country_id   HR.COUNTRIES.COUNTRY_ID%type; 
    country_name HR.COUNTRIES.COUNTRY_NAME%type; 
    counter number := 1; 
    
begin 
 
    loop 
        if counter > 3 then exit; 
        end if; 

        SELECT HR.COUNTRIES.COUNTRY_ID, HR.COUNTRIES.COUNTRY_NAME INTO country_id,country_name
        FROM HR.COUNTRIES
        WHERE HR.COUNTRIES.COUNTRY_ID = counter;
         
        dbms_output.put_line(country_id || ' ' || country_name); 
 
        counter := counter + 1; 
    end loop; 
 
 
end;
/



________________________________________________________________________________________________



declare

    country_name countries.country_name%type;
    airport_number countries.airports%type;

begin
    
    SELECT airport_num into airport_number
        FROM COUNTRIS
    WHERE
        country_name = country_name;
        
    if airport_number >= 0 and airport_number <= 100 then
        dbms_output.put_line('There are 100 or fewer airports');
    elsif airport_number >= 101 and airport_number <= 1000 then
        dbms_output.put_line('There are 100 or fewer airports');
    elsif airport_number >= 1001 and airport_number <= 10000 then
        dbms_output.put_line('There are 100 or fewer airports');
    elsif airport_number > 10000 then
        dbms_output.put_line('There are 100 or fewer airports');
    else
        dbms_output.put_line('There are 100 or fewer airports');
    end if;
    
end;/



________________________________________________________________________________________________



declare

    my_date date := sysdate + 45;
    v_last_day date := last_day(sysdate);

begin

    dbms_output.put_line(to_char(my_date, 'MONTH dd, yyyy'));
    dbms_output.put_line(to_char(my_date, 'Month dd, yyyy'));

    dbms_output.put_line(round(months_between(my_date, v_last_day)));
    
end;
/



________________________________________________________________________________________________



declare
    cursor cc is
        SELECT * FROM HR.EMPLOYEES
        order by salary desc;

    emp_row HR.EMPLOYEES%rowtype;
begin
    open cc;
        loop
            exit when cc%rowcount = 6;
            fetch cc into emp_row;
            
            dbms_output.put_line(emp_row.salary);
            
        end loop;
    close cc;
end;
/



________________________________________________________________________________________________




create or replace procedure pay_raise as
begin
    update hr.employees
    set salary = 3000;
end pay_raise;
/


begin

pay_raise;

end;
/
