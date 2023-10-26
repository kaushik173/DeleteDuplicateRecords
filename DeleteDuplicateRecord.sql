
--How to delete or Remove duplicate Records
;with cte as
(select *,ROW_NUMBER() over (Partition by FirstName order by FirstName) as rowNo from Student)
select * from cte where rowNo <= 1

;with cte as
(select *,ROW_NUMBER() over (Partition by FirstName order by FirstName) as rowNo from Student)
delete from cte where rowNo > 1