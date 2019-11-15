# A Revised Update on the Number of Opportunity Youth in South King County in 2017

This project offers an updated estimate of the number of Opportunity Youth in South King County using the 2017 5-year American Community Survey [(ACS)](https://www.census.gov/programs-surveys/acs/about.html) Public Use Microdata Survey [(PUMS)](https://www.census.gov/programs-surveys/acs/technical-documentation/pums.html).

## Findings

These trends may indicate that current projects aimed at younger Opportunity Youth have helped positively in aiding more to graduate high school. However since we are seeing less Opportunity Youth enter college or graduate college, this might be an opportunity for more targeted aid aimed at Opportunity Youth who have graduated high school, but have not entered the workforce or entered/finished college.
* A possible trend we have identified is that the percentage of Opportunity Youth with a college degree (Associates degree or higher) has decreased by 6% (total between all age groups) when compared to 2014 figures;
* We have also found that in the 19-21 age group, college enrollment has decreased by 3% relative to 2014;
* Another trend we have identified is that the percentage of Opportunity Youth that have completed High School (or obtained a GED) has increased by 6%.

## Methodology

* Query data from a [PostgreSQL database](https://www.postgresql.org/) of US Census PUMA regions;
* Using Jupyter Notebook to combine our code, our notes, and data visualization. To visualize descriptive statistics, use [Matplotlib](https://matplotlib.org/) to create bar charts and [GeoPandas](http://geopandas.org/) to create population choropleth map;
* Map Figure Generation
    + Map data obtained from US government website, Shape file of Washington State PUMA regions
    + GeoPandas library used to map the shape file
    + Data obtained from PostgreSQL database used to populate choropleth maps of Opportunity Youth and job opportunities in South King County

## Process
* A map that visualizes which parts of King County are a part of South King County;
* Estimated number of opportunity youth in South King County from US Census PUMS data in 2017([2017 PUMS README](references/ACS2013_2017_PUMS_README.pdf), [2017 PUMS Data Dictionary](references/PUMS_Data_Dictionary_2017.pdf)). Variables includes:                
    + Age (AGEP)
    + Educational attainment (SCHL)
    + Employment status recode(ESR)
    + Housing unit/GQ person serial number (SERIALNO)
    + Person number (SPORDER) 
    + Person’s weight (PWGTP)(note: this is statistical weight)
    + PUMA is in South King County. Public use microdata area code (PUMA) based on 2010 Census definition    
    + School enrollment (SCH)


## DELIVERABLES
* [`src/`](/src) directory stores all relevant source code.
* [`data/`](data) stores all relevant raw and processed data files.
* [`src/visualization/`](src/visualization/) includes all relevant visualization figures.
* [`src/sql`](/src/sql) includes all relevant SQL queries.

## Setup Instructions

To download the necessary data, please run the following command:

```bash
# installs necessary requirements and downloads necessary data
# note: this may take anywhere from 10-20 minutes
sh setup.sh
```

### `oy-env` conda environment

This project relies on you using the [`environment.yml`](environment.yml) file to recreate the `oy-env` conda environment. To do so, please run the following commands:

```bash
# create the oy-env conda environment
# note: this make take anywhere from 10-20 minutes
conda env create -f environment.yml

# activate the oy-env conda environment
conda activate oy-env

# make oy-env available to you as a kernel in jupyter
python -m ipykernel install --user --name oy-env --display-name "oy-env"
```

## Citations

* <sup>1</sup> Yohalem, N., Cooley, S. 2016. “Opportunity Youth in the Road Map Project Region”. Community Center for Education Results. Available at: https://bit.ly/2P2XRF3. 

* <sup>2</sup> Anderson, T., Braga, B., Derrick-Mills, T., Dodkowitz, A., Peters, E., Runes, C., and Winkler, M. 2019. “New Insights into the Back on Track Model’s Effects on Opportunity Youth Outcomes”. Urban Institute. Available at: https://bit.ly/2BuCLr1. 

* <sup>3</sup> Seattle Region Partnership. 2016. “King County Opportunity Youth Overview: Demographics of opportunity youth and systemic barriers to employment”. https://bit.ly/2oRGz37. 

* <sup>4</sup> Morton, N. 2019. “Nearly 19,000 youth in King County are neither working nor in school. How one Seattle nonprofit is changing that.” The Seattle Times. Available at: https://bit.ly/2W5EufR. 