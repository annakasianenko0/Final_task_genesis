-- Transaction persentage by country
  
select card_country, round(count(*) / sum(count(*)) over() * 100, 2) as trans_perc
from `payments.my_payments_prepared`
group by card_country
order by trans_perc desc;
