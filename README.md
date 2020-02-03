## oraansible

#Ansible scripts used at [pamplona.name](http://clemente.pamplona.name/dba)

Esta es una quequeña recopilacion de playbooks ansible para gestionar el proisionamiento de bases de datos Oracle.
Por el momento el taller se base en sistemas Single Instance
## estructura
La estructura es similar a la de los roles, teniendo:
<pre>
 Raiz
   |
   |- Vars:
        |- oracle_standard.yaml:              Fichero con los estandares del departamento
        |- so_[version]_requisites.yaml   Prerrequisitos del sistema operativo para la version especidica de oracle 
        |- db_binaries.yaml               Informacion de los binarios y parches de base de datos
        |- asm_binaries.yaml              Informacion de los ninarios y parches del grid infraestructure

</pre>
Para una explicacion mas en profundidad puees ver los post asociados a Ansible en http://clemente.pamplona.name/dba
