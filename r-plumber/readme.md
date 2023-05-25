# R - Plumber Monitoring

## Prerequsites
1. Download and install R.

2. For Windows: Add this to a `Path` environment variable (change version as needed)
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
   ![](images/r-plumber_01.png)

2. Go to http://127.0.0.1:8000/__docs__/ to generate some traffic.
   ![](images/r-plumber_02.png)

3. Go to http://localhost:8000/metrics to see the following metrics.

    | metric name | metric type |
    | :---------- | :---------- |
    | process_cpu_seconds_total | counter |
    | process_cpu_seconds_total_created | gauge |
    | http_request_total | counter |
    | http_request_total_created | gauge |
    | http_request_duration_seconds | histogram |
    | http_request_duration_seconds_created | gauge |
   
4. Run the OpenTelemetry Collector with the `otel-config_r-plumber.yaml`
   ```
   ./otelcol-contrib.exe --config=file:'./otel-config_r-plumber.yml'
   ```

# New Relic Example
Go to APM & Services > OpenTelemetry to see the Plumber entity.
![](images/r-plumber_04.png)

Check the Summary > Metrics page to see basic information
![](images/r-plumber_05.png)

Click on `Transactions` on the left to see additional metrics.
![](images/r-plumber_06.png)

Finally, go to the `Metrics Explorer` to see everything else.
![](images/r-plumber_07.png)
