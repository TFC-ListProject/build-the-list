FROM python:3.6

ADD requirements.txt /src/requirements.txt
ADD build_the_list/application.py /src/application.py
ADD build_the_list/config.py /src/config.py

WORKDIR /src

RUN pip install -r requirements.txt

EXPOSE 5000

CMD ["python", "/src/application.py"]
