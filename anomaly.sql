select transaction_status, 
count(*) as total_rows,
count(error_type) as error_type_filled
from `payments.my_payments_prepared`
group by transaction_status;
