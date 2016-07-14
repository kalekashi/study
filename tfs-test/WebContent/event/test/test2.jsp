<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
 <head>
  <title> new document </title>
  <meta name="generator" content="editplus" />
  <meta name="author" content="" />
  <meta name="keywords" content="" />
  <meta name="description" content="" />
 </head>
 <body>
<div contenteditable style='width:100%;text-align:center;'>
<form name="frm">
<select name="selArea" id="selArea"></select>
<select name="selNationality" id="selNationality"></select>
</form>
<script>
	
var Continent = [
    { name: "Asia", code: "AS", countries: [
												{ name: "Afghanistan", code: "AF" },
											    { name: "Armenia", code: "AM" } 
											]
	},
    { name: "Africa", code: "AF", countries: [ 
												{ name: "Algeria", code: "DZ" },
										        { name: "Angola", code: "AO" }
											]
	},
	{ name: "Euro", code: "EU", countries: [ 
												{ name: "Algeria", code: "DZ" },
										        { name: "Angola", code: "AO" }
											]
	}
];
</script>
<SCRIPT>
	var objContinent = document.getElementById("selArea");
    var objCountry = document.getElementById("selNationality");
    var countryData = null;
    var isChecked = false;
    var strDefaultType = "---- All ----";
	var selAreaVal = "AF";
	var selNationalityVal = "";

    if (objContinent) {
        
        for (var i = 0; i < Continent.length; i++) {
            objContinent.options[i] = new Option(Continent[i].name, Continent[i].code);
            if (selAreaVal && selAreaVal == Continent[i].code) {
                objContinent.options[i].selected = true;
                countryData = Continent[i].countries;
                isChecked = true;
            }
        }
        objContinent.options.add(new Option(strDefaultType, ""), 0);

        if (!selAreaVal || !isChecked)
            objContinent.options[0].selected = true;

        isChecked = false;
        if (countryData) {
            for (var i = 0; i < countryData.length; i++) {
                objCountry.options[i] = new Option(countryData[i].name, countryData[i].code);
                if (selNationalityVal && selNationalityVal == countryData[i].code) {
                    objCountry.options[i].selected = true;
                    isChecked = true;
                }
            }
            objCountry.options.add(new Option(strDefaultType, ""), 0);
            if (!selNationalityVal || !isChecked)
                objCountry.options[0].selected = true;
        }
        else
            objCountry.options.add(new Option(strDefaultType, ""), 0);
    }
</SCRIPT>
 </body>
</html>


