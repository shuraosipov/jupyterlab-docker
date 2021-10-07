# This is a docker image with jupyter lab

## Instalation
Build docker image
```
docker build -t jupyter-lab-workspace .
```

Run container and mount your current working directory to the /workplace directory inside containter, so that your changes will be saved locally on your host machine.
```
docker run -p 8888:8888 -v $PWD:/workspace jupyter-lab-workspace
```

The command above will start jupyter lab session.
It will print out notebook URL in the stdout as below:
```
To access the server, open this file in a browser:
        file:///home/feynman/.local/share/jupyter/runtime/jpserver-1-open.html
    Or copy and paste one of these URLs:
        http://06cdd3ca38ad:8888/lab?token=5fdf18d30fcf2a7f66eaf06e4dafc5f785c07957772dab82
     or http://127.0.0.1:8888/lab?token=5fdf18d30fcf2a7f66eaf06e4dafc5f785c07957772dab82
```
