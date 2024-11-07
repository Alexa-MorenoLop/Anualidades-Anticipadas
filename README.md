# Funciones-Anualidades-Anticipadas
El siguiente trabajo contiene las funciones programadas en R utilizadas en el tema Anualidades Anticipadas de Matemáticas Financieras para la licenciatura en Actuaria y Ciencia de Datos. 

*Alexa Moreno López*

*Licenciatura en Actuaría y Ciencia de Datos*

Es posible cargar las funciones realizadas por medio del siguiente comando pegandolo en la consola de su workspace. 

```{r}
source("https://raw.githubusercontent.com/Alexa-MorenoLop/Funciones-Anualidades-Anticipadas/refs/heads/main/FuncionesAnualidadesAnticipadas.R")
```

# Anualidades Anticipadas

Las anualidades son una serie de pagos periodicos realizados a lo largo de una operación financiera, generalmente en intervalos iguales de tiempo. 

Estos pagos son de gran utilidad en operaciones economicas financieras, ya que tienen la finalidad para solvertar un saldo acumulado o mejor conocido como Valor Futuro (VF) en partes o periodos en vez de realizar un único pago al final del plazo.

En este caso, una *Anualidad Anticipada * es aquella en la cual los pagos se realizan al inicio del periodo de pago.

A las Anualidades Anticipadas se les conoce como Anualidades Ciertas, Simples e Inmediatas.

*Anualidad Cierta:* Es aquella cuando se conocen con anticipación las fechas de inicio y fin de la anualidad.

*Anualidad Simple:* Se da cuando el periodo de capitalización coincide con el periodo de pago.

*Anualidad Inmediata:* Basada en cuando los pagos se inician el mismo periodod en que la operación se formaliza.

Basado en una serie de cálculos y analisis de suceciones (que se pueden apreciar en el libro de texto base para este curso) podemos reconocer una ecuación útil para nuestro uso en operaciones financieras con Anualidades Anticipadas.

**Fórmula de Valor Futuro (VF) de una anualidad anticipada** 

*Dada la Anualidad (A), Tasa de interés del periodo (r) y el número de de anulidades (n)*

$$VF=A\frac{(1+r)^n-1}{r} (1+r)$$

De esta fórmula general se derivan despejes para obtener algún valor desconocido según aquellos datos con los que contamos, tales son los siguientes casos:

**Fórmula para encontrar el valor de Anualidad (A) en una anualidad anticipada**

*Conociendo Valor Futuro (VF), tasa de interés del periodo (r) y el número de pagos o anualidades (n)*

$$Anualidad=\frac{VFr}{((1+r)^n-1)(1+r)}$$

**Fórmula para identificar el número de pagos o plazo (n) en una anualidad vencida**

*Conociendo el Valor Futuro (VF), tasa de interés del periodo (r) y el monto de Anualidad (A)*

$$nPlazos=\frac{log(\frac{VF*r}{A(1+r)}+1)}{log(1+r)}$$


**Forma en la que se obtiene el valor de interes del periodo (r)**

*Conociendo Valor Futuro (VF), número de Plazos (T) y el monto de Anualidad (A)*

Para este caso en especifico se es necesario realizar el cálculo al despejar los Intereses del Periodo (r), sin embargo, no es posible hacerlo de forma directa con la fórmula de VF de Anualidades Anticipadas.


**Ejemplo con un problema**

Para una mayor representación y entendimiento de estas funciones y su utilidad se tomará un ejemplo en el cual se despejará cada uno de los valores.

Se nos proporciona el siguiente problema a resolver:

*"Durante los próximos 12 años, una compañía constructora debe invertir al inicio de cada mes $150 000 en un fondo para la depreciación de su maquinaria. ¿Cuál será el monto de este fondo de depreciación al cabo de los 12 años si ha estado produciendo el 9.6% capitalizable cada mes?"*

Comencemos utilizando la Fórmula general para obtener el monto futuro, es decir, buscamos VF con anualidades anticipadas.

Para esto, antes debemos identificar los datos de nuestro problema para facilitar la computación al momento de llevarla a cabo.

$Anualidad(A)$= $150,000.00$

$Número de pagos(n)$= $12 meses * 12 años = 144$ 

$InteresesAnualizados(i)$= $9.6% = 0.096$

$InteresesPeriodo(r)$= $9.6/12=0.096/12$

**Cálculo del Valor Futuro (VF)**

*Conociendo la Anualidad (A), tasa de interés del periodo (r) y el número (plazo) de anualidades (n).*

```{r}

source("https://raw.githubusercontent.com/Alexa-MorenoLop/Funciones-Anualidades-Anticipadas/refs/heads/main/FuncionesAnualidadesAnticipadas.R")

VFsalida=VF(A=150000,r=0.096/12,n=144)

VFsalida

```

Una vez que hemos encontrado el Valor Futuro podemos utilizarlo para buscar otros valores que, si bien ya conocemos debido a que se nos proporcionaron en el desarrollo del problema, lo calcularemos basandonos en el mismo ejercicio, ya que buscamos comprobar el funcionamiento y eficacia de las fórmulas de Anualidades Anticipadas programadas en R.

Ahora encontremos el valor de la Anualidad, el cual sabemos que es $150,000.00.

**Cálculo del Valor de la Anualidad (A)**

*Conociendo Valor Futuro (VF), tasa del periodo (r) y número de pagos (n).*

```{r}

source("https://raw.githubusercontent.com/Alexa-MorenoLop/Funciones-Anualidades-Anticipadas/refs/heads/main/FuncionesAnualidadesAnticipadas.R")

Asalida=A(VF=40635832.11,r=0.096/12,n=144)

Asalida

```

**Cálculo del Valor de Número de pagos o plazo (n)**

*Conociendo Valor Futuro (VF), monto de Anualidad (A) y Tasa del periodo (r).*

```{r}

source("https://raw.githubusercontent.com/Alexa-MorenoLop/Funciones-Anualidades-Anticipadas/refs/heads/main/FuncionesAnualidadesAnticipadas.R")

nsalida=n(VF=40635832.11,A=150000,r=0.096/12)

nsalida

```

**Cálculo de la Tasa del periodo (r)**

*Conociendo Valor Futuro (VF), número de pagos (n) y monto de la Anualidad (A).*

Para finalizar con este ejemplo, a continuación es necesario realizar el cálculo de los Intereses del Periodo (r) con el algoritmo programado.

```{r}

source("https://raw.githubusercontent.com/Alexa-MorenoLop/Funciones-Anualidades-Anticipadas/refs/heads/main/FuncionesAnualidadesAnticipadas.R")

rTasaValor=rTasa(40635832.11,150000,144)

rTasaValor
```

# Anualidades Anticipadas con Valor Actual

Ahora bien, también se nos pueden presentar problemas donde ahora el *Valor Actual* (VA) este presente, es decir, el valor al comienzo del plazo.

El Valor Actual es la suma de valores presentes de todos los pagos. VA corresponde al Valor Futuro (VF) de la operación sumando los intereres recompuestos (I) de la operación.

El Valor Actual de una Anualidad Anticipada tiene las mismas interpretaciones que el valor presente de una Anualidad Vencida.

La fórmula general para obtener el Valor Actual (VA) de una Anualidad Anticipada se deriva por medio de una serie de cálculos de la ecuación general para obtener el VF de una Anualidad Anticipada, para finalmente obtener:

**Fórmula General de Anualidades Anticipadas para el Valor Actual (VA)** 

*Conociendo la Anualidad (A), tasa de interés del periodo (r) y el número de pagos o anualidades (n).*

$$VA=A\frac{1-(1+r)^{-n}}{r}(1+r)$$

De esta fórmula general se derivan despejes para obtener valores desconocidos según aquellos datos con los que contamos, tales son los siguientes casos:

**Fórmula para encontrar el valor de Anualidad (A) en una anualidad anticipada conociendo el Valor Actual.**

*Conociendo Valor Actual (VA), tasa de interés del periodo (r) y el número de pagos o anualidades (n).*

$$AnualidadVA=\frac{VAr}{1-(1+r)^{-n}(1+r)}$$

**Fórmula para identificar el número de pagos (T) en una anualidad anticipada conociendo el Valor Actual.**

*Conociendo el Valor Actual (VA), tasa de interés del periodo (r) y el monto de Anualidad (A).*

$$nPlazosVA=-\frac{log(1-\frac{VAr}{A(1+r)})}{log(1+r)}$$

**Forma en la que se obtiene el valor de interés del periodo (r) conociendo Valor Actual.**

*Conociendo Valor Actual (VA), número de Plazos (n) y el monto de Anualidad (A).*

Al igual que en el caso anterior donde se busca el valor del interés del periodo, al tratar de despejarlo directamente de la fórmula general se ve imposible, por lo que, bajo la misma lógica se implementa el algoritmo que nos aproximará al valor de r con cada iteración.

**Ejemplo con un problema**

Para una mayor representación y entendimiento de estas funciones y su utilidad se tomará un ejemplo en el cual se despejará cada uno de los valores.

Se nos proporciona el siguiente problema a resolver:

*"Un automóvil se puede comprar a crédito mediante 48 abonos mensuales anticipados de $4800. Si la tasa de interés es del 16% capitalizable cada mes, ¿cuál es el valor de contado del automóvil?"*

Comencemos utilizando la Fórmula general para obtener el valor al comienzo del plazo, es decir, buscamos VA.

Para esto, antes debemos identificar los datos de nuestro problema para facilitar la computación al momento de llevarla a cabo.

$Anualidad(A)$= $$4,800.00$

$Número de pagos(n)$= $48 abonos mensuales$ 

$InteresesAnualizados(i)$= $16% = 0.16$

$InteresesPeriodo(r)$= $16/12 = 0.16/12$

**Cálculo del Valor Actual (VA)**

*Conociendo la Anualidad (A), tasa de interés del periodo (r) y el número de pagos o anualidades (n).*

```{r}

source("https://raw.githubusercontent.com/Alexa-MorenoLop/Funciones-Anualidades-Anticipadas/refs/heads/main/FuncionesAnualidadesAnticipadas.R")

VAsalida=VA(A=4800,r=0.16/12,n=48)

VAsalida

```

**Cálculo monto de Anualidad (A) conociendo el Valor Actual.**

*Conociendo Valor Actual (VA), tasa de interés del periodo (r) y el número de pagos o anualidades (n).*

Si bien conocemos el valor por la información dada en el problema, comprobaremos el funcionamiento de la función. Anualidad = $4,800.00$

```{r}

source("https://raw.githubusercontent.com/Alexa-MorenoLop/Funciones-Anualidades-Anticipadas/refs/heads/main/FuncionesAnualidadesAnticipadas.R")

AVAsalida=AVA(VA=171628.50,r=0.16/12,n=48)

AVAsalida

```

**Cálculo del número de pagos (n) conociendo el Valor Actual.**

*Conociendo el Valor Actual (VA), tasa de interés del periodo (r) y el monto de Anualidad (A).*

```{r}

source("https://raw.githubusercontent.com/Alexa-MorenoLop/Funciones-Anualidades-Anticipadas/refs/heads/main/FuncionesAnualidadesAnticipadas.R")

nVAsalida=nVA(VA=171628.50,r=0.16/12,A=4800)

nVAsalida

```
**Cálculo de la Tasa del periodo (r) conociendo Valor Actual**

*Conociendo Valor Actual (VA), número de Plazos (n) y el monto de Anualidad (A).*

Para finalizar con este ejemplo, a continuación es necesario realizar el cálculo de los Intereses del Periodo (r) con el algoritmo programado.

```{r}
source("https://raw.githubusercontent.com/Alexa-MorenoLop/Funciones-Anualidades-Anticipadas/refs/heads/main/FuncionesAnualidadesAnticipadas.R")

rTasaVAsalida=rTasaVA(171628.5,4800,48)

rTasaVAsalida

```

*Bibliografía*

La información del presente fue obtenida y basada del libro: 
Vidaurri Aguirre, H. (2017). Matemáticas Financieras (6.a ed.). Cinthia Chávez Ceballos. https://www.dropbox.com/scl/fi/8tvbn7asxqvlbfim1g5n1/libroMateFinancieras.pdf?rlkey=s1dwrr7fe03cswd6ccmndi3hk&e=12&st=bn50sqdl&dl=0

