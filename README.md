# Gestor de turnos 🌟

## Documentación 📖
<br>
<details>
<summary> <h2 style="display:inline">Comenzando 🚀 </h2></summary>

### BBDD

Crea una bbdd llamada __gestion_turnos__, o importa la bbdd ya creada que está dentro de la carpeta 
_GestionTurnos\src\main\java\com\trabajos\gestionturnos\ **resources**_

##### Usuario: __"root"__
##### Contraseña:  __""__

Si tienes otro usuario y contraseña tendrás que ir al archivo pom.xml.
Ve a la pestaña source y añade tu nombre de usuario y tu contraseña: 

property name="javax.persistence.jdbc.user" value="tu nombre de usuario"
property name="javax.persistence.jdbc.password" value="tu contraseña"
</details>
<br>
<details>
<summary><h2 style="display:inline">Requisitos del proyecto 📚</h2></summary>

__1. Agregar un nuevo turno:__ Los usuarios deben poder ingresar información sobre un nuevo turno, incluyendo número, fecha y descripción del trámite a realizar. 
Al mismo tiempo cada turno tendrá un ciudadano asignado. Un turno es EXCLUSIVO de un ciudadano, sin embargo, un ciudadano puede sacar más de un turno en diferentes ocasiones.

__2. Listar turnos:__ La aplicación debe permitir la visualización de la lista de todos los turnos junto con los ciudadanos asignados a los mismos, en base a una fecha brindada por el usuario. 
Se sugiere el uso de una tabla, para mejor distribución de los datos.

__3. Filtrado de turnos:__ El usuario debe poder seleccionar si quiere ver los turnos "En Espera" (que son aquellos que aún no han sido atendidos) o los "Ya atendidos". 
Siempre teniendo como filtro principal antes que esto la fecha. Es decir, se deberá filtrar por la fecha indicada por el usuario + el estado del turno.

</details>
<br>
<details>
<summary><h2 style="display:inline">Funcionalidades ⚙️</h2> </summary>

La aplicación se basa en la gestión de turnos.

**1**. Si es la primera vez que entras, podrás pedir un turno en la sección **Pedir turno sin código de usuario**.
    Se deberá incluir los datos requeridos, no aceptándose campos vacios o en algunos casos ciertas restricciones.
    Una vez pedido el turno, se te mostrará la fecha de la cita, junto con el número de turno correspondiente al día elegido,
    También se te asignará un código de usuario único para poder pedir de nuevo otro turno.<br>

   <h4 style="display:inline">IMPORTANTE </h4><br>
    Se gestiona la introducción de un ciudadano ya existente (nombre, apellido y dni), en cuyo caso se redirigirá a otra página donde se le indicará que ha habido un error y se le mostrará el 
    código de usuario.
<br><br>
**2**. Si ya has pedido un turno, la próxima vez (con los mismos nombre, apellido y dni) sólo podrás pedir un nuevo turno en la sección Pedir turno sin código de usuario.
   Una vez pedido el turno, se le redirigirá a una página mostrandose la fecha y el turno de la cita.

<h4 style="display:inline">IMPORTANTE </h4><br>
   Se gestiona la introducción de un código de usuario no existente, en cuyo caso se le redirigirá a una página donde se le 
   indica que ha habido un error por introducir un código de usuario de un ciudadano inexistente.
<br><br>
**3**. Tendrá la opción de listar los turnos que hay en una determinada fecha en la sección Listar turnos por Fecha.
   <br><br>
**4**. También podrá filtrar los turnos por fecha y por estado en la sección Filtrado de turnos.<br>

**5**. En la sección Modificar estado del turno podrá modificar el estado de _"en espera"_ a _"ya atendido"_ y viceversa proveyendo el código del turno.<br>
Si quiere conocer el código del turno, podrá verlo en la sección del punto 3 y 4, en la tabla en la columna llamada cod.

</details>
<br>
<details>
<summary><h2 style="display:inline">Notas 📃</h2></summary>

Se aplica los conocimientos adquiridos durante las semanas de java básico y java avanzado.
<br>
**JPA, JSP, streams, bbdd, separación por capas**..


</details>

	