FROM continuumio/miniconda3:4.5.11

# You don't technically need vim, but I like having it for debugging purposes
RUN apt-get update -y; \
    apt-get upgrade -y; \
    apt-get install -y vim-tiny vim-athena

# Add a user and switch, using the default root user is BAD
RUN adduser --home /home/flask flask

USER flask
WORKDIR /home/flask

RUN mkdir -p flask_app

WORKDIR /home/flask/flask_app

# Always save your environments in a conda env file. 
# This makes it so much easier to fix your environment when you inadvertantly clobber it
COPY flask-app-environment.yml environment.yml
RUN conda env create -f environment.yml
RUN echo "alias l='ls -lah'" >> ~/.bashrc

# This is the conda magic. If you are running through a shell just activating the environment in your profile is peachy
RUN echo "source activate flask-app" >> ~/.bashrc

# This is the equivalent of running `source activate`
# Its handy to have in case you want to run additional commands in the Dockerfile
ENV CONDA_EXE /opt/conda/bin/conda
ENV CONDA_PYTHON_EXE /opt/conda/bin/python
ENV CONDA_PROMPT_MODIFIER (flask-app)
ENV CONDA_DEFAULT_ENV flask-app

# Modify for user
ENV CONDA_PREFIX /home/flask/.conda/envs/flask-app
ENV PATH /home/flask/.conda/envs/flask-app/bin:/opt/conda/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

COPY . ./

ENV HELLO WORLD
CMD ["/bin/bash", "-c", "/home/flask/flask_app/start_flask_app.sh"]
