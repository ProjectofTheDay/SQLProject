--The data is from https://ourworldindata.org/covid-deaths

--Look up what kind of info (column) the data has
Select *
From CovidProject..CovidDeaths
Order by 3,4


-- To get the deaths percentage in Indonesia
Select location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 as death_percentage
From CovidProject..CovidDeaths
Where location = 'Indonesia'
Order by 1,2

-- To get the percentage of how many people got affected by Covid in Indonesia
Select location, date, total_cases, population, (total_cases/population)*100 as covid_percentage
From CovidProject..CovidDeaths
Where location = 'Indonesia'
Order by 1,2

-- To get the highest covid case percentage and order it by country with highest covid case
Select location, MAX(total_cases) as highest_covid_cases, population, MAX((total_cases/population))*100 as highest_covid_percentage
From CovidProject..CovidDeaths
Group by location, population
Order by highest_covid_percentage desc

-- To get the death count in each country and order it by country with most death count
Select location, MAX(total_deaths) as death_count
From CovidProject..CovidDeaths
Group by location
Order by death_count desc

-- To get the death count in each continent
Select continent, MAX(total_deaths) as death_count
From CovidProject..CovidDeaths
Where continent is not null
Group by continent
Order by death_count desc

-- To get the percentage of death all over the world in a day from the first case has found
Select date, SUM(new_cases) as total_case_in_a_day, SUM(new_deaths) as total_death_count_in_a_day, SUM(new_deaths)/SUM(new_cases)*100 as death_percentage_in_a_day
From CovidProject..CovidDeaths
Group by date
Order by 1,2

