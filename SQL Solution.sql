SELECT * FROM codex.fact_survey_responses;
SELECT * FROM dim_respondents;
SELECT * FROM dim_cities;

# Who prefers energy drink more?
	SELECT Gender,Count(*) as Gender_Count 
	FROM dim_respondents 
	group by Gender
	Order By Gender_Count DESC ;
  
# Which age group prefers energy drinks more?
	SELECT Age,COUNT(*) as Age_Groups
    FROM dim_respondents
    GROUP BY AGE
    ORDER BY Age_Groups DESC;

#Which type of marketing reaches the most Youth (15-30)?
	SELECT f.Marketing_channels,COUNT(*) as Mark_chan
    FROM fact_survey_responses f
    Join dim_respondents r
    On f.Respondent_ID=r.Respondent_ID
    Where r.Age="19-30"
    group by f.Marketing_channels
    Order by Mark_chan DESC;

#What are the preferred ingredients of energy drinks among respondents?
	SELECT Ingredients_expected,COUNT(*) as preferred_ingredient
    FROM fact_survey_responses
    group by Ingredients_expected
    Order by preferred_ingredient DESC;
    
#What packaging preferences do respondents have for energy drinks?
	SELECT Packaging_preference,COUNT(*) as packaging_preferences
    FROM fact_survey_responses
    group by Packaging_preference
    Order by packaging_preferences DESC;

#Who are the current market leaders?
	SELECT Current_brands,COUNT(*) as current_market_leaders
    FROM fact_survey_responses
    group by Current_brands
    Order by current_market_leaders DESC;
    
#What are the primary reasons consumers prefer those brands over ours?
	SELECT Reasons_for_choosing_brands,COUNT(*) as preference_reason
    FROM fact_survey_responses
    group by Reasons_for_choosing_brands
    Order by preference_reason DESC;
    
#Which marketing channel can be used to reach more customers?
	SELECT Marketing_channels,COUNT(*) as marketing_channel
    FROM fact_survey_responses
    group by Marketing_channels
    Order by marketing_channel DESC;

#What do people think about our brand? (overall rating)
	select Brand_perception, count(*) as perception
	from fact_survey_responses
	group by Brand_perception
	order by perception desc;

#Which cities do we need to focus more on?
	SELECT d.City, COUNT(*) AS ResponseCount, d.Tier
FROM dim_cities d
JOIN dim_respondents r ON d.City_ID = r.City_ID
GROUP BY d.City, Tier
ORDER BY ResponseCount;