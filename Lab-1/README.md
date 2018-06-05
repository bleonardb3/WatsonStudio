# Machine Learning with Spark ML

[<img src="https://raw.githubusercontent.com/Davin-IBM/Proof-of-Technology/master/DSX/images/DSX.png" height="150"/>](http://datascience.ibm.com/) [<img src="https://github.com/jpatter/LMCO/blob/master/Lab-1/images/DB2Warehouse.png" height="150"/>](https://www.ibm.com/analytics/us/en/technology/cloud-data-services/dashdb/)

[<img src="https://raw.githubusercontent.com/Davin-IBM/Proof-of-Technology/master/DSX/images/jupyter.png" height="150"/>](http://jupyter.org/index.html) [<img src="https://raw.githubusercontent.com/Davin-IBM/Proof-of-Technology/master/DSX/images/spark.png" height="150"/>](http://spark.apache.org/)

In this lab, you will use SparkML in IBM's Watson Studio to run generated travel data through a machine learning algorithm, automatically tune the algorithm, and load the results into Cloud Object Storage. 

## Objectives:
Upon completing the lab, you will know how to:


1. Connect to cloud object storage and read data used for machine learning.
2. Identify labels and transform data.
3. Conduct feature engineering for algorithm data.
4. Declare a machine learning model.
5. Setup the Pipeline for data transofms and training.
6. Train the data.
7. Show and evaluate machine learning results.
8. Automatically tune machine learning results.
9. Score data and load results into cloud object storage. 

## Instructions:

### Step 1. Right click on the [link](https://github.com/bleonardb3/WatsonStudio/blob/master/Lab-1/data/female_human_trafficking.csv) and then click on the `Save link as...` and then click `Save` to download the `female_human_trafficking file` to your computer. Don't change the name of the file. 

### Step 2.  Log into your [Watson Studio](http://datascience.ibm.com/) account, then click Projects in the top menubar and select the project you created at the beginning of this proof of technology.
<img src="https://github.com/bleonardb3/WatsonStudio/blob/master/Lab-1/images/Select%20Project.png"/>

### Step 3.  Click the `Add to project > Data Asset` link in the top right of your project pane. 
<img src="https://github.com/bleonardb3/WatsonStudio/blob/master/Lab-1/images/Add%20to%20Project%20Data%20Asset.png"/>

### Step 4.  Click on `browse`. 
<img src="https://github.com/bleonardb3/WatsonStudio/blob/master/Lab-1/images/Click%20Browse.png"/>

### Step 5. Navigate to the folder where you downloaded the `female_human_trafficking.csv` file. Click on the file, and then click on `Open`.
<img src="https://github.com/bleonardb3/WatsonStudio/blob/master/Lab-1/images/Navigate%20to%20File.png"/>

### Step 6. Click on the `Assets` tab (if you are not already on that panel) and you should see `female_human_trafficking.csv` listed under the `Data Assets` category. 

### Step 7.  Click the `Add to project > Notebook` link in the top right of your project pane.
<img src="https://github.com/bleonardb3/WatsonStudio/blob/master/Lab-1/images/Add%20to%20Project.png"/>

### Step 8.  Click the `From URL` tab under `Create Notebook`. Give the notebook a name in the `Name` field, for example `Machine learning with SparkML` and optionally you can give it a description. In the Notebook URL field, use

`https://github.com/bleonardb3/WatsonStudio/blob/master/Lab-1/Categorizing-Vetted-Data.ipynb` 

In the `Select runtime` field, make sure to select the Spark service, and then click on `Create Notebook`

<img src="https://github.com/bleonardb3/WatsonStudio/blob/master/Lab-1/images/Create%20Notebook.png"/>

### Step 9.  Follow the instructions in the notebook.

<img src="https://github.com/bleonardb3/WatsonStudio/blob/master/Lab-1/images/Notebook.png"/>
