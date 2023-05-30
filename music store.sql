create database musicdata

use musicdata

--[Question 1:- Senior most employee based on job title?]--

select top 1* from dbo.employee$
order by levels desc

--[Question 2:- Which countries has the most invoices?]--

select * from dbo.invoice$

select count(*) as c, billing_country from dbo.invoice$
group by billing_country
order by c desc

--[Question 3:- What are top 3 values of total invoice]--

Select top 3(total) from dbo.invoice$
order by total desc


--[Question 4:- Which city has the best customers? Write a query that returns one city that has the highest sum of invoice totals. Return both city name & sum of all total invoices.]--

select * from dbo.invoice$

select top 1(billing_city), sum(total) as total_invoice from dbo.invoice$
group by billing_city
order by total_invoice desc

--[Question 5:- Best Customer based on the total money spent?]--

select top 1(dbo.customer$.customer_id), sum(dbo.invoice$.total) as total_spent
from dbo.customer$
JOIN dbo.invoice$ ON dbo.customer$.customer_id = dbo.invoice$.customer_id
group by dbo.customer$.customer_id
order by total_spent desc

--[Question 6:- Write a query to return email. last_name, first_name of all music listeners. Return the list sorted by email in ascending order]--


select distinct(email), first_name, last_name from dbo.customer$
join dbo.invoice$ on dbo.customer$.customer_id = dbo.invoice$.customer_id
join dbo.invoice_line$ on dbo.invoice$.invoice_id = dbo.invoice_line$.invoice_id
where track_id in (
	select track_id from dbo.track$
	join dbo.genre$ on dbo.track$.genre_id = dbo.genre$.genre_id
	where dbo.genre$.name = 'Rock'
)
order by email




