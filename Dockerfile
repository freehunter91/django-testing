FROM pypy:slim-buster
 RUN apt-get update \
     && apt-get install -y \
        gcc gettext \
        postgresql-client libpq-dev \
        sqlite3 \
        nginx \
        --no-install-recommends && rm -rf /var/lib/apt/lists/*

# COPY requirements.txt ./
# RUN pip install -r requirements.txt
RUN rm -rf /root/.cache/pip
RUN pip install django
RUN mkdir /webapp
ADD firstProject /webapp
WORKDIR /webapp
CMD ["python", "manage.py", "runserver"]
