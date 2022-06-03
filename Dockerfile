FROM python:3.9.2-alpine as base

RUN adduser -D worker
USER worker
WORKDIR /home/worker

COPY --chown=worker:worker requirements.txt requirements.txt
COPY --chown=worker:worker app/ app/
COPY --chown=worker:worker config/ config/

ENV PATH="/home/worker/.local/bin:${PATH}"
ENV FLASK_APP="/home/worker/app/app.py"

# Install our Flask application
RUN pip install -r requirements.txt
EXPOSE 5000
LABEL maintainer="Philip De Lorenzo <philip.delorenzo@smarsh.com>"

CMD ["python", "-m", "flask", "run", "--host=0.0.0.0"]
