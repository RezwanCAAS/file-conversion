
library(readr)
library(openxlsx)


txt_data <- read_delim("/Users/tariqr/Desktop/allele_matching/all_comparison/combined2.txt", delim = "\t")
head(txt_data)

write.xlsx(txt_data, "combined2.xlsx")


# for multiple files in a directory
file_list <- list.files(pattern = "output_.*_compared\\.txt")

# Iterate through each file and convert to .xlsx
for (file in file_list) {
  # Read data from the current file
  txt_data <- read_delim(file, delim = "\t")
  
  # Extract the filename without extension
  filename <- tools::file_path_sans_ext(file)
  
  # Write data to .xlsx file
  write.xlsx(txt_data, paste0(filename, ".xlsx"))
}
