## ASM binaries install 
 Role wich installs the asm binaries 

 ## requires 
 - Server 
<pre>
 Root
   |
   |- vars:
        |- main.yaml              Oracle team values for all configurations
   |
   |- files
   |
   | - roles
         |
         | server_mainteinance              Role wich starts/stop all services on a alone oracle database server 
             |
             | scripts:
                | -create_facts.sh          Scritp wich creates the local facts related to running oracle services
             |
             | tasks   
                | - start_all.yaml
                | - agent.yaml                   Playbook wich manages the OEM agent
                | - gather_so.yaml               Playbook wich registers the Operating System info 
                | - gather_asm.yaml              Playook wich gathers ASM info
                | - gather_SID.yaml              Playbook wich gathers database info
                | - gather_listener.yaml         Playbook wich gathers listener info
                | - shutdown_databases.yaml      Playbook wich stops all databases running at the server 
                | - srvctl_db_shutdown.yaml      Playbok wich stops one database trouhth srv command
                | - sqlplus_db_shutdown.yaml     Playbok wich stops one database trouhth  sqlplus command
                | - check_running_SID.yaml       Playbok wich checks if database is alive 
    |
</pre>