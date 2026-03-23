#!/bin/bash
docker_clean_exit() {
    SIGTERM_RECEIVED=1
    echo "Caught SIGTERM signal, performing processes cleanup"
    # Add your cleanup commands here, e.g., removing temporary files, stopping services
    kill -TERM ${PID_JUPYTER}
    echo "Cleanup complete. Exiting gracefully."
    exit 0 # Exit with success status after cleanup
}

# Watch for CTRL-C or SIGTERM signal
trap  docker_clean_exit SIGTERM

# Show in the logs that ENTRYPOINT is running correctly
echo "Start script is running. PID: $$"

# Run Jupyter notebook server
. ei/bin/activate
if [[ -n "${JUPYTER_TOKEN+x}" ]]; then
    echo "Starting Jupyter notebook with token"
    jupyter notebook --ip=* --ServerApp.iopub_data_rate_limit=100000000.0 --ServerApp.rate_limit_window=5000.0 &
else
    echo "Starting Jupyter notebook without token"
    jupyter notebook --ip=* --ServerApp.iopub_data_rate_limit=100000000.0 --ServerApp.rate_limit_window=5000.0 &
fi
PID_JUPYTER=$!

while true; do
  [[ ! -n "${SIGTERM_RECEIVED}" ]] && sleep 1
done
