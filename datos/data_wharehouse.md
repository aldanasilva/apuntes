
[[_TOC_]]

# Data Warehouse Basics

## ¿Qué es BI?

Es el uso de estrategias, tecnologías e infraestructuras para crear información significativa con el análisis de los datos, para esto se requiere capturar los datos, almacenarlos, estructurarlos, creación de reportes, data mining, análisis predictivo

Raw data -> Transform -> Meaningful insights (better decisions) entender mejor la compania

## ¿Qué es Data Lake?

Riesgos

* Calidad de la información

## ¿Qué es Data Warehouse? (OLAP)

Un Data Warehouse es una base de datos optimizada para propósitos de analítica
* Amigable para los usuarios, fácil de entender
* Rendimiento rápido de consultas
* Habilita el análisis de los datos
* Centralización de los datos en forma estructurada y consistente
* Se cargan los datos en forma consistente y de forma periódica (ETL)
* Se construyen reportes basados en estos datos

OLTP = Online Transactional Processing
OLAP = Online Analytical Processing

ETL = Extract, Transform, Load

Extracción de datos de diferentes fuentes: OLTP, APIs, etc en diferentes formatos como csv, txt, excel, json, parquet, imágenes, etc, se llevan al datalake
Tranformación de los datos: esta transformación se hace en las diferentes capas del datalake
Carga de datos al data warehouse: Los datos procesados son cargados al data warehouse para habilitar el análisis de los datos

## Diferencias entre Data Lake y Data Warehouse

| | Data Lake | Data Warehouse |
| --- | --- | --- |
| Data | Raw | Processed |
| Technologies | Big data | Database |
| Structure | Unstructured | Structured |
| Usage | Not defined yet | Specific and ready to be used |
| Users | Data Scientists | Business users and IT |

# Data Warehouse Architectures

Data sources -> ETL (transformations) -> Data Warehouse

## DW Layers

    1. Staging (bronce): Raw data in tables (tocar lo menos posible los datos crudos)
    1.1 Cleansing (optional): para limpieza de datos cuando los datos crudos están muy crudos
    2. Core (silver) / Data Warehouse: 
    3. Data marts: Es como lo que se hacía en Analysis Services (crear el modelo con las tablas necesarias para un reporte)

## Staging area (extract the data from data sources)

Data Sources ---E---> Staging ---TL---> Core/Access Layer/Data Warehouse

    * Short time on the source systems, don't risk the performance
    * Quickly extract
    * Move the data into relational Database
    * Start transformations from there

This area can be:
    * Temporary: truncate the data for new loads
    * Persistant: don't truncate area, if you need to roll back something or get trace of changes, this can be useful

Summary

* Staging layer is the landong zone extracted data
* Data in tables and on a separate database
* As little "touching" as posible
* We don't charge the source system
* Temporary or Persistent Staging Layers

## Data Marts

Son solamente subsets del data warehose, estos datos están en forma dimensional (facts y dimensions), son construidos para usos muy específicos, los datos en el data mart se pueden agregar aún más según la necesidad (caso de uso)

* Se aumenta la usabilidad y aceptación, dado que no se trabaja con todo el data warehouse, sino con una parte específica completamente definida
* Se puede aumentar la performance con modelos dimensionales

* Se puede enfocar en diferentes departamentos, regiones, casos de uso, y habilitarse para su uso en diferentes herramientas como Power BI, Qlick View, Tableau, etc

* Se enfoca en un problema de negocio lo que puede ser de gran ayuda


## In-memory databases

* Highly optimized for query performance
* Good for Analytics / High query volume
* Usually used for data marts
* Relational and non-relational

Compare
    * Traditional database ---> Disc ---Response time---> In-memory
    * In/memory database ---> In-memory
        * columar storage
        * parallel query plans
        * and other techniques

Challenges
* Durability: Lose all information when devices loses power or is reset
* Durability added through snapshots / images
* Cost-factor
* Traditional DBs also trying reduce usage of disk

Examples
* SAP HANA
* MS SQL Server In-Memory Tables
* Oracle In-Memory
* Amazon MemoryDB


## Cubes (OLAP Cubes)

* Traditional DWH based on relational DBMS (ROLAP)
* Data is organized non-relational in Cube (MOLAP)
    Cube = Multidimensional dataset
* Arrays instead of atbles
* Main reason to use: Fast query performance
* Works well with many BI solutions


* Precalculated (aggregated values)
* MDX (Multidimensional Expressions) language, for example to microsoft

Benefits
* High performance
* Interactive tools to drill / slice & dice

Recommendation

* Built for a specific use-cased (as data marts in general)
* Mode efficient & less complex with separate data marts
* Good for interactive queries woth hierarchies
* Optional after star schema is built in relational DB

Alternatives

* Less important today with advancement of hardware
* Alternatives:
    * Tabular models (SSAS)
    * ROLAP
    * columnar storage


## ODS (Operational Data Storage)

Is used to Operational Decisions Making

Data sources ---ETL---> ODS

* No need for long history
* Needs to be very current or real-time

__ODS - Paralell__

Data sources ---ETL---> DWH (Analytical Decisions)
Data sources ---ETL (Near) real-time---> ODS (Operations Decisions)

__ODS - Sequential__

Data sources ---ETL (Near) real-time---> ODS (Operational decisions) ---ETL---> DWH (Analytical decisions)

__Getting less relevant__ because
* Better performance (Faster ETL / DBs)
* Big data technologies (very fast / real-time)


## Summary

### Data Warehouse Layers

Data sources ---> Staging (landing zone - raw data) ---> Core / Data Warehouse (single point of truth) ---> Data Mart X (access layer) ---> Business applications / Predictive Analysis

### The different layers

* Staging
    * Landing zone
    * Minimal tranformation
    * "Stage" the data in tables

* Core
    * Always there
    * Business logic and single point of truth
    * Can be sometimes the access layer

* Mart
    * Access layer
    * Specific to one use-case
    * Optimized for performance


# Dimensional Modeling

## What is dimensional modeling?

Method of organizing data (in a data warehouse)

* Facts: *Measurement* like profit
* Dimensions: *Context* like category or period

    * Profit by year
    * Profit by category

* Unique tecnique of structering data
* Commonly used in DWH
* Optimized for faster data retrieval
* Oriented around performance and usability
* Designed Reporting / OLAP

## Why dimensional modeling?

* Goal: Fast data retrieval
* Oriented around performance and usabiity

Prefered technique for data warehouse!

## Facts

* Foundation of DWH
* Key measurements
* Aggregated and analyzed

Usually...

* Aggregatable (numerical values)
* Measureables
* Event or transactional data
* Date/time in a fact table

* __Fact table__: PK, FK & Facts (sales, profit, budget, etc)
* __Grain__: Most atomic level facts are defined
* Different types of facts

## Dimensions

* Categorize facts: meaningful context to measurements
* Supportive and descriptive
* Filtering, grouping and labeling

Usually...

* Non-Aggregatable
* Descriptive
* (More) static

* __Dimension table__: PK, Dimension, (FK) (people, products, places, time, etc)
* Different types of dimensions

## Star schema (most common - denormalized)

Denormalized (star schema)
* There is data redundancy!
* Optimized to get data out
* Query performance (read)
* User experience

* Most common schema in Data Mart
* Simplest form (vs. snowflake schema)
* Work best for specific needs (simple set of queries vs complex queries)
* Usability + Performance for specific (read) use-case

The ideal is to use star schema with just one fact table, not many facts

The reduction of redundancy is called normalization

Normalized (not a star schema)
* Tecnique to avoid redundancy
* Minimizes storage
* Performance (write/update)
* Many tables
* Many joins necessary

## Snowflake schema

Advantages:
* Less space (storage cost)
* No (less) redundant data (easier to maintain/update, less risk of corrupted data)
* Solves write slow downs

Disadvantages:
* More complex
* More joins (more complex SQL queries)
* Less performance Data Marts / Cubes

Then, what to use?

Data Mart:
* Star schema

Core:
* Star schema (maybe snowflake schema, but is preferable star schema)

# Facts

## Additivity

There are three types of __additivity__ in fact tables

* Additive
    * Can be added across all dimensions
    * Most flexible and useful
    * Most facts are fully additive

* Semi-additive
    * Can be added across a few dimensions
    * Used carefully and less flexible
    * Averaging might be an alternative
    * Example: Account balance

* Non-additive
    * Cannot be added across any dimension
    * Limited analytical value
    * Store underlying value
    * Examples: Ratio, price, percentages, etc

## Nulls in facts

* No debería haber nulos en llaves foránes, en caso de haberlos, se debería agregar una categoría en la tabla de la dimensión correspondiente y vincular el nuevo registro a las llaves foráneas nulas. Ejemplos, No asignado, Sin categoría, etc. con llave primaria -1 o 999.
* En las columnas de medidas puede haber nulos, se debe tener en cuenta que esto afecta los cálculos que se realicen sobre estos campos, como sumas, promedios, máximos, mínimos, etc. depende del tipo de dato y finalidad (significado de los cálculos) si se pueden tener nulos o no en un campo de medida.

## Transactional fact table

* 1 row = measurement of 1 event / transaction
* Taken place at a specific time (sales, calls, etc.)
* One transaction defines the lowest grain

__Characteristics__

* Most common and very flexible
* Typically additive
* Tend to hace a los of dimensions associated
* Can be enormous on size

## Periodic Snapshot fact table

* 1 row = summarizes measure of many events / transactions
* Summarized of standard period (e.g. 1 day, 1 week, etc.)
* Lowest period defines the grain

__Characteristics__

* Tend to be not as enormous in size
* Typically additive
* Tend to have a lot of facts and fewer dimensions associated
* No events = null or 0

## Accumulation Snapshot fact tables

* 1 row = summarizes measure of many events / transactions
* Summarized of lifespan of 1 process (e.g. order fulfillment, order producction, etc.)
* Definite beginning and definite ending (and steps in between)

__Characteristics__

* Least common
* Workflow or process analysis
* Multiple Date/Time foreign keys (for each process step)
* Date/Time keys associated with role-playing dimension

## Types of fact tables (comparison)

| Type | Transactional | Periodic Snapshot | Accumulating Snapshot |
| --- | --- | --- | --- |
| Grain | 1 row = 1 transaction | 1 row = 1 defined period (plus other dimensions) | 1 row = lifetime of process / event |
| Date dimensions | 1 transaction date | Snapshot date (end of period) | Multiple snapshot dates |
| No. of dimensions | High | Lower | Very high |
| Facts | Measures of transactions | Cumulative measures of transactions in period | Measures of process in lifespan |
| Size | Largest (most detailed grain) | Middle (less detailed grain) | Lowest (highest aggregation) |
| Performance | Can be improved with aggregation | Better (less detailed) | Good performance |

## Factless fact table

* Facts are usually numeric
* Sometimes only dimensionals aspects of an event are recorded
* Example new employee is registered

__Employee registrarion__
| reg_id | Entry Date FK | dep_id | region_id | manager_id | pos_id |
| --- | --- | --- | --- | --- | --- |
| 1 | 20220102 | 1 | 2 | 3 | 10 |
| 2 | 20220103 | 3 | 3 | 4 | 112 |
| 3 | 20220103 | 4 | 6 | 3 | 202 |
| 4 | 20220104 | 4 | 8 | 6 | 110 |
| 5 | 20220104 | 3 | 4 | 8 | 17 |

* How many employees have been registered last month?
* How many employees have been registered in a certain region?

## Steps to create a fact table

What are the key decisions we need to take during the design?

__4 key decisions__ (considdering the business needs)
1. Identify business process for analysis (for example: Sales, Order processing)
2. Declare the grain (for example: Transaction, Order, Order lines, Daily, Daily + location)
3. Identify dimensions that are relevant (what, when, where, how and why) (for example: Time, Locations, Products, Customers)
4. Identify facts for measurement (Defined by the grain and not by specific use-case)

## Surrogate key

* Natural keys
    * Come out of the source system

* Surrogate key (artificial keys)
    * Integer number
    * _PK pr _FK suffix
    * Created by the database / ETL tool

__Benefits__

* Improve performance (less storage / better joins)
* Handle dummy values (nulls / missing values), for example 999 or -1
* Integrate multiple source systems
* Easier administrate / update
* Sometimes there are even no natural keys available

__Practical guidelines__

* Always use surrogate keys in tables as main PK and FK
* Both for Factos and Dimensions (except date dimension)
* Optionally keep the natural keys

# Dimensions

## Dimension tables

* Always has a Primary Key (PK) - Use surrogate key (you can keep the natural key)
* Relative few rows / many columns with descriptive attributes
* Group and Filter ("slice & dice")

## Date dimension

* One of the most common and most important dimensions
* Contains date related features
    * Year, Month (name and number), Day, Quarter, Week, Weekday (name and number), etc.
* Meaningful surrogate key `YYYYMMDD`
    * For example 2022-04-02 <---> 20220402
* Extra row for no date
    * null (source) <---> 1900-01-01 (dim)

* Time is usually a separate dimension
* Can be populated in advance (e.g. for next 5 or 10 years)

__Date features__
* Numbers and text (e.g. January, 1)
* Lond and abreviated (Jan, January - Mon, Monday)
* Combiantions of attributes (Q1, 2022-Q1)
* Fiscal dates (Fiscal year, etc.)
* Flags (Weekend, company holidays, etc.)

## Nulls in dimensions

* Replace nulls with descriptive values
    * More understables for business users
    * Values appear in aggregations in BI tools

## Hierarchies in dimensions

* What we should do
    * Denormalize / flattened
    * Examples
        * Product_ID, Product, Category, etc.
        * Location_PK, City, State, City-State, etc.

## Conformed dimensions

* Conformed dimension is a dimension that is shared by multiple fact tables / stars.
* Used to compare facts across different fact tables.
* For example: Date dimension
* Same granularity not necessary!

## Degenerate dimension

* All relevant information have already been extracted (to other dimensions)
* Attribute can be still useful
* Indicate that it is a deg. dim. (e.g. suffix _DD)

* Degenerate dimension the dimension key without an assiciated dimension
    * Occurring mostly in Transactional facts
    * For example: Invoice no., Billing no., Order ID, etc.

## Junk dimensions

| Transaction_PK | Amount | Payment_Type | Incoming / Outbound | Is_Bonus |
| --- | --- | --- | --- | --- |
| 1 | $530 | Wired | Incoming | Yes |
| 2 | $553 | Credit Card | Outbound | No |
| 3 | $654 | Cash | Incoming | No |

1. Eliminate them if they are not relevant (What if they are relevant?)
2. Leave them as they are in the fact (Long text values? Table size?)
3. One Flag -> One dimension (Very wide fact table?)

Alternative: Junk dimension

__What is a junk dimension?__
* Dimension with various flags / indicators with low cardinality
* Like a box were we store items we need but have no separate storing location

> Note: We call it "junk dimension" usually only internally. Talking to business users we can refer to as "transactional indicator dimension".

An example with table above

| Transaction_PK | Amount | Transactional_Flag_FK |
| --- | --- | --- |
| 1 | $530 | 1 |
| 2 | $553 | 7 |
| 3 | $654 | 12 |

All possible combinations
| Flag_PK | Payment_Type | Incoming / Outbound | Is_Bonus |
| --- | --- | --- | --- |
| 1 | Wired | Incoming | Yes |
| 2 | Wired | Incoming | No |
| 3 | Wired | Outbound | Yes |
| 4 | Wired | Outbound | No |

What if there are many combinations?
1. Extract only available combinations of fact table
2. Two or more junk dimensions

## Role-playing dimension

__What is a role-playing dimension?__
Dimension that is referenced multiple times by a fact

* Most common case is the date dimension.

| Order_ID | Order_Date_FK | No_Products | Product_FK | Production_Start_FK |
| --- | --- | --- | --- | --- |
| 1 | 20220102 | 100 | 32 | 20220103 |
| 2 | 20220103 | 100 | 32 | 20220104 |
| 3 | 20220103 | 100 | 32 | 20220103 |
| 4 | 20220104 | 100 | 32 | 20220106 |
| 5 | 20220104 | 100 | 32 | 20220108 |

# Slowly changing dimensions (SCD)

## Type 0: Retain Original

* There won't be any changes
* Date Table (expect for holidays, etc.)
* "Original"
* Very simple and easy to maintain

## Type 1: Overwrite

* Old attributes are just overwritten
* Only current state is reflected
* Very simple
* No fact table needs to be modified

__Problems__

* History is lost!
* Insignificant changes
* Might affect / break existing queries

## Type 2: New row (default strategy)

* Perfectly partitions history
* Changes are reflected with history
* No updates in fact
* Can use natural keys to maintain distinct count of products, for example

## Administrating Type 2 dimensions

| Product_FK | Product_ID | Name | Category | Ef_Date | Ex_Date |
| --- | --- | --- | --- | --- | --- |
| 1 | SG-TR7 | Sunglases TR-7 | Accessories | 2022-01-01 | 2100-01-01 |
| 2 | CH-B70 | Chocolate bar 70% cacao | Sweets | 2022-01-01 | 2100-01-01 |
| 3 | OT-BSC | Oat meal biscuits | Sweets | 2022-01-01 | 2022-05-31 |
| 4 | OT-BSC | Delicious Oat meal biscuits | Biscuits | 2022-06-01 | 2100-01-01 |

__Periods in which values are valid__
* Ef_Date = Effective date
* Ex_Date = Expiration date

> Note: We should always use a value for the expiration date, use a date far in the future.

* Necessary also in ETL to use correct FK
* Requires Surrogate key instead of Natural key

__Correct FK?__

| Product_FK | Product_ID | Name | Category | Ef_Date | Ex_Date | Is_Current |
| --- | --- | --- | --- | --- | --- | --- |
| 1 | SG-TR7 | Sunglases TR-7 | Accessories | 2022-01-01 | 2100-01-01 | Yes |
| 2 | CH-B70 | Chocolate bar 70% cacao | Sweets | 2022-01-01 | 2100-01-01 | Yes |
| 3 | OT-BSC | Oat meal biscuits | Sweets | 2022-01-01 | 2022-05-31 | No |
| 4 | OT-BSC | Delicious Oat meal biscuits | Biscuits | 2022-06-01 | 2100-01-01 | Yes |

## Mixing Type 1 + 2

* Some attributes can be Type 1 and some Type 2
* No set in stone rules but needs to be defined with business users
* Not a technical decision

## Type 3: Additional Attributes

Type 1: Static
Type 2: Default strategy to maintain reflect history
Type 3: In-between: Switching back and forth between versions

| Product_PK | Product_ID | Name | Category | Prev_Category |
| --- | --- | --- | --- | --- |
| 1 | SG-TR7 | Sunglases TR-7 | Accessories | Accessories |
| 2 | CH-B70 | Chocolate bar 70% cacao | Sweets | Sweets |
| 3 | OT-BSC | Oat meal biscuits | Biscuit | Sweets |

* Instead of adding a row - we add a column
* Typically used for significant changes at a time (e.g. restructurings in organizations)
* Enables switching between historic / current view
* It is possible to add multiple historic columns

__Limitations__

* Not suitable for frequent or unpredictable changes -> better Type 2
* Minor changes -> better Type 1

# ETL Process

## Understanding the ETL process

Data sources ---ETL---> Data Warehouse

Data sources ---> Staging ---> Core / Data Warehouse ---> Data Mart ---> Power BI, Tableau, Qlick View, etc

__ETL-Tool__
* Set of (built-in) tools to
    * Connect to different data sources
    * Transform / Clean data
    * Load data

__ETL-Setup__
* Building workflows
    * Staging workflow
    * Core / Transformation workflow
    * Data Mart Workflow
* Jobs (Scheduling)
    * Run the workflows
    * Are scheduled based on defined rules

## Extracting

* Data is part of DWH
* Understanding data
* From here data is transformed
* Transient (most commonly)
* All data copied and then deleted

| Initial Load | Delta Load |
| --- | --- |
| First (real) run | Subsequent runs |
| All data | Only additional data |

## Initial Load

* First initial extraction from source data
* After discussion with the business users + IT
    * What data is needed?
    * When is a good time to load the data? (Night? Weekends?)
    * Smaller extractions to test
* Initial Load to Core with transformations
* After all the transformation steps have been designed
* Just done for all data from Staging (no filtering)

## Delta Load

* Incremental periodic Extraction / Load
* Delta column for every table
    * Transaction date, create_date, etc.
    * Incrementing number (Suitable primary key)

__What if there is no delta column?__
* Some tools can capture automatically which data has been already loaded (with metadata)
* Just full load everytime and compare the data with data that is already loaded
* Depending on the data volumes -> performance

## Load Workflow

* Insert / Append
* Update
* Delete
    * Typically we don't delete data
    * We can add a column to identify deleted data
    
    | Product_PK | Name | Deleted |
    | --- | --- | --- |
    | 1 | Sunglases TR-7 | No |
    | 2 | Chocolate bar 70% cacao | Yes |
    | 3 | Oat meal biscuits | No |
    | 4 | Chocolate bar 70% cacao | No |
    | 5 | Oat meal biscuits | No |

## Transforming data

__Main goal__: Create a consolidated view of all data for analysis purposes

1. Consolidate (from multiple systems)
    * Making the data compatible and consistent
2. Reshape according to business requirements (for analysis purposes)
    * Clean and reshape data

## Basic transformations

* __Deduplication__: remove duplicates, from same data source or multiple data sources
* __Filtering (rows and columns)__: Filter out irrelevant rows and columns (use select for columns!)
* __Cleaning and mapping (integration)__:
    * Map M for Male and (F, Fe) for Female
    * Replace nulls by zero or a significant value
* __Value Standardization (integration)__:
    * Convert values to same unit and format
    * Remove special characters
    * All in CapitalCase/lowercase/UPPERCASE
* __Key generation__: Create surrogate keys

## Advanced transformations

* __Joining__:
    * Reference the surrogate keys (dim) in the fact table, to replace natural keys
    * Add columns for other tables of the OLTP system
* __Splitting__:
    * Split a column in many columns by delimiter, length, position, etc.
* __Aggregating__:
    * SUM, COUNT, DISTINCT COUNT, AVERAGE
* __Deriving new values__:
    * Calculated columns from another columns, like multiplications, conditionals, etc.

## Scheduling

* Jobs or Packages
* Scheduling at specific times / frequencies

__Can be done either__
* In the ETL tool (Pentaho requires enterprise edition)
* External tool (e.g. Windows Task scheduler, crontab, etc.)

__Guidelines__
* What are the requirements?: Every x time, times per day, etc.
* How long does it take?: 5 min, 1 hour, etc.
* What is a good time?:
    * Initial load vs. Delta load
    * Effect on productive system
    * Short read access (ideal)
    * Night? Morning?

# ETL tools

* Enterprise (Alterys, Informatica, Oracle Data Integrator, Microsoft SSIS)
    * Commercial
    * Most mature
    * Graphical interface
    * Architectural needs
    * Support
* Open-source (Talend Open Studio, Pentaho Data Integration, Hadoop)
    * Source code
    * Often free
    * Graphical interface
    * Support?
    * Ease of use?
* Cloud-native (Azure Data Factory, AWS Glue, Google Cloud Data Flow)
    * Cloud technology
    * Data already in cloud?
    * Efficiency
    * Flexibility?
* Custom (not ideal)
    * Own development
    * Customized
    * Internal resources
    * Maintainance?
    * Training?

## Choosing ETL tool

1. Evaluate current situation/needs
    * What do you want to improve?
    * Data source and other tools?
    * Define your requirements!
    * Define responsibles
    * Who are the users?
2. Evaluate options
|  | Text | Must have?<br>K.O.? | Weight/Importance | Rating |
| --- | --- | --- | --- | --- |
| Cost |  |  | 1-5 | 1-5 |
| Connectors |  |  |  |  |
| Capabilities |  |  |  |  |
| Ease of use/work |  |  |  |  |
| Reviews |  |  |  |  |
| Support/Extras |  |  |  |  |
3. Test / Demo / Trial / PoC

# Case Study: Creating a Data Warehouse

## Plan of attack

1. Look at the problem and plan
2. Set up tables and schema
3. Staging
4. Core (dimension table)
5. Core (fact table)
6. Set up job and testing

# ETL vs. ELT

## What is ELT?

Data sources ---EL---> Data warehouse ---T---> with SQL code (views)

* More flexible
* Data is not transformed before load, faster extractions (more frequent, near real time or real time)

Then... Is ETL obsolete?
* NO! But there are different use cases!

## ETL vs. ETL

| ETL | ELT |
| --- | --- |
| More stable with defined transformations | Requires high performance DB |
| More generic use-cases | More flexible |
| Security | Transformations can be changed quickly |
|  | Real-time |

| ETL | ELT |
| --- | --- |
| Reporting | Data Science, ML |
| Generic use cases | Real-time requirements |
| Easy to use | Big data |

# Using a Data Warehouse

A Data Warehouse is a centralized location for all of our integrated data that is optimized for the purpose of data analysis, serving as a basis for aour reporting and analysis

* Basis for reporting
    * Strategic decisions
    * Integrated
    * High performance
* Enables business users to analyze data
    * Accessible
    * Data Quality
    * Easy to use
* Predictive Analytics
    * Continuous Training of Machine Learning Models
* Use Big Data
    * Aggregate and filter

# Optimizing a Data Warehouse

## Using Indexes

* Indexes help to make data reads faster
    * Slower data writes
    * Additional storage needed

## B-tree Indexes

* Standard index (default)
* Multi-level tree structure
* Breaks data down into pages or blocks
* Should be used for high-cardinality (unique) columns
* Not entire table (costy in terms of storage)
* Set, by default, when create a primary key

## Bitmap Indexes

* Particularily good for dataware houses
* Large amounts od fata + low-cardinality
* Very storage efficient
* More optimized for read and few DML-operations
* Good for many repeating values (dimensionality) - Not much different values

## Guidelines for indexes

| B-tree Index | Bitmap Index |
| --- | --- |
| Default index | Slow to update |
| Unique columns (surrogate key, names) | Storage efficient |
|  | Great read performance |

* __Should we put index on every column?__
    * NO! They come with a cost!
    * Storage + Create/Update time
* __Only when necessary!__
    * Avoid full table reads
    * Small tables do not require indexes
    * Use in large tables if you experiment low query performance

1. Large tables
2. Columns that are used as filters

__Fact tables__
* B-tree on surrogate key
* Bitmap key on foreign keys (depending on the cardinality)

__Dimension tables__
* Take decision based on
    * Size of table
    * Are they used in searchs a lot?
* Choose type based on cardinality

# The modern Data Warehouses

## Cloud vs. On-premises

| On-premises | Cloud |
| --- | --- |
| __What?__<br>Own local hardware<br><ul><li>Storage layer</li><li>Compute layer</li><li>Software layer</li></ul>Physical data center | __What?__<br>Software as a service<br><ul><li>Pay for what you use</li><li>Managed service</li><li>Optimized for scalable analytics</li></ul> |
| __Benefits__<br><ul><li>Full control</li><li>Data governance and compliance</li></ul> | __Benefits__<br><ul><li>Fully managed</li><li>Scalable</li><li>Cost-efficient</li><li>Managed security</li><li>Availability</li><li>Time to market</li></ul> |
| __Problems__<br><ul><li>Full responsibility</li><li>High costs</li><li>More internal resources</li><li>Less flexible</li></ul> | __Problems__<br><ul><li>Regulations</li></ul> |


__Conclusion__

Which one to choose?
* Cloud data warehouses are on the rise
* Most companies opt for cloud data warehouse

In most cases cloud data warehouse is the better choice nowadays!

## Massive parallel processing (MPP)

Work load is split up and processed individually
* Modern way of solving performance issues
* Millions of rows can be processed faster
* Many people can run queries at the same time with good performance
* Helpful with centralizing massive amounts of data

## Columnar storage

* Less data need to be processed!
* Better compression, less storage
* Important factor in improving analytical query performance

