FROM python:3.9.2-alpine as base

WORKDIR /src
COPY requirements.txt requirements.txt
COPY app/ app/
COPY config/ config/
ENV FLASK_APP /src/app/app.py

# Install our Flask application
RUN pip install -r requirements.txt
EXPOSE 5000

CMD ["python", "-m", "flask", "run", "--host=0.0.0.0"]
