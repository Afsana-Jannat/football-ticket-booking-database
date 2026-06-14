select match_id, fixture, base_ticket_price from Matches
where tournament_category = 'Champions League' and match_status = 'Available';


select user_id, full_name, email from users
where full_name ILIKE 'Tanvir%' OR full_name ILIKE '%Haque%'


select booking_id, user_id, match_id, coalesce(payment_status, 'Action Required') as systematic_status from Bookings
where payment_status IS NULL;


select Bookings.booking_id,
  Users.full_name,
  Matches.fixture,
  Bookings.total_cost from Bookings
inner join Users on Bookings.user_id = Users.user_id
inner join Matches on Bookings.match_id = Matches.match_id;


select Users.user_id, Users.full_name, Bookings.booking_id from Users
left join Bookings on Users.user_id = Bookings.user_id;


select booking_id, match_id, total_cost from Bookings
where total_cost > (select avg(total_cost) from Bookings);


select match_id, fixture, base_ticket_price from Matches
order by base_ticket_price desc limit 2 offset 1;