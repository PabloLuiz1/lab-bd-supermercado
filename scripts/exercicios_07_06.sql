--1 Quantidade de empregados por cargo em cada departamento
select count(employee_id) as Qtd_empregados, department_name as Departamento, job_title as Cargo
from employees join departments using (department_id) join jobs using (job_id)
group by department_name, job_title
order by 2, 3;


select DEPARTMENT_NAME, DEPARTMENT_ID, FIRST_NAME from DEPARTMENTS
inner join EMPLOYEES using (DEPARTMENT_ID)
order by 3;
--2 Or�amento mensal em salarios por departamento, considerando-se a porcentagem de comiss�o sobre o sal�rio

--3 Nome dos gerentes e quantidade de empregados que ele gerencia

--4 Nome dos departamentos seguido do nome de seus gerebntes, quantidade de empregados e or�amento mensal em 
--sal�rios sem considerar a porcetagem de comiss�o