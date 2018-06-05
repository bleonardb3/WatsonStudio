# credentials

# Obtain the object storage credentials - you can get these from the Lab-1 notebook in the section on writing to Object Storage. 
# Replace the fields marked INSERT HERE

credentials <-list(
  endpoint = "https://s3-api.us-geo.objectstorage.service.networklayer.com",
  api.key = "INSERT HERE",
  service.id = "INSERT HERE",
  bucket.name = "INSERT HERE",
  file.name = "female_human_trafficking.csv",
  iam.service.endpoint = "https://iam.ng.bluemix.net/oidc/token")
