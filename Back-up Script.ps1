{\rtf1\ansi\ansicpg1252\cocoartf2761
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;\red0\green0\blue0;}
{\*\expandedcolortbl;;\cssrgb\c0\c0\c0;}
\margl1440\margr1440\vieww15160\viewh16800\viewkind0
\deftab720
\pard\pardeftab720\partightenfactor0

\f0\fs24 \cf0 \
# Prompt for user name\
$name = Read-Host "Hello! What's your name?"\
\
# Source directory to be backed up\
$sourceDir = "C:\\Users\\****\\Desktop\\Videos"\
\
# Destination directory for backups\
$backupDir = "C:\\Shared\\Home"\
\
# Create a timestamp for the backup file\
$timestamp = Get-Date -Format "yyyyMMdd_HHmmss"\
\
# Create the backup file name\
$backupFile = "$backupDir\\backup_$timestamp.tar.gz"\
\
# Perform the backup\
Compress-Archive -Path $sourceDir -DestinationPath $backupFile\
\
\pard\pardeftab720\partightenfactor0
\cf0 \expnd0\expndtw0\kerning0
# Email configuration\
$smtpServer = "your_smtp_server"\
$from = "your_email@example.com"\
$to = "recipient@example.com"\
$subject = "Backup Completed"\
$body = "Hello, $name! Your backup is completed: $backupFile"\
\'a0\
# Send email\
Send-MailMessage -SmtpServer $smtpServer -From $from -To $to -Subject $subject -Body $body
\fs32 \
}