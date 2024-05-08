\f0\fs24 \cf0 \
# Prompt for user name\
$name = Read-Host "Hello! What's your name?"\
\
# Source dir to be backed up\
$sourceDir = "C:\\Users\\****\\Desktop\\Videos"\
\
# Destination dir for backups\
$backupDir = "C:\\Shared\\Home"\
\
# Timestamp for the backup file\
$timestamp = Get-Date -Format "yyyyMMdd_HHmmss"\
\
# Creating the backup file name\
$backupFile = "$backupDir\\backup_$timestamp.tar.gz"\
\
# Performing the backup\
Compress-Archive -Path $sourceDir -DestinationPath $backupFile\
\
# Email configuration\
$smtpServer = "####smtp_server"\
$from = "#####@#####.com"\
$to = "####@#####.com"\
$subject = "Backup Completed"\
$body = "Hello, $name! Your backup is completed: $backupFile"\
\'a0\
# Send email\
Send-MailMessage -SmtpServer $smtpServer -From $from -To $to -Subject $subject -Body $body
\fs32 \
}
