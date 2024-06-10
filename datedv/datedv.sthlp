{smcl}
{hline}
help {hi:datedv}{right: 28Dec2023}
{hline}

{title:简述}

{p2colset 5 15 22 2}{...}
{p2col :{hi:datedv} {hline 2}}一个方便的日期处理命令{p_end}
{p2colreset}{...}

{title:语法}
{p 8 14 4}{cmd:datedv} {it:datevar}{cmd:,}
{cmdab::get:(}获取变量列表{cmd:)}
{cmdab:f:ormat:(}日期格式{cmd:)}
[{cmdab:pre:fix:(}变量前缀{cmd:)}
{cmdab:keep:num:}
{cmdab::replace:}]

{synoptset 25 tabbed}{...}
{synopthdr}
{synoptline}
{syntab: 主要参数（必须添加的参数）}
{synopt :{it:datevar}}指定一个日期变量{p_end}

{syntab: 可选参数}
{synopt: {opt get}(获取变量列表)}指定获取的变量列表，目前可用如下：{p_end}
{synopt: }(1) {bf:year}：默认只获取年份；{p_end}
{synopt: }(2) {bf:month}：获取月份；{p_end}
{synopt: }(3) {bf:yearmonth}：获取年份-月份{p_end}
{synopt: }(4) {bf:day}：获取日期{p_end}
{synopt: }(5) {bf:week}：获取年份-周{p_end}
{synopt: }(6) {bf:quarter}：获取年份-季度{p_end}

{synopt: {opt f:ormat}(日期格式)}指定变量的日期格式。 {p_end}
{synopt: }help {help date} 可查看详情。

{synopt: {opt pre:fix}(变量前缀)}指定变量的前缀。{p_end}

{synopt: {opt keep:num}}保留 date({it:datevar}, "{it:format}") 的数值结果。{p_end}

{synopt: {opt replace}}删除 {it:datevar}。{p_end}
{synoptline}
{p2colreset}{...}

{title:例子}

{title: 1 默认仅生成年份}

{phang2}{cmd:. use "demo.dta", clear }{p_end}
{phang2}{cmd:. datedv date1}{p_end}

{title: 2 生成年份、月份，并添加前缀 datedv_，日期格式为 yyyy-mm}

{phang2}{cmd:. datedv date2, format("YM") get(year month) prefix(datedv_)}{p_end}

{title: 3 生成所有变量，保留数值结果，删除原日期变量}

{phang2}{cmd:. datedv date3, get(all) format("DMY") keepnum replace}{p_end}

{title:致谢}

{phang}
感谢{bf:广东外语外贸大学}各位老师的指点。

{title:作者}

{phang}
{bf: 凯恩斯（知乎用户）}{break}{browse "https://www.zhihu.com/people/Keynes"}

