--1 Quantidade de empregados por cargo em cada departamento
select count(employee_id) as Qtd_empregados, department_name as Departamento, job_title as Cargo
from employees join departments using (department_id) join jobs using (job_id)
group by department_name, job_title
order by 2, 3;


select DEPARTMENT_NAME, DEPARTMENT_ID, FIRST_NAME from DEPARTMENTS
inner join EMPLOYEES using (DEPARTMENT_ID)
order by 3;
--2 Orçamento mensal em salarios por departamento, considerando-se a porcentagem de comissão sobre o salário

--3 Nome dos gerentes e quantidade de empregados que ele gerencia

--4 Nome dos departamentos seguido do nome de seus gerebntes, quantidade de empregados e orçamento mensal em 
--salários sem considerar a porcetagem de comissão