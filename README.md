# Impact Assessment of US Withdrawl from Paris Agreement and Shale Revolution

## Table of Contents
┌--**0. Abstract**<br>
│--**1. Introduction**<br>
│--**2. Literature Review**<br>
│--**3. Data**<br>
│--**4. Method**<br>
│--**5. Results**<br>
│---- **5-1. Paris Agreement**<br>
│---- **5-2. Shale Revolution**<br>
│--**6. Discussion**<br>
└--**7. References**<br>

## 0. Abstract
International agreements like the Paris Climate Accords are potentially one of the most important tools in our arsenal to combat the effects of anthropogenic climate change. In this paper we attempt to determine the actual importance of the agreement by estimating the change in oil production following President Trump’s decision to withdraw the U.S. from the agreement in 2017. If the agreement is an effective measure, we should see no significant difference between the trends in oil production in the U.S. and other countries. We use the synthetic control method to estimate the effects of the U.S. leaving the Accords. Results indicate that, following the exit from the Accords, domestic oil production increased dramatically relative to a synthetic counterfactual. Production of oil roughly doubled between 2017 and 2020. This result was found to be robust to a placebo test. 

## 1. Introduction 
The Paris Climate Agreement of 2015, which is a successor to the Kyoto Protocol of 1997, is an agreement signed between one hundred and ninety-five parties, the goal of which is to limit the rise in global average temperature to below 2 °C, a limit which scientists consider necessary to prevent many of the catastrophic consequences of climate change. It aims to do this by reducing the emissions of all greenhouse gases by its member countries. The agreement is binding and requires each country to determine how much to reduce its emissions by, and then meet that goal through changes in their domestic policy. No central body can compel a country to set a specific emissions target, but they can pursue legal action and punish them for failing to do so. 
<br><br>The United States joined the Paris agreement in 2016. In 2017, President Trump announced that he would withdraw the U.S. from the Accords on the pretext that it would ‘undermine’ the nation’s economy, and the withdrawal officially came into effect on November 4, 2020. With the inauguration of Joe Biden as president in 2021, the U.S. rejoined the Paris Agreement. We seek to know the effect of President Trump’s 2017 announcement on the production of oil in the U.S. We found little to no study done on this specific subject, so we believe our research topic is unique.
<br><br>The hypothesis we will test is whether oil production in the U.S. is different from oil production in a basket of other countries that all produce oil, and all decided to remain in the Paris Agreement. If President Trump’s announcement had a significant effect on the behavior of domestic oil producers, then U.S. oil production would have increased relative to that of the other countries in our sample. To estimate this effect, we use the synthetic control method, which is explained more thoroughly below. The general idea behind synthetic control is that using only one control to test the treatment may be problematic if the treatment and the control differ greatly in their characteristics. With synthetic control, we create a counterfactual by taking a weighted average of many different control countries to create a ‘synthetic U.S.’ that is as similar as possible to the U.S. in its characteristics, which eliminates this problem. 

## 2. Literature Review
Synthetic control dates back to the late 2000s and has been used to investigate the effect of policy interventions on dependent variables many times since then. Our study in particular is interested in the use of synthetic control to study the effects of green-energy/climate mitigation/emissions reduction programs on oil/coal/gas prices, oil/coal/gas production, emissions of greenhouse gasses, and the usage of green energy and other renewable energy sources. Synthetic control has in the past been used to study the effects of cap-and-trade schemes on coal-to-gas switching in the U.S. Northeast (Kim et al. 2016), the effects of tendering on the addition of renewable energy capacity (Bento et al. 2020), and the effects of a Shanxi emissions trading scheme on emissions of dust and soot (Cheng et al. 2019).
<br><br>However, the closest papers to ours are (Steinkraus 2019) and (Almer et al. 2012). The former investigates the impact of a greenhouse gas action plan on coal production in four U.S. states that produce coal, and the latter investigates the impact of the Kyoto Protocol’s binding emissions targets on the actual CO2 emissions of seven developed nations. So we have prior studies investigating the impact of emissions reduction schemes on oil, gas, or coal prices and investigating the impact of a worldwide binding emissions reduction agreement very similar to the Paris Agreement on emissions. We feel that our paper, which investigates the impact of a worldwide binding emissions reduction agreement on oil production in the U.S., is a very natural and logical extension of the existing literature. 

## 3. Data
We used annual national-level data for the period of 1998-2021 (24 years). We picked G20 nations since we preferred our nations to have two traits: they must be part of the Paris Agreement and must have the capability to produce some amount of oil. Sixteen G20 nations’ data are used as a control group and are synthesized, which we will later discuss in depth under our method section. The data includes their yearly averages of oil production, in units of one thousand barrels per day -  which is the common yearly measurement you could find on the web. GDP per capita, population, the annual percentage change of a consumer price index (yearly inflation rate), natural gas production, and renewable energy consumption percentage (% of total final energy consumption) are also measured.
<br><br>The sixteen countries are Australia, Brazil, Canada, France, India, Indonesia, Iraq, Italy, Japan, Mexico, Russia, Saudi Arabia, South Africa, Turkey, the United Kingdom, and the United States. We excluded Germany and South Korea since they do not have the capability to produce oil by themselves. No inflation data on the world bank database was found for Argentina, so we did not count it as well. The four largest oil producers (U.S., Russia, Saudi Arabia, and Canada) were all included in G20, but the fifth largest producer, Iraq, was not. We collected data on Iraq as well to make our control group a bit more diverse. EU is also represented in the G20 but is not included in our dataset as it would have been redundant if included - since France, Italy, Germany, and the UK are already in the G20.
<br><br>We collected GDP per capita, population, inflation rate, and renewable energy percentage from the World Bank’s database. Our hope was that the GDP per capita and population would give us a general measure of each nation’s economic scale and strength. The inflation rate adds a bit more time-related data as constant inflation is usually a trait found in most developed nations, whereas deflation is usually confronted by nations that are still developing.
<br><br>Other energy-related data we collected were yearly natural gas production (dry natural gas production in billion cubic feet) and our most important dataset: yearly oil production. We obtained both datasets from the U.S. Energy Information Administration (EIA). We merged all of those data from EIA and the World Bank into one Excel spreadsheet, ready to import into our R code.

## 4. Method
In our research, we aimed to find the effects of Trump’s withdrawal from the Paris Agreement. The synthetic control method that we learned during class is efficient in evaluating the effect of an intervention in comparative case studies. We decided that building a synthetic United States will help us better understand the effect of withdrawal. It will show us what the oil production of the U.S. would have been if the U.S. had never withdrawn from the Paris Agreement in 2017. Our synthetic U.S. exists in a world where Trump never announced the withdrawal from the climate accords. By using a donor pool of fifteen G20 nations plus Iraq, we should be able to produce the designated synthetic dataset.
<br><br>Our output would be the U.S.’s oil production (yearly average, in units of thousand barrels per day). Our first covariate is the GDP per capita, which is a general measurement of the average living standard of a country. While there are many other living standard indicators, GDP per capita is the most prominent indicator and thus easily obtainable for most countries. The second covariate is the population, which gives us the economic scale of each nation’s market. The third covariate is the inflation rate, which is the yearly percentage change in the consumer price index. We believe it is another great indicator of each nation’s economy’s history. Renewable energy percentage and natural gas production are the fourth and fifth covariates that add details to what each nation is doing in terms of energy consumption.
<br><br>We used the tidysynth package in R, which generates synthetic controls, placebo tests, and shows weights of each individual used in our donor pool. It automatically generates the synthetic control using the most optimal weights. After downloading all the necessary datasets, we merged them into one spreadsheet. We imported this to our tidysynth function to create our synthetic control, using our donor pool of sixteen nations.

## 5. Result
## 5-1. Paris Agreement
We used our data and tried to make the synthetic United States find the effect of Trump's withdrawal from the Paris Agreement in 2017. Figure 1 shows a steep increase in oil production per day after the period that President Donald Trump announced withdrawal from the Paris Agreement. However, the graph also indicates that other factors might affect the United States' oil production between 2012 and 2013. Figure 2 displays the differences between observed data and synthetic data. The ideal graph needs to move around 0, but our graph moves far from 0 and shows a steep increase before 2017. Therefore, our synthetic United States could have some limitations in predicting actual controlled United States oil production if President Trump did not announce the withdrawal of the Paris Agreement.<br>
<p align="center">
<img src="https://user-images.githubusercontent.com/79275984/221070339-0898ffc0-cf06-4e94-abbb-81efb56910ed.png" width="500">

<br><p align="center">**<Figure 1> Observed oil production and synthetic oil production**<br><br>

<p align="center">
<img src="https://user-images.githubusercontent.com/79275984/221071096-1c9a05f4-6dc2-40f8-9617-c6dae0065140.png" width="500">

<br><p align="center">**<Figure 2> Difference between synthetic control and observed oil production**<br><br><br>

Table 1 indicates how much each country is weighted to make a control unit and which variables are used to make the control unit’s data. Iraq (weight = 0.51), Saudi Arabia (weight = 0.32), and Russia (weight =0.17)  are the top 3 countries that are used to make the control unit, and 2010 oil production (weight = 0.54) is the most weighted variable to make oil production data of the control unit. Table 2 shows the mean values of each covariate of synthetic United States and observed United States. The mean values of each covariate of the Donor sample are distinguished from observed United States data. 

<p align="center">
<img src="https://user-images.githubusercontent.com/79275984/221071335-cfbecd30-8acd-4b21-bf1b-a48c237e6b55.png" width="380">

<br><p align="center">**<Table 1> Weights of each country**<br><br><br>

<p align="center">
<img src="https://user-images.githubusercontent.com/79275984/221071530-350697f8-90e8-4cee-a309-feb2588d6855.png" width="430"><br>

<br><p align="center">**<Table 2> Balance table, Paris Agreement**<br><br><br>
The announcement of withdrawal from the Paris Agreement significantly affected the United States' oil production after 2017. We tried the placebo check to determine whether this increase was due to the withdrawal of the Paris Agreement. Figure 3 indicates the placebo check of the effect of the withdrawal announcement on U.S. oil production. The U.S. oil production increased after 2017, but other control units were located around 0. Also, the United States Mean Squared Predictive Error (MSPE) ratio is much higher than other countries in Figure 5. The MSPE ratio of the United States is 14.85. Other countries' MSPE ratios are between 0 to 5. These results indicate a significant effect of the withdrawal on U.S. oil production.

<p align="center">
<img src="https://user-images.githubusercontent.com/79275984/221071909-de853bf3-436d-4e3e-a201-8570570a0675.png" width="500"><br>

<br><p align="center">**<Figure 3> Placebo check**<br><br><br>

<p align="center">
<img src="https://user-images.githubusercontent.com/79275984/221071778-68d21a72-7664-43a2-986d-cfeea034bef9.png" width="700"><br>

<br><p align="center">**<Table 3> Donor pool significance table**<br><br><br>

## 5-2. Shale Revolution
Before the United States withdrew from the Paris Agreement, figure 1 shows that the United States' oil production increased between 2010 and 2015. We were curious about this increase and found that the Shale revolution happened in 2010. Also, the Shale revolution first started in the United States. Other countries had different technical improvements than the United States. Therefore, we used synthetic control to check the effect of the Shale revolution on the United States' oil production. As shown in figure 5, two graphs are closely located before 2010 and observed data significantly increased after 2010. Figure 6 also indicates that the difference between observed and synthetic United States is close to 0 and increases after 2010. This graph suggests that the Shale revolution affected U.S. oil production.

 
<Figure 4> Observed United States oil production and Controlled United State oil production

 
<Figure 5> Difference between observed data and synthetic controlled data

<br><br>In this second study, the United Kingdom (weight = 0.58) and South Africa (weight = 0.42) are two countries mainly weighted to make synthetic United States. The oil production in 2000 (weight = 0.41) is the most weighted variable. Using the weighting values in Table 4, we made the synthetic United States in Table 5. Some covariates of the donor sample are distinguished from synthetic United States covariates.

 
<Table 4> Weights of each country

 
<Table 5> Balance table, Shale revolution
We did a placebo test to check that the Shale revolution affected the United States' oil production. Figure 6 shows that U.S. oil production increased much higher than other control units after 2010. There is a country where the oil production level increased after 2010. However, most control units’ graphs are around zero and below zero. We conclude that the Shale revolution in the U.S. significantly affected the U.S. oil production level after 2010. 
Furthermore, the MSPE ratio of the U.S. (MSPE = 101.18) is much higher than other countries. This MSPE value indicated that the Shale revolution affected U.S. oil production. The second highest country is South Africa (MSPE = 62.57). However, Table 6 indicates that there are no countries where Fisher’s exact P-value is less than a 5% significance level. Even though Saudi Arabia shows a high MSPE value, the U.S. MSPE is much higher than its value. Donor pool data in table 6 shows no countries in which Fisher’s exact p-value is less than a 5% significance level.

 
<Figure 6> Placebo check

 
<Table 6> Donor pool table, Shale revolution

## 6. Discussion
When we set our treatment period to when Trump declared withdrawal from the Paris Agreement (2017), our synthetic control did not show the most ideal results. As seen in Figure 2, differences between observed data and synthetic controlled data were not near zero. However, the placebo test and MSPE results suggested that the withdrawal from the Paris agreement affected the United States' oil production level. Oil production level started to increase in 2010. We found the Shale revolution happened in the U.S. in 2010. So, resetting our treatment period to the Shale revolution (2010), we got a more ideally looking graph. The revised difference graph is seen in Figure 7, and the lines are closer to zero. Our revised synthetic control also exhibited better placebo test results (see Figures 4 and 9), where we can see much straighter lines on the revised version’s placebo test graph. Therefore, we conclude that both events significantly increased the United States' oil production.
<br><br>From this comparison, we learned that the Shale revolution might have had a more significant effect on the U.S. oil production levels. By looking at Figures 3 and 4, we see a spike in oil production after 2010. The difference between the synthetic and observed oil production is large between periods 2005-2010 and 2010-2015. We suspect that the 2010 Shale revolution may be the main cause of the trend change. A much flatter difference graph trend in Figure 6 suggests that the Shale revolution has a greater impact on U.S. oil production.
<br><br>During our analysis, we also ran into a couple of limitations. First, because the U.S. holds very unique characteristics out of the 16 nations, it itself is the biggest outlier. Both in terms of economic size (GDP per capita) and oil production, there is no nation like the U.S. that holds quite the characteristics. What is more important is the fact that the U.S. is the largest oil producer in the world already makes our synthetic control method unproductive. Since they produce the most amount of oil, it is almost impossible to reproduce the synthetic U.S. As we could see in table2 and table5, donor sample oil production data is significantly distinguished from synthetic U.S. oil production data. These differences indicate that our sample could not be effectively used to make synthetic U.S. oil production data.
<br><br>Secondly, we had limited data. Our data sources (World Bank and the EIA) had some missing data such as renewable energy from 2020 to 2021. We also trimmed away data before 1998 since there were some countries that were missing some of the covariate data. We also had a handful of countries to replicate the synthetic U.S., but we think it could have been the same even if we had more nations on our list. Chances are, even with more nations, the synthetic U.S. would have had no weights on the added small nations.
<br><br>Third, the Paris Agreement only started recently. It was 2015 when the United Nations’ Climate Change Conference decided to initiate the climate accords.It was officially signed in 2016. Trump announced the withdrawal in 2017. So, there is only a year or two that the U.S. experienced the effects of the Paris Agreement. Also, the U.S. officially withdrew from the Paris Agreement in 2020, and President Biden resigned the Paris Agreement a year later. So, the actual period of withdrawal was just a year. We believe that this situation may be too short to realize any significant effects of the agreement.


 
# 7. References
Kim, Man-Keun, and Taehoo Kim. “Estimating Impact of Regional Greenhouse Gas Initiative on Coal to Gas Switching Using Synthetic Control Methods.” Energy Economics, vol. 59, 2016, pp. 328–335., https://doi.org/10.1016/j.eneco.2016.08.019. 
<br><br>Bento, Nuno, et al. “Market-Pull Policies to Promote Renewable Energy: A Quantitative Assessment of Tendering Implementation.” Journal of Cleaner Production, vol. 248, 2020, p. 119209., https://doi.org/10.1016/j.jclepro.2019.119209. 
<br><br>Almer, Christian, and Ralph Winkler. “The Effect of Kyoto Emission Targets on Domestic CO2 Emissions: A Synthetic Control Approach.” SSRN Electronic Journal, 2012, https://doi.org/10.2139/ssrn.1752282. 
<br><br>Cheng, Xiao, et al. “Effect of Shanxi Pilot Emission Trading Scheme on Industrial Soot and Dust Emissions: A Synthetic Control Method.” Energy & Environment, vol. 31, no. 3, 2019, pp. 461–478., https://doi.org/10.1177/0958305x19876682.
<br><br>Council on Foreign Relations. (n.d.). Timeline: Oil dependence and U.S. foreign policy. Council on Foreign Relations. Retrieved December 12, 2022, from https://www.cfr.org/timeline/oil-dependence-and-us-foreign-policy 
<br><br>Council on Foreign Relations. (2013, October 15). The Shale Gas and tight oil boom. Council on Foreign Relations. Retrieved December 12, 2022, from https://www.cfr.org/report/shale-gas-and-tight-oil-boom
<br><br>Steinkraus, Arne. “A Synthetic Control Assessment of the Green Paradox: The Role of Climate Action Plans.” German Economic Review, vol. 20, no. 4, 2019, https://doi.org/10.1111/geer.12176. 
<br><br>U.S. Energy Information Administration (EIA). (n.d.). Oil and petroleum products explained. Independent Statistics and Analysis. Retrieved December 11, 2022, from https://www.eia.gov/energyexplained/oil-and-petroleum-products/where-our-oil-comes-from.php 
<br><br>World Bank. (n.d.). GDP per capita (current US$). The World Bank Data. Retrieved December 11, 2022, from https://data.worldbank.org/indicator/NY.GDP.PCAP.CD
<br><br>World Bank. (n.d.). Inflation, consumer prices (annual %). The World Bank Data. Retrieved December 11, 2022, from https://data.worldbank.org/indicator/FP.CPI.TOTL.ZG
<br><br>World Bank. (n.d.). Population, total. The World Bank Data. Retrieved December 11, 2022, from https://data.worldbank.org/indicator/SP.POP.TOTL
<br><br>World Bank. (n.d.). Renewable energy consumption (% of total final energy consumption). The World Bank Data. Retrieved December 11, 2022, from https://data.worldbank.org/indicator/EG.FEC.RNEW.ZS 
<br><br>R-Project. (n.d.). Tidysynth Readme. Tidysynth. Retrieved December 11, 2022, from https://cran.r-project.org/web/packages/tidysynth/readme/README.html 

