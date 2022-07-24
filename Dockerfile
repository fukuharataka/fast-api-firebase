# alpineでは動かない
FROM python:3

WORKDIR /usr/src/app
COPY ./app /usr/src/app

RUN apt-get update
RUN apt-get -y install locales && \
    localedef -f UTF-8 -i ja_JP ja_JP.UTF-8 \
    && pip install --no-cache-dir --trusted-host pypi.python.org -r requirements.txt

EXPOSE 8000
# FastAPIを8000ポートで待機
CMD ["uvicorn", "main:app", "--reload", "--host", "0.0.0.0", "--port", "8000"]