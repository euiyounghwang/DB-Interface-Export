#!/bin/sh
DB_EXPORT_PATH=/home/devuser/monitoring/metrics_socket
SERVICE_NAME=es-service-db-api-service

# -- JAVA HONE Configuration
JAVA_HOME=/apps/java/latest
PATH=$PATH:$JAVA_HOME/bin
export JAVA_HOME
# --


SCRIPTDIR="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
cd $SCRIPTDIR

# -- PORT Check
PORT=5044

# Check if the port is active
PID=$(lsof -t -i :"$PORT")
# --

#echo $SCRIPTDIR

VENV=".venv"

# Python 3.11.7 with Window
if [ -d "$VENV/bin" ]; then
    source $VENV/bin/activate
else
    source $VENV/Scripts/activate
fi


# Cronjob
# -----
# DB API Service
# Go to DT nodes and sudo su
# */10 * * * * su - biadmin -c "/home/biadmin/monitoring/rest_api/db_interface_api/db_interface_api_service.sh start"
# ----

# See how we were called.
case "$1" in
  start)
        if ss -lnt | grep -q ":$PORT "; then
          echo "$SERVICE_NAME [Port $PORT] is being used (Listening as PID : $PID)"
          #kill -9 $PID
        else
          # Start daemon.
          echo "🦄 Starting $SERVICE_NAME";
          nohup python -m uvicorn main:app --reload --host=0.0.0.0 --port=5044 --workers 4 &> /dev/null &
          #gunicorn -k uvicorn.workers.UvicornWorker main:app --bind 0.0.0.0:3333 --workers 4
          # poetry run uvicorn main:app --reload --host=0.0.0.0 --port=8001 --workers 4
        fi
        ;;
  stop)
        # Stop daemons.
        echo "🦄 Shutting down $SERVICE_NAME";
        if ss -lnt | grep -q ":$PORT "; then
          kill -9 $PID
         else
          echo "🦄 $SERVICE_NAME was not Running"
        fi
        ;;
  restart)
        $0 stop
        sleep 2
        $0 start
        ;;
  status)
        if ss -lnt | grep -q ":$PORT "; then
          echo "🦄 $SERVICE_NAME is Running as PID: $PID"
        else
          echo "🦄 $SERVICE_NAME is not Running"
        fi
        ;;
    *)
        echo "Usage: $0 {start|stop|restart|status}"
        exit 1
esac