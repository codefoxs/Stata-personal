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
qui replace `new_prov' = "北京市"           if regexm(`old_prov', "北京|Beijing")
qui replace `new_prov' = "天津市"           if regexm(`old_prov', "天津|Tianjin")
qui replace `new_prov' = "河北省"           if regexm(`old_prov', "河北|Hebei")
qui replace `new_prov' = "山西省"           if regexm(`old_prov', "山西|Shanxi")
qui replace `new_prov' = "内蒙古自治区"     if regexm(`old_prov', "内蒙|Mongolia|Neimenggu")
qui replace `new_prov' = "辽宁省"           if regexm(`old_prov', "辽宁|Liaoning")
qui replace `new_prov' = "吉林省"           if regexm(`old_prov', "吉林|Jilin")
qui replace `new_prov' = "黑龙江省"         if regexm(`old_prov', "黑龙|Heilong")
qui replace `new_prov' = "上海市"           if regexm(`old_prov', "上海|Shanghai")
qui replace `new_prov' = "江苏省"           if regexm(`old_prov', "江苏|Jiangsu")
qui replace `new_prov' = "浙江省"           if regexm(`old_prov', "浙江|Zhejiang")
qui replace `new_prov' = "安徽省"           if regexm(`old_prov', "安徽|Anhui")
qui replace `new_prov' = "福建省"           if regexm(`old_prov', "福建|Fujian")
qui replace `new_prov' = "江西省"           if regexm(`old_prov', "江西|Jiangxi")
qui replace `new_prov' = "山东省"           if regexm(`old_prov', "山东|Shandong")
qui replace `new_prov' = "河南省"           if regexm(`old_prov', "河南|Henan")
qui replace `new_prov' = "湖北省"           if regexm(`old_prov', "湖北|Hubei")
qui replace `new_prov' = "湖南省"           if regexm(`old_prov', "湖南|Hunan")
qui replace `new_prov' = "广东省"           if regexm(`old_prov', "广东|Guangdong")
qui replace `new_prov' = "广西壮族自治区"   if regexm(`old_prov', "广西|Guangxi")
qui replace `new_prov' = "海南省"           if regexm(`old_prov', "海南|Hainan")
qui replace `new_prov' = "重庆市"           if regexm(`old_prov', "重庆|Chongqing")
qui replace `new_prov' = "四川省"           if regexm(`old_prov', "四川|Sichuan")
qui replace `new_prov' = "贵州省"           if regexm(`old_prov', "贵州|Guizhou")
qui replace `new_prov' = "云南省"           if regexm(`old_prov', "云南|Yunnan")
qui replace `new_prov' = "西藏自治区"       if regexm(`old_prov', "西藏|Xizang|Tibet")
qui replace `new_prov' = "陕西省"           if regexm(`old_prov', "陕西|Shaanxi")
qui replace `new_prov' = "甘肃省"           if regexm(`old_prov', "甘肃|Gansu")
qui replace `new_prov' = "青海省"           if regexm(`old_prov', "青海|Qinghai")
qui replace `new_prov' = "宁夏回族自治区"   if regexm(`old_prov', "宁夏|Ningxia")
qui replace `new_prov' = "新疆维吾尔自治区" if regexm(`old_prov', "新疆|Xinjiang")
qui replace `new_prov' = "台湾省"           if regexm(`old_prov', "台湾|Taiwan")
qui replace `new_prov' = "香港特别行政区"   if regexm(`old_prov', "香港|Hong Kong")
qui replace `new_prov' = "澳门特别行政区"   if regexm(`old_prov', "澳门|Macau")

qui gen `prov_code' =., after(`new_prov')
qui replace `prov_code' = 110000          if regexm(`old_prov', "北京|Beijing")
qui replace `prov_code' = 120000          if regexm(`old_prov', "天津|Tianjin")
qui replace `prov_code' = 130000          if regexm(`old_prov', "河北|Hebei")
qui replace `prov_code' = 140000          if regexm(`old_prov', "山西|Shanxi")
qui replace `prov_code' = 150000          if regexm(`old_prov', "内蒙|Mongolia|Neimenggu")
qui replace `prov_code' = 210000          if regexm(`old_prov', "辽宁|Liaoning")
qui replace `prov_code' = 220000          if regexm(`old_prov', "吉林|Jilin")
qui replace `prov_code' = 230000          if regexm(`old_prov', "黑龙|Heilong")
qui replace `prov_code' = 310000          if regexm(`old_prov', "上海|Shanghai")
qui replace `prov_code' = 320000          if regexm(`old_prov', "江苏|Jiangsu")
qui replace `prov_code' = 330000          if regexm(`old_prov', "浙江|Zhejiang")
qui replace `prov_code' = 340000          if regexm(`old_prov', "安徽|Anhui")
qui replace `prov_code' = 350000          if regexm(`old_prov', "福建|Fujian")
qui replace `prov_code' = 360000          if regexm(`old_prov', "江西|Jiangxi")
qui replace `prov_code' = 370000          if regexm(`old_prov', "山东|Shandong")
qui replace `prov_code' = 410000          if regexm(`old_prov', "河南|Henan")
qui replace `prov_code' = 420000          if regexm(`old_prov', "湖北|Hubei")
qui replace `prov_code' = 430000          if regexm(`old_prov', "湖南|Hunan")
qui replace `prov_code' = 440000          if regexm(`old_prov', "广东|Guangdong")
qui replace `prov_code' = 450000          if regexm(`old_prov', "广西|Guangxi")
qui replace `prov_code' = 460000          if regexm(`old_prov', "海南|Hainan")
qui replace `prov_code' = 500000          if regexm(`old_prov', "重庆|Chongqing")
qui replace `prov_code' = 510000          if regexm(`old_prov', "四川|Sichuan")
qui replace `prov_code' = 520000          if regexm(`old_prov', "贵州|Guizhou")
qui replace `prov_code' = 530000          if regexm(`old_prov', "云南|Yunnan")
qui replace `prov_code' = 540000          if regexm(`old_prov', "西藏|Xizang|")
qui replace `prov_code' = 610000          if regexm(`old_prov', "陕西|Shaanxi")
qui replace `prov_code' = 620000          if regexm(`old_prov', "甘肃|Gansu")
qui replace `prov_code' = 630000          if regexm(`old_prov', "青海|Qinghai")
qui replace `prov_code' = 640000          if regexm(`old_prov', "宁夏|Ningxia")
qui replace `prov_code' = 650000          if regexm(`old_prov', "新疆|Xinjiang")
qui replace `prov_code' = 810000          if regexm(`old_prov', "台湾|Taiwan")
qui replace `prov_code' = 820000          if regexm(`old_prov', "香港|Hong Kong")
qui replace `prov_code' = 710000          if regexm(`old_prov', "澳门|Macau")

end