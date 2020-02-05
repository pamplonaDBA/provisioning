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
        |-REQ03_createdb_TEST.yaml     Ejemplo de informacion de provisionamiento de  una base de datos 
        |-REQ01_asm_create_disks.yaml  Ejemplo de informacon de  provisionamiento de discos para el ASM 
   |  
   |  
   | so_check.yaml                 Playbook que comprueba los prerrequisitos del sistema operativo  
   | oracle_directories.yaml       Playbook que comprueba el arbol de directorios de oracle
   | unzip_binaries.yaml           Playbook generico que decomprime zips
   | asm_binaries_install.yaml     Playbok  que installa los binarios de ASM  y registra el oracle restart sin ASM
   | asmlib_configure.yaml         Playbook que configura el asmlib
   | asmlib_create_disks.yaml         Playbook que configura los discos de ASM 
   | asm_create.yaml               Playbook que crea una instancia +ASM con en el GRID y con los discos previamente instalados
   | db_binaries_install.yaml      Playbook que instala los binarios del motor de base de datos
   | db_createdb.yaml              Playbook que crea una base de datos


</pre>
Para una explicacion mas en profundidad puees ver los post asociados a Ansible en http://clemente.pamplona.name/dba
