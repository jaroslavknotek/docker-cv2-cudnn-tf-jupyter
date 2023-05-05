FROM hdgigante/python-opencv

EXPOSE 4444

RUN python3 -m ensurepip
RUN pip3 install jupyterlab

RUN mkdir /jupyterlab
WORKDIR /jupyterlab
CMD jupyter lab --port 4444 --allow-root --ip=0.0.0.0

