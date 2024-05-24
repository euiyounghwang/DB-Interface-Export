# DB-Interface-Export
<i>Python DB Interface with Prometheus-Export

This is a repository that searches the desired table in the db in the Prometheus-Export application and delivers the record.


### Using Poetry: Create the virtual environment in the same directory as the project and install the dependencies:
```bash
python -m venv .venv
source .venv/bin/activate
pip install poetry

# --
poetry config virtualenvs.in-project true
poetry init
poetry add JPype1
poetry add psycopg2-binary
poetry add jaydebeapi
```
or you can run this shell script `./create_virtual_env.sh` to make an environment. then go to virtual enviroment using `source .venv/bin/activate`


