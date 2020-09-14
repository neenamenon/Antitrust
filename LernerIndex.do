rename value HHI
encode country, gen(country1)
replace lernerindex = 0 if (lernerindex >= .)
drop if lernerindex == 0
corr lernerindex growthrate
twoway scatter growthrate lernerindex || lfit growthrate lernerindex
corr lernerindex gini
twoway scatter growthrate gini || lfit growthrate gini
twoway scatter gini lernerindex || lfit gini lernerindex
encode year, gen(year1)
recast int year1
xtset country1 year1
xtcd growthrate lernerindex
xtcd gini lernerindex
xtcd growthrate lernerindex
pvarsoc growthrate lernerindex
pvarsoc growthrate lernerindex, maxlag(3) pvaropts(instl(1/4))
pvarsoc gini lernerindex, maxlag(3) pvaropts(instl(1/4))
pvar growthrate lernerindex, instl(1/4)
pvargranger
pvar gini lernerindex, instl(1/4)
pvargranger
pvar growthrate lernerindex, instl(1/4) gmmstyle
pvar gini lernerindex, lag(2) instl(1/4)
pvar gini lernerindex, lag(2) instl(1/4) gmmstyle
pvarstable
pvar growthrate lernerindex, instl(1/4)
pvarstable