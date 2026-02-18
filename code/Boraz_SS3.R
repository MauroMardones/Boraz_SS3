rm(list = ls())
options(bitmapType = "cairo")

# ## Load packages
library(r4ss)
library(ss3diags)
library(mvtnorm)
# library(FLCore)
# library(ggplotFL)
# library(kobe)
require(plyr)
require(dplyr)
require(reshape2)
library(grid)
library(png)
library(kableExtra)
library(here)
library(knitr)
library(tidyverse)

# # install.packages("devtools")
# # install.packages("caTools")
# # library("caTools")
# # # install.packages("r4ss")
# paquetes <- c("stringr",
#               "tidyverse",
#               "kableExtra","ggplot2",
#               "ggthemes",
#                "patchwork",
#               "dplyr","reshape","here","r4ss",
#               "zoo","ss3diags","pdftools",
#               "forcats","ggpubr",
#               "FLCore","ggplotFL",
#               "mvtnorm","kobe","plyr")
# lapply(paquetes, require, character.only = TRUE)

## Process Run Models ---------
# Firstly, the different model configurations were run using the Stock Synthesis executable. The following code chunk outlines the directory structure and execution commands used to run the models. 
# Modelos J Gil  dont run
# dir2 <- here("models", "Basecase_TVsel2018_Polyonly_h06_Mat5-2024length") # Benchmark  with 2024
dir3 <- here("models", "Basecase_TVsel2018_Polyonly_h06_Mat5") # benchmark model 
dir3.b <- here("models", "Basecase_TVsel2018_Polyonly_h06_Mat5-2024length_newCPUEpoly") # lengtth comp from benc
dir4 <- here("models", "Basemodel_newCPUEpoly_6years_raw")
dir5 <- here("models", "Basemodel_newCPUEpoly_6years_ajus")
dir6 <- here("models", "Basemodel_newCPUEpoly_ajus")
dir7 <- here("models", "Basemodel_newCPUEpoly_raw")
dir8 <- here("models", "Basemodel_newCPUEpoly_sel-blocks")
dir9 <- here("models", "Basemodel_newCPUEpoly_catchability_TV")
fig_path<-here("figs")
exe_ss3 <- here("executable", "ss3_opt_osx_arm64")

# debe devolver TRUE

## Run models---------
# # Secondly, the models were executed in a loop to streamline the process.
# # The following code chunk demonstrates how multiple model runs were automated.
# 
# # Lista de directorios para correro tordos juntos
directorios <- c(dir2,
                 dir3,
                 dir3.b,
                 dir4,
                 dir5,
                 dir6,
                 dir7,
                 dir8,
                 dir9)
#  # Agrega aquí todos los nombres de las carpetas que deseas procesar
#
# # Bucle para ejecutar el código en cada directorio
for (dir in directorios) {
  r4ss::run(
    dir = dir,
    exe = exe_ss3, # O bien definen la ruta donde tengan el .exe de SS3
    skipfinished = FALSE,
    show_in_console = TRUE
  )
}
# # Considerar que al correr el modelo dentro de cada `chunk` se cambia el directorio.
# 
# # # Corro escenario por separado
# # r4ss::run(
# #   dir = dir8,
# #   exe = "../../executable/ss3_opt_osx_arm64",
# #   skipfinished = FALSE,
# #   show_in_console = TRUE
# # )

##  Call outputs

# To call main outputs from each model for 
# comparison and further analysis, 


## Read outputs ---------
# the following code chunk demonstrates how to read the outputs using the `SS_output()` function. 
# model2 <- SS_output(dir=dir2,
#                          covar=T,
#                          forecast=T)
model3 <- SS_output(dir=dir3,
                         covar=T,
                         forecast=T)
model3.b <- SS_output(dir=dir3.b,
                         covar=T,
                         forecast=T)
model4 <- SS_output(dir=dir4,
                         covar=T,
                         forecast=T)
model5 <- SS_output(dir=dir5,
                         covar=T,
                         forecast=T)
model6 <- SS_output(dir=dir6,
                         covar=T,
                         forecast=T)
model7 <- SS_output(dir=dir7,
                         covar=T,
                         forecast=T)
model8 <- SS_output(dir=dir8,
                         covar=T,
                         forecast=T)
model9 <- SS_output(dir=dir9,
                         covar=T,
                         forecast=T)
# 
# # #Option para sacar HTML
# SS_plots(model8,
#          uncertainty=T,
#          datplot = T,
#          png=T,
#          aalresids = F,
#          btarg=0.40,
#          minbthresh=0.20,
#          forecast=T)


## Read  SS3 files ---------
# leo archivos para plotear y hacer tablas con "Basemodel"
start1 <- SS_readstarter(file = file.path(dir2,
                                               "starter.ss"),
                              verbose = FALSE)
# note the data and control file names can vary, so are determined from the 
# starter file.
dat1 <- SS_readdat(file = file.path(dir2, start1$datfile),
                        verbose = FALSE)
# Read in ctl file. Note that the data fileR object is needed so that SS_readctl
# assumes the correct data structure
ctl1 <-  r4ss::SS_readctl(file = file.path(dir2,
                                    start1$ctlfil),
                        verbose = FALSE,
                        use_datlist = TRUE, 
                   datlist = dat1)
fore1 <- r4ss::SS_readforecast(file = file.path(dir2, 
                                                "forecast.ss"),
                              verbose = FALSE)
# can also read in wtatage.ss for an empirical wt at age model using
# r4ss::SS_readwtatage()

## Comparisions plots ------

# Labels for model runs
legend.labels <- c(
  "Benchmark Model",
   "S2","S3", "S4", "S5", "S6", "S7"
)

# Read model outputs
biglist <- SSgetoutput(
  dirvec = c(
    dir3,
    dir3.b,
    dir4,
    dir5,
    dir6,
    dir7,
    dir8
  ),
  getcovar = FALSE
)

# Summarize
summaryoutput <- SSsummarize(biglist)

# Plot comparisons
SSplotComparisons(
  summaryoutput,
  legendlabels = legend.labels,
  pheight = 4.5,
  png = FALSE,   # CRÍTICO
  plotdir = fig_path
)

# comtable <- SStableComparisons(summaryoutput,
#                    likenames = c("TOTAL",
#                                  "Survey",
#                                  "Length_comp",
#                                  "Age_comp",
#                                  "priors",
#                                  "Size_at_age"),
#                    names = c("Recr_Virgin",
#                              "R0",
#                              "steep",
#                              "NatM",
#                              "L_at_Amax",
#                              "VonBert_K",
#                              "SSB_Virg",
#                              "Bratio_2024",
#                              "SPRratio_2024"),
#                    digits = NULL,
#                    modelnames = c("Benchmark_Model",
#                                   "S2",
#                                   "S3", "S4", "S5", "S6", "S7"),
#                    csv = FALSE,
#                    csvdir = dir4,
#                    csvfile = "parameter_comparison_table.csv",
#                  verbose = TRUE,
#                    mcmc = FALSE)
# kbl(comtable, booktabs = T,format = "latex",
#     caption = "Comparision between scenarios")  %>%
#     kable_styling(latex_options = "scale_down","hold_position")
# 

par(mfrow=c(2,4), mar=c(5,1,1,1))

rmse3l <- SSplotJABBAres(model3,
               subplots = "len",
               add=T)
mtext("A", side = 3, adj = 0, line = 0.2, cex = 0.8, font = 2)
rmse3bl <- SSplotJABBAres(model3.b,
               subplots = "len",
               add=T)
mtext("B", side = 3, adj = 0, line = 0.2, cex = 0.8, font = 2)
rmse4l <- SSplotJABBAres(model4,
               subplots = "len",
               add=T)
mtext("C", side = 3, adj = 0, line = 0.2, cex = 0.8, font = 2)
rmse5l <- SSplotJABBAres(model5,
               subplots = "len",
               add=T)
mtext("D", side = 3, adj = 0, line = 0.2, cex = 0.8, font = 2)
rmse6l <- SSplotJABBAres(model6,
               subplots = "len",
               add=T)
mtext("E", side = 3, adj = 0, line = 0.2, cex = 0.8, font = 2)
rmse7l <- SSplotJABBAres(model7,
               subplots = "len",
               add=T)
mtext("F", side = 3, adj = 0, line = 0.2, cex = 0.8, font = 2)
rmse8l <- SSplotJABBAres(model8,
               subplots = "len",
               add=T)
mtext("G", side = 3, adj = 0, line = 0.2, cex = 0.8, font = 2)

par(mfrow=c(2,4), mar=c(5,1,1,1))
rmse3c <- SSplotJABBAres(model3,
               subplots = "cpue",
               add=T)
mtext("A", side = 3, adj = 0, line = 0.2, cex = 0.8, font = 2)
rmse3bc <- SSplotJABBAres(model3.b,
               subplots = "cpue",
               add=T)
mtext("B", side = 3, adj = 0, line = 0.2, cex = 0.8, font = 2)
rmse4c <- SSplotJABBAres(model4,
               subplots = "cpue",
               add=T)
mtext("C", side = 3, adj = 0, line = 0.2, cex = 0.8, font = 2)
rmse5c <- SSplotJABBAres(model5,
               subplots = "cpue",
               add=T)
mtext("D", side = 3, adj = 0, line = 0.2, cex = 0.8, font = 2)
rmse6c <- SSplotJABBAres(model6,
               subplots = "cpue",
               add=T)
mtext("E", side = 3, adj = 0, line = 0.2, cex = 0.8, font = 2)
rmse7c <- SSplotJABBAres(model7,
               subplots = "cpue",
               add=T)
mtext("F", side = 3, adj = 0, line = 0.2, cex = 0.8, font = 2)
rmse8c <- SSplotJABBAres(model8,
               subplots = "cpue",
               add=T)
mtext("G", side = 3, adj = 0, line = 0.2, cex = 0.8, font = 2)

# # corro po r separado para no tener todo el rato el compu corriendo
# #do retrospective model runs
# # retro(dir=dir4,
# #       oldsubdir="",
# #       newsubdir="Retrospective",
# #       years= 0:-5,
# #       exe = exe_ss3,
# #       #exe="ss_osx",
# #       extras = "-nox",
# #       skipfinished = F)
# 

## Run Retro--------------
# all retro run
directorios <- c(dir2,
                 dir3,
                 dir3.b,
                 dir4,
                 dir5,
                 dir6,
                 dir7,
                 dir8)
for (dir in directorios) {
  retro(
    dir = dir,
    oldsubdir = "",
    newsubdir = "Retrospective",
    years = 0:-5,
    exe = exe_ss3,
    extras = "-nox",
    skipfinished = FALSE
  )
}


# # s1
# retroModels1 <- SSgetoutput(dirvec=file.path(dir1,
#                                             "Retrospective",
#                                             paste("retro",0:-5,
#                                                   sep="")))
# 
# retroSummary1 <- SSsummarize(retroModels1)
# #s2
retroModels2 <- SSgetoutput(dirvec=file.path(dir2,
                                            "Retrospective",
                                            paste("retro",0:-5,
                                                  sep="")))

retroSummary2 <- SSsummarize(retroModels2)
#s3
retroModels3 <- SSgetoutput(dirvec=file.path(dir3,
                                            "Retrospective",
                                            paste("retro",0:-5,
                                                  sep="")))

retroSummary3 <- SSsummarize(retroModels3)
#s3.b
retroModels3b <- SSgetoutput(dirvec=file.path(dir3.b,
                                            "Retrospective",
                                            paste("retro",0:-5,
                                                  sep="")))

retroSummary3b <- SSsummarize(retroModels3b)
#s4
retroModels4 <- SSgetoutput(dirvec=file.path(dir4,
                                            "Retrospective",
                                            paste("retro",0:-5,
                                                  sep="")))

retroSummary4 <- SSsummarize(retroModels4)
#s5
retroModels5 <- SSgetoutput(dirvec=file.path(dir5,
                                            "Retrospective",
                                            paste("retro",0:-5,
                                                  sep="")))

retroSummary5 <- SSsummarize(retroModels5)
#s6
retroModels6 <- SSgetoutput(dirvec=file.path(dir6,
                                            "Retrospective",
                                            paste("retro",0:-5,
                                                  sep="")))

retroSummary6 <- SSsummarize(retroModels6)
#s7
retroModels7 <- SSgetoutput(dirvec=file.path(dir7,
                                            "Retrospective",
                                            paste("retro",0:-5,
                                                  sep="")))

retroSummary7 <- SSsummarize(retroModels7)
#s8
retroModels8 <- SSgetoutput(dirvec=file.path(dir8,
                                            "Retrospective",
                                            paste("retro",0:-5,
                                                  sep="")))

retroSummary8 <- SSsummarize(retroModels8)

# retro01 <- SSplotRetro(retroSummary01,
#             add=T,
#             forecast = F,
#             legend = T,
#             verbose=F)
par(mfrow=c(2,4), mar=c(5,1,1,1))
# retro1 <- SSplotRetro(retroSummary1,
#             add=T,
#             forecast = F,
#             legend = T,
#             verbose=F,
#             subplots = "SSB",
#             tickEndYr=F,
#             legendloc="left")
# retro2 <- SSplotRetro(retroSummary2,
#             add=T,
#             forecast = F,
#             legend = T,
#             verbose=F,
#             subplots = "F")
retro3 <- SSplotRetro(retroSummary3,
            add=T,
            forecast = F,
            legendloc = "topright",
            verbose=F,
            subplots = "SSB",
            tickEndYr=TRUE)
mtext("A", side = 3, adj = 0, line = 0.2, cex = 0.8, font = 2)
retro3b <- SSplotRetro(retroSummary3b,
            add=T,
            forecast = F,
            legendloc = "topright",
            verbose=F,
            subplots = "SSB",
            tickEndYr=TRUE)
mtext("B", side = 3, adj = 0, line = 0.2, cex = 0.8, font = 2)
retro4 <- SSplotRetro(retroSummary4,
            add=T,
            forecast = F,
            legend = T,
            verbose=F,
            subplots = "SSB",
            tickEndYr=TRUE)
mtext("C", side = 3, adj = 0, line = 0.2, cex = 0.8, font = 2)
retro5 <- SSplotRetro(retroSummary5,
            add=T,
            forecast = F,
            legend = T,
            verbose=F,
            subplots = "SSB",
            tickEndYr=TRUE)
mtext("D", side = 3, adj = 0, line = 0.2, cex = 0.8, font = 2)
retro6 <- SSplotRetro(retroSummary6,
            add=T,
            forecast = F,
            legend = T,
            verbose=F,
            subplots = "SSB",
            tickEndYr=TRUE)
mtext("E", side = 3, adj = 0, line = 0.2, cex = 0.8, font = 2)
retro7 <- SSplotRetro(retroSummary7,
            add=T,
            forecast = F,
            legend = T,
            verbose=F,
            subplots = "SSB",
            tickEndYr=TRUE)
mtext("F", side = 3, adj = 0, line = 0.2, cex = 0.8, font = 2)
retro8 <- SSplotRetro(retroSummary8,
            add=T,
            forecast = F,
            legend = T,
            verbose=F,
            subplots = "SSB",
            tickEndYr=TRUE)
mtext("G", side = 3, adj = 0, line = 0.2, cex = 0.8, font = 2)


# # model01
# tablebias1 <- SShcbias(retroSummary1,quant="SSB",verbose=F)
# tablebias1b <- SShcbias(retroSummary1,quant="F",verbose=F)
# table1 <- rbind(tablebias1, tablebias1b)
# 
# kbl(table1, booktabs = T,format = "latex",
#     caption = "\\label{mod1}Rho parameter in SSB and F model s1")  %>% 
#     kable_styling(latex_options = "HOLD_position")
# 
# # model2
# tablebias2 <- SShcbias(retroSummary2,quant="SSB",verbose=F)
# tablebias2b <- SShcbias(retroSummary2,quant="F",verbose=F)
# table2 <- rbind(tablebias2, tablebias2b)
# 
# kbl(table2, booktabs = T,format = "latex",
#     caption = "\\label{mod2}Rho parameter in SSB  and F model s2")  %>% 
#     kable_styling(latex_options = "HOLD_position")

# model3
tablebias3 <- SShcbias(retroSummary3,quant="SSB",verbose=F)
tablebias3b <- SShcbias(retroSummary3,quant="F",verbose=F)
table3 <- rbind(tablebias3, tablebias3b)


# model3b
tablebias3b <- SShcbias(retroSummary3b,quant="SSB",verbose=F)
tablebias3b2 <- SShcbias(retroSummary3b,quant="F",verbose=F)
table3b <- rbind(tablebias3b, tablebias3b2)


# model4
tablebias4 <- SShcbias(retroSummary4,quant="SSB",verbose=F)
tablebias4b <- SShcbias(retroSummary4,quant="F",verbose=F)
table4 <- rbind(tablebias4, tablebias4b)

# model5
tablebias5 <- SShcbias(retroSummary5,quant="SSB",verbose=F)
tablebias5b <- SShcbias(retroSummary5,quant="F",verbose=F)
table5 <- rbind(tablebias5, tablebias5b)


# model6
tablebias6 <- SShcbias(retroSummary6,quant="SSB",verbose=F)
tablebias6b <- SShcbias(retroSummary6,quant="F",verbose=F)
table6 <- rbind(tablebias6, tablebias6b)


# model7
tablebias7 <- SShcbias(retroSummary7,quant="SSB",verbose=F)
tablebias7b <- SShcbias(retroSummary7,quant="F",verbose=F)
table7 <- rbind(tablebias7, tablebias7b)


# model8
tablebias8 <- SShcbias(retroSummary8,quant="SSB",verbose=F)
tablebias8b <- SShcbias(retroSummary8,quant="F",verbose=F)
table8 <- rbind(tablebias8, tablebias8b)



par(mfrow=c(2,4), mar=c(5,1,1,1))
# hcl = SSplotHCxval(retroSummary1, 
#                    add = T, 
#                    verbose = F, 
#                    ylimAdj = 1.3,
#                    legendcex = 0.7, 
#                    indexselect = 2)
# hcl2 = SSplotHCxval(retroSummary2, 
#                    add = T, 
#                    verbose = F, 
#                    ylimAdj = 1.3,
#                    legendcex = 0.7, 
#                    indexselect = 2)
hcl3 = SSplotHCxval(retroSummary3, 
                   add = T, 
                   verbose = F, 
                   ylimAdj = 1.3,
                   legendcex = 0.7, 
                   indexselect = 1)
mtext("A", side = 3, adj = 0, line = 0.2, cex = 0.8, font = 2)
hcl3b = SSplotHCxval(retroSummary3b, 
                   add = T, 
                   verbose = F, 
                   ylimAdj = 1.3,
                   legendcex = 0.7, 
                   indexselect = 1)
mtext("B", side = 3, adj = 0, line = 0.2, cex = 0.8, font = 2)
hcl4 = SSplotHCxval(retroSummary4, 
                   add = T, 
                   verbose = F, 
                   ylimAdj = 1.3,
                   legendcex = 0.7, 
                   indexselect = 1)
mtext("C", side = 3, adj = 0, line = 0.2, cex = 0.8, font = 2)
hcl5 = SSplotHCxval(retroSummary5, 
                   add = T, 
                   verbose = F, 
                   ylimAdj = 1.3,
                   legendcex = 0.7, 
                   indexselect = 1)
mtext("D", side = 3, adj = 0, line = 0.2, cex = 0.8, font = 2)
hcl6 = SSplotHCxval(retroSummary6, 
                   add = T, 
                   verbose = F, 
                   ylimAdj = 1.3,
                   legendcex = 0.7, 
                   indexselect = 1)
mtext("E", side = 3, adj = 0, line = 0.2, cex = 0.8, font = 2)
hcl7 = SSplotHCxval(retroSummary7, 
                   add = T, 
                   verbose = F, 
                   ylimAdj = 1.3,
                   legendcex = 0.7, 
                   indexselect = 1)
mtext("F", side = 3, adj = 0, line = 0.2, cex = 0.8, font = 2)
hcl8 = SSplotHCxval(retroSummary8, 
                   add = T, 
                   verbose = F, 
                   ylimAdj = 1.3,
                   legendcex = 0.7, 
                   indexselect = 1)
mtext("", side = 3, adj = 0, line = 0.2, cex = 0.8, font = 2)



### Likelihood profile for steepness (not implemented yet, but code chunk is here for future reference)
# # Definir directorios base y de perfil
# prof4 <- here("models",
#               "Basemodel_newCPUEpoly",
#               "likeprofile")
# dir.create(prof4, showWarnings = FALSE)
# 
# # Directorio del modelo base 
# dirname.model.run <- dir5
# 
# #  Directorio del perfil de verosimilitud 
# dirname.likeprof <- file.path(dirname.model.run, "likeprof")
# dir.create(dirname.likeprof, showWarnings = FALSE, recursive = TRUE)
# 
# # ---- Subdirectorio para plots 
# plotdir <- file.path(dirname.likeprof, "plots_likelihood")
# dir.create(plotdir, showWarnings = FALSE, recursive = TRUE)
# 
# # ---- Subdirectorio "simple" (modelo base limpio) 
# reference.dir <- file.path(dirname.likeprof, "simple")
# dir.create(reference.dir, showWarnings = FALSE, recursive = TRUE)
# 

# # Copiar el modelo base completo a simple
# file.copy(
#   Sys.glob(file.path(dirname.model.run, "*.*")),
#   reference.dir,
#   overwrite = TRUE
# )
# 
# # read outputs
# # Base <- SS_output(dir = reference.dir, covar = TRUE)
# # Copiar solo los inputs SS3 necesarios al directorio del perfil
# copy_SS_inputs(
#   dir.old  = reference.dir,
#   dir.new  = dirname.likeprof,
#   copy_exe = TRUE,
#   verbose  = FALSE
# )
# # Leer inputs del modelo para edición
# inputs <- SS_read(dir = dirname.likeprof)
# # Ajustes necesarios para el perfil. Permitir estimación de recdevs
# inputs$ctl$recdev_phase <- 1
# # Usar valores iniciales del modelo base
# inputs$start$init_values_src <- 0
#  # Usar likelihood de priors para parámetros fijados
# inputs$start$prior_like <- 1
# # Forzar control modificado para el perfil
# inputs$start$ctlfile <- "control_modified.ss"
# # Escribir el modelo modificado
# SS_write(inputs, dir = dirname.likeprof, overwrite = TRUE)
# 
# # Escribir el modelo modificado
# h.vec <- seq(0.3, 0.9, by = 0.05)
# Nprof <- length(h.vec)
# 
# prof_h <- profile(
#   dir        = dirname.likeprof,
#   exe        = exe_ss3,
#   oldctlfile = "control.ss",
#   newctlfile = "control_modified.ss",
#   string     = "SR_BH_steep",
#   profilevec = h.vec
# )

# # Leer las salidas del perfil
# prof.models <- SSgetoutput(
#   dirvec  = dirname.likeprof,
#   keyvec  = 1:Nprof,
#   getcovar = FALSE
# )
# 
# prof.summary <- SSsummarize(prof.models)
# # Componentes principales de verosimilitud
# 
# mainlike_components <- c(
#   "TOTAL",
#   "Survey",
#   "Length_comp",
#   "Age_comp",
#   "Catch",
#   "Size_at_age",
#   "Recruitment"
# )
# 
# mainlike_labels <- c(
#   "Total likelihood",
#   "Index likelihood",
#   "Length likelihood",
#   "Age likelihood",
#   "Catch likelihood",
#   "Size-at-age likelihood",
#   "Recruitment likelihood"
# )
# 

# # Plot del perfil de verosimilitud (TOTAL)
# png(file.path(plotdir, "steepness_profile_TOTAL.png"),
#     width = 7, height = 4.5, res = 300, units = "in")
# 
# par(mar = c(5,4,1,1))
# 
# SSplotProfile(
#   prof.summary,
#   profile.string = "steep",
#   profile.label  = expression(italic(h)),
#   components     = mainlike_components,
#   component.labels = mainlike_labels,
#   add_cutoff     = TRUE,
#   cutoff_prob    = 0.95,
#   print          = FALSE
# )
# 
# Baseval <- round(
#   Base$parameters$Value[
#     grep("SR_BH_steep", Base$parameters$Label)
#   ], 2
# )
# 
# axis(1, at = Baseval, labels = Baseval)
# abline(v = Baseval, lty = 2)
# 
# dev.off()
# 

# # Comparación de series de tiempo entre perfiles
# labs <- paste("h =", h.vec)
# labs[which(round(h.vec,2) == Baseval)] <- paste("h =", Baseval, "(Base model)")
# 
# SSplotComparisons(
#   prof.summary,
#   legendlabels = labs,
#   png = TRUE,
#   plotdir = plotdir,
#   legendloc = "bottomleft",
#   pheight = 4.5
# )

# # Piner plots – ejemplo para índices (Survey likelihood)
# par(mar = c(5,4,1,1))
# 
# PinerPlot(
#   prof.summary,
#   profile.string = "steep",
#   component = "Surv_like",
#   main = "Changes in index likelihoods by fleet",
#   add_cutoff = TRUE,
#   cutoff_prob = 0.95
# )
# 
# axis(1, at = Baseval, labels = Baseval)
# abline(v = Baseval, lty = 2)
# 
# ggsave(
#   filename = file.path(plotdir, "steepness_profile_Survey_like.png"),
#   width = 7,
#   height = 4.5,
#   dpi = 300
# )
# 

# # table
# prof_h_models <- SSgetoutput(
#   dirvec   = dirname.likeprof,
#   keyvec   = seq_along(h.vec),
#   getcovar = FALSE
# )


## Kobe plots ----------

par(mfrow=c(2,4), mar=c(5,1,1,1))
# mvln_2 <- SSdeltaMVLN(model2,
#                      Fref = "MSY",
#                      plot = TRUE,
#                      addprj = TRUE,
#                      virgin = TRUE,
#                      mc = 100)

mvln_3 <- SSdeltaMVLN(model3,
                     Fref = "MSY",
                     plot = TRUE,
                     addprj = TRUE,
                     virgin = TRUE,
                     mc = 100)
mtext("A", side = 3, adj = 0, line = 0.2, cex = 0.8, font = 2)

mvln_3.b <- SSdeltaMVLN(model3,
                     Fref = "MSY",
                     plot = TRUE,
                     addprj = TRUE,
                     virgin = TRUE,
                     mc = 100)
mtext("B", side = 3, adj = 0, line = 0.2, cex = 0.8, font = 2)

mvln_4 <- SSdeltaMVLN(model4,
                     Fref = "MSY",
                     plot = TRUE,
                     addprj = TRUE,
                     virgin = TRUE,
                     mc = 100)
mtext("C", side = 3, adj = 0, line = 0.2, cex = 0.8, font = 2)

mvln_5 <- SSdeltaMVLN(model5,
                     Fref = "MSY",
                     plot = TRUE,
                     addprj = TRUE,
                     virgin = TRUE,
                     mc = 100)
mtext("D", side = 3, adj = 0, line = 0.2, cex = 0.8, font = 2)

mvln_6 <- SSdeltaMVLN(model6,
                     Fref = "MSY",
                     plot = TRUE,
                     addprj = TRUE,
                     virgin = TRUE,
                     mc = 100)
mtext("E", side = 3, adj = 0, line = 0.2, cex = 0.8, font = 2)

mvln_7 <- SSdeltaMVLN(model7,
                     Fref = "MSY",
                     plot = TRUE,
                     addprj = TRUE,
                     virgin = TRUE,
                     mc = 100)
mtext("F", side = 3, adj = 0, line = 0.2, cex = 0.8, font = 2)


mvln_8 <- SSdeltaMVLN(model8,
                     Fref = "MSY",
                     plot = TRUE,
                     addprj = TRUE,
                     virgin = TRUE,
                     mc = 100)
mtext("G", side = 3, adj = 0, line = 0.2, cex = 0.8, font = 2)


## Diagnostics ----------

# Modelo 3
diag3 <- data.frame(
  Scenario = "Benchmark",
  Convergency = model3$maximum_gradient_component,
  AIC = as.numeric(2 * dim(model3$estimated_non_dev_parameters)[1] + 2 * model3$likelihoods_used[1, 1]),
  Total_like = model3$likelihoods_used$values[rownames(model3$likelihoods_used) == "TOTAL"],
  N_Params = as.numeric(2 * dim(model3$estimated_non_dev_parameters)[1]),
  Index_like = model3$likelihoods_used$values[rownames(model3$likelihoods_used) == "Survey"],
  Length_comp_like = model3$likelihoods_used$values[rownames(model3$likelihoods_used) == "Length_comp"],
  RMSE_index = rmse3c$RMSE.perc[rmse3c$indices == "Combined"],
  RMSE_length = rmse3l$RMSE.perc[rmse3l$indices == "Combined"],
  MASE = mean(hcl3$MAE.base, na.rm = TRUE),
  Retro_Rho_ssb = tablebias3[5, 3],
  Forecast_Rho_ssb = tablebias3[5, 4],
  Forecast_Rho_f = tablebias3b[5, 3],
  Rho_f = tablebias3b[5, 4]
)

# Modelo 3b
diag3.b <- data.frame(
  Scenario = "S2", #Benchmark_newCPUEpoly
  Convergency = model3.b$maximum_gradient_component,
  AIC = as.numeric(2 * dim(model3.b$estimated_non_dev_parameters)[1] + 2 * model3.b$likelihoods_used[1, 1]),
  Total_like = model3.b$likelihoods_used$values[rownames(model3.b$likelihoods_used) == "TOTAL"],
  N_Params = as.numeric(2 * dim(model3.b$estimated_non_dev_parameters)[1]),
  Index_like = model3.b$likelihoods_used$values[rownames(model3.b$likelihoods_used) == "Survey"],
  Length_comp_like = model3.b$likelihoods_used$values[rownames(model3.b$likelihoods_used) == "Length_comp"],
  RMSE_index = rmse3bc$RMSE.perc[rmse3bc$indices == "Combined"],
  RMSE_length = rmse3bc$RMSE.perc[rmse3bc$indices == "Combined"],
  MASE = mean(hcl3b$MAE.base, na.rm = TRUE),
  Retro_Rho_ssb = tablebias3b[5, 3],
  Forecast_Rho_ssb = tablebias3b[5, 4],
  Forecast_Rho_f = tablebias3b2[5, 3],
  Rho_f = tablebias3b[5, 4]
)


# Modelo 4
diag4 <- data.frame(
  Scenario = "S3", # "Basemodel_newCPUEpoly_6years_raw",
  Convergency = model4$maximum_gradient_component,
  AIC = as.numeric(2 * dim(model4$estimated_non_dev_parameters)[1] + 2 * model4$likelihoods_used[1, 1]),
  Total_like = model4$likelihoods_used$values[rownames(model4$likelihoods_used) == "TOTAL"],
  N_Params = as.numeric(2 * dim(model4$estimated_non_dev_parameters)[1]),
  Index_like = model4$likelihoods_used$values[rownames(model4$likelihoods_used) == "Survey"],
  Length_comp_like = model4$likelihoods_used$values[rownames(model4$likelihoods_used) == "Length_comp"],
  RMSE_index = rmse4c$RMSE.perc[rmse4c$indices == "Combined"],
  RMSE_length = rmse4l$RMSE.perc[rmse4l$indices == "Combined"],
  MASE = mean(hcl4$MAE.base, na.rm = TRUE),
  Retro_Rho_ssb = tablebias4[5, 3],
  Forecast_Rho_ssb = tablebias4[5, 4],
  Forecast_Rho_f = tablebias4b[5, 3],
  Rho_f = tablebias4b[5, 4]
)

# Modelo 5
diag5 <- data.frame(
  Scenario = "S4", #  "Basemodel_newCPUEpoly_6years_ajus",
  Convergency = model5$maximum_gradient_component,
  AIC = as.numeric(2 * dim(model5$estimated_non_dev_parameters)[1] + 2 * model5$likelihoods_used[1, 1]),
  Total_like = model5$likelihoods_used$values[rownames(model5$likelihoods_used) == "TOTAL"],
  N_Params = as.numeric(2 * dim(model5$estimated_non_dev_parameters)[1]),
  Index_like = model5$likelihoods_used$values[rownames(model5$likelihoods_used) == "Survey"],
  Length_comp_like = model5$likelihoods_used$values[rownames(model5$likelihoods_used) == "Length_comp"],
  RMSE_index = rmse5c$RMSE.perc[rmse5c$indices == "Combined"],
  RMSE_length = rmse5l$RMSE.perc[rmse5l$indices == "Combined"],
  MASE = mean(hcl5$MAE.base, na.rm = TRUE),
  Retro_Rho_ssb = tablebias5[5, 3],
  Forecast_Rho_ssb = tablebias5[5, 4],
  Forecast_Rho_f = tablebias5b[5, 3],
  Rho_f = tablebias5b[5, 4]
)

# Modelo 6
diag6 <- data.frame(
  Scenario = "S5", #"Basemodel_newCPUEpoly_ajus",
  Convergency = model6$maximum_gradient_component,
  AIC = as.numeric(2 * dim(model6$estimated_non_dev_parameters)[1] + 2 * model6$likelihoods_used[1, 1]),
  Total_like = model6$likelihoods_used$values[rownames(model6$likelihoods_used) == "TOTAL"],
  N_Params = as.numeric(2 * dim(model6$estimated_non_dev_parameters)[1]),
  Index_like = model6$likelihoods_used$values[rownames(model6$likelihoods_used) == "Survey"],
  Length_comp_like = model6$likelihoods_used$values[rownames(model6$likelihoods_used) == "Length_comp"],
  RMSE_index = rmse6c$RMSE.perc[rmse6c$indices == "Combined"],
  RMSE_length = rmse6l$RMSE.perc[rmse6l$indices == "Combined"],
  MASE = mean(hcl6$MAE.base, na.rm = TRUE),
  Retro_Rho_ssb = tablebias6[5, 3],
  Forecast_Rho_ssb = tablebias6[5, 4],
  Forecast_Rho_f = tablebias6b[5, 3],
  Rho_f = tablebias6b[5, 4]
)

# Modelo 7
diag7 <- data.frame(
  Scenario = "S6",# "Basemodel_newCPUEpoly_raw",
  Convergency = model7$maximum_gradient_component,
  AIC = as.numeric(2 * dim(model7$estimated_non_dev_parameters)[1] + 2 * model7$likelihoods_used[1, 1]),
  Total_like = model7$likelihoods_used$values[rownames(model7$likelihoods_used) == "TOTAL"],
  N_Params = as.numeric(2 * dim(model7$estimated_non_dev_parameters)[1]),
  Index_like = model7$likelihoods_used$values[rownames(model7$likelihoods_used) == "Survey"],
  Length_comp_like = model7$likelihoods_used$values[rownames(model7$likelihoods_used) == "Length_comp"],
  RMSE_index = rmse7c$RMSE.perc[rmse7c$indices == "Combined"],
  RMSE_length = rmse7l$RMSE.perc[rmse7l$indices == "Combined"],
  MASE = mean(hcl7$MAE.base, na.rm = TRUE),
  Retro_Rho_ssb = tablebias7[5, 3],
  Forecast_Rho_ssb = tablebias7[5, 4],
  Forecast_Rho_f = tablebias7b[5, 3],
  Rho_f = tablebias7b[5, 4]
)

# Modelo 8
diag8 <- data.frame(
  Scenario = "S7", #"Basemodel_newCPUEpoly_sel-blocks",
  Convergency = model8$maximum_gradient_component,
  AIC = as.numeric(2 * dim(model8$estimated_non_dev_parameters)[1] + 2 * model8$likelihoods_used[1, 1]),
  Total_like = model8$likelihoods_used$values[rownames(model8$likelihoods_used) == "TOTAL"],
  N_Params = as.numeric(2 * dim(model8$estimated_non_dev_parameters)[1]),
  Index_like = model8$likelihoods_used$values[rownames(model8$likelihoods_used) == "Survey"],
  Length_comp_like = model8$likelihoods_used$values[rownames(model8$likelihoods_used) == "Length_comp"],
  RMSE_index = rmse8c$RMSE.perc[rmse8c$indices == "Combined"],
  RMSE_length = rmse8l$RMSE.perc[rmse8l$indices == "Combined"],
  MASE = mean(hcl8$MAE.base, na.rm = TRUE),
  Retro_Rho_ssb = tablebias8[5, 3],
  Forecast_Rho_ssb = tablebias8[5, 4],
  Forecast_Rho_f = tablebias8b[5, 3],
  Rho_f = tablebias8b[5, 4]
)

diag_all <- rbind(diag3,
                  diag3.b,
                  diag4,
                  diag5,
                  diag6,
                  diag7,
                  diag8)


diag_tidy <- diag_all |>
  pivot_longer(
    cols = -Scenario,
    names_to = "Description",
    values_to = "Value"
  ) |>
  pivot_wider(
    names_from  = Scenario,
    values_from = Value,
    values_fn   = mean
  )
diag_tidy[, -1] <- lapply(
  diag_tidy[, -1],
  function(x) round(as.numeric(x), 3)
)



