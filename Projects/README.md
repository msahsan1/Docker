<pre>
<h2> Docker </h2>
ahsan@vmmint:~/Docker/Projects$ docker build -t msahsan1/hello-world-python:0.2 .
[+] Building 15.4s (9/9) FINISHED                                                                                            docker:default
 => [internal] load build definition from Dockerfile                                                                                   0.1s
 => => transferring dockerfile: 157B                                                                                                   0.0s
 => [internal] load .dockerignore                                                                                                      0.1s
 => => transferring context: 2B                                                                                                        0.0s
 => [internal] load metadata for docker.io/library/python:alpine3.10                                                                   2.2s
 => [1/4] FROM docker.io/library/python:alpine3.10@sha256:152b1952d4b42e360f2efd3037df9b645328c0cc6fbe9c63decbffbff407b96a             7.1s
 => => resolve docker.io/library/python:alpine3.10@sha256:152b1952d4b42e360f2efd3037df9b645328c0cc6fbe9c63decbffbff407b96a             0.0s
 => => sha256:152b1952d4b42e360f2efd3037df9b645328c0cc6fbe9c63decbffbff407b96a 1.65kB / 1.65kB                                         0.0s
 => => sha256:655edcda221823fcdb79b61095dd77e6c767bf1543505dcf078f6945497c7fcf 1.37kB / 1.37kB                                         0.0s
 => => sha256:cf02325838736bb42f50cff8931c1b0e5363d6106283d98ba769ac81376e9125 7.14kB / 7.14kB                                         0.0s
 => => sha256:21c83c5242199776c232920ddb58cfa2a46b17e42ed831ca9001c8dbc532d22d 2.80MB / 2.80MB                                         0.9s
 => => sha256:9a80d14c35bdcf3182348df62dae02f393b19e47d873d74d008296c54b784602 300.94kB / 300.94kB                                     0.6s
 => => sha256:0d32a27dde5abbed916f46fcb2c81121cc1d09851ba5c744322ab51207f7e295 22.57MB / 22.57MB                                       5.8s
 => => sha256:2cb80a514e077437cb1c8bc06caa99b515ba357f530d64833423d3e3b5b60c1a 230B / 230B                                             0.8s
 => => sha256:d5d3b19aaadda1328d19cdfa8b1933e08c113e613efa7d0083e6b317cab8031a 1.93MB / 1.93MB                                         1.4s
 => => extracting sha256:21c83c5242199776c232920ddb58cfa2a46b17e42ed831ca9001c8dbc532d22d                                              0.2s
 => => extracting sha256:9a80d14c35bdcf3182348df62dae02f393b19e47d873d74d008296c54b784602                                              0.0s
 => => extracting sha256:0d32a27dde5abbed916f46fcb2c81121cc1d09851ba5c744322ab51207f7e295                                              0.9s
 => => extracting sha256:2cb80a514e077437cb1c8bc06caa99b515ba357f530d64833423d3e3b5b60c1a                                              0.0s
 => => extracting sha256:d5d3b19aaadda1328d19cdfa8b1933e08c113e613efa7d0083e6b317cab8031a                                              0.2s
 => [internal] load build context                                                                                                      0.0s
 => => transferring context: 478B                                                                                                      0.0s
 => [2/4] WORKDIR /app                                                                                                                 0.3s
 => [3/4] COPY . /app                                                                                                                  0.0s
 => [4/4] RUN pip install -r requirements.txt                                                                                          5.4s
 => exporting to image                                                                                                                 0.2s
 => => exporting layers                                                                                                                0.2s
 => => writing image sha256:1a80b97e6a944c006ca73e2b05ff1e92a39c933c6c82c7c0ac90fd037806d073                                           0.0s 
 => => naming to docker.io/msahsan1/hello-world-python:0.2                                                                             0.0s 
mahsan@vmmint:~/Docker/Projects$                                                                                                            
                  
mahsan@vmmint:~/Docker/Projects$ docker images
REPOSITORY                    TAG       IMAGE ID       CREATED              SIZE                                                            
msahsan1/hello-world-python   0.2       1a80b97e6a94   About a minute ago   91.2MB
mahsan@vmmint:~/Docker/Projects$ 


mahsan@vmmint:~/Docker/Projects$ docker images
REPOSITORY                    TAG       IMAGE ID       CREATED         SIZE
msahsan1/hello-world-python   0.2       1a80b97e6a94   2 minutes ago   91.2MB
mahsan@vmmint:~/Docker/Projects$ docker run -p 5000:5000 -d msahsan1/hello-world-python:0.2
d5c0462b98017dfb218535b4b6d5a0683ffd6ad99ebbabeeb469e19e4e9393e7
mahsan@vmmint:~/Docker/Projects$ 

mahsan@vmmint:~/Docker/Projects$ docker ps -a
CONTAINER ID   IMAGE                             COMMAND                  CREATED          STATUS          PORTS                                       NAMES
d5c0462b9801   msahsan1/hello-world-python:0.2   "/bin/sh -c 'python …"   17 seconds ago   Up 17 seconds   0.0.0.0:5000->5000/tcp, :::5000->5000/tcp   objective_aryabhata
mahsan@vmmint:~/Docker/Projects$ 

ahsan@vmmint:~/Docker/Projects$ docker logs d5c0462b98017dfb218535b4b6d5a0683ffd6ad99ebbabeeb469e19e4e9393e7
 * Serving Flask app 'launch'
 * Debug mode: on
WARNING: This is a development server. Do not use it in a production deployment. Use a production WSGI server instead.
 * Running on all addresses (0.0.0.0)
 * Running on http://127.0.0.1:5000
 * Running on http://172.17.0.2:5000
Press CTRL+C to quit
 * Restarting with stat
 * Debugger is active!
 * Debugger PIN: 522-619-432
mahsan@vmmint:~/Docker/Projects$ 

mahsan@vmmint:~/Docker/Projects$ curl localhost:5000
{"message":"Hello World Python v1"}mahsan@vmmint:~/Docker/Projects$ 

mahsan@vmmint:~/Docker/Projects$ docker images
REPOSITORY                    TAG       IMAGE ID       CREATED          SIZE
msahsan1/hello-world-python   0.2       1a80b97e6a94   13 minutes ago   91.2MB
mahsan@vmmint:~/Docker/Projects$ docker history 1a80b97e6a94
IMAGE          CREATED          CREATED BY                                      SIZE      COMMENT
1a80b97e6a94   13 minutes ago   CMD ["/bin/sh" "-c" "python ./launch.py"]       0B        buildkit.dockerfile.v0
<missing>      13 minutes ago   EXPOSE map[5000/tcp:{}]                         0B        buildkit.dockerfile.v0
<missing>      13 minutes ago   RUN /bin/sh -c pip install -r requirements.t…   11.1MB    buildkit.dockerfile.v0
<missing>      13 minutes ago   COPY . /app # buildkit                          356B      buildkit.dockerfile.v0
<missing>      13 minutes ago   WORKDIR /app                                    0B        buildkit.dockerfile.v0
<missing>      3 years ago      /bin/sh -c #(nop)  CMD ["python3"]              0B        
<missing>      3 years ago      /bin/sh -c set -ex;   wget -O get-pip.py "$P…   6.51MB    
<missing>      3 years ago      /bin/sh -c #(nop)  ENV PYTHON_GET_PIP_SHA256…   0B        
<missing>      3 years ago      /bin/sh -c #(nop)  ENV PYTHON_GET_PIP_URL=ht…   0B        
<missing>      3 years ago      /bin/sh -c #(nop)  ENV PYTHON_PIP_VERSION=20…   0B        
<missing>      3 years ago      /bin/sh -c cd /usr/local/bin  && ln -s idle3…   32B       
<missing>      3 years ago      /bin/sh -c set -ex  && apk add --no-cache --…   67.4MB    
<missing>      3 years ago      /bin/sh -c #(nop)  ENV PYTHON_VERSION=3.8.3     0B        
<missing>      3 years ago      /bin/sh -c #(nop)  ENV GPG_KEY=E3FF2839C048B…   0B        
<missing>      3 years ago      /bin/sh -c apk add --no-cache ca-certificates   551kB     
<missing>      3 years ago      /bin/sh -c #(nop)  ENV LANG=C.UTF-8             0B        
<missing>      3 years ago      /bin/sh -c #(nop)  ENV PATH=/usr/local/bin:/…   0B        
<missing>      3 years ago      /bin/sh -c #(nop)  CMD ["/bin/sh"]              0B        
<missing>      3 years ago      /bin/sh -c #(nop) ADD file:66a440394c2442570…   5.58MB    
mahsan@vmmint:~/Docker/Projects$ 



</pre>

