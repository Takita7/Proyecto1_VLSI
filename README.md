# Tarea-1_VLSI
Este proyecto se enfoca en el diseño y la simulación de circuitos integrados utilizando la tecnología específica del transistor mínimo. Se dividirá en dos partes principales: la determinación de resistencias y capacitancias mínimas, y el diseño de un inversor óptimo.

En la primera parte, se realizarán cálculos y simulaciones para determinar las resistencias de canal de transistores mínimos NMOS y PMOS, así como la capacitancia equivalente de compuerta. Esto proporcionará una estimación inicial de las características del proceso que se utilizarán a lo largo del curso.

En la segunda parte, se diseñará un inversor mínimo con margen de ruido simétrico, utilizando herramientas de simulación para verificar su funcionamiento y analizar su desempeño bajo diferentes condiciones. Se realizarán iteraciones para encontrar una solución empírica razonable de la relación PMOS/NMOS y se llevarán a cabo pruebas adicionales para evaluar el comportamiento del inversor.

## Parte 1:
Para la primera parte se determinaron la resistencia del transistor de tipo N y el de tipo P de tamaño mínimo, se realizó de la siguiente manera:

$$\ R = \frac{V_{DD}}{2 \cdot I_{DSAT}} \ $$ 

Para el N quedaría de la siguiente manera:
$$\frac{1.8 \text{V}}{2 \cdot 475 \times 10^{-6} \text{A/um} \cdot 0.36 \mu m} = 5263.16  \Omega$$


Para el P quedaría de la siguiente manera:
$$\frac{1.8 \text{V}}{2 \cdot 170 \times 10^{-6} \text{A/um} \cdot 0.72 \mu m} = 6965.94  \Omega$$

Utilizando la otra formula:

$$R = \frac{V_{DD}}{I_H + I_L}$$

Para determinar la resistencia del N se hace de la siguiente manera:

$$\frac{1.8 \text{V}}{{475 \times 10^{-6} \text{A/um}} \cdot 0.36 \mu m}  = 10526.31 \Omega$$

Y la del P quedria:

$$\frac{1.8 \text{V}}{{170 \times 10^{-6} \text{A/um}} \cdot 0.72 \mu m} = 14705.88 \Omega$$

Ahora para determinar la resistencia unitaria se debe de multiplicar por el ancho usado, en este caso 0.36 micrometros para el N y 0.76 micrometros para el P 

$$R_{\text{nueff}} = 10526.31 \Omega \cdot 0.36 \mu m$$

$$R_{\text{nueff}} = 3789.47 \frac{\Omega}{\mu m}$$

$$R_{\text{pueff}} = 14705.88 \\Omega \cdot 0.72 \mu m$$

$$R_{\text{pueff}} = 11176.47 \frac{\Omega}{\mu m}$$

Ahora bien para calcular las capacitancias se puede determinar de la siguiente manera, siendo la más pesimista

$$C_{gs} = W_{dib} \cdot L_{dib} \cdot C_{OX}$$

La capacitancia del N queda de la siguiente manera:

$$0.36 \mu m \cdot 0.18 \mu m \cdot 8.46 \times 10^{-15} \text{A/um} = 5.48 \times 10^{-16} F $$

Y la del P:

$$0.72 \mu m \cdot 0.18 \mu m \cdot 8.91 \times 10^{-15} \text{A/um} = 11.55 \times 10^{-16} F $$

Para calcular los tiempos se utiliza la siguiente formula:

$$\tau = 3 \cdot R \cdot C$$

Para el N:

$$3 \cdot 10526.31 \Omega \cdot 5.48 \times 10^{-16} F = 17.3 \ \text{ps}$$

Para el P:

$$\frac{3}{2} \cdot 14705.88 \Omega \cdot 11.55 \times 10^{-16} F = 25.48 \ \text{ps}$$

## Parte 2:
Con respecto al inversor, se diseñó uno a nivel de esquemático, de un tamaño mínimo permitido por la tecnología propuesta. El funcionamiento del mismo se puede ver en las siguientes figuras, donde en la primera se logra apreciar el funcioamiento del inversor en un único pulso, mostrando así con más detalle el comportamiento del voltaje de salida.

<p align="center">
    <img src="https://github.com/Rmarino25/Tarea-1_VLSI/assets/110320407/40297304-6ed0-4d2c-b9e2-d01c9d4f35ec"/>
</p>

En la segunda imagen, se crea un tren de pulsos, mostrando así un funcionamiento "macro" del inversor.

<p align="center">
    <img src="https://github.com/Rmarino25/Tarea-1_VLSI/assets/110320407/dd250a39-cf4c-4e9f-8a62-de82065af6fb"/>
</p>

Simulando diferentes relaciones de tamaño para el inversor, nos da como resultado la siguiente gráfica. El transistor mínimo se encuentra en una relación aproximada a 2.33. Está relación se puede determinar cuando el valor de el valor del voltaje de entrada es 0.9 V

<p align="center">
    <img src="https://github.com/Rmarino25/Tarea-1_VLSI/assets/110353604/c47cd2d0-0b19-4d9b-a5d7-a9a9ca81e244"/>
</p>

Ahora bien analizando la corriente que pasa por el transistor de tipo N, podemos graficar la curva característivca de la siguiente manera:

<p align="center">
    <img src="https://github.com/Rmarino25/Tarea-1_VLSI/assets/110353604/ce6679be-bba1-4808-a52b-e00c02c8c602"/>
</p>

Posteriormente, se ejecutaron varias iteraciones, buscando un valor óptimo de la relación de tamaño entre el transistor p y el n. Esta relación se encontró alrededor de 2.8 veces el tamaño del transistor p con respecto al n. Se encontró que al aumentar más la relación de 2.8/1 se reduce el tiempo de subida pero se empieza a aumentar el tiempo de bajada, perdiendo así la idea de que los dos tiempos, tanto el de subida como bajada, sean lo más cercanos posibles. Los tiempos obtenidos tanto en simulación como mediante hspice se pueden ver en las siguientes figuras.

<p align="center">
    <img src="https://github.com/Rmarino25/Tarea-1_VLSI/assets/110353604/e6717942-4686-4721-abf2-05574fdafb7f"/>
</p>

<p align="center">
    <img src="https://github.com/Rmarino25/Tarea-1_VLSI/assets/110353604/23586a26-13ae-43c6-a159-c6e4515e38a5"/>
</p>

Seguidamente se realizaron simulaciones sobre las esquinas de variablidad del proceso, lo que da como resultado:

<p align="center">
    <img src="https://github.com/Rmarino25/Tarea-1_VLSI/assets/110353604/1b8097d0-ea03-4b01-83b5-7b8c68e0bf30"/>
</p>

Con respecto al FO4, se ejecutó el deck de SPICE manteniendo una relación de 2/1 y se encontraron los tiempos de retardo, tanto de bajada como de subida.

<p align="center">
    <img src="https://github.com/Rmarino25/Tarea-1_VLSI/assets/110353604/106a434e-62ee-4127-9a83-b03fb425d542"/>
</p>

<p align="center">
    <img src="https://github.com/Rmarino25/Tarea-1_VLSI/assets/110353604/49985f53-6395-4357-88d4-588aaf9d1d0d"/>
</p>

 Ya teniendo los resultados del FO4, se varió la relación de tamaño p/n, obteniedo así diferentes valores de retardo para cada uno. Estos comportamientos se graficaron mediante un script de python, evidenciando la diferencia que existe en los tiempos de retardo.

<p align="center">
    <img src="https://github.com/Rmarino25/Tarea-1_VLSI/assets/110320407/3c271f1d-368f-4707-8a12-c6a5449f3967"/>
</p>

Luego se montó el FO4 optimizado, lo cual hizo que se redujeran los tiempo de subida y bajada, dando como resultado las siguientes figuras:

<p align="center">
    <img src="https://github.com/Rmarino25/Tarea-1_VLSI/assets/110353604/983c4f64-87e3-4cb4-853f-84b6a9fe7dbf"/>
</p>

<p align="center">
    <img src="https://github.com/Rmarino25/Tarea-1_VLSI/assets/110353604/4f2b4426-d4a3-4139-880d-ae37fb767024"/>
</p>

A nivel de rendimiento, se puede notar que los tiempos de subida y bajada en el FO4 optimizado son menores. Esto significa que la señal se transmite más rápido. Además, considerando que los transistores estarán activos por menos tiempo, habrá una diferencia en términos de consumo de energía, ya que los transistores más grandes suelen consumir más energía.

Al comparar los resultados del FO4 y el FO4 optimizado, la elección entre uno y otro dependerá de la arquitectura a la que se vaya a integrar.

Ahora bien, utilizando los valores tiempos de subida y bajada con la relación 2/1, es posible determinar la resistencia de los transitores de la siguiente manera:

Para el N:

$$R = \frac{16.548 \ \text{ps}}{3 \times 5.48 \times 10^{-16} F}$$

$$R = 10065,69 \Omega$$

Para el P:

$$ R = \frac{19.664 \ \text{ps}}{\frac{3}{2} \times 11.55 \times 10^{-16} F} $$

$$R = 11350,07 \Omega$$

Analizando los valores que se determinarin de manera simulada o hecha manual, se puede concluir lo siguiente:

Utilizando los valores que se sacaron manualmente, las resistencia dieron un valor más elevado, por lo cual de usar estos valores serían los utilizados en el peor de los casos, cubriendo un margen de error más amplio.
Los valores simulados tienen la ventaja de que no quita mucho tiempo determinar los valores, por cual es más eficiente. Por otro lado en la simulación se desprecia las capacitancias parásitas.

Como tal, al aumentar el tamaño del transistor, se puede apreciar una disminución de tau ya que la resistencia decrece. Esto es verdadero hasta cierto punto, ya que conforme se aumenta el tamaño del transistor, aumenta la capacitancia también. De este decremento y aumento de los valores es necesario encontrar el "sweet spot" para poder balancear los tiempos de subida y caída.
