
//论文：《排污权交易制度与能源利用效率》
//复刻人：少了一个菜（xukun）
//评论+关注，邮件发送至：xukun0624vip@163.com 获取代码与数据

*本人自行补充
*附表1 主要变量描述性统计
use "/Users/xukun/Desktop/data/单位GDP能耗（总体数据）.dta",clear

tabstat lngdpenergy lnso2 lngasflow lnenergy lnindgdp erchan lnpgdp lnpeoplemidu lnpatent , statistics( count mean sd min median max ) columns(statistics)

use "/Users/xukun/Desktop/data/绿色全要素能源效率（总体数据）.dta"

tabstat gtfpe lngtfpe, statistics( count mean sd min median max ) columns(statistics)

**附图1 试点和非试点城市单位地区生产总值能耗均值变化

use "/Users/xukun/Desktop/data/单位GDP能耗（总体数据）.dta",clear

generate gdpenergy = exp(lngdpenergy) 

mean gdpenergy if treat ==1, over(year)

mean gdpenergy if treat ==0, over(year)

use "/Users/xukun/Desktop/data/画图.dta",clear

twoway (connected 处理组 年份) (connected 控制组 年份)

**附图2 试点和非试点城市绿色全要素能源效率均值变化
use "/Users/xukun/Desktop/data/绿色全要素能源效率（总体数据）.dta"

mean gtfpe if treat ==1, over(year)

mean gtfpe if treat ==0, over(year)

clear //示例如何导入excel数据 
import excel "/Users/xukun/Desktop/附图2 试点和非试点城市绿色全要素能源效率均值变化.xlsx", sheet("Sheet1") firstrow

twoway (connected 处理组 年份) (connected 控制组 年份)


**表1 排污权交易制度与能源利用效率：DID模型回归结果

use "/Users/xukun/Desktop/data/单位GDP能耗（总体数据）.dta",clear

global control " lnpeoplemidu lnindgdp erchan "

**基础回归1

xtreg lngdpenergy did $control i.year i.year#i.pron,fe r

estimates store m1

**加入政策发生后动态效应1

xtreg lngdpenergy ty08 ty09 ty10 ty11 ty12 ty13 ty14 ty15 ty16 ty17 $control i.year i.year#i.pron,fe r

estimates store m3

use "/Users/xukun/Desktop/data/绿色全要素能源效率（总体数据）.dta",clear

global control " lnpgdp lnenergy lnindgdp lnso2 lnpeoplemidu lninnova"

**基础回归2

qui xtreg gtfpe did $control i.year i.year#i.pron,fe r

estimates store m2

**加入政策发生后动态效应2

xtreg gtfpe ty08 ty09 ty10 ty11 ty12 ty13 ty14 ty15 ty16 ty17 $control i.year i.year#i.pron,fe r

estimates store m4

esttab m1 m2 m3 m4, scalar(r2_w N) compress star(* 0.1 ** 0.05 *** 0.01)b(%6.4f)se(%6.4f) nogaps  


**附图 3 平行趋势检验（a）

use "/Users/xukun/Desktop/data/单位GDP能耗（总体数据）.dta",clear

gen Dyear=year-2008

gen Before3=(Dyear==-3 & treat==1)

lab var Before3 "3 Year Prior"

gen Before2=(Dyear==-2 & treat==1)

lab var Before2 "2 Year Prior"

gen Before1=(Dyear==-1 & treat==1)

lab var Before1 "1 Year Prior"

gen Current=(Dyear==0 & treat==1)

lab var Current "Year of Adoption"

gen After1=(Dyear==1 & treat==1)

lab var After1 "1 Year After"

gen After2=(Dyear==2 & treat==1)

lab var After2 "2 Year After"

gen After3_=(Dyear>=3 & treat==1)

lab var After3_ "3 or More Year After"

xtset cityid year

xtreg lngdpenergy treat post Before3 Before2 Before1 Current After1 After2 After3 i.year i.year#i.pron,fe

est store Dynamic1

coefplot Dynamic1, keep(Before3 Before2 Before1 Current After1 After2 After3_) vertical


**附图 3 平行趋势检验（b）

use "/Users/xukun/Desktop/data/绿色全要素能源效率（总体数据）.dta",clear

gen Dyear=year-2008

gen Before3=(Dyear==-3 & treat==1)

lab var Before3 "3 Year Prior"

gen Before2=(Dyear==-2 & treat==1)

lab var Before2 "2 Year Prior"

gen Before1=(Dyear==-1 & treat==1)

lab var Before1 "1 Year Prior"

gen Current=(Dyear==0 & treat==1)

lab var Current "Year of Adoption"

gen After1=(Dyear==1 & treat==1)

lab var After1 "1 Year After"

gen After2=(Dyear==2 & treat==1)

lab var After2 "2 Year After"

gen After3_=(Dyear>=3 & treat==1)

lab var After3_ "3 or More Year After"

xtset cityid year

xtreg gtfpe treat post Before3 Before2 Before1 Current After1 After2 After3_ i.year i.year#i.pron,fe

est store Dynamic2

coefplot Dynamic2, keep(Before3 Before2 Before1 Current After1 After2 After3_) vertical


**附表2：剔除能源政策影响-单位GDP能耗（剔除能源政策影响）

use "/Users/xukun/Desktop/data/单位GDP能耗（剔除能源政策影响）.dta", clear

xtset cityid year

global control" lnpeoplemidu lnindgdp erchan "

set seed 10101

gen ranorder = runiform()

sort ranorder

psmatch2 treat $control,outcome( lngdpenergy ) radius cal(0.0001) logit

pstest $control,both graph

qui xtreg lngdpenergy did $control i.year#i.pron if _support==1,fe

estimates store m5

**附表2：剔除能源政策的影响-绿色全要素能源效率（剔除能源政策影响）

use "/Users/xukun/Desktop/data/绿色全要素能源效率（剔除能源政策影响）.dta", clear

xtset cityid year

global control " lnpgdp lnenergy lnindgdp lnso2 lnpeoplemidu lninnova"

set seed 10101

gen ranorder = runiform()

sort ranorder

psmatch2 treat $control,outcome(gtfpe) radius cal(0.0001) logit

pstest $control,both graph

qui xtreg gtfpe did $control i.year#i.pron if _support==1,fe

estimates store m6

esttab m5 m6, scalar(r2_w N) compress star(* 0.1 ** 0.05 *** 0.01)b(%6.4f)se(%6.4f) nogaps


** 表2 排污权交易制度与能源利用效率：工具变量估计-克服内生性问题

use "/Users/xukun/Desktop/data/单位GDP能耗（总体数据）.dta",clear

xtset cityid year

global control " lnpeoplemidu lnindgdp erchan "

xtreg did ivpost $control i.year,fe

estimates store m7

xtivreg lngdpenergy $control i.year (did=ivpost) ,fe

estimates store m9

** 表2 排污权交易制度与能源利用效率：工具变量估计-克服内生性问题

use "/Users/xukun/Desktop/data/绿色全要素能源效率（总体数据）.dta",clear

xtset cityid year

global control " lnpgdp lnenergy lnindgdp lnso2 lnpeoplemidu lninnova"

xtreg did ivpost $control,fe

estimates store m8

xtivreg gtfpe $control (did=ivpost) ,fe

estimates store m10

esttab m7 m8 m9 m10, scalar(r2_w N) compress star(* 0.1 ** 0.05 *** 0.01)b(%6.4f)se(%6.4f) nogaps

**附图 4：安慰剂检验

forvalue i=1/1000{

use "/Users/xukun/Desktop/data/单位GDP能耗（总体数据）.dta", clear

g obs_id= _n

gen random_digit= runiform()

sort random_digit

g random_id= _n

preserve

keep random_id did

rename did random_did

rename random_id id

label var id

save random_did, replace

restore

drop random_digit random_id did

rename obs_id id

label var id

save rawdata, replace

use rawdata, clear

merge 1:1 id using random_did,nogen

reg lngdpenergy random_did lnindgdp erchan lnpeoplemidu

g _b_random_did= _b[random_did]

g _se_random_did= _se[random_did]

keep _b_random_did _se_random_did

duplicates drop _b_random_did, force

save placebo`i', replace

}
use placebo1, clear

forvalue i=2/1000{

append using placebo`i'

}
gen tvalue= _b_random_did/ _se_random_did

kdensity tvalue, xtitle("t 值") ytitle("分布") saving(placebo_test1)

*-删除临时文件

forvalue i=1/1000{

erase placebo`i'.dta

}

**附图 4： 安慰剂检验2

forvalue i=1/1000{

use "/Users/xukun/Desktop/data/绿色全要素能源效率（总体数据）.dta", clear

g obs_id= _n

gen random_digit= runiform()

sort random_digit

g random_id= _n

preserve

keep random_id did

rename did random_did

rename random_id id

label var id

save random_did, replace

restore

drop random_digit random_id did

rename obs_id id

label var id

save rawdata, replace

use rawdata, clear

merge 1:1 id using random_did,nogen

reg gtfpe random_did lnpgdp lnenergy lnindgdp lnso2 lnpeoplemidu lninnova

g _b_random_did= _b[random_did]

g _se_random_did= _se[random_did]

keep _b_random_did _se_random_did

duplicates drop _b_random_did, force

save placebo`i', replace

}

use placebo1, clear

forvalue i=2/1000{

append using placebo`i'

}
gen tvalue= _b_random_did/ _se_random_did

kdensity tvalue, xtitle("t 值") ytitle("分布") saving(placebo_test2)

*-删除临时文件

forvalue i=1/1000{

erase placebo`i'.dta

}

**附表 3： 改变排污权交易制度观测窗宽的稳健性检验结果：动态时间窗1

use "/Users/xukun/Desktop/data/单位GDP能耗1年.dta",clear

qui xtreg lngdpenergy did i.year i.year#i.pron,fe r

estimates store k1

use "/Users/xukun/Desktop/data/单位GDP能耗2年.dta",clear

qui xtreg lngdpenergy did i.year i.year#i.pron,fe r

estimates store k2

use "/Users/xukun/Desktop/data/单位GDP能耗3年.dta",clear

qui xtreg lngdpenergy did i.year i.year#i.pron,fe r

estimates store k3

use "/Users/xukun/Desktop/data/单位GDP能耗4年.dta",clear

qui xtreg lngdpenergy did i.year i.year#i.pron,fe r

estimates store k4

**附表 3： 改变排污权交易制度观测窗宽的稳健性检验结果：反事实检验1

use "/Users/xukun/Desktop/data/单位GDP能耗2005年为假设开始年.dta",clear

qui xtreg lngdpenergy did i.year i.year#i.pron,fe r

estimates store k5

use "/Users/xukun/Desktop/data/单位GDP能耗2006年为假设开始年.dta",clear

qui xtreg lngdpenergy did i.year i.year#i.pron,fe r

estimates store k6

esttab k1 k2 k3 k4 k5 k6, scalar(r2_w N) compress star(* 0.1 ** 0.05 *** 0.01)b(%6.4f)se(%6.4f) nogaps

****附表 3： 改变排污权交易制度观测窗宽的稳健性检验结果：动态时间窗2

use "/Users/xukun/Desktop/data/绿色全要素能源效率1年.dta",clear

qui xtreg gtfpe did i.year i.year#i.pron,fe r

estimates store k11

use "/Users/xukun/Desktop/data/绿色全要素能源效率2年.dta",clear

qui xtreg gtfpe did i.year i.year#i.pron,fe r

estimates store k22

use "/Users/xukun/Desktop/data/绿色全要素能源效率3年.dta",clear

qui xtreg gtfpe did i.year i.year#i.pron,fe r

estimates store k33

use "/Users/xukun/Desktop/data/绿色全要素能源效率4年.dta",clear

qui xtreg gtfpe did i.year i.year#i.pron,fe r

estimates store k44

**附表 3： 改变排污权交易制度观测窗宽的稳健性检验结果：反事实检验2

use "/Users/xukun/Desktop/data/绿色全要素能源效率2005年为假设开始年.dta",clear

qui xtreg gtfpe did i.year i.year#i.pron,fe r

estimates store k55

use "/Users/xukun/Desktop/data/绿色全要素能源效率2006年为假设开始年.dta",clear

qui xtreg gtfpe did i.year i.year#i.pron,fe r

estimates store k66

esttab k11 k22 k33 k44 k55 k66 , scalar(r2_w N) compress star(* 0.1 ** 0.05 *** 0.01)b(%6.4f)se(%6.4f) nogaps


**附表 4： 排污权交易制度与能源利用效率： PSM-DID 模型估计1

use "/Users/xukun/Desktop/data/单位GDP能耗（总体数据）.dta", clear

global control " lnpeoplemidu lnindgdp erchan "

set seed 10101

gen ranorder = runiform()

sort ranorder

psmatch2 treat $control,outcome( lngdpenergy ) radius cal(0.0001) logit

pstest $control,both graph

qui xtreg lngdpenergy did $control i.year i.year#i.pron if _support==1,fe r

estimates store ps1

**附表 4： 排污权交易制度与能源利用效率： PSM-DID 模型估计2

use "/Users/xukun/Desktop/data/绿色全要素能源效率（总体数据）.dta", clear

global control " lnpgdp lnenergy lnindgdp lnso2"

set seed 10101

gen ranorder = runiform()

sort ranorder

psmatch2 treat $control,outcome( gtfpe ) radius cal(0.0001) logit

pstest $control,both graph

qui xtreg gtfpe did $control i.year i.year#i.pron if _support==1,fe r

estimates store ps2

esttab ps1 ps2, scalar(r2_w N) compress star(* 0.1 ** 0.05 *** 0.01)b(%6.4f)se(%6.4f) nogaps


**附表 5： 稳健性检验：剔除其他政策的干扰1

use "/Users/xukun/Desktop/data/单位GDP能耗（总体数据）.dta", clear

xtset cityid year

global control " lnpeoplemidu lnindgdp erchan "

drop if year==2013

drop if year==2014

drop if year==2015

drop if year==2016

drop if year==2017

qui xtreg lngdpenergy did $control i.year i.year#i.pron,fe r

estimates store q1

**附表 5： 稳健性检验：剔除其他政策的干扰2

use "/Users/xukun/Desktop/data/绿色全要素能源效率（总体数据）.dta", clear

xtset cityid year

global control " lnenergy lnindgdp lnso2 lnpeoplemidu lninnova"

drop if year==2013

drop if year==2014

drop if year==2015

drop if year==2016

drop if year==2017

qui xtreg gtfpe did $control i.year i.year#i.pron,fe r

estimates store q2

esttab q1 q2, scalar(r2_w N) compress star(* 0.1 ** 0.05 *** 0.01)b(%6.4f)se(%6.4f) nogaps


**附表 6： 排污权交易制度与能源利用效率：三重差分模型估计1

use "/Users/xukun/Desktop/data/单位GDP能耗（总体数据）.dta", clear

xtset cityid year

global control " lnpeoplemidu lnindgdp erchan "

qui xtreg lngdpenergy ddd $control i.year i.year#i.pron,fe r

estimates store s1

**附表 6： 排污权交易制度与能源利用效率：三重差分模型估计2

use "/Users/xukun/Desktop/data/绿色全要素能源效率（总体数据）.dta", clear

xtset cityid year

global control " lnpgdp lnenergy lnindgdp lnso2 lnpeoplemidu lninnova"

qui xtreg lngtfpe ddd $control i.year i.year#i.pron,fe r

estimates store s2

esttab s1 s2, scalar(r2_w N) compress star(* 0.1 ** 0.05 *** 0.01)b(%6.4f)se(%6.4f) nogaps

**表3 影响机制验证：市场化与绿色创新视角

use "/Users/xukun/Desktop/data/单位GDP能耗（影响机制验证）.dta",clear

global control " erchan lnindgdp lnpeoplemidu "

regress lngdpenergy didmarket lnmarket $control i.year, vce(robust)

estimates store y1

regress lngdpenergy didgoven lngovner $control i.year, vce(robust)

estimates store y2

regress lngdpenergy didgactor lngactor $control i.year, vce(robust)

estimates store y3

**表3 影响机制验证：市场化与绿色创新视角2

use "/Users/xukun/Desktop/data/绿色全要素能源效率（总体数据）.dta", clear

global control " lnpgdp lnenergy lnindgdp lnso2 lnpeoplemidu lninnova"

gen didpatent=did*lnpatent

regress gtfpe treat post didpatent $control i.year, vce(robust)

estimates store y4

gen didgii =did*gii

regress gtfpe didgii $control i.year, vce(robust)

estimates store y5

esttab y1 y2 y3 y4 y5, scalar(r2_w N) compress star(* 0.1 ** 0.05 *** 0.01)b(%6.4f)se(%6.4f) nogaps

**表4 排污权交易制度对城市能源利用效率影响的异质性：单位 GDP 能耗视角

**1.0总体

use "/Users/xukun/Desktop/data/资源型城市单位GDP能耗（总体）.dta",clear

xtset cityid year

global control " lnpeoplemidu lnindgdp erchan "

set seed 10101

gen ranorder = runiform()

sort ranorder

psmatch2 treat $control,outcome(lngdpenergy) radius cal(0.0001) logit

pstest $control,both graph

qui xtreg lngdpenergy did $control i.year if _support==1,fe r

estimates store z0

**1.1成长

use "/Users/xukun/Desktop/data/资源型城市单位GDP能耗（成长型）.dta", clear

xtset cityid year

global control " lnpeoplemidu lnindgdp erchan "

qui xtreg lngdpenergy did $control i.year,fe r

estimates store z1

**1.2成熟

use "/Users/xukun/Desktop/data/资源型城市单位GDP能耗（成熟型）.dta", clear

xtset cityid year

global control " lnpeoplemidu lnindgdp erchan "

qui xtreg lngdpenergy did $control i.year,fe r

estimates store z2

**1.3衰退

use "/Users/xukun/Desktop/data/资源型城市单位GDP能耗（衰退型）.dta", clear

xtset cityid year

global control " lnpeoplemidu lnindgdp erchan "

qui xtreg lngdpenergy did $control i.year i.year#i.pron,fe r

estimates store z3

**1.4再生

use "/Users/xukun/Desktop/data/资源型城市单位GDP能耗（再生型）.dta",clear

xtset cityid year

global control " lnpeoplemidu lnindgdp erchan "

qui xtreg lngdpenergy did $control i.year,fe r

estimates store z4

esttab z0 z1 z2 z3 z4 , scalar(r2_w N) compress star(* 0.1 ** 0.05 *** 0.01)b(%6.4f)se(%6.4f) nogaps


**表5 排污权交易制度对城市能源利用效率影响的异质性：绿色全要素能源效率视角

**2.0总体

use "/Users/xukun/Desktop/data/资源型城市绿色全要素能源效率（总体）.dta",clear

xtset cityid year

global control " lnpgdp lnenergy lnindgdp lnso2 lnpeoplemidu lninnova"

qui xi: regress gtfpe treat post did $control i.year, vce(robust)

estimates store zz0

**2.1成长

use "/Users/xukun/Desktop/data/资源型城市绿色全要素能源效率（成长型）.dta",clear

xtset cityid year

global control " lnpgdp lnenergy lnindgdp lnso2 lnpeoplemidu lninnova"

qui xi: regress gtfpe treat post did $control i.year, vce(robust)

estimates store zz1

**2.2成熟

use "/Users/xukun/Desktop/data/资源型城市绿色全要素能源效率（成熟型）.dta",clear

xtset cityid year

global control " lnpgdp lnenergy lnindgdp lnso2 lnpeoplemidu lninnova"

qui xi: regress gtfpe treat post did $control i.year, vce(robust)

estimates store zz2

**2.3衰退

use "/Users/xukun/Desktop/data/资源型城市绿色全要素能源效率（衰退型）.dta",clear

xtset cityid year

global control " lnpgdp lnenergy lnindgdp lnso2 lnpeoplemidu lninnova"

qui xi: regress gtfpe treat post did $control i.year, vce(robust)

estimates store zz3

**2.4再生

use "/Users/xukun/Desktop/data/资源型城市绿色全要素能源效率（再生型）.dta",clear

xtset cityid year

global control " lnpgdp lnenergy lnindgdp lnso2 lnpeoplemidu lninnova"

qui xi: regress gtfpe treat post did $control i.year, vce(robust)

estimates store zz4

esttab zz0 zz1 zz2 zz3 zz4 , scalar(r2_w N) compress star(* 0.1 ** 0.05 *** 0.01)b(%6.4f)se(%6.4f) nogaps


**表 6：工业基地类型视角

**老工业1

use "/Users/xukun/Desktop/data/老工业基地单位GDP能耗.dta",clear

xtset cityid year

global control " lnpeoplemidu lnindgdp erchan "

set seed 10101

gen ranorder = runiform()

sort ranorder

psmatch2 treat $control,outcome( lngdpenergy ) radius cal(0.0001) logit

pstest $control,both graph

qui xtreg lngdpenergy did $control i.year i.year#i.pron if _support==1,fe r

estimates store l1

**非老工业1

use "/Users/xukun/Desktop/data/非老工业基地单位GDP能耗.dta", clear

xtset cityid year

global control " lnpeoplemidu lnindgdp erchan "

set seed 10101

gen ranorder = runiform()

sort ranorder

psmatch2 treat $control,outcome( lngdpenergy ) radius cal(0.0001) logit

pstest $control,both graph

qui xtreg lngdpenergy did $control i.year i.year#i.pron if _support==1,fe r

estimates store l2

**老工业2

use "/Users/xukun/Desktop/data/老工业基地绿色全要素能源效率.dta", clear

xtset cityid year

global control " lnpgdp lnindgdp lnso2 lninnova"

qui xtreg gtfpe did $control i.year i.year#i.pron,fe r

estimates store l3

**非老工业2

use "/Users/xukun/Desktop/data/非老工业基地绿色全要素能源效率.dta", clear

xtset cityid year

global control " lnpgdp lnindgdp lnso2 lninnova"

qui xtreg gtfpe did $control i.year i.year#i.pron,fe r

estimates store l4

esttab l1 l2 l3 l4, scalar(r2_w N) compress star(* 0.1 ** 0.05 *** 0.01)b(%6.4f)se(%6.4f) nogaps

