<?php

	ini_set('display_errors', 'On');
	
	require "./PHPmailer/PHPMailerAutoload.php";
	 
 function sendPDF($email, $pdfFile, $data){
	 date_default_timezone_set ('Etc/UTC');


	$mail = new PHPMailer(); // create a new object
	$mail->isSMTP(); // enable SMTP
	$mail->SMTPAuth = true; // authentication enabled
	$mail->SMTPSecure = 'ssl'; // secure transfer enabled REQUIRED for GMail
	$mail->Host = "smtp.gmail.com";
	$mail->Port = 465; // or 587
	$mail->IsHTML(true);


	$mail->Username = "pyxisemployeerecognition@gmail.com"; //Email that you setup
	$mail->Password = "Student@OSU"; // Password

	$mail -> AddReplyTo ("hesseljo@oregonstate.edu");
		
	//receipent info
	$mail -> addAddress($email, $data['recName']);
	
	//subject line
	$mail -> Subject = $data['titleAward'] . " has been awarded.";
	
	//read html message
	$msg = file_get_contents("./template/email_template.html");
	
	//replace placeholders with data
	$msg = str_replace ("%recName%", $data["recName"], $msg);
	$msg = str_replace ("%awardTitle%", $data["titleAward"], $msg);
	$msg = str_replace ("%giveName%", $data["giveName"], $msg);
	
	//set body of email as the html message
	//$mail -> isHTML (true);
	$mail -> MsgHTML ($msg);
	$mail -> AltBody = "Congratulations, ". $data["recName"]. "! You have been awarded ". $data["titleAward"] . "by" . $data["giveName"];
	
	//attachment
	$mail ->AddAttachment($pdfFile);
	
	//send and check for error
	if(!$mail -> Send()){
		echo "Error sending mail. Error Code: " . $mail -> ErrorInfo;
	}
	
	echo "Message sent.";
 }
?>