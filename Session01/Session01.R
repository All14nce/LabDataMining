# variable 
name <- "budi"

# =
name1 = "cici"

name
name1

"tim" -> name2

name2

# int, string, double

# pembagian jenis tipe data
# scalar -> menampung satu data saja: num, int, string, double

# non scalar -> vector, matrix, table

# membuat vector
# combine
# : -> slicing
vect1 <- c(1,2,3,4,5)
vect2 <- c(1:100)

vect1
vect2

# access value di R
vect1[1]

# matrix
mtx1 <- matrix(c(1:50), nrow = 5, ncol = 5, byrow = TRUE, dimnames = list(
  c("row1", "row2", "row3", "row4", "row5"),
  c("col1", "col2", "col3", "col4", "col5")
))

mtx1

# access value matrix
# cara 1
mtx1[1][1]

# cara 2
# format ambil column seluruhnya
# nama_matrix[row, col]
# col tidak dikasih ke berapa, maka akan ambil seluruh kolom
mtx1[1,]

# ambil semua nilai dari baris pertama sampai terakhir yang ada di kolom pertama
mtx1[,1]

# perkalian setiap value dari dimensi matrix
mtx2 <- matrix(c(1:50), nrow = 5, ncol = 5)
mtx2

mtx1
mtx2

mtx1 * mtx2

# perkalian matrix
mtx3 <- matrix(c(1,2,3,4), nrow = 2, ncol = 2)
mtx4 <- matrix(c(1,2,3,4), nrow = 2, ncol = 4)

mtx3 %*% mtx4

# function
f1 <- function(x,y){
  total <<- x + y
}

f1(1,2)

total

f2 <- function(){
  "hellow world"
}

f2()

# import data
score <- read.csv(file = "Score.csv", fileEncoding = "UTF-8-BOM")
score

score$Course.Code
