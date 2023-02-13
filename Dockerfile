FROM ubuntu:jammy-20230126

WORKDIR /django-app

COPY . .

RUN sudo apt update && sudo apt install -y python3 && sudo apt install -y python3-pip

RUN pip install -r requirements.txt && \
    python3 manage.py migrate && \
    python3 manage.py createsuperuser && \

EXPOSE 8000

CMD ["python3", "manage.py", "runserver", "0.0.0.0:8000"]