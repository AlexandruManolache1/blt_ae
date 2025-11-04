BLT_AE Project

#Few consideration regarding the Air Boltic Data

Tech stack used: Databricks , dbt and github for code repository.

Data is structured in following layers / schemas

- 00-RAW : first area where data is located. In our case data comes from seeds and raw select for the JSON
- 01-STG : materialization of seed data and JSON flattening
- 02-INT : area where we do on the fly operations like TRIM, column renaming, reordering..etc | Materialization = views
- 03-CNT : the place where all the transformation happens, where all the business logic is stored. Here we create the fact, dimensions .. | Materialization = table
- 04-ACL : the serving area where the data consumers will feed. Here no filtering will be applied, just select from CNT tables. Materialization | Materialization = table

Parts not finished :

- int layer : trimming for all the STG models
- tests in schema.yml ; every dimension need to have at least unique key constraint.
- tests for fact tables ;  data integrity . ex: missing Customers groups for customers.  
- ACL set up
- visualization part  in Looker Studio | ERD diagram using something like PowerBI where we can see how we can present the model. 
 
---------

Explanations about the data model.

- I merged all customer data in one dimension.
- Same for airplane. I created a dimension with all the models that the company is operating.
  \*\* Here I created a surrogate key as ID as the existing source system ID had duplicates. I used the initial one to go with the ID in the trip fact
- i created also dimensions for city, date, seat, status

- fact_trips - here we can find information about trips: Origin & Destination City , Airplace that operated, Duration.
- fact_order - here we store information about customers that made the order,price,seat and status.

I analyzed the posibility of merging the two facts, but they have different business meaning => different grain. 
In fact trip we have : 1 row per trip.
In fact order we have : 1 row per order. 
I would  assume in the same order we can have 1+ trips. 

So i choose to have separate facts, and join on trip_Id. 

