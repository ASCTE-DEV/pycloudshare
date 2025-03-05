# syntax=docker/dockerfile:1

ARG PYTHON_VERSION=3.11.7
FROM ubuntu AS base

# Prevents Python from writing pyc files.
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

WORKDIR /app

RUN --mount=type=cache,target=/root/.cache/pip \
    --mount=type=bind,source=requirements.txt,target=requirements.txt \
    python -m pip install -r requirements.txt

COPY . .

# If you want to run the application via a Flask app
# EXPOSE 5200
# CMD ["gunicorn", "-b", "0.0.0.0:5200", "--log-level=DEBUG", "run:app"]
