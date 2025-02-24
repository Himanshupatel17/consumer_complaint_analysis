-- What are the top 10 most frequently reported issues by customers
select issue as most_reported_issue,count(issue) as issue_count
from consumer_complaint
group by issue
order by issue_count desc
limit 10;

-- Which product category receives the highest number of complaints
select product, count(*) as highest_complaint
from consumer_complaint
group by product
order by highest_complaint desc
limit 5;

-- What are the most common sub-issues associated with each major issue
select  issue,sub_issue, count(*) as common_issue
from consumer_complaint
group by issue,sub_issue
order by issue, common_issue desc
limit 5;

-- What is the average response time for complaints
select AVG(DATEDIFF( Date_received,Date_submitted)) AS average_response_time_day
from consumer_complaint;

-- What percentage of complaints receive a timely response
select 
    (COUNT(CASE WHEN Timely_response = 'Yes' THEN 1 END) * 100.0 / COUNT(*)) AS timely_response_percentage
from consumer_complaint;

   -- What percentage of complaints are closed with an explanation versus monetary relief
select
    (COUNT(CASE WHEN Company_response_to_consumer = 'Closed with explanation' THEN 1 END) * 100.0 / COUNT(*)) AS explain_percentage,
    (COUNT(CASE WHEN Company_response_to_consumer=  'Closed with monetary relie'  THEN 1 END) * 100.0 / COUNT(*)) AS monetary_percentage
from consumer_complaint;

-- How do response types vary across different products
select Product, Company_response_to_consumer, COUNT(*) AS total_responses
from consumer_complaint
group by Product, Company_response_to_consumer
order by total_responses DESC;

-- Which states have the highest number of complaints, and how have they changed over time
select year(date_received) as year, state, count(*) as total_complaints
from consumer_complaint
group by year(date_received),state
order by year desc, total_complaints desc;

-- Are there seasonal trends in consumer complaints
select month(date_received) as month, count(*) as total_complaint_by_months
from consumer_complaint
group by month(date_received)
order by total_complaint_by_months desc;

-- Which submission methods (e.g., web, phone, referral) are used the most
select submitted_via,count(*) as most_used
from consumer_complaint
group by submitted_via
order by most_used desc;

-- Which submission methods (e.g., web, phone, referral) are used the most
select submitted_via,count(*) as most_used
from consumer_complaint
group by submitted_via
order by most_used desc;

-- Which submission methods (e.g., web, phone, referral) are used the most
select submitted_via,count(*) as most_used
from consumer_complaint
group by submitted_via
order by most_used desc;

-- Which submission methods (e.g., web, phone, referral) are used the most
select submitted_via,count(*) as most_used
from consumer_complaint
group by submitted_via
order by most_used desc;

-- How many complaints are still unresolved or in progress
select Company_response_to_consumer,count(*) as total
from consumer_complaint
where Company_response_to_consumer in ('closed' , 'In progress')
group by Company_response_to_consumer
order by total desc;

-- What percentage of complaints are addressed within the required timeframe
select (COUNT(CASE WHEN DATEDIFF(Date_received, Date_submitted) <= 500 THEN 1 END) * 100.0 / COUNT(*)) AS on_time_percentage,
    (COUNT(CASE WHEN DATEDIFF(Date_received, Date_submitted) > 500 THEN 1 END) * 100.0 / COUNT(*)) AS late_percentage
from consumer_complaint;

-- Which product have the most unresolved complaints
select product,Company_response_to_consumer, count(*) as total
from consumer_complaint
where Company_response_to_consumer in('closed' , 'in progress')
group by product,Company_response_to_consumer 
order by total desc;
