select * from dbo.['2018$']
left join dbo.market_segment$
on dbo.['2018$'].market_segment = market_segment$.market_segment
left join dbo.meal_cost$
on meal_cost$.meal = dbo.['2018$'].meal
union
select * from dbo.['2019$']
left join dbo.market_segment$
on dbo.['2019$'].market_segment = market_segment$.market_segment
left join dbo.meal_cost$
on meal_cost$.meal = dbo.['2019$'].meal
union
select * from dbo.['2020$']
left join dbo.market_segment$
on dbo.['2020$'].market_segment = market_segment$.market_segment
left join dbo.meal_cost$
on meal_cost$.meal = dbo.['2020$'].meal


select @@SERVERNAME