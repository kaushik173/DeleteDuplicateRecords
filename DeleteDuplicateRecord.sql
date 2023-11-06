
--How to delete or Remove duplicate Records
;with cte as
(select *,ROW_NUMBER() over (Partition by FirstName order by FirstName) as rowNo from Student)
select * from cte where rowNo <= 1

;with cte as
(select *,ROW_NUMBER() over (Partition by FirstName order by FirstName) as rowNo from Student)
delete from cte where rowNo > 1

--#delete duplicate row from the contacts table
delete from contacts where id in
(select id from (
SELECT 
	id, 
    email, 
    ROW_NUMBER() OVER ( 
		PARTITION BY email 
        ORDER BY email
	) AS row_num 
FROM contacts)t where row_num > 1);
