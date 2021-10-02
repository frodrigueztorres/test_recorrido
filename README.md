# README

* Versiones

| Tecnología  | Número de versión |
| ------------| ------------------|
| Ruby        | 2.6.5             |
| Rails       | 6.1.4             |
| Node        | 12.20.1           |
| DB          | PostgreSQL - 13.3 |


*Se agregó Vue.js, pero no se utilizó en la solución. En consecuencia, se ocupó Bootstrap 5*

## Instalación

Para la instalación del aplicativo, se debe ingresar dentro de la plataforma y ejecutar los siguientes comandos

* bundle install

* rails db:create

* rails db:migrate

* rails s


# FUNCIONAMIENTO BÁSICO

Dentro de la aplicación, se puede observar un index con un listado de las alertas creadas. Dentro de este listado se puede ingresar a una opción para agregar nuevas alertas

Para agregar una alerta, se debe escoger un nombre, las ciudades de origen y destino y el precio correspondiente. Al tener listo el elemento se debe guardar.

Finalmente, al observar cada elemento se puede consultar un listado sobre los buses con las caracteristicas que se solicitaron, y un gráfico comparativo para cada uno de los siguientes siete días.

Finalmente, dentro de la tabla, se puede hacer click a cada una de las columnas y llevarán como link a la página correspondiente para la compra de los pasajes (Si es primera vez que se ingresa, se debe hacer con nombre de usuario y contraseña, el cual será recorrido)
