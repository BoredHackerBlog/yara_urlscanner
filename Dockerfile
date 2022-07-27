FROM python:3.10-buster

WORKDIR /app
COPY start.sh ./

COPY requirements.txt ./
RUN pip install --disable-pip-version-check --no-cache-dir -r requirements.txt

COPY app.py ./
COPY worker.py ./

COPY rules.yar ./

CMD [ "bash", "start.sh"]
