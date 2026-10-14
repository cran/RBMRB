## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  eval = FALSE   # all chunks require internet — not run during R CMD CHECK
)

## ----setup--------------------------------------------------------------------
# library(RBMRB)

## ----test---------------------------------------------------------------------
# bmrb_test()

## ----fetch--------------------------------------------------------------------
# # Fetch entry 15060 (returns nested list: dataset -> chain -> seq_id -> atom -> ppm)
# cs <- cs_from_bmrb(15060)
# 
# # Preview first few residues
# cs_peek(cs)
# 
# # Convert to a flat data.frame for dplyr/ggplot2 workflows
# df <- cs_to_df(cs)
# head(df)

## ----file---------------------------------------------------------------------
# cs_file <- cs_from_file("my_protein.str")
# cs_peek(cs_file)

## ----spectra------------------------------------------------------------------
# # 1H-15N HSQC coloured by residue type
# n15hsqc(bmrb_ids = 15060, legend = "residue")
# 
# # Overlay two entries with shift-tracking lines
# n15hsqc(bmrb_ids = c(17076, 17077),
#         legend     = "dataset",
#         draw_trace = TRUE)
# 
# # 1H-13C HSQC
# c13hsqc(bmrb_ids = 15060, legend = "residue")
# 
# # 1H-1H TOCSY
# tocsy(bmrb_ids = 15060)
# 
# # Generic 2D: N vs CA with sequence walk
# generic_2d("N", "CA", bmrb_ids = 15060, seq_walk = TRUE)

## ----export-------------------------------------------------------------------
# pl <- create_n15hsqc_peaklist(bmrb_ids = 15060)
# 
# # CSV
# export_peak_list(pl, "peaks.csv")
# 
# # Sparky format
# export_peak_list(pl, "peaks.sparky", output_format = "sparky")

## ----histograms---------------------------------------------------------------
# # 1D histogram for ALA CA
# cs_hist("ALA", "CA")
# 
# # Compare multiple residue-atom pairs
# cs_hist(list_of_atoms = c("ALA-CA", "GLY-CA", "SER-CA"))
# 
# # 2D correlation heatmap
# cs_hist2d("ALA", "CA", "CB")
# 
# # Conditional distribution: N shifts of SER given CA ~ 55.5 ppm
# conditional_cs_hist("SER", "N",
#   filtering_rules = list(CA = 55.5),
#   c_tolerance = 2.0)

## ----statistics---------------------------------------------------------------
# # All CA shifts for alanine (returns data.frame)
# df <- get_cs_data("ALA", "CA")
# summary(df$Val)
# 
# # Filter by pH and temperature
# df_filtered <- get_cs_data("ALA", "CA",
#   ph_min = 6.5, ph_max = 7.5,
#   t_min  = 293, t_max  = 303)
# 
# # Paired CA-CB shifts (for scatter plots)
# paired <- get_2d_cs_data("ALA", "CA", "CB")
# plot(paired$atom1, paired$atom2,
#      xlab = "CA (ppm)", ylab = "CB (ppm)")

## ----utilities----------------------------------------------------------------
# # Search by keyword
# bmrb_search("ubiquitin human")
# 
# # Cross-reference with PDB
# bmrb_pdb_ids(15000)
# bmrb_from_pdb("2JM0")
# 
# # Get BibTeX citation
# cat(bmrb_citation(15060, format = "text"))

