# Probando Tomcat

##V1 Ubuntu + Tomcat

   Habilitado usuario "tomcat" password "tomcat" con roles para manager

   Desplegada aplicación psi-probe (https://github.com/psi-probe/psi-probe.git) "/probe"


##V2 Ubuntu + MariaDB + Tomcat

   Habilitado usuario "admin" password "admin" (encriptado) con roles para manager

   Desplegada aplicación psi-probe (https://github.com/psi-probe/psi-probe.git) "/probe"


##V3 Ubuntu + Apache + MariaDB + Tomcat

   Habilitados usuarios de V1 y V2.

   Desplegado Apache para contenido estático y tomcat para contenido dinámico.

   Desplegada aplicación psi-probe (https://github.com/psi-probe/psi-probe.git) "/probe"


##V4 Ubuntu + Apache + Cluster Tomcat modo Balanceador

   Habilitados usuarios de V1 y V2.

   Cluster vertical en modo balanceador (sin mantener sesion, y lbfactor 1:1)

   Habilitado JK Manager para supervisión del modulo Jk en el contexto "/jk"

   Desplegada aplicación psi-probe (https://github.com/psi-probe/psi-probe.git) "/probe"


##V5 Ubuntu + Apache + Cluster Tomcat modo Balanceador + mantenimiento de session

   Habilitados usuarios de V1 y V2.

   Cluster vertical en modo balanceador (con mantenimiento de sesion)

   Habilitado JK Manager para supervisión del modulo Jk en el contexto "/jk"

   Desplegada aplicación psi-probe (https://github.com/psi-probe/psi-probe.git) "/probe"


