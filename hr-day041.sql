/*
치환 변수 
- 단일 앰퍼샌드 (&) 및 이중 앰퍼센드 (&&) 치환을 사용 값 임시저장
*/

/*
단일 앰퍼샌드 치환 변수 사용
변수앞에 & 붙이면 유저가 값을 입력하도록 할 수 있습니다.
*/
select employee_id, last_name, salary, department_id
from employees
where employee_id = &employee_num;

/*
문자 및 날짜 값을 치환 변수로 지정
날짜 값 및 문자 값에 대해 작은 따옴표를 사용합니다.
*/
select last_name, department_id, salary*12
from employees
where job_id = '&job_title';


-- 열 이름, 표현식 및 텍스트 지정
select employee_id, last_name, job_id, &column_name
from employees
where &codition
order by &order_cloumn;


/*
이중 엠퍼샌드 치환 변수 사용
유저가 매번 값을 입력할 필요 없이 재사용할 경우 이중 앰퍼샌드(&&) 사용합니다.
*/
select employee_id, last_name, job_id, &&column_name
from employees
order by &column_name;

/*
define 명령사용
define 명령 사용하여 변수 생성하고 값 할당합니다.
underfine 명령 사용하여 변수 제거 합니다.
*/
define employee_num = 200

select employee_id, last_name, salsry, department_id
from employees
where employee_id = &employee_num;

underfine employee_num;

/*
verify 명령사용 
verifu 명령을 사용하여 sql keveloper가 치환 변수를 값으로 바꾸기 전후에 치환 변수의 표시를 토글합니다.
*/
set verify on 
select employee_id, last_name, salary
from employees
where employee_id = &employee_nom;

/*
바인드 변수
오라클에서 사용하는 변수
치환변수보다 성능 좋다 적극사용!!!
*/
var employee_num number

exec: employee_num :=200

select employee_id, last_name, salary
from employees
where employee_id= :employee_num;