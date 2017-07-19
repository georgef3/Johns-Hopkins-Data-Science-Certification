##Programming Week 2, Part 3 Third Attempt
corr <- function(specdata, threshold = 0) {
        files_full <- list.files(specdata, full.names = TRUE)
        dat <- vector(mode = "numeric", length = 0)
        
        for (i in 1:length(files_full)) {
                moni_i <- read.csv(files_full[i])
                csum <- sum((!is.na(moni_i$sulfate)) & (!is.na(moni_i$nitrate)))
                if (csum > threshold) {
                        tmp <- moni_i[which(!is.na(moni_i$sulfate)), ]
                        submoni_i <- tmp[which(!is.na(tmp$nitrate)), ]
                        dat <- c(dat, cor(submoni_i$sulfate, submoni_i$nitrate))
                }
        }
        
        dat
}

cr <- corr(specdata, 150)
head(cr)