{smcl}
{* *! version 0.1.3 10Sep2025}{...}
{vieweralsosee "[R] regexm" "help regexm"}{...}
{vieweralsosee "[R] replace" "help replace"}{...}
{vieweralsosee "" "--"}{...}
{viewerjumpto "Syntax" "cnprov##syntax"}{...}
{viewerjumpto "Standarization" "cnprov##standarization"}{...}
{viewerjumpto "Example" "cnprov##example"}{...}
{viewerjumpto "More information" "cnprov##addition"}{...}
{title:Title}

{p2colset 5 15 22 2}{...}
{p2col :{hi:cnprov} {hline 2}}Standardize names of Chinese provinces. Also provide their codes{p_end}
{p2colreset}{...}

{marker syntax}{...}
{title:Syntax}
{p 8 14 4}{cmd:cnprov} {it:province_string}
[{cmd:,} {cmdab::name:(}{it:string}{cmd:)}]

{synoptset 25 tabbed}{...}
{synopthdr}
{synoptline}
{syntab: Main}
{synopt :{it:province_string}}Province name variable in your data{p_end}

{syntab: Other options}
{synopt: {opt name}({it:string})}Name for generated variables. Default names are {bf:prov} and {bf:prov_code}{p_end}
{synoptline}
{p2colreset}{...}

{marker standarization}{...}
{title:Standarization}

      {it:province_string containing one of the strings in the right side can be converted to the left side correspondingly}

{bf: 1 Name standarization}

        "北京市"           <-   "北京|Beijing|beijing"
        "天津市"           <-   "天津|Tianjin|tianjin"
        "河北省"           <-   "河北|Hebei|hebei"
        "山西省"           <-   "山西|Shanxi|shanxi"
        "内蒙古自治区"     <-   "内蒙|Mongolia|Neimeng|neimeng"
        "辽宁省"           <-   "辽宁|Liaoning|liaoning"
        "吉林省"           <-   "吉林|Jilin|jilin"
        "黑龙江省"         <-   "黑龙|Heilong|heilongjiang"
        "上海市"           <-   "上海|Shanghai|shanghai"
        "江苏省"           <-   "江苏|Jiangsu|jiangsu"
        "浙江省"           <-   "浙江|Zhejiang|zhejiang"
        "安徽省"           <-   "安徽|Anhui|anhui"
        "福建省"           <-   "福建|Fujian|fujian"
        "江西省"           <-   "江西|Jiangxi|jiangxi"
        "山东省"           <-   "山东|Shandong|shandong"
        "河南省"           <-   "河南|Henan|henan"
        "湖北省"           <-   "湖北|Hubei|hubei"
        "湖南省"           <-   "湖南|Hunan|hunan"
        "广东省"           <-   "广东|Guangdong|guangdong"
        "广西壮族自治区"   <-   "广西|Guangxi|guangxi"
        "海南省"           <-   "海南|Hainan|hainan"
        "重庆市"           <-   "重庆|Chongqing|chongqing"
        "四川省"           <-   "四川|Sichuan|sichuan"
        "贵州省"           <-   "贵州|Guizhou|guizhou"
        "云南省"           <-   "云南|Yunnan|yunnan"
        "西藏自治区"       <-   "西藏|Xizang|Tibet|xizang|tibet"
        "陕西省"           <-   "陕西|Shaanxi|shaanxi"
        "甘肃省"           <-   "甘肃|Gansu|gansu"
        "青海省"           <-   "青海|Qinghai|qinghai"
        "宁夏回族自治区"   <-   "宁夏|Ningxia|ningxia"
        "新疆维吾尔自治区" <-   "新疆|Xinjiang|xinjiang"
        "台湾省"           <-   "台湾|Taiwan|taiwan"
        "香港特别行政区"   <-   "香港|Hong Kong|xianggang|hongkong|hong kong|HongKong"
        "澳门特别行政区"   <-   "澳门|Macau|macau|aomen|Aomen"

{bf: 2 Code standarization}

        110000             <-   "北京|Beijing|beijing"
        120000             <-   "天津|Tianjin|tianjin"
        130000             <-   "河北|Hebei|hebei"
        140000             <-   "山西|Shanxi|shanxi"
        150000             <-   "内蒙|Mongolia|Neimeng|neimeng"
        210000             <-   "辽宁|Liaoning|liaoning"
        220000             <-   "吉林|Jilin|jilin"
        230000             <-   "黑龙|Heilong|heilongjiang"
        310000             <-   "上海|Shanghai|shanghai"
        320000             <-   "江苏|Jiangsu|jiangsu"
        330000             <-   "浙江|Zhejiang|zhejiang"
        340000             <-   "安徽|Anhui|anhui"
        350000             <-   "福建|Fujian|fujian"
        360000             <-   "江西|Jiangxi|jiangxi"
        370000             <-   "山东|Shandong|shandong"
        410000             <-   "河南|Henan|henan"
        420000             <-   "湖北|Hubei|hubei"
        430000             <-   "湖南|Hunan|hunan"
        440000             <-   "广东|Guangdong|guangdong"
        450000             <-   "广西|Guangxi|guangxi"
        460000             <-   "海南|Hainan|hainan"
        500000             <-   "重庆|Chongqing|chongqing"
        510000             <-   "四川|Sichuan|sichuan"
        520000             <-   "贵州|Guizhou|guizhou"
        530000             <-   "云南|Yunnan|yunnan"
        540000             <-   "西藏|Xizang|Tibet|xizang|tibet"
        610000             <-   "陕西|Shaanxi|shaanxi"
        620000             <-   "甘肃|Gansu|gansu"
        630000             <-   "青海|Qinghai|qinghai"
        640000             <-   "宁夏|Ningxia|ningxia"
        650000             <-   "新疆|Xinjiang|xinjiang"
        810000             <-   "台湾|Taiwan|taiwan"
        820000             <-   "香港|Hong Kong|xianggang|hongkong|hong kong|HongKong"
        710000             <-   "澳门|Macau|macau|aomen|Aomen"

{marker example}{...}
{title:Example}

{hline}
{pstd}Quick use{p_end}
{phang2}{cmd:. cnprov province}{p_end}

{pstd}Name the generated variables{p_end}
{phang2}{cmd:. cnprov province, name(new_prov)}{p_end}
{hline}

{marker author}{...}
{title:Author}

{pstd}CodeFox{break}
A student who is learning Stata{break}
Homepage: {browse "https://github.com/codefoxs":CodeFox's Github}
{p_end}

{marker addition}{...}
{title:More information}

{pstd}
Introduction for provinces in China (Chinese website): {browse "https://baike.baidu.com/item/中华人民共和国省级行政区/54127472":中华人民共和国省级行政区}
{p_end}

{pstd}
Introduction for provinces in China (English website): {browse "https://en.wikipedia.org/wiki/Provinces_of_China":Provinces of China}
{p_end}

