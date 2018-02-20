FROM python:2.7

RUN apt-get update; apt-get install -y libxmlsec1 libxmlsec1-dev

COPY . /root/python-social-auth

WORKDIR /root/python-social-auth

RUN python setup.py install
RUN pip install -r test_requirements.txt

ENTRYPOINT nosetests social/tests/backends/test_saml.py