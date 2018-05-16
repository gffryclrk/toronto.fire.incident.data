# Fire Incident Data

## Data Prep

### Initial Explorations


Using tidy to make the XML a bit more readable (or at least browsable):

```sh
tidy -xml -i TFS_OPEN_DATA-2012.xml >> 2012.xml
```

### XML to CSV

I didn't find XML to be a particularly convenient format to work with so I worked with XQuery to convert the XML to CSV. I'm not the best with XQuery but have so far have been successful in this task. My goal is to un-nest or 'flatten' the XML structure into two tables: Incidents & Responding Units which will be linked by Unique Key on INCIDENT_NUMBER. With the data in this format I can then use relational tools to load, store or browse the dataset. 

