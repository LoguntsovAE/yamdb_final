FROM python:3.8.5

WORKDIR /code
COPY requirements.txt .
RUN pip install -r requirements.txt
RUN python manage.py makemigrations
RUN python manage.py migrate
RUN python manage.py collectstatic —noinput
COPY . .
CMD gunicorn api_yamdb.wsgi:application --bind 0.0.0.0:8000