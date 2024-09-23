FROM python:3.11
WORKDIR /data
RUN apt-get update && apt-get install -y wget
RUN wget https://bootstrap.pypa.io/get-pip.py && python3.11 get-pip.py --force-reinstall
RUN pip install django==3.2
COPY . .
RUN python manage.py migrate
EXPOSE 8000
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
