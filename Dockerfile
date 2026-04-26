FROM python:3.13
WORKDIR / MYAPPP
COPY . .
CMD ["python", "app.py"]