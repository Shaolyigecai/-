
clear
cd "/Users/xukun/Desktop"
use 数据-城市.dta
// 2010 试点城市 city=1代表实施政策的样本， city=0代表未实施政策的样本，policy为实施年份
gen city=1 if 省份=="广东省" & 年度 >= 2010 // 广东省2010年及以后受政策影响
replace city=1 if 省份=="辽宁省" & 年度 >= 2010
replace city=1 if 省份=="湖北省" & 年度 >= 2010
replace city=1 if 省份=="陕西省" & 年度 >= 2010
replace city=1 if 省份=="云南省" & 年度 >= 2010
replace city=1 if 城市=="天津市" & 年度 >= 2010
replace city=1 if 城市=="重庆市" & 年度 >= 2010
replace city=1 if 城市=="深圳市" & 年度 >= 2010
replace city=1 if 城市=="厦门市" & 年度 >= 2010
replace city=1 if 城市=="杭州市" & 年度 >= 2010
replace city=1 if 城市=="南昌市" & 年度 >= 2010
replace city=1 if 城市=="贵阳市" & 年度 >= 2010
replace city=1 if 城市=="保定市" & 年度 >= 2010
gen policy=2010 if 省份=="广东省"
replace policy=2010 if 省份=="辽宁省"
replace policy=2010 if 省份=="湖北省"
replace policy=2010 if 省份=="陕西省"
replace policy=2010 if 省份=="云南省"
replace policy=2010 if 城市=="天津市"
replace policy=2010 if 城市=="重庆市"
replace policy=2010 if 城市=="深圳市"
replace policy=2010 if 城市=="厦门市"
replace policy=2010 if 城市=="杭州市"
replace policy=2010 if 城市=="南昌市"
replace policy=2010 if 城市=="贵阳市"
replace policy=2010 if 城市=="保定市"

// 2013试点城市
replace city=1 if 省份=="海南省" & 年度 >= 2013
replace city=1 if 城市=="北京市" & 年度 >= 2013
replace city=1 if 城市=="上海市" & 年度 >= 2013
replace city=1 if 城市=="石家庄市" & 年度 >= 2013
replace city=1 if 城市=="秦皇岛市" & 年度 >= 2013
replace city=1 if 城市=="晋城市" & 年度 >= 2013
replace city=1 if 城市=="呼伦贝尔市" & 年度 >= 2013
replace city=1 if 城市=="吉林市" & 年度 >= 2013
replace city=1 if 城市=="苏州市" & 年度 >= 2013
replace city=1 if 城市=="淮安市" & 年度 >= 2013
replace city=1 if 城市=="镇江市" & 年度 >= 2013
replace city=1 if 城市=="宁波市" & 年度 >= 2013
replace city=1 if 城市=="温州市" & 年度 >= 2013
replace city=1 if 城市=="池州市" & 年度 >= 2013
replace city=1 if 城市=="南平市" & 年度 >= 2013
replace city=1 if 城市=="景德镇市" & 年度 >= 2013
replace city=1 if 城市=="赣州市" & 年度 >= 2013
replace city=1 if 城市=="青岛市" & 年度 >= 2013
replace city=1 if 城市=="济源市" & 年度 >= 2013
replace city=1 if 城市=="广元市" & 年度 >= 2013
replace city=1 if 城市=="遵义市" & 年度 >= 2013
replace city=1 if 城市=="金昌市" & 年度 >= 2013
replace city=1 if 城市=="乌鲁木齐市" & 年度 >= 2013
replace policy=2013 if 省份=="海南省"
replace policy=2013 if 城市=="北京市"
replace policy=2013 if 城市=="上海市"
replace policy=2013 if 城市=="石家庄市"
replace policy=2013 if 城市=="秦皇岛市"
replace policy=2013 if 城市=="晋城市"
replace policy=2013 if 城市=="呼伦贝尔市"
replace policy=2013 if 城市=="吉林市"
replace policy=2013 if 城市=="苏州市"
replace policy=2013 if 城市=="淮安市"
replace policy=2013 if 城市=="镇江市"
replace policy=2013 if 城市=="宁波市"
replace policy=2013 if 城市=="温州市"
replace policy=2013 if 城市=="池州市"
replace policy=2013 if 城市=="南平市"
replace policy=2013 if 城市=="景德镇市"
replace policy=2013 if 城市=="赣州市"
replace policy=2013 if 城市=="青岛市"
replace policy=2013 if 城市=="济源市"
replace policy=2013 if 城市=="广元市"
replace policy=2013 if 城市=="遵义市"
replace policy=2013 if 城市=="金昌市"
replace policy=2013 if 城市=="乌鲁木齐市"

// 2017试点城市
replace city=1 if 城市=="乌海市" & 年度 >= 2017
replace city=1 if 城市=="南京市" & 年度 >= 2017
replace city=1 if 城市=="常州市" & 年度 >= 2017
replace city=1 if 城市=="嘉兴市" & 年度 >= 2017
replace city=1 if 城市=="金华市" & 年度 >= 2017
replace city=1 if 城市=="衢州市" & 年度 >= 2017
replace city=1 if 城市=="合肥市" & 年度 >= 2017
replace city=1 if 城市=="淮北市" & 年度 >= 2017
replace city=1 if 城市=="黄山市" & 年度 >= 2017
replace city=1 if 城市=="六安市" & 年度 >= 2017
replace city=1 if 城市=="宣城市" & 年度 >= 2017
replace city=1 if 城市=="三明市" & 年度 >= 2017
replace city=1 if 城市=="共青城市" & 年度 >= 2017
replace city=1 if 城市=="吉安市" & 年度 >= 2017
replace city=1 if 城市=="抚州市" & 年度 >= 2017
replace city=1 if 城市=="济南市" & 年度 >= 2017
replace city=1 if 城市=="烟台市" & 年度 >= 2017
replace city=1 if 城市=="潍坊市" & 年度 >= 2017
replace city=1 if 城市=="长沙市" & 年度 >= 2017
replace city=1 if 城市=="株洲市" & 年度 >= 2017
replace city=1 if 城市=="湘潭市" & 年度 >= 2017
replace city=1 if 城市=="郴州市" & 年度 >= 2017
replace city=1 if 城市=="成都市" & 年度 >= 2017
replace city=1 if 城市=="普洱市" & 年度 >= 2017
replace city=1 if 城市=="拉萨市" & 年度 >= 2017
replace city=1 if 城市=="兰州市" & 年度 >= 2017
replace city=1 if 城市=="敦煌市" & 年度 >= 2017
replace city=1 if 城市=="西宁市" & 年度 >= 2017
replace city=1 if 城市=="银川市" & 年度 >= 2017
replace city=1 if 城市=="吴忠市" & 年度 >= 2017
replace city=1 if 城市=="昌吉市" & 年度 >= 2017
replace city=1 if 城市=="伊宁市" & 年度 >= 2017
replace city=1 if 城市=="和田市" & 年度 >= 2017
replace city=1 if 城市=="第一师阿拉尔市" & 年度 >= 2017
replace city=0 if city==.
replace policy=2017 if 城市=="乌海市"
replace policy=2017 if 城市=="南京市"
replace policy=2017 if 城市=="常州市"
replace policy=2017 if 城市=="嘉兴市"
replace policy=2017 if 城市=="金华市"
replace policy=2017 if 城市=="衢州市"
replace policy=2017 if 城市=="合肥市"
replace policy=2017 if 城市=="淮北市"
replace policy=2017 if 城市=="黄山市"
replace policy=2017 if 城市=="六安市"
replace policy=2017 if 城市=="宣城市"
replace policy=2017 if 城市=="三明市"
replace policy=2017 if 城市=="共青城市"
replace policy=2017 if 城市=="吉安市"
replace policy=2017 if 城市=="抚州市"
replace policy=2017 if 城市=="济南市"
replace policy=2017 if 城市=="烟台市"
replace policy=2017 if 城市=="潍坊市"
replace policy=2017 if 城市=="长沙市"
replace policy=2017 if 城市=="株洲市"
replace policy=2017 if 城市=="湘潭市"
replace policy=2017 if 城市=="郴州市"
replace policy=2017 if 城市=="成都市"
replace policy=2017 if 城市=="普洱市"
replace policy=2017 if 城市=="拉萨市"
replace policy=2017 if 城市=="兰州市"
replace policy=2017 if 城市=="敦煌市"
replace policy=2017 if 城市=="西宁市"
replace policy=2017 if 城市=="银川市"
replace policy=2017 if 城市=="吴忠市"
replace policy=2017 if 城市=="昌吉市"
replace policy=2017 if 城市=="伊宁市"
replace policy=2017 if 城市=="和田市"
replace policy=2017 if 城市=="第一师阿拉尔市"
replace policy=2050 if policy==.

*附表1
xtset 城市编号 年度
rename city citylccpost
global firmvar1 pgdp pop ind urb es // 定义全局变量firmvar1，碳排放回归的控制变量
global firmvar2 citywage pop pgdp rsc // 定义全局变量firmvar2，就业回归的控制变量
sum co2 citylabor citylccpost pgdp pop ind urb es citywage rsc

*表1
reghdfe co2 citylccpost $firmvar1, absorb(城市 年度) vce(cluster 城市) //城市、年度固定效应；城市层面聚类稳健标准误
reghdfe citylabor citylccpost $firmvar2, absorb(城市 年度) vce(cluster 城市)

// 以下为补充的代码
rename (城市编号 年度) (city year)
save data_city.dta, replace

*企业
*附表1
clear
use 数据-企业.dta
xtset id year
global deptvar labor // 定义全局变量deptvar，就业变量
global firmvar wage size lev ser tax grow roa // 定义全局变量firmvar，就业回归的控制变量
sum $deptvar lccpost $firmvar 

*表2
reghdfe labor lccpost, absorb(id year) vce(cluster id) //企业、年度固定效应；企业层面聚类稳健标准误
reghdfe labor lccpost $firmvar, absorb(id year) vce(cluster id)

*图2
* 平行趋势检验
clear
use 数据-企业.dta
gen event = year - policy if G>0  // G>0 为受政策影响的样本
tab event
replace event = -4 if event <= -4
replace event = 6 if event >= 6 
replace event =. if G==0 // stata中数值 . 即 缺失值 被认为是一个非常大的数，所以上一行代码if event >= 6 条件下，event若为.会被替换为6
tab event, gen(eventt)
forvalues i = 1/11{
	replace eventt`i' = 0 if eventt`i' == .
}
drop eventt1 // 以event <= -4作为基准
reghdfe labor eventt* $firmvar, absorb(id year) vce(cluster id)
coefplot, baselevels keep(eventt*) vertical yline(0) ytitle("政策动态效应") xtitle("低碳城市试点政策实施的相对时间") addplot(line @b @at) ciopts(recast(rcap)) scheme(s1mono) levels(95)    coeflabels(eventt2 = "-3" eventt3 = "-2" eventt4 = "-1" eventt5 = "0" eventt6 = "1" eventt7  = "2" eventt8  = "3" eventt9  = "4" eventt10  = "5" eventt11  = ">=6")
graph export "平行趋势检验.png",as(png) replace width(800) height(600)

*附表2
* 时间安慰剂检验
reghdfe labor lccpostfalse1 $firmvar, absorb(id year) vce(cluster id) // 提前1年实施政策
reghdfe labor lccpostfalse2 $firmvar, absorb(id year) vce(cluster id) // 提前2年实施政策
reghdfe labor lccpostfalse3 $firmvar, absorb(id year) vce(cluster id) // 提前3年实施政策
reghdfe labor lccpostfalse4 $firmvar, absorb(id year) vce(cluster id) // 提前4年实施政策


*附图1
*城市安慰剂检验
clear
cd "/Users/xukun/Desktop"
use data_city.dta
set matsize 5000
mat b = J(500,1,0) // 存储系数的矩阵 500行1列值为0
mat se = J(500,1,0) // 存储标准误的矩阵 500行1列值为0
mat p = J(500,1,0)  // 存储p值的矩阵 500行1列值为0

forvalues i=1/500{
	use "data_city.dta" , clear 
	xtset city year
	keep if year==2007
	sample 121, count // 随机保留121个样本
	keep city 
	save "atchcity.dta",replace
	merge 1:m city using "data_city.dta"
	gen groupnew=(_merge==3) //生成伪处理组的虚拟变量
	save "matchcity`i'.dta",replace
		
	*伪政策虚拟变量
	use "data_city.dta",clear 
	bsample 1, strata(city) // 每个城市保留一个样本
	keep year
	save "matchyear.dta", replace
	mkmat year, matrix(sampleyear) // 把year变量值存储在矩阵中
	use "matchcity`i'.dta",replace
	xtset city year
	gen time = 0
	foreach j of numlist 1/287 {
		replace time = 1 if (city == `j' & year >= sampleyear[`j',1])
	}	
	gen  did=time*groupnew
	global firmvar2 citywage pop pgdp rsc // 定义全局变量firmvar2，就业回归的控制变量
	reghdfe citylabor did $firmvar2, absorb(city year) vce(cluster city)
	
	mat b[`i',1] = _b[did] // did的系数
	mat se[`i',1] = _se[did] // did的标准误
	scalar df_r = e(N) - e(df_m) -1
	mat p[`i',1] = 2*ttail(df_r,abs(_b[did]/_se[did])) // did的p值
}
svmat b, names(coef) // 把矩阵中的值转换为变量coef1
svmat se, names(se)
svmat p, names(pvalue)

drop if pvalue1 == .
label var pvalue1 p值
label var coef1 估计系数

 twoway (scatter pvalue1 coef1,  xlabel(-0.1(0.01)0.1, grid) yline(0.1,lp(shortdash)) xline(0.0756,lp(shortdash)) xtitle(估计系数) ytitle(p值) msymbol(smcircle_hollow) mcolor(grey) legend(off)) (kdensity coef1, title(安慰剂检验))

 *-删除临时文件
forvalue i=1/500{
    erase  "matchcity`i'.dta"
}

*附表3（1）（2）列
*截尾labor
clear
use 数据-企业.dta
winsor2  labor , suffix(_tr) cuts(1 99) trim // 1%截尾labor
winsor2  labor , suffix(_tr2) cuts(5 95) trim // 5%截尾labor
reghdfe labor_tr lccpost $firmvar, absorb(id year) vce(cluster id) // 1%截尾labor
reghdfe labor_tr2 lccpost $firmvar, absorb(id year) vce(cluster id) // 5%截尾labor

*附表3（3）-（7）列
*加入基准变量缓解选择（该部分未公布代码，仅举例）
clear
use 数据-企业.dta
gen 两控区 = size > 11 // 生成虚假的变量
gen 省会城市 =  tax > 12 // 生成虚假的变量
gen 经济特区城市 =  roa > 0.04 // 生成虚假的变量
gen 是否胡焕庸线以东 =  grow > 1.85 // 生成虚假的变量

reghdfe labor lccpost $firmvar c.两控区#c.year, absorb(id year) vce(cluster id)
reghdfe labor lccpost $firmvar c.省会城市#c.year, absorb(id year) vce(cluster id)
reghdfe labor lccpost $firmvar c.经济特区城市#c.year, absorb(id year) vce(cluster id)
reghdfe labor lccpost $firmvar c.是否胡焕庸线以东#c.year, absorb(id year) vce(cluster id)
reghdfe labor lccpost $firmvar c.两控区#c.year c.省会城市#c.year c.经济特区城市#c.year c.是否胡焕庸线以东#c.year, absorb(id year) vce(cluster id)

*排除其他政策干扰
clear
use 数据-企业.dta
gen 创新型城市试点did = size > 12 & G > 0 // 生成虚假的变量
gen 重点控制区did = roa > 0.04 & G > 0 // 生成虚假的变量
gen 政策态度 = grow > 1.853 & G > 0 // 生成虚假的变量
reghdfe labor lccpost $firmvar 创新型城市试点did, absorb(id year) vce(cluster id)
reghdfe labor lccpost $firmvar 重点控制区did, absorb(id year) vce(cluster id)
reghdfe labor lccpost $firmvar 政策态度, absorb(id year) vce(cluster id)

*产业政策（创业）
gen 总量指数得分 = size * 0.12 + lccpostfalse1 * 1.2  // 生成虚假的变量
gen 人均得分 = size * 0.12 + lccpostfalse2 * 1.2  // 生成虚假的变量
gen 单位面积得分 = size * 0.12 + lccpostfalse3 * 1.2  // 生成虚假的变量
reghdfe labor lccpost $firmvar 总量指数得分, absorb(id year) vce(cluster id)
reghdfe labor lccpost $firmvar 人均得分, absorb(id year) vce(cluster id)
reghdfe labor lccpost $firmvar 单位面积得分, absorb(id year) vce(cluster id)

*附表5（1）-（3）
*其他政策+产业政策
reghdfe labor lccpost $firmvar 创新型城市试点did 重点控制区did 政策态度 总量指数得分, absorb(id year) vce(cluster id)
reghdfe labor lccpost $firmvar 创新型城市试点did 重点控制区did 政策态度 人均得分, absorb(id year) vce(cluster id)
reghdfe labor lccpost $firmvar 创新型城市试点did 重点控制区did 政策态度 单位面积得分, absorb(id year) vce(cluster id)


*附表5（4）-（6）
*PSM-DID
// 最邻近匹配1:2
use "data_city.dta" , clear 
set  seed 0000
gen  norvar_1 = rnormal()
sort norvar_1
global firmvar2 citywage pop pgdp rsc // 定义全局变量firmvar2，就业回归的控制变量
psmatch2 citylccpost $firmvar2 , outcome(citylabor) logit neighbor(2) ties common ate 
keep if _weight ~=. // 保留匹配成功的样本
reghdfe citylabor citylccpost $firmvar2, absorb(city year) vce(cluster city)

// 核匹配
use "data_city.dta" , clear 
set  seed 0000
gen  norvar_1 = rnormal()
sort norvar_1
global firmvar2 citywage pop pgdp rsc // 定义全局变量firmvar2，就业回归的控制变量				 
psmatch2 citylccpost $firmvar2 , outcome(citylabor) logit  ties common ate kernel	
keep if _weight ~=. // 保留匹配成功的样本
reghdfe citylabor citylccpost $firmvar2, absorb(city year) vce(cluster city)
				  
// 半径匹配
use "data_city.dta" , clear 
set  seed 0000
gen  norvar_1 = rnormal()
sort norvar_1
global firmvar2 citywage pop pgdp rsc // 定义全局变量firmvar2，就业回归的控制变量					 
psmatch2 citylccpost $firmvar2 , outcome(citylabor) logit  ties common ate caliper(0.05)
keep if _weight ~=. // 保留匹配成功的样本
reghdfe citylabor citylccpost $firmvar2, absorb(city year) vce(cluster city)

						  
*机制分析
clear
use 数据-企业.dta // 未提供企业数据，我用数据-企业进行替换
xtset id year
global firmvar wage size lev ser tax grow roa
// 产出效应
gen 企业产出 = size * roa *0.2 // 没有数据，我随机写的
gen ln高技能 = size * grow *0.1 // 没有数据，我随机写的
gen ln低技能 = size * grow *0.15 // 没有数据，我随机写的

reghdfe 企业产出 lccpost $firmvar, absorb(id year) vce(cluster id)
reghdfe labor 企业产出 $firmvar, absorb(id year) vce(cluster id)
reghdfe ln高技能 企业产出 $firmvar, absorb(id year) vce(cluster id)
reghdfe ln低技能 企业产出 $firmvar, absorb(id year) vce(cluster id)

// 要素替代效应
gen 减排治理投资 = size * tax *0.2 // 没有数据，我随机写的
reghdfe 减排治理投资 lccpost $firmvar, absorb(id year) vce(cluster id)
reghdfe labor 减排治理投资 $firmvar, absorb(id year) vce(cluster id)
reghdfe ln高技能 减排治理投资 $firmvar, absorb(id year) vce(cluster id)
reghdfe ln低技能 减排治理投资 $firmvar, absorb(id year) vce(cluster id)

*异质性分析
clear
use 数据-企业.dta // 未提供企业数据，我用数据-企业进行替换
gen 股权性质编码 = "1" if size > 13 // 没有数据，我随机写的
replace 股权性质编码 = "3" if size < 11.9
replace 股权性质编码 = "2" if 股权性质编码==""
xtset id year
global firmvar wage size lev ser tax grow roa
keep if 股权性质编码=="1" // 保留国有企业的样本
reghdfe labor lccpost $firmvar, absorb(id year) vce(cluster id)

clear
use 数据-企业.dta // 未提供企业数据，我用数据-企业进行替换
gen 股权性质编码 = "1" if size > 13 // 没有数据，我随机写的
replace 股权性质编码 = "3" if size < 11.9
replace 股权性质编码 = "2" if 股权性质编码==""
xtset id year
global firmvar wage size lev ser tax grow roa
keep if 股权性质编码=="2" // 保留民营企业的样本
reghdfe labor lccpost $firmvar, absorb(id year) vce(cluster id)

clear
use 数据-企业.dta // 未提供企业数据，我用数据-企业进行替换
gen 股权性质编码 = "1" if size > 13 // 没有数据，我随机写的
replace 股权性质编码 = "3" if size < 11.9
replace 股权性质编码 = "2" if 股权性质编码==""
xtset id year
global firmvar wage size lev ser tax grow roa
keep if 股权性质编码=="3" // 保留外资企业的样本
reghdfe labor lccpost $firmvar, absorb(id year) vce(cluster id)


clear
use 数据-企业.dta // 未提供企业数据，我用数据-企业进行替换
gen 企业年龄 = 17 if size > 12.6 // 没有数据，我随机写的
replace 企业年龄 = 15 if size <= 12.6
xtset id year
global firmvar wage size lev ser tax grow roa
keep if 企业年龄>=16 // 保留旧企业的样本
reghdfe labor lccpost $firmvar, absorb(id year) vce(cluster id)

clear
use 数据-企业.dta // 未提供企业数据，我用数据-企业进行替换
gen 企业年龄 = 17 if size > 12.6 // 没有数据，我随机写的
replace 企业年龄 = 15 if size <= 12.6
xtset id year
global firmvar wage size lev ser tax grow roa
keep if 企业年龄<16 // 保留新企业的样本
reghdfe labor lccpost $firmvar, absorb(id year) vce(cluster id)


clear
use 数据-企业.dta // 未提供企业数据，我用数据-企业进行替换
gen 产业 = 1 if size > 13 // 没有数据，我随机写的
replace 产业 = 2 if size < 11.9
replace 产业 = 3 if 产业==.
xtset id year
global firmvar wage size lev ser tax grow roa
keep if 产业==1 // 保留第一产业的样本
reghdfe labor lccpost $firmvar, absorb(id year) vce(cluster id)

clear
use 数据-企业.dta // 未提供企业数据，我用数据-企业进行替换
gen 产业 = 1 if size > 13 // 没有数据，我随机写的
replace 产业 = 2 if size < 11.9
replace 产业 = 3 if 产业==.
xtset id year
global firmvar wage size lev ser tax grow roa
keep if 产业==2 // 保留第二产业的样本
reghdfe labor lccpost $firmvar, absorb(id year) vce(cluster id)

clear
use 数据-企业.dta // 未提供企业数据，我用数据-企业进行替换
gen 产业 = 1 if size > 13 // 没有数据，我随机写的
replace 产业 = 2 if size < 11.9
replace 产业 = 3 if 产业==.
xtset id year
global firmvar wage size lev ser tax grow roa
keep if 产业==3 // 保留第三产业的样本
reghdfe labor lccpost $firmvar, absorb(id year) vce(cluster id)

clear
use 数据-企业.dta // 未提供企业数据，我用数据-企业进行替换
gen 高碳行业 = 1 if size > 12.6 // 没有数据，我随机写的
replace 高碳行业 = 0 if size <= 12.6
xtset id year
global firmvar wage size lev ser tax grow roa
keep if 高碳行业==1  // 保留高碳行业的样本
reghdfe labor lccpost $firmvar, absorb(id year) vce(cluster id)

clear
use 数据-企业.dta // 未提供企业数据，我用数据-企业进行替换
gen 高碳行业 = 1 if size > 12.6 // 没有数据，我随机写的
replace 高碳行业 = 0 if size <= 12.6
xtset id year
global firmvar wage size lev ser tax grow roa
keep if 高碳行业==0 // 保留低碳行业的样本
reghdfe labor lccpost $firmvar, absorb(id year) vce(cluster id)

						  