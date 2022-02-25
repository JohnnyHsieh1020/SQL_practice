-- Write an SQL query to reformat the table such that there is a department id column and a revenue column for each month.
-- Return the result table in any order.
-- The query result format is in the following example.

-- Input: 
-- Department table:
-- +------+---------+-------+
-- | id   | revenue | month |
-- +------+---------+-------+
-- | 1    | 8000    | Jan   |
-- | 2    | 9000    | Jan   |
-- | 3    | 10000   | Feb   |
-- | 1    | 7000    | Feb   |
-- | 1    | 6000    | Mar   |
-- +------+---------+-------+
-- Output: 
-- +------+-------------+-------------+-------------+-----+-------------+
-- | id   | Jan_Revenue | Feb_Revenue | Mar_Revenue | ... | Dec_Revenue |
-- +------+-------------+-------------+-------------+-----+-------------+
-- | 1    | 8000        | 7000        | 6000        | ... | null        |
-- | 2    | 9000        | null        | null        | ... | null        |
-- | 3    | null        | 10000       | null        | ... | null        |
-- +------+-------------+-------------+-------------+-----+-------------+
-- Explanation: The revenue from Apr to Dec is null.
-- Note that the result table has 13 columns (1 for the department id + 12 for the months).

--SQL:
Select id, 
sum(case when month = 'Jan' then revenue end) 'Jan_Revenue',
sum(case when month = 'Feb' then revenue end) 'Feb_Revenue',
sum(case when month = 'Mar' then revenue end) 'Mar_Revenue',
sum(case when month = 'Apr' then revenue end) 'Apr_Revenue',
sum(case when month = 'May' then revenue end) 'May_Revenue',
sum(case when month = 'Jun' then revenue end) 'Jun_Revenue',
sum(case when month = 'Jul' then revenue end) 'Jul_Revenue',
sum(case when month = 'Aug' then revenue end) 'Aug_Revenue',
sum(case when month = 'Sep' then revenue end) 'Sep_Revenue',
sum(case when month = 'Oct' then revenue end) 'Oct_Revenue',
sum(case when month = 'Nov' then revenue end) 'Nov_Revenue',
sum(case when month = 'Dec' then revenue end) 'Dec_Revenue'
From Department
Group By id