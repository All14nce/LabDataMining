# Understanding Data
  # 1. Duplikat Data
  # 2. Data N/A



#DATA FRAME -> Ada dua cara
  #1. Data Frame: Vector 
  # c() -> data.frame(id=c(), #name = c())
  #2. Olah data dari CSV



#HANDLE NA
  #List of Names
  names <- c("Joko", "Budi", "Budi", "Dedi", NA,  NA)
  
  #1. Mengecek NA -> is.na
  is.na(names)
  sum(is.na(names))
  
  #2. Menghapus NA
  names <- names[!is.na(names)]
  names


#DUPLICATE
  #1. Mengecek duplikat
  duplicated(names)
  # duplicated(names, incomparables = c("Budi"))
  sum(duplicated(names))
  
  #2. Menghapus duplikat
  names <- names[!duplicated(names)]
  names


#DATA FRAME
  #1. Bikin sendiri
  student <- c("Budi", "Joko", "Joko", "Budi", NA, NA)
  score <- c(NA, 100, 90, 75, NA, 80)
  student
  score
  
  df <- data.frame(
    students = student, scores = score
  )
  df
  
    #- Remove NA pake is.na
    df <- df[!is.na(df$scores), ]
    df <- df[!is.na(df$students), ]
    df
  
    # - Remove NA dari data frame
    df <- na.omit(df)
    df
    
    # - Remove Duplicate
    sum(duplicated(df))
    df <- df[!duplicated(df$students), ]
    df
    
  #2. Dari CSV
  data <- read.csv('supermarket_sales.csv', 
                   fileEncoding = 'UTF-8-BOM',
                   na.strings = "")
  data
  
    #- Remove data NA
    sum(is.na(data))
    data <- na.omit(data)
    sum(is.na(data))
    
    #- Remove duplicate
    sum(duplicated(data))
    data <- data[!duplicated(data$Invoice.ID), ]
    
    #- Ambil Data
    data <- subset( data, 
                    data$Branch %in% 'A',
                    select = c("Branch", "Product.line", "Gender", "Unit.price", "Quantity"))
    
    #- Mencari total nilai dari unitprice * quantity
    total <- data$Unit.price * data$Quantity
    data$Total = total
    
    #- Konversi -> Dua Cara
    
      #1. Konversi: Manual
      
        #- Mengubah gender female jadi F
        gender <- data$Gender
        gender[gender =="Female"] <- "F"
        
        sum(gender == "F")
        gender
        
        #- Mengubah gender male jadi M
        gender[gender =="Male"] <- "M"
        sum(gender == "M")
        gender
        
        #- Masukan hasil konversi
        data$Gender = gender
        data$Gender
      
      #2. Cara Cepat Konversi
      data$Gender[data$Gender == "Female"] <- "F"
      data$Gender[data$Gender == "Male"] <- "M"
    
    #- Mencari nilai mean
    mean(data$Total)
    
    #- Mencari nilai median
    median(data$Total)
    
    #-  Summary Data
    summary(data)