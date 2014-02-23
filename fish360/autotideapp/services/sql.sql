(*) Get All Fishing Frips

SELECT	node.nid, node.type, node.title, node.uid, 
		trip.field_start_value, trip.field_stop_value
FROM 	node, content_type_fishing_trip_type trip
WHERE 	node.nid = trip.nid
LIMIT		0, 100

(*) Get All Fishing Frips For Username

SELECT	node.nid, node.type, node.title, node.uid, 
		trip.field_start_value, trip.field_stop_value,
		users.name
FROM 	node, content_type_fishing_trip_type trip, users
WHERE 	node.nid = trip.nid
AND		users.uid = node.uid
ORDER BY	users.name ASC
LIMIT		0, 100

(*) Get All Fishing Frips For jsilva

SELECT	node.nid, node.type, node.title, node.uid, 
		trip.field_start_value, trip.field_stop_value
FROM 	node, content_type_fishing_trip_type trip, users
WHERE 	node.nid = trip.nid
AND		users.uid = node.uid
AND		users.name='jsilva'
ORDER BY	node.title ASC
LIMIT		0, 100

(*) Get All Fishing Frips For JOSE

SELECT	node.nid, node.type, node.title, node.uid, 
		trip.field_start_value, trip.field_stop_value
FROM 	node, content_type_fishing_trip_type trip, users
WHERE 	node.nid = trip.nid
AND		users.uid = node.uid
AND		users.name='jose'
ORDER BY	node.title ASC
LIMIT		0, 100

(*) Select Fishing Trips With NULL start date

SELECT	trip.field_start_value, trip.field_stop_value
FROM 	content_type_fishing_trip_type trip
WHERE	trip.field_stop_value is NULL
LIMIT		0, 100

(*) Update Fishing Trip Dates where stop is NULL

UPDATE	content_type_fishing_trip_type
SET		field_start_value = '2014-01-01 00:00:00',
		field_stop_value = '2014-01-03 00:00:00'
WHERE	field_stop_value is NULL

(*) Update Fish Title + nid

UPDATE	node
SET		node.title = CONCAT(node.title, ' ', node.nid)
WHERE	title = 'New Fishing Trip'

(*) Get Trips Fish

SELECT	fishNode.title, fishNode.nid AS fishId,
		tripNode.nid AS tripId
FROM	node fishNode, node tripNode,
		content_type_fishing_trip_type trip,
		content_type_fish_type fish
WHERE	fishNode.nid = fish.nid
AND		tripNode.nid = trip.nid
AND		fish.field_fishing_trip_nid = trip.nid
ORDER BY	fishNode.changed DESC
LIMIT		0, 100

(*) Delete Trip for Node Id

DELETE	FROM	node
WHERE 	node.nid = 428

DELETE	FROM	content_type_fishing_trip_type
WHERE	content_type_fishing_trip_type.nid = 428


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
