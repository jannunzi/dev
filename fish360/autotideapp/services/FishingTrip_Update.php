<?php
	include_once "../Commons.php";
	include_once "../Utils.php";

	@apache_setenv('no-gzip', 1);
	@ini_set('zlib.output_compression', 0);
	@ini_set('implicit_flush', 1);     

	$nid = $_REQUEST['nid'];
	$callback = $_REQUEST['callback'];
	$title = $_REQUEST['title'];
	$startDate = $_REQUEST['startDate'];
	$endDate = $_REQUEST['endDate'];

	connectToDB();

	$updateTitleSql = "UPDATE node SET title='$title' WHERE node.nid = $nid";
	$updateStartDateSql = "UPDATE content_type_fishing_trip_type SET field_start_value='$startDate' WHERE nid = $nid";
	$updateEndDateSql = "UPDATE content_type_fishing_trip_type SET field_stop_value='$endDate' WHERE nid = $nid";
	
	mysql_query($updateTitleSql);
	mysql_query($updateStartDateSql);
	mysql_query($updateEndDateSql);

	closeDB();
	
	if(isset($_REQUEST['callback'])){
		header('Content-type: text/javascript');
		echo $callback."()";
	} else {
		header('Content-type: application/json');
	}

?>