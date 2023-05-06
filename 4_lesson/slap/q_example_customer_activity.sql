set @evnt = f_random_integer(3,12004);
drop temporary table if exists my_selected_tix;
create temporary table my_selected_tix as
select e.event_id,(e.event_base_price+s.venue_seat_base_price) as ticket_price,s.venue_seat_id,s.venue_seat_common_id
from tt_events e
inner join tt_venues v on (e.event_venue_id = v.venue_id)
inner join tt_venue_seats s on (v.venue_id =s.venue_id)
where e.event_id=@evnt order by s.venue_seat_id;
select * from my_selected_tix;
insert into tt_benchmarks (benchmark_completed,benchmark_note) values (now(),'mariadb-slap: temporary table test');
