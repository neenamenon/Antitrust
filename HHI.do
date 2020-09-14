#Looking at the relationship betweeen Herfindahl-Hirschman Index, economic growth and inequality of 40 countries.
encode country, gen(country1)
rename value HHI
label variable HHI "HHI"
xtset country1 year
drop country 
rename country1 country
xtcd growthrate HHI
xtcd gini HHI
pvar growthrate HHI
pvargranger
pvar gini HHI
pvargranger
xtcd growthrate HHI
xtcd gini HHI
pvarsoc growthrate HHI, maxlag(3) pvaropts(instl(1/4))
pvarsoc gini HHI, maxlag(3) pvaropts(instl(1/4))
pvarsoc growthrate HHI, maxlag(4) pvaropts(instl(1/4))
pvar growthrate HHI, lag(3) instl(1/4)
pvar growthrate HHI, lag(3) instl(1/4) gmmstyle
pvar gini HHI, lag(3) instl(1/4)
pvar gini HHI, lag(3) instl(1/4) gmmstyle
drop if year < 1992
xtcd growthrate HHI
pvarsoc growthrate HHI, maxlag(3) pvaropts(instl(1/4))
pvar growthrate HHI, lag(3) instl(1/4)
pvar growthrate HHI, instl(1/4)
pvarsoc gini HHI, maxlag(3) pvaropts(instl(1/4))
pvar gini HHI, instl(1/4) gmmstyle
pvar growthrate HHI, instl(1/4)
pvargranger
pvar gini HHI, instl(1/4) gmmstyle
pvargranger
pvar growthrate HHI, instl(1/4)
pvarstable, graph
