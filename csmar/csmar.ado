*! Version 0.1.3 Can automatically choose .zip and .xlsx files to convert
*! Version 0.1.2 Support zip file
*! Version 0.1.1 Stata commands for load CSMAR xlsx file

cap program drop csmar
program define csmar
    syntax anything, [REmove sheet(string) case(string) otheropt(string)]
    
    dis as res "================== {it:Begin} =================="
    qui timer clear 1
    qui timer on 1
    local working_dir: pwd
    
    local filematch = regexm(`anything', ".*\\(.*)\.xlsx")
    if `filematch' == 0{
        local filematch = regexm(`anything', "(.*)\.xlsx")
    }
    if (`filematch' == 0){
        local filematch = regexm(`anything', ".*\\(.*)\.zip")
        if `filematch' == 0{
            local filematch = regexm(`anything', "(.*)\.zip")
        }
        
        if (`filematch' == 0){
            dis as err "Only support .zip or .xlsx files"
            exit
        }
        
        local filename = regexs(1)
        
        local new_folder = subinstr(`anything', ".zip", "", .)
        
        cap mkdir "`new_folder'"
        qui cd "`new_folder'"
        qui fs *
        cap dis strlen(`r(files)')
        if _rc == 0{
            if ("`remove'" == ""){
                dis as err "Folder `new_folder' is not empty. Use 'remove' option or save files to another folder."
                exit
            }
            
            dis as err "Folder `new_folder' is not empty. Files are removed ..."
            foreach f in `r(files)'{
                rm "`f'"
            }
        }
        
        local file_path = `anything'
        cap qui unzipfile "`file_path'", replace
        if _rc > 0{
            qui unzipfile "`working_dir'\\`file_path'", replace
        }
        
        qui fs *.xlsx
        local xlsx_num = wordcount(`"`r(files)'"')
        
        dis as res ">>> `xlsx_num' xlsx files are converting to dta..."
        foreach f in `r(files)'{
            local f_name = subinstr("`f'", ".xlsx", "", .)
            
            dis as txt "Converting `f' to dta..."
            csmar_xlsx "`f'", sheet("`sheet'") case("`case'") clear otheropt("`otheropt'")
            
            qui save "`f_name'", replace
        }
        
        qui fs *.dta
        local first_dta = word(`r(files)', 1)
        qui use "`first_dta'", clear
        
        local merge_num = wordcount(`"`r(files)'"')
        dis as res ">>> `merge_num' dta files are merging..."
        local dtacount = 1
        foreach fdta in `r(files)'{
            if `dtacount' > 1{
                dis as txt "Appending `fdta'..."
                qui append using "`fdta'"
            }
            else{
                local dtacount = 2
            }
        }
        
        qui fs *
        foreach f in `r(files)'{
            rm "`f'"
        }
        qui cd "`working_dir'"
        rmdir "`new_folder'"
        
        qui timer off 1
        dis as res "==================  {it:End}  =================="
        qui timer list 1
        local tt: dis %10.2f `r(t1)'
        dis as res "⏰ Time used: `tt's"
        dis as res "{it:Have a nice day and good luck to you!} (*￣3￣)╭)"
        dis as res "==========================================="
    }
    else{
        dis as txt `"Converting `anything' to dta..."'
        csmar_xlsx `anything', sheet("`sheet'") case("`case'") clear otheropt("`otheropt'")
        qui timer off 1
        dis as res "==================  {it:End}  =================="
        qui timer list 1
        local tt: dis %10.2f `r(t1)'
        dis as res "⏰ Time used: `tt's"
        dis as res "{it:Have a nice day and good luck to you!} ヾ(≧ ▽≦ *)o"
        dis as res "==========================================="
    }
end


cap program drop csmar_xlsx
program define csmar_xlsx
    syntax anything, [sheet(string) case(string) clear otheropt(string)]
    
    if "`case'" == ""{
        local case = "lower"
    }
    else if "`case'" == "preserve" | "`case'" == "raw"{
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
    qui drop in 1/2
    qui destring *, replace
end
