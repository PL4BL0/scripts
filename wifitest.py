import subprocess
import json
import csv
import os
from datetime import datetime

# Nombre del archivo donde se guardarán los datos
ARCHIVO_CSV = "registro_velocidad_wifi.csv"

def ejecutar_test():
    print("\n" + "🚀"*5 + " INICIANDO NUEVO TEST DE VELOCIDAD " + "🚀"*5)
    
    # 1. Pedir datos
    zona = input("📍 Ingresa la ZONA (ej: Cocina, Pieza): ")
    wifi_ssid = input("📶 Ingresa nombre del WIFI (SSID): ")
    
    print(f"\n⏳ Midiendo velocidad en '{zona}'... (Esto toma unos 30 seg)")

    try:
        # CAMBIO IMPORTANTE: Quitamos check=True para manejar el error manualmente
        # y agregamos '--secure' para usar HTTPS (es mas estable)
        resultado = subprocess.run(
            ["speedtest-cli", "--json", "--secure"], 
            capture_output=True, 
            text=True
        )
        
        # Verificamos si hubo error en la ejecución (código distinto de 0)
        if resultado.returncode != 0:
            print("\n❌ ERROR CRÍTICO DE CONEXIÓN:")
            print(f"La herramienta speedtest falló. Razón técnica:\n{resultado.stderr}")
            print("👉 CONSEJO: Verifica que tengas internet en esta red navegando en Chrome/Safari.")
            return # Salimos de la función para no intentar guardar datos vacíos

        datos = json.loads(resultado.stdout)
        
        # 3. Procesar datos
        descarga = round(datos["download"] / 1_000_000, 2)
        subida = round(datos["upload"] / 1_000_000, 2)
        ping = round(datos["ping"], 2)
        fecha = datetime.now().strftime("%Y-%m-%d %H:%M:%S")

        # 4. Mostrar resultado actual destacado
        print(f"\n✅ RESULTADO ACTUAL: Bajada: {descarga} Mbps | Subida: {subida} Mbps | Ping: {ping} ms")

        # 5. Guardar
        guardar_en_csv(fecha, zona, wifi_ssid, descarga, subida, ping)

        # 6. MOSTRAR TABLA COMPARATIVA
        mostrar_historial()

    except FileNotFoundError:
        print("\n❌ Error: Falta 'speedtest-cli'. Instálalo con 'pip install speedtest-cli'.")
    except Exception as e:
        print(f"\n❌ Ocurrió un error inesperado: {e}")

def guardar_en_csv(fecha, zona, wifi, down, up, ping):
    existe = os.path.isfile(ARCHIVO_CSV)
    with open(ARCHIVO_CSV, mode='a', newline='', encoding='utf-8') as f:
        writer = csv.writer(f)
        if not existe:
            writer.writerow(["Fecha", "Zona", "WiFi", "Bajada(Mb)", "Subida(Mb)", "Ping(ms)"])
        writer.writerow([fecha, zona, wifi, down, up, ping])

def mostrar_historial():
    print("\n" + "="*85)
    print(f"📊 HISTORIAL Y COMPARATIVA ({ARCHIVO_CSV})")
    print("="*85)
    
    # Formato de columnas: {:<20} significa alinear a izquierda con 20 espacios
    formato = "{:<20} | {:<15} | {:<15} | {:<12} | {:<12} | {:<10}"
    
    try:
        with open(ARCHIVO_CSV, mode='r', encoding='utf-8') as f:
            reader = csv.reader(f)
            datos = list(reader)
            
            # Imprimir encabezados
            header = datos[0]
            print(formato.format(*header))
            print("-" * 85)
            
            # Imprimir filas de datos
            for fila in datos[1:]:
                # Añadimos 'Mbps' visualmente a las filas para que se vea claro
                print(formato.format(fila[0], fila[1], fila[2], fila[3], fila[4], fila[5]))
                
    except FileNotFoundError:
        print("Aún no hay historial.")
    print("="*85 + "\n")

if __name__ == "__main__":
    ejecutar_test()