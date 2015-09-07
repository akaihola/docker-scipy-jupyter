# Installs the SciPy stack (excluding Sympy), Seaborn and Jupyter Notebook

FROM ubuntu:15.04
MAINTAINER Antti Kaihola <antti.15+docker-images@kaihola.fi>
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y -q \
    python3-jinja2 \
    python3-jsonschema \
    python3-pexpect \
    python3-pip \
    python3-pygments \
    python3-seaborn \
    python3-simplegeneric \
    python3-zmq
RUN pip3 install jupyter

RUN useradd --create-home jupyter
USER jupyter
RUN mkdir /home/jupyter/notebooks

WORKDIR /home/jupyter/notebooks
EXPOSE 8888
CMD ["jupyter", "notebook", "--ip", "0.0.0.0", "--port", "8888", "--no-browser"]
