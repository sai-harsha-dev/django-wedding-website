FROM ubuntu:jammy-20230126 as build_stage

WORKDIR /django-app

COPY . .

RUN apt update && apt install -y python3 && apt install -y python3-pip

RUN pip install -r requirements.txt

FROM gcr.io/distroless/python3

WORKDIR /django-app

COPY --from=build_stage /django-app .

RUN python3 manage.py migrate && \
    python3 manage.py createsuperuser

EXPOSE 8000

CMD ["python3","manage.py", "runserver", "0.0.0.0:8000"]