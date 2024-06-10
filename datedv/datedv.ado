*! 0.1.1 11Jun2024 by CodeFox

* 主命令
cap program drop datedv
program define datedv
    syntax varlist , [get(string) Format(string) PREfix(string) KEEPNUM replace]
    
    if "`format'" == ""{
    	local format = "YMD"
    }
    
    if "`prefix'" == ""{
    	local pre = ""
    }
    else{
    	local pre = "datedv_"
    }
    
    if "`get'" == ""{
    	local get = "year" // 默认只获取年份
    }
    if "`get'" == "all"{
    	local get = "year month year_month day week quarter"
    }
    
    gen `pre'datenum = date(`varlist', "`format'"), after(`varlist')
    
    local lastvar = "`pre'datenum"
    foreach v in `get'{
    	_datedv_get_`v' `pre'datenum , pre(`pre') lastvar("`lastvar'")
        local lastvar = "`pre'`v'"
    }
    
    if "`keepnum'" == ""{
    	drop `pre'datenum
    }
    
    if "`replace'" != ""{
    	drop `varlist'
    }
    
end

* 获取年份子命令
cap program drop _datedv_get_year
program define _datedv_get_year
    syntax varlist , lastvar(string) [pre(string)]
    gen `pre'year = year(`varlist') , after(`lastvar')
end

* 获取月份子命令
cap program drop _datedv_get_month
program define _datedv_get_month
    syntax varlist , lastvar(string) [pre(string)]
    gen `pre'month = month(`varlist') , after(`lastvar')
end

* 获取年份-月份子命令
cap program drop _datedv_get_year_month
program define _datedv_get_year_month
    syntax varlist , lastvar(string) [pre(string)]
    tempvar year
    tempvar month
    tempvar strmonth
    gen `year' = year(`varlist') , after(`lastvar')
    gen `month' = month(`varlist') , after(`lastvar')
    gen `strmonth' = cond(`month' > 9, string(`month'), string(0) + string(`month')) , after(`lastvar')
    gen `pre'year_month = string(`year') + "-" + `strmonth', after(`lastvar')
end

* 获取日的子命令
cap program drop _datedv_get_day
program define _datedv_get_day
    syntax varlist , lastvar(string) [pre(string)]
    gen `pre'day = day(`varlist') , after(`lastvar')
end

* 获取年份-周的子命令
cap program drop _datedv_get_week
program define _datedv_get_week
    syntax varlist , lastvar(string) [pre(string)]
    tempvar year
    tempvar week
    gen `year' = year(`varlist') , after(`lastvar')
    gen `week' = week(`varlist') , after(`lastvar')
    gen `pre'week = string(`year') + "-" + string(`week'), after(`lastvar')
end

* 获取年份-季度子命令
cap program drop _datedv_get_quarter
program define _datedv_get_quarter
    syntax varlist , lastvar(string) [pre(string)]
    tempvar year
    tempvar quarter
    gen `year' = year(`varlist') , after(`lastvar')
    gen `quarter' = 4 , after(`lastvar')
    qui replace `quarter' = 3 if month(`varlist') <= 9
    qui replace `quarter' = 2 if month(`varlist') <= 6
    qui replace `quarter' = 1 if month(`varlist') <= 3
    gen `pre'quarter = string(`year') + "-" + string(`quarter'), after(`lastvar')
end
