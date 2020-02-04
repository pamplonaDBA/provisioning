## oraansible

#Ansible scripts used at [pamplona.name](http://clemente.pamplona.name/dba)

Esta es una quequeña recopilacion de playbooks ansible para gestionar el proisionamiento de bases de datos Oracle.
Por el momento el taller se base en sistemas Single Instance
## estructura
La estructura es similar a la de los roles, teniendo:
<pre>
 Raiz
   |
   |- vars:
        |- oracle_standard.yaml      Fichero con los estandares del departamento
        |- oracle_files.yaml         Fichero con la informacion fisica de los binarios 
        |- so_19.3_requisites.yaml   Ejemplo de fichero de requisitos de S.O para oracle 19.3
   |
   |- templates
        |- asm_binaries_19.3.rsp.j2 Ejemplo de template para la instalacion de binarios de asm la version 19.3
        |- db_binaries_19.3.rsp.j2  Ejemplo de template para la instalacion de binarios de binarios  la version 19.3
        |- db_create_19.3.j2        Ejemplo de template para la icreacion de una base datos Single instance version 19.3
   |
   |- files
        |-db_createdb_TEST.yaml     Ejemplo de parametrizacion especifica par una base de datos 
   |  
   |  
   | so_check.yaml                 Playbook que comprueba los prerrequisitos del sistema operativo  
   | oracle_directories.yaml 
   | unzip_binaries.yaml
   | asm_binaries_install.yaml
   | configure_asmlib.yaml
   | asm_binaries_install.yaml
   | asm_create.yaml
   | db_binaries_install.yaml
   | db_createdb.yaml


</pre>
Para una explicacion mas en profundidad puees ver los post asociados a Ansible en http://clemente.pamplona.name/dba
