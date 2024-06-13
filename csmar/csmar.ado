*! Version 0.1.1 Stata commands for load CSMAR xlsx file

cap program drop csmar
program define csmar
    syntax anything, [sheet(string) case(string) clear otheropt(string)]
    
    if "`case'" == ""{
    	local case = "lower"
    }
    else if "`case'" == "preserve"{
    	local case = "preserve"
    }
    else if "`case'" == "lower"{
    	local case = "lower"
    }
    else if "`case'" == "upper"{
    	local case = "upper"
    }
    else{
    	dis as error "Wrong type of case"
        exit
    }
    qui import excel using `anything', sheet("`sheet'") firstrow case(`case') `clear' `otheropt'
    
    foreach var of varlist * {
        label var `var' "`=`var'[1]' (`=`var'[2]')"
    }
    qui drop in 1/2 // 删除第1和2行
    qui destring *, replace // 把所有变量destring
    
end
