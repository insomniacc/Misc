$adusers = Get-aduser -Filter 'name -like "*"'

foreach($aduser in $adusers){
    #Check to see if this has previously been checked or not and set the state
    if($aduser.samaccountname -in $cache:checkedusers){
        $checksplat = @{checked = $true}
    }else{
        $checksplat = @{checked = $false}
    }

    #Create a new checkbox - apply our state 'splat' variable
    New-UDCheckbox -Id "CheckboxID_$($aduser.samaccountname)" @checksplat -Label "$($aduser.samaccountname)" -OnChange {
        #Get the state
        if((Get-UDElement -Id "CheckboxID_$($aduser.samaccountname)").Attributes["checked"]){
            #If Checkbox is Checked - Add user to array
            if($aduser.samaccountname -notin $cache:checkedusers){
                if($cache:checkedusers){
                    $cache:checkedusers += $aduser.samaccountname
                }else{
                    $cache:checkedusers = @("","") #This was done due to this issue: https://forums.universaldashboard.io/t/working-with-arrays-in-endpoints/1691
                    $cache:checkedusers += $aduser.samaccountname
                }
            }
        }else{
            #If Checkbox is Not Checked - remove user from array
            if($aduser.samaccountname -in $cache:checkedusers){
                $cache:checkedusers = $cache:checkedusers | ?{$_ -notlike $aduser.samaccountname}
            }
        }
    }
}

#Output so you can see whats being added/removed from the array, remove the empty/dummy entries we put into our variable:
new-udelement -tag div -AutoRefresh -RefreshInterval 1 -endpoint {
    new-udhtml -markup "<br><br>List:<br> $(($cache:checkedusers |? { $_ -notlike ''}) -join "<br>")"
}
