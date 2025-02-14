
SET TEXT TO PASTEBOARD:C523(String:C10(Form:C1466.token))

$file:=File:C1566("/DATA/Settings/"+Replace string:C233(String:C10(Current date:C33); "/"; "-")+" "+Replace string:C233(String:C10(Current time:C178); ":"; "")+" token.txt")
$file.setText(String:C10(Form:C1466.token))
