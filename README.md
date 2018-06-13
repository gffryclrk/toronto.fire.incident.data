# Fire Incident Data

## Data Prep

### Initial Explorations


Using tidy to make the XML a bit more readable (or at least browsable):

```sh
tidy -xml -i TFS_OPEN_DATA-2012.xml >> 2012.xml
```

### XML to CSV

I didn't find XML to be a particularly convenient format to work with so I worked with XQuery to convert the XML to CSV. I'm not the best with XQuery but have so far have been successful in this task. My goal is to un-nest or 'flatten' the XML structure into two tables: Incidents & Responding Units which will be linked by Unique Key on INCIDENT_NUMBER. With the data in this format I can then use relational tools to load, store or browse the dataset.

## Data Description
Dataset: Fire Services Incident Data
Owner: Toronto Fire Services
Currency: July 2017
Format: XML
Refresh Rate: Annually
Retrieved from: City of Toronto Open Data Catalog on May 12th, 2018

### Data Preparation
The first major step in this project was to convert from XML to tabular structure. The tabular structure I chose was .csv because this format is well supported in various database and statistical packages. The conversion was made using XQuery and processed with BaseX, an open-source XQuery processor. The XML structure was as follows:

```xml
<?xml version="1.0" encoding="utf-8" standalone="yes"?>
<FIRE_DATA>
	<INCIDENT>
		<RespondingUnits>
		</RespondingUnits>
	</INCIDENT>
</FIRE_DATA>
```

Within the INCIDENT nodes there were also 100 features pertaining to the fire incident itself. Further, details on the Responding Units were nested within the Incident element itself creating a tree-like XML structure. A flat, table-like, structure was desirable and so the INCIDENT data was exported to .CSV for each year using XQuery and a Bash shell script which automatically changed the input and output files for the XQuery conversion script. Further, the data on Responding Units was also extracted from the XML and placed in flattened .CSV files for later use using the same technique. The unique incident number, from the parent element, was included with each Responding Unit observation so that at a later time it could be used as a KEY to JOIN the Responding Units table with the Incident Table.

Once available in tabular format the data was loaded into an R data.frame. The entire INCIDENT dataset consists of 720,370 observations of 100 features. The features include various variables that pertain to fire incidents including date and time, a unique incident identifier, the type of fire, fuel of ignition source, firefighter injuries, civilian injuries, other services & ministries contacted, and details on the building and property. Table 1 & 2 show the breakdowns of Incident and Responding units by year, respectively.  The first year of Incident records, 2011, has the largest number of observations with the remaining years relatively constant. All years have about a similar quantity of responding unit records.

### Type Conversion
The next processing step conducted was converting Date features. The three date features in the dataset are DISPATCH_DATE, ARRIVAL_DATE and INCIDENT_DATE. Both DISPATCH_DATE and ARRIVAL_DATE are identical so ARRIVAL_DATE was removed to reduce redundancy. DISPATCH and INCIDENT dates were then converted to POSIXct object in R.

A great majority of the INCIDENT features are of categorical type and thus were converted to factors. NA values were kept as their own level in the factors for future reference. The rest of the INCIDENT features were converted to the most suitable type; mostly Numeric.
### NA
This is a sparse dataset with many NA values observed. Some features, such as AGENT_APP_MIN, AGENT_APP_HOUR, AGENT_APP_SEC, CONTROL_HOUR, etc have over 700,000 NA values in a dataset of 720370. This analysis will further explore the meaning of NA values in this dataset. For example, some NA values may exist where the field wouldn’t make sense, such as building type for an outdoor fire. Other NA values may be the result of incomplete incident repots at the time of incident. Challenges will undoubtedly occur as a result of having features with so many NA values. A row-wise summary of NA values shows, out of 99 features (after dropping ARRIVAL_DATE), a minimum of 12, max of 70 and median of 58. The distribution of NA values has a left skew with the 1st Quartile starting at 58 NA values. As a result of so many NA values, features and observations may have to be dropped entirely.
### Approach
The next steps in this analysis will be to subset the dataset further in order to explore trends and patterns in the data. Multiple papers that were reviewed for the Literature Review section above were able to find breakdowns in the data such as which days, months and hours had the most fire incidents and what the different breakdown of causes of the incidents were. Trends over time will be explored and analyzed.
