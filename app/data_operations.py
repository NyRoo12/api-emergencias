# app/data_operations.py
from config.db import obtener_conexion


def obtener_cantidad_total_fichas():
    try:
        conexion, cursor = obtener_conexion()
        consulta = "SELECT COUNT(*) AS cantidad FROM ficha_interna"
        cursor.execute(consulta)
        resultado = cursor.fetchone()
        cursor.close()
        conexion.close()
        return resultado['cantidad'] if resultado else None
    except Exception as e:
        print("Error:", e)
        return None

def obtener_datos():
    try:
        conexion, cursor = obtener_conexion()
        consulta_fichas = "SELECT COUNT(*) AS cantidad_fichas FROM ficha_interna"
        cursor.execute(consulta_fichas)
        resultado_fichas = cursor.fetchone()
        cantidad_fichas = resultado_fichas['cantidad_fichas']

        consulta = """
        SELECT ficha_interna.*, emergencias.*, afectado.*
        FROM afectado
        JOIN emergencias ON afectado.id_emergencia = emergencias.id_emergencia
        JOIN ficha_interna ON emergencias.id_ficha = ficha_interna.id_ficha
        """

        cursor.execute(consulta)
        resultados = cursor.fetchall()

        cursor.close()
        conexion.close()

        return {'cantidad_total_fichas': cantidad_fichas, 'datos': resultados}
    except Exception as e:
        print("Error:", e)
        return None

def insertar_datos(nuevosdatos):
    try:
        conexion, cursor = obtener_conexion()

        consulta_ficha_interna = "INSERT INTO ficha_interna (id_ficha, fecha, hora) VALUES (%s,%s,%s);"
        datos_ficha_interna = (
            nuevosdatos['ficha_interna']['id_ficha'],
            nuevosdatos['ficha_interna']['fecha'],
            nuevosdatos['ficha_interna']['hora']
        )
        cursor.execute(consulta_ficha_interna, datos_ficha_interna)

        consulta_emergencias = "INSERT INTO emergencias (id_emergencia, id_ficha, sector,coordenadaLatitud,coordenadaLongitud,tipo, descripcion, danos_siniestro, propiedad,evaluacion_emergencias,damnificados,total_afectados,total_femenino,total_masculino,cantidad_ninos,cantidad_adulto,cantidad_adultomayor, fallecidos, seguro) VALUES (%s,%s,%s, %s,%s,%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s);"
        datos_emergencias = (
            nuevosdatos['emergencias']['id_emergencia'],
            nuevosdatos['ficha_interna']['id_ficha'],
            nuevosdatos['emergencias']['sector'],
            nuevosdatos['emergencias']['coordenadaLatitud'],
            nuevosdatos['emergencias']['coordenadaLongitud'],
            nuevosdatos['emergencias']['tipo'],
            nuevosdatos['emergencias']['descripcion'],
            nuevosdatos['emergencias']['danos_siniestro'],
            nuevosdatos['emergencias']['propiedad'],
            nuevosdatos['emergencias']['evaluacion_emergencias'],
            nuevosdatos['emergencias']['damnificados'],
            nuevosdatos['emergencias']['total_afectados'],
            nuevosdatos['emergencias']['total_femenino'],
            nuevosdatos['emergencias']['total_masculino'],
            nuevosdatos['emergencias']['cantidad_ninos'],
            nuevosdatos['emergencias']['cantidad_adulto'],
            nuevosdatos['emergencias']['cantidad_adultomayor'],
            nuevosdatos['emergencias']['fallecidos'],
            nuevosdatos['emergencias']['seguro']
        )
        cursor.execute(consulta_emergencias, datos_emergencias)

        consulta_afectado = "INSERT INTO afectado (id_afectado, nombre_completo, rut, id_emergencia, domicilio, telefono, sexo, etapavida, tipodano) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s);"
        datos_afectado = (
            nuevosdatos['afectado']['id_afectado'],
            nuevosdatos['afectado']['nombre_completo'],
            nuevosdatos['afectado']['rut'],
            nuevosdatos['emergencias']['id_emergencia'],
            nuevosdatos['afectado']['domicilio'],
            nuevosdatos['afectado']['telefono'],
            nuevosdatos['afectado']['sexo'],
            nuevosdatos['afectado']['etapavida'],
            nuevosdatos['afectado']['tipodano'],
        )
        cursor.execute(consulta_afectado, datos_afectado)

        conexion.commit()

        cursor.close()
        conexion.close()
        return True
    except Exception as e:
        print("Error:", e)
        return False
