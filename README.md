## Oracle Ansible
 Group of playbooks and roles to manage ORacle databases on linux environmets 


 ## Files tree
<pre>
 ## Provisioning
Playbooks and roles for Oracle CRS and sigle instance provisioning 


## Brief info

<pre>
 Root
   |
   |- vars:
        |- main.yaml                     Specific rules an locations of our oracle department
        |- oracle_files.yaml              Source  & patch files info and locations    
   |
   |- files
        |-CRQ001_asm_create_disks.yaml      Example of asm disks provisioning
        |-CRQ002_createdb_ASMTEST.yaml      Example of database provisioning
        |-CRQ003_createdb_FSTEST.yaml       Example of database provisioning
   |    
   | - roles
         |so_check                           Checks the pre requirements of S.O
            -|
             |vars
                |-  OracleLinux_7_oracle_19.3_requisites.yaml      Prerrequisites for a installation of a 19.3 oracle files at OEL7
            
         |oracle_directories                 Role wich checks all required file structure exsists
         |
         |unzip_binaries                     Role wich unzips selected files 
         |
         |asm_binaries_install               Role wich install and setus the CRS = Listener          
            |
            |Templates 
                |-asm_binaries_19.3.rsp.j2   Jinja files wich create the asm response file for 19.3 version 
                |-asm_binaries_12.1.rsp.j2   Jinja files wich create the asm response file for 12.1 version 
                |-asm_binaries_12.2.rsp.j2   Jinja files wich create the asm response file for 12.2 version 
         |    
         | asm_create                       Role which configures asmlib, create asmdisks, diskgroups and asm 
         |
         | db_create                        Role wich creates a database 
            |
            |Templates 
                |-rdbms_createdb_19.3.rsp.j2   Jinja files wich create the rdbms response file for 19.3 version 
                |-rdbms_createdb_12.1.rsp.j2   Jinja files wich create the rdbms response file for 12.1 version 
                |-rdbms_createdb_12.2.rsp.j2   Jinja files wich create the rdbms response file for 12.2 version 
         |
         |
    | check_so_prerrequisites.yaml     Playbook wich checks the S.O  prerrequisites
    |     
    | asm_only_binaries                Playbook which install CRS listener and setup them
    | 
    | asm_full_install                 Playbook which install CRS,listeners, confiurres asmlib, create asmdisks,diskgroups and asm 
    |
    | db_binaries_install              Playbook wich installs and inventory database binaries 
    |
    | asmfull_plus_db_binaries         Playbook   which install CRS,listeners, confiurres asmlib, create asmdisks,diskgroups, asm and database binaries 
    |
    | db_createdb                      Playbook wich creates a database 
         
</pre>
Para una explicacion mas en profundidad puees ver los post asociados a Ansible en http://clemente.pamplona.name/dba

## Sudo permissions
This are some sudo perissions for the playbooks 


<pre>
#ANSIBLE
# Installation and management of software
Cmnd_Alias SOFTWARE = /bin/rpm, /usr/bin/up2date, /usr/bin/yum
### Services
 Cmnd_Alias SERVICES = /sbin/service, /sbin/chkconfig, /usr/bin/systemctl
### Storage
 Cmnd_Alias STORAGE = /sbin/fdisk,/sbin/parted, /sbin/partprobe, /bin/mount, /bin/umount
#Oracle_inventory
 Cmnd_Alias ORAINVENTORY=/u01/app/oraInventory/orainstRoot.sh
#ASMLIB
 Cmnd_Alias ASMLIB= /usr/sbin/asmtool, /usr/sbin/oracleasm, sudoedit /etc/logrotate.d/30-oracle_logs, sudoedit /etc/rsyslog.d/30-oracle.conf
#DB_INSTALL
 Cmnd_Alias DB_INSTALL= /u01/app/oracle/product/[....]/dbhome[.]/root.sh
#ASM_INSTALL
 Cmnd_Alias ASM_INSTALL = /u01/app/oracle/product/[....]/grid/root.sh, /u01/app/oracle/product/[....]/grid/bin/perl,  /u01/app/oracle/product/[....]/grid/gridSetup.sh

#
ansible    ALL=(oracle) NOPASSWD:ALL
ansible    ALL=(root)   NOPASSWD:SOFTWARE,SERVICES,STORAGE,ASMLIB,ORAINVENTORY,ASM_INSTALL,DB_INSTALL
</pre>