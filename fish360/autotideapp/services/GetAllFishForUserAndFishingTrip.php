<?php
	include_once "../Commons.php";
	include_once "../Utils.php";

	@apache_setenv('no-gzip', 1);
	@ini_set('zlib.output_compression', 0);
	@ini_set('implicit_flush', 1);     

	header('Content-type: application/json');

	session_start();
//	$username = $_GET['username'];
	$username = $_SESSION['username'];
	
	if(!isset($username)){
		$username = $_REQUEST['username'];
	}
	
	if(!isset($username)){
		$username = "jsilva";
	}
	$fishingTripNodeId = $_REQUEST['fishingTripNodeId'];
	$callback = $_REQUEST['callback'];

	connectToDB();

	$select = "SELECT name,`node`.title, `content_type_fish_type`.nid  ";
	$from = "FROM `node`, `users`, `content_type_fish_type` ";
	$where = "WHERE `node`.type = 'fish_type' AND `users`.name='$username' AND `node`.uid=`users`.uid AND `content_type_fish_type`.field_fishing_trip_nid = $fishingTripNodeId AND `node`.nid = `content_type_fish_type`.nid";
	$query = $select.$from.$where;
	
	$results = mysql_query($query);
	$num_rows = mysql_num_rows($results);
	$count = 0;
	
	if(isset($_REQUEST['callback'])){
		header('Content-type: text/javascript');
		echo $callback."(";
	} else {
		header('Content-type: application/json');
	}
	echo "{'fish' : [\n";
	
	while($row = mysql_fetch_array($results)) {
		echo json_encode($row);
		if($count < $num_rows - 1)
			echo ",\n";
		$count++;
	}
	closeDB();

	echo "\n]}";
	if(isset($_REQUEST['callback'])){
		echo ")";
	}
//	echo "$username, $fishingTripNodeId, $callback";
	
?>