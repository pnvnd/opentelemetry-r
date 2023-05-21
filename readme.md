# OpenTelemetry - R

## Prerequsites
1. Download and install R.

2. Add this to a `Path` environment variable (change version as needed)
   ```
   C:\Program Files\R\R-4.3.0\bin
   ```

3. Launch `R.exe` or `R.app` and install the following packages:
   ```
   install.packages("openmetrics")
   install.packages("plumber")
   install.packages("httr")
   ```

4. Download [`otelcol-contrib`](https://github.com/open-telemetry/opentelemetry-collector-releases/releases) and extract somewhere.

## Plumber

1. Run this in a terminal to start the Plumber server.  You may need to allow this app over the firewall.
   ```
   RScript plumberSrv.R
   ```
   ![](images/r-plumber.png)

2. Go to http://localhost:8000/metrics to see the following metrics

    | metric name | metric type |
    | :---------- | :---------- |
    | process_cpu_seconds_total | counter |
    | process_cpu_seconds_total_created | gauge |
    | http_request_total | counter |
    | http_request_total_created | gauge |
    | http_request_duration_seconds | histogram |
    | http_request_duration_seconds_created | gauge |
   
3. Run the OpenTelemetry Collector with the `otel-config_plumber.yml`
   ```
   ./otelcol-contrib.exe --config=file:'D:/OpenTelemetry/otel-config_plumber.yml'
   ```
   ![](images/otelcol-contrib.png)

# Batch Instrumentation

1. Download and extract `pushgateway` from https://github.com/prometheus/pushgateway/releases
2. Run `pushgateway.exe` in a terminal.  Optionally, create this as a Windows service to run in the background.  You may need to allow this over the firewall.
   ![](images/pushgateway.png)

3. Run your batch job
   ```
   Rscript ./batch/batchjob.R
   ```
4. Go to http://localhost:9091/metrics to see the metrics

5. Run the OpenTelemetry Collector with the `otel-config_batch.yml`
   ```
   ./otelcol-contrib.exe --config=file:'D:/OpenTelemetry/otel-config_batch.yml'
   ```

