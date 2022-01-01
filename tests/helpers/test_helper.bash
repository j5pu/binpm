# shellcheck shell=sh
. bats.sh

# TODO: el puto color de los ficheros de python
# TODO: he puesto que no strict en helper.sh en PS1
# TODO: lo de fpm y nfpm etc en Chrome.
# TODO: el instalar cache de pip de https://pypi.org/simple/pip/ que no sale la ultima.
# TODO: hash -t git saca el path hash git saca error code hash -td git se olvida de las que ha recordado
#   y saca path, siempre usa la ultima del path. Pero si se actualiza el PATH hash -t git sale error, primero
#   hash git para que funcione, y borra todos los anteriores el cambio de PATH...
# TODO: el has poner que la imagen que descarga si no la encuentra sea quiet.... se queda pillado en download complete
#  si no
#  hay imagen
# TODO: me falta la documentation de has, parser y psargs.
# TODO: el findup, hacer un top, las pruebas etc. y meterlo en el colon --bins
# TODO: meter en bats.sh el colon --base cuando este instalado.
# TODO: meter en colon --init el bats-core porque no tengo el man... ponerlo en system.sh?
# TODO: acabar con los manuales que estaba del bats.sh  de bats::description
# TODO: acabar con el BATS_TOP_NEXT... de hecho hacer una dev.sh que haga source el bats.sh y
#     llamar a las variables DEV... si eso igual influye en el colon.
# TODO: meter las imágenes y las funciones de docker en bindev.
# TODO: donde meto el path de la imagen con el repository en colon, o en la funcion o en el dev.sh
# TODO: probar las opciones de --desc, --help, etc. en todos los comandos.
# TODO: probar las librerías y su ejecución con --desc, etc. y la generada de color.sh
# TODO: empezar a usar el profile.sh en lugar el system.sh ??
# TODO: meter las completions en system, pero tener en cuenta que las variables se exportan y las funciones no.
# TODO: hacer las completions de binman y bindev.
# TODO: hacer las man pages de todos.
# TODO: ver como hago los install del comando 'man' y los programas que no estén y Brewfile y si meto el bash y el most
# TODO: ver si meto el asdf o sigo asi.
# TODO: y si miro el google fire?
# TODO: faltaría también lo que empece a hacer de build.
# TODO: actualizar los make files con los programas que funcionan de colon, etc.
