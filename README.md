# DB-Interface-Export
<i>Python DB Interface with Prometheus-Export

FastAPI is a modern, fast (high-performance), web framework for building APIs with Python 3.8+ based on standard Python.
This is a repository that provides to deliver the records to the Prometheus-Export application.


### Install Poerty
```
https://python-poetry.org/docs/?ref=dylancastillo.co#installing-with-the-official-installer
```


### Using Python Virtual Environment
```bash
python -m venv .venv
source .venv/bin/activate
```


### Using Poetry: Create the virtual environment in the same directory as the project and install the dependencies:
```bash
poetry config virtualenvs.in-project true
poetry init
poetry add fastapi
poetry add uvicorn
poetry add pytz
poetry add httpx
poetry add pytest
poetry add pytest-cov
poetry add requests
poetry add python-dotenv
poetry add JPype1
poetry add psycopg2-binary
poetry add jaydebeapi
```
or you can run this shell script `./create_virtual_env.sh` to make an environment. then go to virtual enviroment using `source .venv/bin/activate`


