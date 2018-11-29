data <- tibble(english = c("A","B","C","D","E","F"),
               french = c("AA", "BB", "CC", "DD", "EE", "FF"))

en <- function(txt, translate = TRUE){
  if(!translate)
    return(txt)
  trans(txt, TRUE)
}

fr <- function(txt, translate = TRUE){
  if(!translate)
    return(txt)
  trans(txt, TRUE)
}

trans <- function(x, french = FALSE){
  if(french){
    col <- "french"
    col2 <- "english"
  }else{
    col <- "english"
    col2 <- "french"
  }
  
  from <- data[,col, drop = TRUE]
  to <- data[,col2, drop = TRUE]

  j <- match(x, from)
  v <- to[j]
  v[is.na(j)] <- x[is.na(j)]
  v
}

