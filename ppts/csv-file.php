<HTML>
<HEAD>
</HEAD>
<BODY>
<?php
$CSVfp = fopen("contacts.csv", "r");
if($CSVfp !== FALSE) {
?>
<table cellspacing="1" border="1px">
<tr>
<td align="center">Friend Name</td>
<td align="center">Mobile</td>
</tr>
<?php	
while(! feof($CSVfp)) {
	$data = fgetcsv($CSVfp, 1000, ",");
	if(!empty($data)) {
?>
<tr class="data">
<td align="center"><?php echo $data[0]; ?></td>
<td align="center"><?php echo $data[1]; ?></td>
</tr>
<?php
}
}
?>
</table>
<?php	
}
fclose($CSVfp);
?>
</BODY>
</HTML>