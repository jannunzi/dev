<?php
	include_once "../Commons.php";
	include_once "../Utils.php";

//	@apache_setenv('no-gzip', 1);
//	@ini_set('zlib.output_compression', 0);
//	@ini_set('implicit_flush', 1);     

	echo "hello world";
	
	if(1==1) return;

	$callback = $_REQUEST['callback'];
	$title = $_REQUEST['title'];
	$startDate = $_REQUEST['startDate'];
	$endDate = $_REQUEST['endDate'];

//	connectToDB();

	$node = new stdClass();
	 
	//Main Node Fields
	$node->name = "Title";
	$node->title = $node->name;
	$node->body = "Lorem Ipsum";
//	$node->type = 'page'; //This can be any node type
	$node->type = 'fishing_trip_type'; //This can be any node type
	$node->created = time();
	$node->changed = $node->created;
	$node->promote = 0; // Display on front page ? 1 : 0
	$node->sticky = 0;  // Display top of page ? 1 : 0
	$node->format = 2;  // 1:Filtered HTML, 2: Full HTML
	$node->status = 1   // Published ? 1 : 0
	$node->uid = 13;             //  Content owner uid (author)?
	$node->language = 'en';
//	- See more at: http://www.unleashed-technologies.com/blog/2010/07/16/drupal-6-inserting-updating-nodes-programmatically#sthash.blAloDS3.dpuf

	if ($node = node_submit($node)) {
	    node_save($node);
	    echo "Node ".$node->title." added correctly";
//	    drupal_set_message(t("Node ".$node->title." added correctly"));
	} else {
	    echo "Node ".$node->title." added incorrectly";
//	    drupal_set_message(t("Node ".$node->title." added incorrectly"), "error");
	}
//	- See more at: http://www.unleashed-technologies.com/blog/2010/07/16/drupal-6-inserting-updating-nodes-programmatically#sthash.blAloDS3.dpuf

//	closeDB();

/*
	if(isset($_REQUEST['callback'])){
		header('Content-type: text/javascript');
		echo $callback."()";
	} else {
		header('Content-type: application/json');
	}
*/
?>