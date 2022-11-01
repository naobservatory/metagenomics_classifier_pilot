import pandas

file = "czid_upload_metadata_clean.csv"

df = pandas.read_csv(file, sep=",")

#In czid_upload_metadata_clean.csv, change the "Collection Date" column from "YYYY-MM-DD" to "YYYY-MM".

df["Collection Date"] = df["Collection Date"].str.replace("-[0-9][0-9]$", "")

df.to_csv("czid_upload_metadata_clean_dates.csv", index=False)