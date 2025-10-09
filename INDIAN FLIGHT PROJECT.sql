SELECT TOP (1000) [index]
      ,[airline]
      ,[flight]
      ,[source_city]
      ,[departure_time]
      ,[stops]
      ,[arrival_time]
      ,[destination_city]
      ,[class]
      ,[duration]
      ,[days_left]
      ,[price]
  FROM indian_flight_database..flight_data

  select distinct(price)
  from indian_flight_database..flight_data
  where price like '%1%5%'
  order by price 

  --This shows the Airline in the Dataset and Their Frequencies
    select airline, count(airline) as 'Airline_Frequency'
  from indian_flight_database..flight_data
  group by airline
  order by Airline_Frequency asc
 -- where duration = '0'

 select airline,source_city,destination_city,count(airline) as 'Airline_Frequency'
 from indian_flight_database..flight_data
 group by airline,source_city,destination_city
 order by airline, Airline_Frequency desc

 -- select airline,flight,source_city,departure_time,stops,arrival_time, destination_city,class,duration, days_left,price
 --from indian_flight_database..flight_data
 -- where airline = 'Air_India'
 --group by airline,flight,source_city,departure_time,stops,arrival_time, destination_city,class,duration, days_left,price
 --having source_city = 'Kolkata' and destination_city = 'Hyderabad'
 --order by airline


  select *
 from indian_flight_database..flight_data
 where airline = 'Air_India'
 group by airline,source_city,destination_city
 having source_city = 'Bangalore' and destination_city = 'Hyderabad'


   select departure_time, COUNT(departure_time) as 'Count_Of_Departure_Time'
  from indian_flight_database..flight_data
  group by departure_time
  order by  Count_Of_Departure_Time desc


     select arrival_time, COUNT(arrival_time) as  'Count_Of_Arrival_Time'
  from indian_flight_database..flight_data
  group by arrival_time
  order by  Count_Of_Arrival_Time desc


   select source_city, count(source_city) as Source_City_Frequency_Count
  from indian_flight_database..flight_data
  group by source_city
  order by Source_City_Frequency_Count desc


   select destination_city, count(destination_city) as Destination_City_Frequency_Count
  from indian_flight_database..flight_data
  group by destination_city
  order by Destination_City_Frequency_Count desc

  --THIS SHOWS THE NUMBER/COUNT OF TRAFFIC BETWEEN AIRPORTS OR THE BUSIEST AIR ROUTE
  select source_city,destination_city,count(destination_city) as 'Count_Of_Traffic_Between_Airports_Cities'
  from indian_flight_database..flight_data
  group by source_city, destination_city
  order by source_city asc, Count_Of_Traffic_Between_Airports_Cities desc



  --THIS SHOWS THAT PRICE VARIES BETWEEN AIRLINES - ECONOMY CLASS
    select airline,source_city,destination_city,departure_time,class,days_left,price
  from indian_flight_database..flight_data
  where source_city = 'Mumbai' and destination_city = 'Chennai'
  group by airline,source_city,destination_city,departure_time,class,days_left,price
  having class = 'Economy' and days_left = '40'
  order by price desc

  --THIS SHOWS THAT PRICE VARIES BETWEEN AIRLINES - BUSINESS CLASS
    select airline,source_city,destination_city,departure_time,class,days_left,price
  from indian_flight_database..flight_data
  where source_city = 'Mumbai' and destination_city = 'Chennai'
  group by airline,source_city,destination_city,departure_time,class,days_left,price
  having class = 'Business' and days_left = '40'
  order by price desc

  --THIS TABLE SHOWS THAT DEPARTURE AND ARRIVAL TIME ALSO AFFECTS TICKET PRICE. 
  --The table is queried using Mumbai as source_city and delhi as destination_city. With same days left as 10
    
     select departure_time, arrival_time,AVG(price) as 'Average_Price'
  from indian_flight_database..flight_data
  where source_city = 'Mumbai' and destination_city = 'delhi'
  group by departure_time, arrival_time,days_left
  having /**airline = 'Air_India' andclass = 'Business' and **/days_left = '10'
  order by Average_Price desc
   

   

  --THIS ANSWERS THE QUESTION OF HOW PRICE CHANGES IN SOURCE CITY AND DESTINATION CITY USING THE AVERAGE PRICE PER CITY
     select source_city, destination_city, avg(price) as 'Average_Price(SOURCE_CITY/DESTINATION CITY)'
  from indian_flight_database..flight_data
  where class <> 'Business'  and days_left = '15'
  group by source_city, destination_city,departure_time,arrival_time
  having departure_time = 'Morning' and arrival_time = 'Evening'
  order by /**source_city,**/ 'Average_Price(SOURCE_CITY/DESTINATION CITY)' desc


  --  select source_city, destination_city, max(price) as 'Maximum_Price(SOURCE_CITY/DESTINATION CITY)'
  --from indian_flight_database..flight_data
  --where class <> 'Business'  and days_left = '15'
  --group by source_city, destination_city,departure_time,arrival_time
  --having departure_time = 'Morning' and arrival_time = 'Evening'
  --order by source_city, 'Maximum_Price(SOURCE_CITY/DESTINATION CITY)' desc

  --    select source_city, destination_city, min(price) as 'Minimum_Price(SOURCE_CITY/DESTINATION CITY)'
  --from indian_flight_database..flight_data
  --where class <> 'Business'  and days_left = '15'
  --group by source_city, destination_city,departure_time,arrival_time
  --having departure_time = 'Morning' and arrival_time = 'Evening'
  --order by source_city, 'Minimum_Price(SOURCE_CITY/DESTINATION CITY)' desc
  

  --   select departure_time,arrival_time,count(departure_time)
  --from indian_flight_database..flight_data
  --group by departure_time,arrival_time
  --order by 3 desc

  --THIS SHOWS THE AVERAGE TICKET PRICE AND HOW PRICES ARE AFFECTED WHEN BOUGHT LESS WITH THAN 2DAYS BEFORE DEPARTURE
    select source_city, destination_city, avg(price) as 'Average_Price_For_1-2Days'
  from indian_flight_database..flight_data
  where /*class <> 'Business'  and*/ days_left <=2 
  group by source_city, destination_city,departure_time,arrival_time
  having departure_time = 'Morning' and arrival_time = 'Evening'
  order by /**source_city,**/ 'Average_Price_For_1-2Days' desc

  --THIS SHOWS THE AVERAGE TICKET PRICE AND HOW PRICES ARE AFFECTED WHEN BOUGHT WITH MORE THAN 2DAYS BEFORE DEPARTURE
     select source_city, destination_city, avg(price) as 'Average_Price_Above_2Days'
  from indian_flight_database..flight_data
  where /*class <> 'Business'  and*/ days_left > 2 
  group by source_city, destination_city,departure_time,arrival_time
  having departure_time = 'Morning' and arrival_time = 'Evening'
  order by /**source_city,**/ 'Average_Price_Above_2Days' desc


  --THE NEXT 3 QUERIES BELOW ANSWERS THE QUESTION OF HOW PRICE VARIES BETWEEN BUSINESS AND ECONOMY
  --this shows how it varies on AVERAGE PRICE
  select class, avg(price) as 'Average_Price'
  from indian_flight_database..flight_data
  --where class <> 'Business'  and days_left > 3 
  group by class
  --having departure_time = 'Morning' and arrival_time = 'Evening'
  order by /**source_city,**/ 'Average_Price' desc

  --this shows how it varies on MAXIMUM PRICE
     select class, max(price) as 'Maximum_Price'
  from indian_flight_database..flight_data
  --where class <> 'Business'  and days_left > 3 
  group by class
  --having departure_time = 'Morning' and arrival_time = 'Evening'
  order by /**source_city,**/ 'Maximum_Price' desc

  --this shows how it varies on MINIMUM PRICE
  select class, min(price) as 'Minimum_Price'
  from indian_flight_database..flight_data
  --where class <> 'Business'  and days_left > 3 
  group by class
  --having departure_time = 'Morning' and arrival_time = 'Evening'
  order by /**source_city,**/ 'Minimum_Price' desc


  --THIS IS THE AVERAGE PRICE OF VISTARA AIRLINE FLIGHT DELHI TO HYDERABAD IN BUSINESS CLASS
     select airline,source_city,destination_city, avg(price) as 'Average_Price'
  from indian_flight_database..flight_data
  WHERE airline = 'Vistara' AND class = 'Business'
  GROUP BY airline,source_city,destination_city
  having source_city = 'Delhi' and destination_city = 'Hyderabad'


  --THIS QUERY IS TO KNOW THE SECOND HIGHEST FLIGHT PRICE
  select  max(price)
  from indian_flight_database..flight_data
  where price < (
  select max(price)
  from indian_flight_database..flight_data)
  
  


   select *
  from indian_flight_database..flight_data





