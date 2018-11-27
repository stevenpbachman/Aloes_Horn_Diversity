This document describes methods used in the paper **'Aloes Horn of Africa'**. Each headings relates to sections in the manuscript. See [Aloes_Horn_Diversity](https://github.com/stevenpbachman/Aloes_Horn_Diversity) for raw data and related documents.

### Methods

*Aloe occurrence data:*

Specimen data were derived from a database of collections from herbaria including ETH, K, EA, UPS, PRE, and some from FT and other institutions. The taxonomic treatments were verified by one of us (Demissew)

  # import specimens
  specimens_all<- read_csv("01_data/specimens_all.csv")




Get Aloe Red List assessment data:

  #install.packages("rredlist")
  library(rredlist)

  # note the version of the Red List
  rl_ver = rredlist::rl_version(key = rlkey)

