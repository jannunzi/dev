<?php
	include_once "../Commons.php";
	include_once "../Utils.php";

	@apache_setenv('no-gzip', 1);
	@ini_set('zlib.output_compression', 0);
	@ini_set('implicit_flush', 1);     

	session_start();

	$username = $_SESSION['username'];
	
	if(!isset($username)){
		$username = $_REQUEST['username'];
	}
	
//	if(!isset($username)){
//		$username = "jsilva";
//	}
	
	$callback = $_REQUEST['callback'];

	connectToDB();

//	$query = "SELECT name,`node`.* FROM `node`, `users` WHERE `node`.type = 'fishing_trip_type' AND `users`.name='$username' AND `node`.uid=`users`.uid";
	$query = "SELECT name,`node`.title as title,`node`.nid FROM `node`, `users` WHERE `node`.type = 'fishing_trip_type' AND `users`.name='$username' AND `node`.uid=`users`.uid";
	$results = mysql_query($query);
	$num_rows = mysql_num_rows($results);
	$count = 0;

	if(isset($_REQUEST['callback'])){
		header('Content-type: text/javascript');
		echo $callback."(";
	} else {
		header('Content-type: application/json');
	}
	echo '{"username":"'.$username.'","trips":[';
	while($row = mysql_fetch_array($results)) {
		echo json_encode($row);
		if($count < $num_rows - 1)
			echo ",\n";
		$count++;
	}
	closeDB();

	echo "]}";
	
	if(isset($_REQUEST['callback'])){
		echo ")";
	}
?>