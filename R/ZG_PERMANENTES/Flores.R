# Flores
# Cargar la biblioteca readxl

f_Flores<-function(directorio,mes,anio){

  #Cargar librerias
  library(readxl)
  library(dplyr)
  library(openxlsx)
  library(zoo)

  #identificar la carpeta
  carpeta=nombre_carpeta(mes,anio)



  # Exportaciones ------------------------------------------------------------------



  # Especifica la ruta del archivo de Excel
  archivos=list.files(paste0(directorio,"/",anio,"/",carpeta,"/consolidado_ISE"))
  elementos_seleccionados <- archivos[grepl("Expos e", archivos) ]
  # Especifica la ruta del archivo de Excel
  Flores <- read.xlsx(paste0(directorio,"/",anio,"/",carpeta,"/consolidado_ISE/",elementos_seleccionados,"/Resumen Exportaciones ",mes_0[mes],"-",anio," - copia.xlsx"),
                       sheet = "PNK")





# Rosas -------------------------------------------------------------------
  Promedio_rosas_2015=4072178.51916667
  Participacion_rosas=0.222549869904597

  n_fila=which(Flores == "011101",arr.ind = TRUE)[,"row"]
  n_col1=which(Flores== paste0((anio-2)," 1"),arr.ind = TRUE)[,"col"]
  n_col2=which(Flores== paste0((anio)," ",mes),arr.ind = TRUE)[,"col"]


  #Tomar el valor que nos interesa
  Indice_rosas=as.numeric(Flores[n_fila[1],n_col1[1]:n_col2[1]])/Promedio_rosas_2015*100

  Indice_rosas_ponderado=Indice_rosas*Participacion_rosas

# Claveles -------------------------------------------------------------------
  Promedio_Claveles_2015=3327397.96666667
  Participacion_Claveles=0.154206418039896

  n_fila=which(Flores == "011102",arr.ind = TRUE)[,"row"]
  n_col1=which(Flores== paste0((anio-2)," 1"),arr.ind = TRUE)[,"col"]
  n_col2=which(Flores== paste0(anio," ",mes),arr.ind = TRUE)[,"col"]



  #Tomar el valor que nos interesa
  Indice_Claveles=as.numeric(Flores[n_fila[1],n_col1[1]:n_col2[1]])/Promedio_Claveles_2015*100

  Indice_Claveles_ponderado=Indice_Claveles*Participacion_Claveles



# Pompones -------------------------------------------------------------------
  Promedio_Pompones_2015=11130088.51
  Participacion_Pompones=0.623243712055507

  n_fila=which(Flores == "011103",arr.ind = TRUE)[,"row"]
  n_col1=which(Flores== paste0((anio-2)," 1"),arr.ind = TRUE)[,"col"]
  n_col2=which(Flores== paste0(anio," ",mes),arr.ind = TRUE)[,"col"]



  #Tomar el valor que nos interesa
  Indice_Pompones=as.numeric(Flores[n_fila[1],n_col1[1]:n_col2[1]])/Promedio_Pompones_2015*100

  Indice_Pompones_ponderado=Indice_Pompones*Participacion_Pompones

  # Agrupar datos -----------------------------------------------------------

  Valor_Flores=Indice_rosas_ponderado+Indice_Claveles_ponderado+Indice_Pompones_ponderado

  return(Valor_Flores)
}
