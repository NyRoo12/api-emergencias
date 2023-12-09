# app/api.py
from flask import Flask, jsonify, request
from app.data_operations import obtener_cantidad_total_fichas, obtener_datos, insertar_datos

app = Flask(__name__)

@app.route('/api/cantidadFichas', methods=['GET'])
def obtener_cantidad_total_fichas_route():
    cantidad_total_fichas = obtener_cantidad_total_fichas()
    if cantidad_total_fichas is not None:
        return jsonify({'cantidad_total_fichas': cantidad_total_fichas})
    else:
        return jsonify({'mensaje': 'Error al obtener la cantidad total de fichas'}), 500

@app.route('/api/obtenerDatos', methods=['GET'])
def obtener_datos_route():
    datos = obtener_datos()
    if datos is not None:
        return jsonify(datos)
    else:
        return jsonify({'mensaje': 'Error al obtener los datos'}), 500

@app.route('/api/insertarDatos/fichas', methods=['POST'])
def insertar_datos_ficha_route():
    try:
        nuevosdatos = request.json
        exito = insertar_datos(nuevosdatos)
        if exito:
            return jsonify({'mensaje': 'Datos insertados correctamente'}), 201
        else:
            return jsonify({'mensaje': 'Error al insertar los datos'}), 500
    except Exception as e:
        print("Error:", e)
        return jsonify({'error': str(e)}), 500

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000, debug=True)
