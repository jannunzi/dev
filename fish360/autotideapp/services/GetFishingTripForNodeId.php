<?php
	include_once "../Commons.php";
	include_once "../Utils.php";

	@apache_setenv('no-gzip', 1);
	@ini_set('zlib.output_compression', 0);
	@ini_set('implicit_flush', 1);     

	$callback = $_REQUEST['callback'];
	$fishingTripNodeId = $_REQUEST['fishingTripNodeId'];
	$u = $_REQUEST['u'];

	connectToDB();

//	$query = "SELECT `node`.*, `node_revisions`.body FROM `node`, `node_revisions` WHERE `node`.nid=$fishingTripNodeId AND `node_revisions`.nid=$fishingTripNodeId";
//	$query = "SELECT `node`.*, `node_revisions`.body FROM `node`, `node_revisions` WHERE `node`.nid=$fishingTripNodeId AND `node_revisions`.nid=$fishingTripNodeId";
	$query = "SELECT * FROM `node`, `content_type_fishing_trip_type` WHERE `node`.nid = $fishingTripNodeId AND `content_type_fishing_trip_type`.nid = $fishingTripNodeId";
	$results = mysql_query($query);
	$num_rows = mysql_num_rows($results);
	$count = 0;
	
	if(isset($_REQUEST['callback'])){
		header('Content-type: text/javascript');
		echo $callback."(";
	} else {
		header('Content-type: application/json');
	}
	
	while($row = mysql_fetch_array($results)) {
		echo json_encode($row);
		if($count < $num_rows - 1)
			echo ",";
		$count++;
	}
	closeDB();

	if($count == 0)
		echo "[]";

  if(isset($_REQUEST['callback'])){
		echo ")";
	}	
?>