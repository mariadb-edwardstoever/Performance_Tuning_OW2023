use openworks;

show session status like '%handler%';
flush status;

show session status like '%handler%';
show tables;
show session status like '%handler%';

/* SELECT ON A TABLE WITH NO KEY */ 
flush status;
-- Handler_read_rnd_next: Number of requests to read the next row. 
-- A large number of these may indicate many table scans and improperly used indexes.
select * from site_user_comments_archive where post_id='DWY-1-3938729';
show session status like '%handler%';

/* SELECT ON A TABLE WITH KEY */
flush status;
-- Handler_read_key: Number of row read requests based on an index value. 
-- A high value indicates indexes are regularly being used, which is usually positive.
select * from site_user_comments where post_id='HAH-3-7606337';
show session status like '%handler%';

/* ANOTHER EXAMPLE WITH MORE ROWS */
flush status;
select * from site_user_comments where post_id='AEU-4-4149834';
show session status like '%handler%';

/* INSERT */
flush status;
insert into site_user_comments
(site_user_id,post_id,comment_id,comment_text,comment_datetime)
values
(977,'AVA-7-6332437','RSR-511115','A very interesting introduction.',now());
show session status like '%handler%';

/* UPDATE */
flush status;
update site_user_comments set comment_text='Correction, interesting and odd.'
where post_id='AVA-7-6332437' and comment_id='RSR-511115';
show session status like '%handler%';

/* DELETE */
flush status;
delete from site_user_comments
where post_id='AVA-7-6332437' and comment_id='RSR-511115';
show session status like '%handler%';

