$adusers = get-aduser -Filter 'name -like "*"'
$session:checkedusers = @("","") #This was done due to this issue: https://forums.universaldashboard.io/t/working-with-arrays-in-endpoints/1691

foreach($aduser in $adusers){
    #Create a new checkbox
    New-UDCheckbox -Id "CheckboxID_$($aduser.samaccountname)" -Label "$($aduser.samaccountname)" -OnChange {
        #Get the state
        if((Get-UDElement -Id "CheckboxID_$($aduser.samaccountname)").Attributes["checked"]){
            #If Checkbox is Checked - Add user to array
            if($aduser.samaccountname -notin $session:checkedusers){
                $session:checkedusers += $aduser.samaccountname
            }
        }else{
            #If Checkbox is Not Checked - remove user from array
            if($aduser.samaccountname -in $session:checkedusers){
                $session:checkedusers = $session:checkedusers | ?{$_ -notlike $aduser.samaccountname}
            }
        }
    }
}

#Output so you can see whats being added/removed from the array:
new-udelement -tag div -AutoRefresh -RefreshInterval 1 -endpoint {
    new-udhtml -markup "<br><br>List:<br> $(($session:checkedusers |? { $_ -notlike ''}) -join "<br>")"
}
