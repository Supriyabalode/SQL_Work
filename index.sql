-- index is database object used to speed up the retrieval of data

use hef_shine;
create index idx_name on employee (emp_name);
show index from employee;

create index idx_n on emp6 (name,dept) ;
show index from emp6;

alter table emp6
drop index idx_n;

create unique index idx_un on emp6 (id);

select * from practice;