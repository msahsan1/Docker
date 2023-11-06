<pre>
<h2> Docker Compose Jenkins </h2>
ahsan@vmmint:~/Docker/Jenkins$ cat docker-compose.yaml 
version: '3.8'
services:
   jenkins:
     image: jenkins/jenkins:lts
     privileged: true
     user: root
     ports:
      - 8080:8080
      - 50000:50000
     container_name: jenkins
     volumes:
      - /home/${myname}/jenkins_compose/jenkins_configuration:/var/jenkins_home
      - /var/run/docker.sock:/var/run/docker.sock
mahsan@vmmint:~/Docker/Jenkins$ 



ahsan@vmmint:~/Docker/Jenkins$ docker-compose up -d
WARNING: The myname variable is not set. Defaulting to a blank string.
Creating network "jenkins_default" with the default driver
Pulling jenkins (jenkins/jenkins:lts)...
lts: Pulling from jenkins/jenkins
0a9573503463: Pull complete
e7dfbe47a424: Pull complete
63a7b790559d: Pull complete
de38613af57f: Pull complete
5e2a9b06c446: Pull complete
aaaca84f7bc7: Pull complete
b7d3a74d9ec1: Pull complete
c1655dbb8674: Pull complete
8517c106c345: Pull complete
6c94ede8b808: Pull complete
f94c7e55f771: Pull complete
8f558801c051: Pull complete
Digest: sha256:80587de2dac2bb701cd0b14d35988e591d62589fd337a4b584f4c52101fd4e3c
Status: Downloaded newer image for jenkins/jenkins:lts
Creating jenkins ... done
mahsan@vmmint:~/Docker/Jenkins$ docker container ls
CONTAINER ID   IMAGE                 COMMAND                  CREATED          STATUS          PORTS                                                                                      NAMES
e561db37971f   jenkins/jenkins:lts   "/usr/bin/tini -- /u…"   16 seconds ago   Up 15 seconds   0.0.0.0:8080->8080/tcp, :::8080->8080/tcp, 0.0.0.0:50000->50000/tcp, :::50000->50000/tcp   jenkins
mahsan@vmmint:~/Docker/Jenkins$ docker container ls
CONTAINER ID   IMAGE                 COMMAND                  CREATED          STATUS          PORTS                                                                                      NAMES
e561db37971f   jenkins/jenkins:lts   "/usr/bin/tini -- /u…"   24 seconds ago   Up 23 seconds   0.0.0.0:8080->8080/tcp, :::8080->8080/tcp, 0.0.0.0:50000->50000/tcp, :::50000->50000/tcp   jenkins
mahsan@vmmint:~/Docker/Jenkins$ 



mahsan@vmmint:~/Docker/Jenkins$ docker logs jenkins 
Running from: /usr/share/jenkins/jenkins.war
webroot: /var/jenkins_home/war
2023-11-06 01:54:59.068+0000 [id=1]	INFO	winstone.Logger#logInternal: Beginning extraction from war file
2023-11-06 01:55:00.441+0000 [id=1]	WARNING	o.e.j.s.handler.ContextHandler#setContextPath: Empty contextPath
2023-11-06 01:55:00.545+0000 [id=1]	INFO	org.eclipse.jetty.server.Server#doStart: jetty-10.0.17; built: 2023-10-02T04:04:10.314Z; git: a0f5f05abaa6c3aabb7c3d35f10a6f412ab8b05f; jvm 17.0.8.1+1
2023-11-06 01:55:00.802+0000 [id=1]	INFO	o.e.j.w.StandardDescriptorProcessor#visitServlet: NO JSP Support for /, did not find org.eclipse.jetty.jsp.JettyJspServlet
2023-11-06 01:55:00.862+0000 [id=1]	INFO	o.e.j.s.s.DefaultSessionIdManager#doStart: Session workerName=node0
2023-11-06 01:55:01.272+0000 [id=1]	INFO	hudson.WebAppMain#contextInitialized: Jenkins home directory: /var/jenkins_home found at: EnvVars.masterEnvVars.get("JENKINS_HOME")
2023-11-06 01:55:01.374+0000 [id=1]	INFO	o.e.j.s.handler.ContextHandler#doStart: Started w.@58860997{Jenkins v2.414.3,/,file:///var/jenkins_home/war/,AVAILABLE}{/var/jenkins_home/war}
2023-11-06 01:55:01.388+0000 [id=1]	INFO	o.e.j.server.AbstractConnector#doStart: Started ServerConnector@5e01a982{HTTP/1.1, (http/1.1)}{0.0.0.0:8080}
2023-11-06 01:55:01.400+0000 [id=1]	INFO	org.eclipse.jetty.server.Server#doStart: Started Server@784b990c{STARTING}[10.0.17,sto=0] @2933ms
2023-11-06 01:55:01.402+0000 [id=26]	INFO	winstone.Logger#logInternal: Winstone Servlet Engine running: controlPort=disabled
2023-11-06 01:55:01.588+0000 [id=33]	INFO	jenkins.InitReactorRunner$1#onAttained: Started initialization
2023-11-06 01:55:01.612+0000 [id=31]	INFO	jenkins.InitReactorRunner$1#onAttained: Listed all plugins
2023-11-06 01:55:02.322+0000 [id=31]	INFO	jenkins.InitReactorRunner$1#onAttained: Prepared all plugins
2023-11-06 01:55:02.326+0000 [id=31]	INFO	jenkins.InitReactorRunner$1#onAttained: Started all plugins
2023-11-06 01:55:02.334+0000 [id=37]	INFO	jenkins.InitReactorRunner$1#onAttained: Augmented all extensions
2023-11-06 01:55:02.514+0000 [id=37]	INFO	jenkins.InitReactorRunner$1#onAttained: System config loaded
2023-11-06 01:55:02.515+0000 [id=37]	INFO	jenkins.InitReactorRunner$1#onAttained: System config adapted
2023-11-06 01:55:02.515+0000 [id=37]	INFO	jenkins.InitReactorRunner$1#onAttained: Loaded all jobs
2023-11-06 01:55:02.516+0000 [id=37]	INFO	jenkins.InitReactorRunner$1#onAttained: Configuration for all jobs updated
2023-11-06 01:55:02.567+0000 [id=51]	INFO	hudson.util.Retrier#start: Attempt #1 to do the action check updates server
2023-11-06 01:55:02.979+0000 [id=37]	INFO	jenkins.install.SetupWizard#init: 

*************************************************************
*************************************************************
*************************************************************

Jenkins initial setup is required. An admin user has been created and a password generated.
Please use the following password to proceed to installation:

8876edfb01654bc8ad6cc28149b631f9

This may also be found at: /var/jenkins_home/secrets/initialAdminPassword

*************************************************************
*************************************************************
*************************************************************

2023-11-06 01:55:18.083+0000 [id=37]	INFO	jenkins.InitReactorRunner$1#onAttained: Completed initialization
2023-11-06 01:55:18.133+0000 [id=25]	INFO	hudson.lifecycle.Lifecycle#onReady: Jenkins is fully up and running
2023-11-06 01:55:18.482+0000 [id=51]	INFO	h.m.DownloadService$Downloadable#load: Obtained the updated data file for hudson.tasks.Maven.MavenInstaller
2023-11-06 01:55:18.483+0000 [id=51]	INFO	hudson.util.Retrier#start: Performed the action check updates server successfully at the attempt #1
mahsan@vmmint:~/Docker/Jenkins$ 


</pre>

