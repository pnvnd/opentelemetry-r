# OpenTelemetry Collector Configuration Examples
This is a repository of OpenTelemetry Collector configuration files for commonly observed applications.  Start by creating an OpenTelemetry Collector service on your local machine to make it easier to start and stop the OpenTelemetry Collector for testing purposes.

# OpenTelemetry Collector as a Service

## Windows (Manual)

1. Download and extract the OpenTelemetry Collector somewhere (`C:\Program Files\OpenTelemetry` in this example)
2. Get an OpenTelemetry configuration file and take note of the path and file name (`C:\Program Files\OpenTelemetry\otel-config.yaml` in this example)
3. Create a Windows Service using PowerShell as an Administrator. You'll need to enter your service account credentials.  In this example, the current logged in user is used.
   ```PowerShell
   New-Service -Name "otelcol-contrib" -BinaryPathName "${apppath}\otelcol-contrib.exe --config=file:`"${apppath}\otel-config.yaml`"" -DisplayName "OpenTelemetry Collector (contrib)" -StartupType Manual -Description "OpenTelemetry Collector v${version}" -Credential "$Env:UserDomain\$Env:UserName"
   ```
   ![](images/otelcol-contrib_service1.png)
   ![](images/otelcol-contrib_service2.png)
4. Start the service with `Start-Service -Name "otelcol-contrib"`
   ![](images/otelcol-contrib_service3.png)
   ![](images/otelcol-contrib_service4.png)
   ![](images/otelcol-contrib_service5.png)
5. (optional) Stop the service with `Stop-Service -Name "otelcol-contrib"`
6. (optional) Delete the service with `Remove-Service -Name "otelcol-contrib"` or for older version of PowerShell:
   ```PowerShell
   (Get-WmiObject -Class Win32_Service -Filter "Name='otelcol-contrib'").delete()
   ```

## Windows (Automated)

```PowerShell
$ProgressPreference = "SilentlyContinue"
$apppath = "C:\Program Files\OpenTelemetry"
$version = "0.77.0"
$otelcol = "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v${version}/otelcol-contrib_${version}_windows_amd64.tar.gz"

mkdir $apppath
cd $apppath
Invoke-WebRequest -Uri $otelcol -OutFile $apppath\otelcol-contrib.tar.gz
tar -xzf .\otelcol-contrib.tar.gz
New-Item otel-config.yaml

New-Service -Name "otelcol-contrib" -BinaryPathName "${apppath}\otelcol-contrib.exe --config=file:`"${apppath}\otel-config.yaml`"" -DisplayName "OpenTelemetry Collector (contrib)" -StartupType Manual -Description "OpenTelemetry Collector v${version}" -Credential "$Env:UserDomain\$Env:UserName"
```
