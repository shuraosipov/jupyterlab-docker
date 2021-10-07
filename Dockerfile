FROM ubuntu:latest

RUN useradd -m feynman
RUN mkdir /workspace && chown -R feynman /workspace
RUN mkdir /miniconda && chown -R feynman /miniconda && chmod -R 755 /miniconda 


RUN apt-get update && \
    apt-get install -y locales wget && \
    rm -rf /var/lib/apt/lists/* && localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8
ENV LANG en_US.utf8

WORKDIR /tmp
USER feynman

RUN wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
RUN bash Miniconda3-latest-Linux-x86_64.sh -u -b -p /miniconda
ENV PATH=$PATH:/miniconda/condabin:/miniconda/bin
RUN conda install -c conda-forge jupyterlab

EXPOSE 8888

WORKDIR /workspace

CMD ["jupyter", "lab", "--port=8888", "--no-browser", "--ip=0.0.0.0", "--allow-root"]]

# If you want to save files back to the local filesystem use this instead
#USER root
#CMD ["jupyter", "lab", "--port=8888", "--no-browser", "--ip=0.0.0.0", "--allow-root"]]
