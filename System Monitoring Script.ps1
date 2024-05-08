{\rtf1\ansi\ansicpg1252\cocoartf2761
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\margl1440\margr1440\vieww11520\viewh8400\viewkind0
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0

\f0\fs24 \cf0 # Prompt for user name\
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
$diskUsage = Get-WmiObject -Class Win32_LogicalDisk -Filter "DeviceID='C:'" | Select-Object -ExpandProperty FreeSpace\
$diskUsagePercent = ($diskUsage / (Get-WmiObject -Class Win32_LogicalDisk -Filter "DeviceID='C:'" | Select-Object -ExpandProperty Size)) * 100\
\
# Email configuration\
$smtpServer = \'93****_server"\
$from = \'93****@****.com"\
$to = \'93****@****.com"\
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