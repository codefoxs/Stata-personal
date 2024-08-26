*! Version 0.1.4 26Aug2024: Bug fixed
*! Version 0.1.3 13Jun2024: Support factor and time-serie variables
*! Version 0.1.2 11May2024: Add by() option
*! Version 0.1.1 09May2024: Lewbel IV method with reghdfe and ivreghdfe

cap program drop lewbel
program define lewbel, eclass
    syntax varlist(fv ts) [if] [in], Absorb(string) [VCE(string) CLuster(string) Z(string) BY(string) first keep opt(string)]
    
    marksample touse
    markout `touse' `z'
    
    gettoken y xlist: varlist
    gettoken x control: xlist

    if "`z'" == ""{
        local z = "`control'"
    }
    
    if "`first'" != ""{
    	local qui = ""
    }
    else{
    	local qui = "qui"
    }
    
    tempvar resid
    tempvar resid2
    qui reghdfe `x' `control' `z' if `touse', a(`absorb') resid(`resid')
    qui gen `resid2' = `resid'^2 if `touse'
    qui reghdfe `resid2' $controls `z' if `touse', a(`absorb')
    local LM = e(N) * e(r2)
    local LMk = e(N) - e(df_r)
    local LMp = chi2tail(`LMk', `LM')
    
    
    dis as res "*=============================================================================*"
    dis as res "*                       Part 1 Heteroskedasticity test                        *"
    dis as res "*=============================================================================*"
    dis as txt "Breusch–Pagan test for heteroskedasticity"
    dis as txt "H0: Constant variance"
    dis as txt _col(3) "Chi2(" _c
    dis as res `LMk' _c
    dis as txt ") = " _c
    dis as res %9.4f `LM'
    dis as txt _col(5) "Prob > chi2 = " _c
    dis as res %5.4f `LMp' _n
    
    
    dis as res "*=============================================================================*"
    dis as res "*                          Part 2 2SLS regression                             *"
    dis as res "*=============================================================================*"
    local glist = ""
    foreach v of varlist `z' {
        tempvar var_mean
        if "`by'" != ""{
            bys `by': qui egen `var_mean' = mean(`v') if `touse'
        }
        else{
            qui egen `var_mean' = mean(`v') if `touse'
        }
        qui gen `v'_g = (`v' - `var_mean') * `resid'
        local glist = "`glist'`v'_g "
        qui drop `var_mean'
    }
    
    if "`cluster'" != ""{
        ivreghdfe `y' (`x' = `glist') `control' if `touse', a(`absorb') cluster(`cluster') `first' `opt'
    }
    else{
    	ivreghdfe `y' (`x' = `glist') `control' if `touse', a(`absorb') vce(`vce') `first' `opt'
    }
    
    if "`keep'" == ""{
    	cap drop `glist'
    }
    ereturn scalar HetLM = `LM'
    ereturn scalar HetLM_df = `LMk'
    ereturn scalar HetLMp = `LMp'
    
    ereturn scalar Kleibergen_Paap_rk_LM = e(idstat)
    ereturn scalar Kleibergen_Paap_rk_LM_p = chi2tail(e(exexog_ct), e(idstat))
    ereturn scalar Cragg_Donald_Wald_F = e(cdf)
    ereturn scalar Kleibergen_Paap_rk_Wald_F = e(rkf)
    ereturn scalar Hansen_J = e(j)
    ereturn scalar Hansen_J_p = chi2tail(e(exexog_ct)-1, e(j))
    
    ereturn local glist = "`glist'"
end

