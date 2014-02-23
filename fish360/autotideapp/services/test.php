<?php
	echo "hello";
	
	$node = new stdClass();
	$node->name = "Jose 123";
	$node->title = $node->name;
	$node->body = "Lorem Ipsum";
	$node->type = 'fishing_trip_type'; //This can be any node type
	$node->created = time();
	$node->changed = $node->created;
	$node->promote = 0; // Display on front page ? 1 : 0
	$node->sticky = 0;  // Display top of page ? 1 : 0
	$node->format = 2;  // 1:Filtered HTML, 2: Full HTML
//	$node->status = 1   // Published ? 1 : 0
	$node->uid = 1;             //  Content owner uid (author)?
	$node->language = 'en';
	/*
*/
	echo "[1]";
	try {
		echo "[22]";
		node_submit($node);
		echo "[3]";
		node_save($node);
		echo "[4]";
	} catch(Exception $error) {
		echo "[5]";
	}
	
	echo "goodbye";
?>