# API de Gestión de Emergencia

Este proyecto es una API Flask que gestiona información de la base de datos de gestion de emergencias.

## Configuración

### 1. Clonar el repositorio

```bash
git clone https://github.com/NyRoo12/api-emergencias.git
cd api-gestion-emergencia

```

### 2. Configurar el config/db.py con sus datos de mariadb

```# db.py
import mysql.connector

db_config = {
    'host': 'localhost',
    'user': 'su_usuario', <---- EDITAR
    'password': 'su_contraseña', <---- EDITAR
    'database': 'GestionEmergencia',
}

def obtener_conexion():
    conexion = mysql.connector.connect(**db_config)
    cursor = conexion.cursor(dictionary=True)
    return conexion, cursor```
```

### 3. Iniciar en la carpeta principal con 

``` python3 run.py ```


