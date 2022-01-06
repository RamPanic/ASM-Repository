# Planificador de procesos

Es un componente del S.O. y sirve para gestionar la compartición de la CPU entre una comunidad de procesos/Hilos listos para ejecutarse. El planificador, además de tener que escoger el proceso correcto para ejecutar, tiene que preocuparse también de realizar un uso eficiente de la CPU, debido a que la conmutación de procesos es muy costosa.

## Tipos de planificación

* Corto plazo: Decide cómo compartir momento a momento al equipo entre todos los procesos que requieren de sus recursos, especialmente el procesador. La planificación a corto plazo se lleva a cabo decenas de veces por segundo (razón por la cual debe ser código muy simple, eficiente y rápido); es el encargado de planificar los procesos que están listos para ejecución.
En algunos textos, al planificador a corto plazo se le llama despachador (dispatcher).
* Mediano plazo: Decide cuáles procesos es conveniente bloquear en determinado momento, sea por escacez/saturación de algún recurso (como la memoria primaria) o porque están realizando alguna solicitud que no puede satisfacerse momentaneamente; se encarga de tomar decisiones respecto a los procesos conforme entran y salen del estado de bloqueado (esto es, típicamente, están a la espera de algún evento externo o de la finalización de transferencia de datos con algún dispositivo).
En algunos textos, al planificador a mediano plazo se le llama agendador (scheduler). 
* Largo plazo: Decide qué procesos serán los siguientes en ser iniciados. Este tipo de planificación era el más frecuente en los sistemas de lotes (principalmente aquellos con spool) y multiprogramados en lotes; las decisiones eran tomadas principalmente considerando los requisitos pre-declarados de los procesos y los que el sistema tenía libres al terminar algún otro proceso. La planificación a largo plazo puede llevarse a cabo con periodicidad de una vez cada varios segundos, minutos e inclusive horas.
En los sistemas de uso interactivo, casi la totalidad de los que se usan hoy en día, este tipo de planificación no se efectúa, dado que es típicamente el usuario quien indica expresamente qué procesos iniciar.
