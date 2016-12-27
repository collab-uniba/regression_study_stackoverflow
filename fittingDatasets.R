#Import the datasets to match
ds1 <- read.csv2("example1.csv")
ds2 <- read.csv2("example2.csv")

# %in% operator allows for quick matching controls between two columns of datasets. The datasets must have values comparable in at least one column
booleanVector1 <- ds1$PostId %in% ds2$PostId
booleanVector2 <- ds2$PostId %in% ds1$PostId

#A new dataset is created having only the rows included in the boolean condition stated by %in%
ds1Conditioned <- ds1[booleanVector1, ]
ds2Conditioned <- ds2[booleanVector2, ]

#Now they share the same number of rows, and they can be merged by use of the merge() function. the "by.x" and "by.y" parameters allow for the 
# comparison of the column in the first dataset (x), and the column in the second (y), resulting in the datasets joined together by comparison of those columns
finalDs <- merge(ds1Conditioned, ds2Conditioned, by.x = "PostId", by.y = "PostId")
