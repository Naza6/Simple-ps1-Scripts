# Prompt for user name\
$name = Read-Host "Hello! What's your name?"\
\
# Monitor CPU usage\
$cpuUsage = Get-WmiObject -Class Win32_Processor | Select-Object -ExpandProperty LoadPercentage\
\
# Monitor memory usage\
$memUsage = (Get-WmiObject -Class Win32_OperatingSystem).TotalVisibleMemorySize\
$memFree = (Get-WmiObject -Class Win32_OperatingSystem).FreePhysicalMemory\
$memUsagePercent = ($memUsage - $memFree) / $memUsage * 100\
\
# Monitor disk usage\
$diskUsage = Get-WmiObject -Class Win32_LogicalDisk -Filter "DeviceID='C:###'" | Select-Object -ExpandProperty FreeSpace\
$diskUsagePercent = ($diskUsage / (Get-WmiObject -Class Win32_LogicalDisk -Filter "DeviceID='C:###'" | Select-Object -ExpandProperty Size)) * 100\
\
# Email configuration\
$smtpServer = \'####smpt_server"\
$from = \'####@####.com"\
$to = \'####@####.com"\
$subject = "System Monitoring Report"\
$body = @"\
Hello, $name!\
Here are the system usage stats:\
CPU Usage: $cpuUsage%\
Memory Usage: $memUsagePercent%\
Disk Usage: $diskUsagePercent%\
"@\
\
# Send email\
Send-MailMessage -SmtpServer $smtpServer -From $from -To $to -Subject $subject -Body $body\
}
