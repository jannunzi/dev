select count(nid) AS count, t.field_fishing_trip_nid TripId
from content_type_fish_type t
group by field_fishing_trip_nid
order by count desc

All Trips and their Fish
select nt.title AS Trip, nt.nid, nf.title AS Fish, nf.nid
from
	node nt,
	node nf,
	content_type_fishing_trip_type t,
	content_type_fish_type f
where
	nt.nid = t.nid	AND
	nf.nid = f.nid AND
	f.field_fishing_trip_nid = t.nid
order by fish


All Fish for Trip Id 25
select nt.title AS Trip, nt.nid, nf.title AS Fish, nf.nid
from
	node nt,
	node nf,
	content_type_fishing_trip_type t,
	content_type_fish_type f
where
	nt.nid = t.nid	AND
	nf.nid = f.nid AND
	f.field_fishing_trip_nid = t.nid AND
	nt.nid = 25
order by fish


All Fish Fields for Trip Id 25
select nf.*, f.*
from
	node nt,
	node nf,
	content_type_fishing_trip_type t,
	content_type_fish_type f
where
	nt.nid = t.nid	AND
	nf.nid = f.nid AND
	f.field_fishing_trip_nid = t.nid AND
	nt.nid = 25
