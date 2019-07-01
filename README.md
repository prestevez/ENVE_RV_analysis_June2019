# ENVE Event Dependence Study

## Versión 0.3

Estas instrucciones detallan brevemente el procedimiento necesario para correr exitosamente los scripts diseñados para el análisis de la ENVE 2014 en R.

La ejecución consta principalmente de dos partes, la Instalación de paquetes requeridos, y la Ejecución del script.

La instalación de paquetes solo se requiere realizar una vez. La ejecución del script puede realizarse las veces que sean necesarias si se encuentran errores.

# Instalación de paquetes requeridos

Los paquetes requeridos por este proyecto son los siguientes:

- "devtools"
- "foreign"
- "tidyverse"
- "Cairo"
- "knitr"
- "lazyeval"
- "RCurl"
- "glmmTMB"
- "classInt"
- "reshape2"
- "lmtest"
- "car"
- "downloader"
- "coda"
- "R2admb"
- "arsenal"
- "bbmle"
- "gridExtra"
- "scales"
- "dgof"
- "glmmADMB"
- "victim"

**Es recomendable contar con la [versión más actualizada de R](https://cran.r-project.org).**

**Para realizar la instalación de paquetes requeridos de forma automática ejecute:**

```{r}
source("package_installer.R")
```

Si prefiere realizar la instalación de forma manual, se puede verificar qué paquetes no se encuentran ya instalados con el siguiente comando:

```{r}
source("package_checker.R")
```

Para realizar la instalación manual de los paquetes faltantes, ejecute los comandos apropriados:

```{r}

install.packages("devtools")
install.packages("foreign")
install.packages("tidyverse")
install.packages("Cairo")
install.packages("knitr")
install.packages("lazyeval")
install.packages("RCurl")
install.packages("glmmTMB")
install.packages("classInt")
install.packages("reshape2")
install.packages("lmtest")
install.packages("car")
install.packages("downloader")
install.packages("coda")
install.packages("R2admb")
install.packages("arsenal")
install.packages("bbmle")
install.packages("gridExtra")
install.packages("scales")
install.packages("dgof")

```

El paquete `glmmADMB` no se encuentra disponible en CRAN y requiere ser compilado desde el código fuente (source). El script de instalación automática (`package_installer.R`) instala el paquete `glmmADMB` si este no se encuentra disponible. Sin embargo, si prefiere instalarlo manualmente, o la instalación del script falla, puede usar el siguiente comando:

```{r}
install.packages("glmmADMB",
    repos=c("http://glmmadmb.r-forge.r-project.org/repos",
            getOption("repos")),
    type="source")

```

Es posible que deba instalar manualmente los paquetes **coda** y **R2admb**, pues son dependencias requeridas. Si la instalación de **glmmADMB** falla, intente instalar las dependencias primero.

(El script de instalación automática también instala las dependencias si estas fueran requeridas.)

Si la instalación reporta **tERROR: compilation failed for package "glmmADMB"**, o similar, será necesario instalar Rtools en la computadora.

**La siguientes instrucciones están pensadas para un sistema Windows**.

Rtools permite la instalación de paquetes en R desde el código fuente (*source*). Para instalar Rtools navegamos a la página de [Rtools](http://cran.r-project.org/bin/windows/Rtools/), y descargamos el archivo ejecutable acorde a nuestra versión de R. Corremos el instalador seleccionando la opción default: "Package authoring installation".

Tras la instalación reinicie R y vuelva a correr el comando de instalación desde código fuente.

El paquete "victim" no se encuentra dispoinble en CRAN, por lo que debe de ser instalado desde Github. El script instalador de paquetes instala "victim" si este no está disponible en el sistema. Si desea instalar manualmente el paquete "victim", use el siguiente comando:

```{r}
devtools::install_github("prestevez/victim")
```

# Ejecución del script

El proyecto está diseñado para requerir la menor intervención posible para su ejecución. Una vez puesto en marcha, el script generará los reportes y outputs relevantes en una carpeta para su posterior revisión y envío.

Además de la instalación de los paquetes necesarios, descrita en la sección anterior, la única intervención necesaria es colocar los archivos .dbf que contienen los datos de la ENVE en el folder del proyecto y asignar el working directory en R al folder del proyecto.

## Archivos .dbf ENVE 2014

El análisis utiliza ambas tablas de la ENVE, tanto del cuestionario principal como del módulo de delitos. Para poder ejecutar el script, es necesario copiar los archivos respectivos (`enve2014cuest_ciega_2014.dbf` y `enve2014delitos_ciega_2014.dbf`) al folder de este proyecto.

## Establecer working directory en R

Establezca el working directory en R para que apunte al folder del proyecto.

Por ejemplo:

```{r}
getwd() # Devuelve cuál es el working directory actual.

setwd("C:/R/ENVE_EstevezSoto") # Establece el working directory en el folder del proyecto

```

Sólo se requiere que el path al folder del proyecto sea especificado.

## Ejecutar el script

El proyecto está contenido en un archivo R Markdown que permite elaborar reportes automáticos de análisis realizados en R. Cuando el script termina, guarda los resultados en una archivo de texto con formato markdown (extensión .md) que puede ser abierto en cualquier editor de texto en cualquier computadora (Notepad, etc.).

Para correr el análisis, ejecute el siguiente comando en la consola de R:

```{r}
knitr::knit("ENVE_rv_ext_type_July2019.Rmd")
```

La ejecución es tardada, pero depende del equipo en el que se corra; es normal que parezca que no hace nada.

# Resultados

El script automáticamente realizará los análisis requeridos y guardará los resultados en un archivo llamado ENVE_rv_ext_type_June2019.md en la carpeta del proyecto. Asimismo, el programa guardará en una subcarpeta llamada figure/ las gráficas elaboradas en el análisis, y una subcarpeta llamada coef_csv/ con archivos csv con los resultados de los modelos ejecutados.
