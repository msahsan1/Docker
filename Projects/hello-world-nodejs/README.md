<pre>
<h2> Hello World nodejs </h2>
ahsan@vmmint:~/Docker/Projects/hello-world-nodejs$ docker build -t msahsan1/hello-world-nodejs:0.2 .
[+] Building 13.5s (10/10) FINISHED                                                                                                                  docker:default
 => [internal] load build definition from Dockerfile                                                                                                           0.0s
 => => transferring dockerfile: 133B                                                                                                                           0.0s
 => [internal] load .dockerignore                                                                                                                              0.0s
 => => transferring context: 2B                                                                                                                                0.0s
 => [internal] load metadata for docker.io/library/node:8.16.1-alpine                                                                                          1.2s
 => [auth] library/node:pull token for registry-1.docker.io                                                                                                    0.0s
 => [1/4] FROM docker.io/library/node:8.16.1-alpine@sha256:e1d58a32a7303b3f95f64fe13f2c6679e42879f02a2b77e06771a023e7706e02                                    0.0s
 => [internal] load build context                                                                                                                              0.0s
 => => transferring context: 861B                                                                                                                              0.0s
 => CACHED [2/4] WORKDIR /app                                                                                                                                  0.0s
 => [3/4] COPY . /app                                                                                                                                          0.0s
 => [4/4] RUN npm install                                                                                                                                     11.4s
 => exporting to image                                                                                                                                         0.7s
 => => exporting layers                                                                                                                                        0.7s
 => => writing image sha256:ce44484716806d63efed4cbcd39f1e05f498aa425f4510e231ef09616cd91bd2                                                                   0.0s 
 => => naming to docker.io/msahsan1/hello-world-nodejs:0.2                                                                                                     0.0s 
mahsan@vmmint:~/Docker/Projects/hello-world-nodejs$                                                                                                                 
                

mahsan@vmmint:~/Docker/Projects/hello-world-nodejs$ docker images
REPOSITORY                    TAG       IMAGE ID       CREATED              SIZE                                                                                    
msahsan1/hello-world-nodejs   0.2       ce4448471680   About a minute ago   108MB
msahsan1/hello-world-python   0.2       1a80b97e6a94   3 hours ago          91.2MB
mahsan@vmmint:~/Docker/Projects/hello-world-nodejs$ 


    
ahsan@vmmint:~/Docker/Projects/hello-world-nodejs$ docker container run -d -p 5001:5000 msahsan1/hello-world-nodejs:0.2
11f833752c968c960e43a1d7ba460cc368cdbf581ecce040c1100f1309f70a23
mahsan@vmmint:~/Docker/Projects/hello-world-nodejs$ docker ps -a
CONTAINER ID   IMAGE                             COMMAND                  CREATED         STATUS         PORTS                                       NAMES
11f833752c96   msahsan1/hello-world-nodejs:0.2   "docker-entrypoint.s…"   5 seconds ago   Up 5 seconds   0.0.0.0:5001->5000/tcp, :::5001->5000/tcp   stoic_visvesvaraya
d5c0462b9801   msahsan1/hello-world-python:0.2   "/bin/sh -c 'python …"   3 hours ago     Up 3 hours     0.0.0.0:5000->5000/tcp, :::5000->5000/tcp   objective_aryabhata
mahsan@vmmint:~/Docker/Projects/hello-world-nodejs$ 

mahsan@vmmint:~/Docker/Projects/hello-world-nodejs$ curl localhost:5001
{"message":"Hello World JavaScript v1"}mahsan@vmmint:~/Docker/Projects/hello-world-nodejs$ curl localhost:5000
{"message":"Hello World Python v1"}mahsan@vmmint:~/Docker/Projects/hello-world-nodejs$ 


            

</pre>

