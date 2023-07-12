#step1 - reading data
library(rstudioapi)
library(dplyr)
myDir = unlist(strsplit(rstudioapi::getActiveDocumentContext()$path, '/'))
file_path = paste0(myDir[seq_len(length(myDir)-3)], collapse = '/')
data_path=paste0(file_path,"/data/Dataset/UCI HAR Dataset/")
data_path_test=paste0(data_path,"test/")

features_path=data_path_train=paste0(file_path,"/data/Dataset/UCI HAR Dataset/")
features_name=paste0(features_path,"features.txt")
x_test_name=paste0(data_path_test,"X_test.txt")
y_test_name=paste0(data_path_test,"Y_test.txt")
subj_test_name=paste0(data_path_test,"subject_test.txt")
features_lst_tmp<-read.table(features_name,header = FALSE)


features_lst_clean <- gsub("[^[:alnum:]]", "", features_lst_tmp$V2)

x_test=read.table(x_test_name, header = FALSE) 
y_test=read.table(y_test_name, header = FALSE)
subject_test=read.table(subj_test_name,header = FALSE)
names(y_test)="y"
names(subject_test)="subject"
names(x_test)=features_lst_clean
y_test=y_test %>%mutate(train=0)



data_path_train=paste0(data_path,"train/")
x_train_name=paste0(data_path_train,"X_train.txt")
y_train_name=paste0(data_path_train,"y_train.txt")
subj_train_name=paste0(data_path_train,"subject_train.txt")
x_train=read.table(x_train_name, header = FALSE)
y_train=read.table(y_train_name, header = FALSE)
subject_train=read.table(subj_train_name,header = FALSE)
names(y_train)="y"
names(x_train)=features_lst_clean
names(subject_train)="subject"
y_train=y_train %>%mutate(train=1)

#step2- collecting all data together


#a-indicator for train or test+combining x+y
test_all=data.frame(subject_test, y_test,x_test)
train_all=data.frame(subject_train, y_train,x_train)
data_all <- rbind(test_all,train_all)
#rm(features_lst)
features_lst=features_lst_clean
features_to_keep<- features_lst[grep("mean|std",features_lst)]
selected_vars=data_all[,features_to_keep]


#read activity file
activity_name=paste0(features_path,"activity_labels.txt")
activity_labels<-read.table(activity_name,header = FALSE)
names(activity_labels)=c("y","y_label")
#give values to the Ys according to the "DPT" table activity labels
data_all_labels=merge(activity_labels,data_all,by="y")


aggregate_data=data_all_labels %>% 
                group_by(y_label,subject)%>% 
  summarise_all(mean)
     