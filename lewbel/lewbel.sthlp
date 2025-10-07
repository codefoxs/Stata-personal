{smcl}
{hline}
help {hi:lewbel}{right: 13Jun2024}
{hline}

{title:简述}

{p2colset 5 15 22 2}{...}
{p2col :{hi:lewbel} {hline 2}}基于异方差的工具变量回归（Lewbel，2012）{p_end}
{p2colreset}{...}


{title:语法}
{p 8 14 4}
{cmdab:lewbel} {varlist} {ifin}, 
{cmdab:a:bsorb(varlist)}
[
{cmdab:vce:(method)}
{cmdab:c:luster(varlist)}
{cmdab:z(varlist)}
{cmdab:by(varlist)}
{cmdab:first}
{cmdab:keep}
{cmdab:opt(options)}
]


{title:主要参数}

{synoptset 25 tabbed}{...}
{synopthdr}
{synoptline}
{syntab:主要参数（必须添加的参数）}
{synopt:{it:varlist}}用于回归的变量，第一个为被解释变量，{p_end}
{synopt:}第二个为核心解释变量，后面为控制变量{p_end}

{synopt: {opt a:bsorb}({it:varlist})}吸收的固定效应，参考：{p_end}
{synopt:}{help reghdfe:help reghdfe}{p_end}


{syntab: 可选参数}
{synopt: {opt vce}({it:method})}{help reghdfe:help reghdfe}{p_end}

{synopt: {opt cl:uster}({it:varlist})}{help reghdfe:help reghdfe}{p_end}

{synopt: {opt z}({it:varlist})}额外添加的外生变量{p_end}

{synopt: {opt by}({it:varlist})}取均值的分组方法（一般不建议使用）{p_end}

{synopt: {opt first}}展示第一阶段回归结果{p_end}

{synopt: {opt keep}}保留生成的工具变量（以 _g 结尾）{p_end}

{synopt: {opt opt}(options)}{help ivreghdfe} 的额外参数{p_end}
{synoptline}
{p2colreset}{...}


{title:例子}

{phang2}{inp:.} {stata `"use "https://github.com/codefoxs/Stata-personal/raw/main/lewbel/lewbel%20test.dta", clear"'}{p_end}

{phang2}{inp:.} {stata `"global controls = "x2-x9""'}{p_end}

{phang2}{inp:.} {stata `"xtset id year"'}{p_end}

{phang2}{inp:.} {stata `"gen Ind_year = string(Industry) + "$" + string(year)"'}{p_end}

{phang2}{inp:.} {stata `"lewbel y x1 $controls , a(Country Ind_year) cl(Ind_year) keep first"'}{p_end}

{phang2}{inp:.} {stata `"ereturn list"'}{p_end}


{title:存储变量（可以采用 reg2docx 的 scalars 输出）}

{synoptset 30 tabbed}{...}
{syntab:标量 Scalars}
{synopt:{cmd:e(HetLM)}}Breusch–Pagan 检验卡方统计量{p_end}
{synopt:{cmd:e(HetLMp)}}Breusch–Pagan 检验卡方统计量 p 值{p_end}
{synopt:{cmd:e(Kleibergen_Paap_rk_LM)}}弱工具变量检验：Kleibergen Paap rk LM 值{p_end}
{synopt:{cmd:e(Kleibergen_Paap_rk_LM_p)}}弱工具变量检验：Kleibergen Paap rk LM 的 p 值{p_end}
{synopt:{cmd:e(Cragg_Donald_Wald_F)}}弱工具变量检验：Cragg Donald Wald F 值{p_end}
{synopt:{cmd:e(Cragg_Donald_Wald_F_p)}}弱工具变量检验：Cragg Donald Wald F 的 p 值{p_end}
{synopt:{cmd:e(Hansen_J)}}过度识别检验：Hansen J 值{p_end}
{synopt:{cmd:e(Hansen_J_p)}}过度识别检验：Hansen J  的 p 值{p_end}


{title:参考文献}

{p 4 8 2}
Lewbel, A. (2012). Using Heteroscedasticity to Identify and Estimate Mismeasured and Endogenous Regressor Models. {it:Journal of Business & Economic Statistics}, 30(1), 67–80.{p_end}


{bf:作者}

{phang}
{bf: CodeFox}  {browse "https://github.com/codefoxs":Github}
{phang}
{bf: Keynes}  {browse "https://www.zhihu.com/people/Keynes":Zhihu}

