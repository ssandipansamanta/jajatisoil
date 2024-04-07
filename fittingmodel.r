library("caret")
fitting_model <- function(url_to_data){
  # url <- "https://raw.githubusercontent.com/jajatisoil/jajatisoil/main/data_all.csv"
  # local_path <- "Data_All.xlsx"
  # download.file(url, local_path, method = "auto")
  # data <- read_excel(url)
  data <- read.csv(url_to_data)
  
  # Converting the categorical variable as a factor
  data$Category <- as.factor(data$Category)
  
  # Partition data - train (80%) & test (20%)
  set.seed(5678)
  ind <- sample(2, nrow(data), replace = TRUE, prob = c(0.8, 0.2))
  train <- data[ind == 1, ]
  test <- data[ind == 2, ]
  
  # Train the model
  fitControl <- trainControl(method = "repeatedcv", number = 10, repeats = 5)
  
  #Random Forest
  set.seed(7186)
  RF<-train(Category~.,data=train,
            method='rf', trControl=fitControl,tuneLength=4,ntree=100*(ncol(train)-1))
  
  base::saveRDS(RF, file = "model.RData")
  rm(RF)
  
}

fitting_model(url_to_data = "https://raw.githubusercontent.com/jajatisoil/jajatisoil/main/data_all.csv")
