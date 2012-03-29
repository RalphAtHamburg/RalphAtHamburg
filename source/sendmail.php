<?php 

// Predefined Variables
$sender = "noreply@ralph-moecklinghoff.de";
$to = "mail@ralph-moecklinghoff.de"; 
$subject = "Anfrage über Homepage"; 

$name    = htmlspecialchars($_REQUEST['name']); 
$mail    = htmlspecialchars($_REQUEST['mail']);
$anfrage = htmlspecialchars($_REQUEST['anfrage']); 

$message = "Anfrage von der Website:\n\nName: " . $name . "\nMail:\t" . $mail ."\nAnfrage:\t" . $anfrage;

$headers = "From: $sender"; 

$sent = mail($to, $subject, $message, $headers); 

$headers = "From: $fromnReply-To: 
$fromnContent-type: text/plain; charset=iso-8859-1";  

if($sent) 
  {print "Vielen Dank für Ihre Kontaktaufnahme, ich melden mich bei Ihnen."; } 
else 
  {print "Beim Senden der Anfrage ist leider ein Fehler aufgetreten."; }

?>