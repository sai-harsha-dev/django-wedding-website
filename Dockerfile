FROM ubuntu:jammy-20230126 as build_stage

WORKDIR /django-app

COPY . .

RUN apt update && apt install -y python3 && apt install -y python3-pip

RUN pip install -r requirements.txt && \
    python3 manage.py migrate && \
    python3 manage.py createsuperuser

FROM gcr.io/distroless/python3

WORKDIR /django-app

COPY --from=build_stage /django-app .

EXPOSE 8000

CMD ["manage.py", "runserver", "0.0.0.0:8000"]