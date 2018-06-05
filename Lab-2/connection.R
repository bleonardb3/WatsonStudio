# connection.R
# Connect to the files in object storage using a Spark connector
# 1. female_human_trafficking.csv
# 2. trafficking_results.csv

# First obtain the object storage credentials - you can get these from the Lab-1 notebook. 

# ************************   INSERT OBJECT STORAGE CREDENTIALS  **************************************

credentials <-list(
  endpoint = "https://s3-api.us-geo.objectstorage.service.networklayer.com",
  api.key = "INSERT HERE",
  service.id = "INSERT HERE",
  bucket.name = "INSERT HERE",
  file.name = "female_human_trafficking.csv",
  iam.service.endpoint = "https://iam.ng.bluemix.net/oidc/token")


# First, connect to the Spark service using sparklyr’s spark_connect function. 
library(sparklyr)
library(dplyr)
kernels <- list_spark_kernels()
sc <- spark_connect(config = kernels[1])

# Next obtain the object storage credentials - you can get these from the Lab-1 notebook. Replace the fields marked 
# INSERT HERE

#source('credentials.R', local = TRUE)


# Now in order for us to access Cloud Object Storage file ‘female_human_trafficking.csv’ and 'trafficking_results.csv', 
# we need to use “stocator” COS connector which is by default installed on Spark service from IBM Cloud(Bluemix)
# and we will use IAM authentication.

# Stocator does require you to set your Cloud Object Storage credentials in Hadoop Configuration, 
# so we need to get Java Context from sparkcontext to set hadoop configuration values for Stocator.

# Get the Java Context from spark context to set the S3 credentials needed to connect S3 bucket. 
# Spark Java Context let you access JVM properties for your spark Cluster

ctx <- sparklyr::spark_context(sc)
jsc <- invoke_static( sc, "org.apache.spark.api.java.JavaSparkContext", "fromSparkContext", ctx )

# Now we will set the Hadoop configuration since using java spark context
hconf <- jsc %>% invoke("hadoopConfiguration")
hconf %>% invoke("set","fs.cos.myCos.iam.api.key", paste(credentials["api.key"]))
hconf %>% invoke("set","fs.cos.myCos.iam.service.id", paste(credentials["sevice.id"]))
hconf %>% invoke("set","fs.cos.myCos.endpoint", paste(credentials["endpoint"]))

# Now lets build the path that we want read from, first is scheme as we set in hadoop configuration
# that is “cos”. # Then “.myCos” is what we set in hadoop configuration and finally followed by the file name or filepath 
# from where you are trying to read under this bucket.

path <- paste("cos://",paste(credentials["bucket.name"]),".myCos/female_human_trafficking.csv",sep="")
#dplyr::db_drop_table(sc, "female_human_trafficking_tbl")

spark_female_human_trafficking_df <- spark_read_csv(sc,name = "female_human_trafficking_tbl",path = path)
r_female_human_trafficking_df <- collect(spark_female_human_trafficking_df)

path <- paste("cos://",paste(credentials["bucket.name"]),".myCos/trafficking_results.csv",sep="")
#dplyr::db_drop_table(sc, "trafficking_results_tbl")

spark_trafficking_results_df <- spark_read_csv(sc,name = "trafficking_results_tbl",path = path)
r_trafficking_results_df <- collect(spark_trafficking_results_df)


