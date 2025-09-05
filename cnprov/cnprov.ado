*! version 0.1.3 03Seq2025: Bug Fix raised by zhihu@qing-feng-wan-yue-37(清风); Support more match types
*! version 0.1.2 03Apr2025: Support conversion from English to Chinese
*! version 0.1.1 12Jun2024 CodeFox

cap program drop cnprov
program define cnprov

syntax varlist(max=1), [name(string)]

local old_prov = "`varlist'"

if "`name'" == ""{
    local new_prov = "prov"
    local prov_code = "prov_code"
}
else{
    local new_prov = "`name'"
    local prov_code = "`name'_code"
}

qui gen `new_prov' = "", after(`old_prov')
qui replace `new_prov' = "北京市"           if regexm(`old_prov', "北京|Beijing|beijing")
qui replace `new_prov' = "天津市"           if regexm(`old_prov', "天津|Tianjin|tianjin")
qui replace `new_prov' = "河北省"           if regexm(`old_prov', "河北|Hebei|hebei")
qui replace `new_prov' = "山西省"           if regexm(`old_prov', "山西|Shanxi|shanxi")
qui replace `new_prov' = "内蒙古自治区"     if regexm(`old_prov', "内蒙|Mongolia|Neimeng|neimeng")
qui replace `new_prov' = "辽宁省"           if regexm(`old_prov', "辽宁|Liaoning|liaoning")
qui replace `new_prov' = "吉林省"           if regexm(`old_prov', "吉林|Jilin|jilin")
qui replace `new_prov' = "黑龙江省"         if regexm(`old_prov', "黑龙|Heilong|heilongjiang")
qui replace `new_prov' = "上海市"           if regexm(`old_prov', "上海|Shanghai|shanghai")
qui replace `new_prov' = "江苏省"           if regexm(`old_prov', "江苏|Jiangsu|jiangsu")
qui replace `new_prov' = "浙江省"           if regexm(`old_prov', "浙江|Zhejiang|zhejiang")
qui replace `new_prov' = "安徽省"           if regexm(`old_prov', "安徽|Anhui|anhui")
qui replace `new_prov' = "福建省"           if regexm(`old_prov', "福建|Fujian|fujian")
qui replace `new_prov' = "江西省"           if regexm(`old_prov', "江西|Jiangxi|jiangxi")
qui replace `new_prov' = "山东省"           if regexm(`old_prov', "山东|Shandong|shandong")
qui replace `new_prov' = "河南省"           if regexm(`old_prov', "河南|Henan|henan")
qui replace `new_prov' = "湖北省"           if regexm(`old_prov', "湖北|Hubei|hubei")
qui replace `new_prov' = "湖南省"           if regexm(`old_prov', "湖南|Hunan|hunan")
qui replace `new_prov' = "广东省"           if regexm(`old_prov', "广东|Guangdong|guangdong")
qui replace `new_prov' = "广西壮族自治区"    if regexm(`old_prov', "广西|Guangxi|guangxi")
qui replace `new_prov' = "海南省"           if regexm(`old_prov', "海南|Hainan|hainan")
qui replace `new_prov' = "重庆市"           if regexm(`old_prov', "重庆|Chongqing|chongqing")
qui replace `new_prov' = "四川省"           if regexm(`old_prov', "四川|Sichuan|sichuan")
qui replace `new_prov' = "贵州省"           if regexm(`old_prov', "贵州|Guizhou|guizhou")
qui replace `new_prov' = "云南省"           if regexm(`old_prov', "云南|Yunnan|yunnan")
qui replace `new_prov' = "西藏自治区"       if regexm(`old_prov', "西藏|Xizang|Tibet|xizang|tibet")
qui replace `new_prov' = "陕西省"           if regexm(`old_prov', "陕西|Shaanxi|shaanxi")
qui replace `new_prov' = "甘肃省"           if regexm(`old_prov', "甘肃|Gansu|gansu")
qui replace `new_prov' = "青海省"           if regexm(`old_prov', "青海|Qinghai|qinghai")
qui replace `new_prov' = "宁夏回族自治区"   if regexm(`old_prov', "宁夏|Ningxia|ningxia")
qui replace `new_prov' = "新疆维吾尔自治区" if regexm(`old_prov', "新疆|Xinjiang|xinjiang")
qui replace `new_prov' = "台湾省"          if regexm(`old_prov', "台湾|Taiwan|taiwan")
qui replace `new_prov' = "香港特别行政区"   if regexm(`old_prov', "香港|Hong Kong|xianggang|hongkong|hong kong|HongKong")
qui replace `new_prov' = "澳门特别行政区"   if regexm(`old_prov', "澳门|Macau|macau|aomen|Aomen")

qui gen `prov_code' =., after(`new_prov')
qui replace `prov_code' = 110000           if regexm(`old_prov', "北京|Beijing|beijing")
qui replace `prov_code' = 120000           if regexm(`old_prov', "天津|Tianjin|tianjin")
qui replace `prov_code' = 130000           if regexm(`old_prov', "河北|Hebei|hebei")
qui replace `prov_code' = 140000           if regexm(`old_prov', "山西|Shanxi|shanxi")
qui replace `prov_code' = 150000           if regexm(`old_prov', "内蒙|Mongolia|Neimeng|neimeng")
qui replace `prov_code' = 210000           if regexm(`old_prov', "辽宁|Liaoning|liaoning"
qui replace `prov_code' = 220000           if regexm(`old_prov', "吉林|Jilin|jilin")
qui replace `prov_code' = 230000           if regexm(`old_prov', "黑龙|Heilong|heilong")
qui replace `prov_code' = 310000           if regexm(`old_prov', "上海|Shanghai|shanghai"
qui replace `prov_code' = 320000           if regexm(`old_prov', "江苏|Jiangsu|jiangsu")
qui replace `prov_code' = 330000           if regexm(`old_prov', "浙江|Zhejiang|zhejiang")
qui replace `prov_code' = 340000           if regexm(`old_prov', "安徽|Anhui|anhui")
qui replace `prov_code' = 350000           if regexm(`old_prov', "福建|Fujian|fujian")
qui replace `prov_code' = 360000           if regexm(`old_prov', "江西|Jiangxi|jiangxi")
qui replace `prov_code' = 370000           if regexm(`old_prov', "山东|Shandong|shandong")
qui replace `prov_code' = 410000           if regexm(`old_prov', "河南|Henan|henan")
qui replace `prov_code' = 420000           if regexm(`old_prov', "湖北|Hubei|hubei")
qui replace `prov_code' = 430000           if regexm(`old_prov', "湖南|Hunan|hunan")
qui replace `prov_code' = 440000           if regexm(`old_prov', "广东|Guangdong|guangdong")
qui replace `prov_code' = 450000           if regexm(`old_prov', "广西|Guangxi|guangxi")
qui replace `prov_code' = 460000           if regexm(`old_prov', "海南|Hainan|hainan")
qui replace `prov_code' = 500000           if regexm(`old_prov', "重庆|Chongqing|chongqing")
qui replace `prov_code' = 510000           if regexm(`old_prov', "四川|Sichuan|sichuan")
qui replace `prov_code' = 520000           if regexm(`old_prov', "贵州|Guizhou|guizhou")
qui replace `prov_code' = 530000           if regexm(`old_prov', "云南|Yunnan|yunnan")
qui replace `prov_code' = 540000           if regexm(`old_prov', "西藏|Xizang|Tibet|xizang|tibet")
qui replace `prov_code' = 610000           if regexm(`old_prov', "陕西|Shaanxi|shaanxi")
qui replace `prov_code' = 620000           if regexm(`old_prov', "甘肃|Gansu|gansu")
qui replace `prov_code' = 630000           if regexm(`old_prov', "青海|Qinghai|qinghai")
qui replace `prov_code' = 640000           if regexm(`old_prov', "宁夏|Ningxia|ningxia")
qui replace `prov_code' = 650000           if regexm(`old_prov', "新疆|Xinjiang|xinjiang")
qui replace `prov_code' = 810000           if regexm(`old_prov', "台湾|Taiwan|taiwan")
qui replace `prov_code' = 820000           if regexm(`old_prov', "香港|Hong Kong|xianggang|hongkong|hong kong|HongKong")
qui replace `prov_code' = 710000           if regexm(`old_prov', "澳门|Macau|macau|aomen|Aomen")

end