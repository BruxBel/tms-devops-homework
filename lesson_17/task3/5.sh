#!/bin/bash

# Конфигурация
DB_USER="postgres"
DB_NAME="my_database"
BACKUP_DIR="/path/to/backups"
REMOTE_SERVER="user@remote-server:/path/to/backups"
RETENTION_DAYS=7

# Создание имени файла с timestamp
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
BACKUP_FILE="$BACKUP_DIR/backup_${DB_NAME}_${TIMESTAMP}.sql"

# Создание директории для бэкапов если не существует
mkdir -p $BACKUP_DIR

# Создание бэкапа
echo "Creating backup: $BACKUP_FILE"
pg_dump -U $DB_USER -d $DB_NAME -f $BACKUP_FILE

# Проверка успешности создания бэкапа
if [ $? -eq 0 ]; then
    echo "Backup created successfully"
    
    # Сжатие бэкапа
    gzip $BACKUP_FILE
    echo "Backup compressed"
    
    # Отправка на удаленный сервер
    scp "${BACKUP_FILE}.gz" $REMOTE_SERVER
    
    if [ $? -eq 0 ]; then
        echo "Backup transferred to remote server successfully"
    else
        echo "Error transferring backup to remote server"
        exit 1
    fi
    
    # Очистка старых бэкапов (старше 7 дней)
    find $BACKUP_DIR -name "backup_${DB_NAME}_*.sql.gz" -mtime +$RETENTION_DAYS -delete
    echo "Old backups cleaned up"
    
else
    echo "Error creating backup"
    exit 1
fi