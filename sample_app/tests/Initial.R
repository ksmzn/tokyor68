app <- ShinyDriver$new("../")
app$snapshotInit("Initial")

app$snapshot()
app$setInputs(sepal_col = "Sepal.Width")
app$snapshot()
