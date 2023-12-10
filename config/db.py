# db.py
import mysql.connector

db_config = {
    'host': 'localhost',
    'user': 'nicolas',
    'password': 'colocolo89',
    'database': 'GestionEmergencia',
}

def obtener_conexion():
    conexion = mysql.connector.connect(**db_config)
    cursor = conexion.cursor(dictionary=True)
    return conexion, cursor
