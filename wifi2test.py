import subprocess
import json
import csv
import os
import platform
import threading
import time
import sys
from datetime import datetime

# Archivo de guardado
ARCHIVO_CSV = "registro_velocidad_wifi.csv"

# Variables globales
resultado_test = None
error_test = None

def detectar_wifi():
    """Detecta el nombre de la red Wi-Fi según el Sistema Operativo"""
    sistema = platform.system()
    try:
        if sistema == "Windows":
            res = subprocess.check_output(["netsh", "wlan", "show", "interfaces"], encoding='cp850', errors='ignore')
            for linea in res.split('\n'):
                if " SSID" in linea and ":" in linea:
                    return linea.split(":")[1].strip()
                    
        elif sistema == "Darwin": # macOS (CORREGIDO)
            try:
                # INTENTO 1: Comando oficial 'networksetup' en la interfaz en0 (la más común)
                res = subprocess.check_output(["networksetup", "-getairportnetwork", "en0"], encoding='utf-8')
                # La salida típica es: "Current Wi-Fi Network: NombreDeTuRed"
                if "Current Wi-Fi Network" in res and ": " in res:
                    ssid = res.split(": ")[1].strip()
                    return ssid
                
                # INTENTO 2: Si en0 falla, probamos en1 (a veces pasa en MacBooks antiguos o con hubs)
                res = subprocess.check_output(["networksetup", "-getairportnetwork", "en1"], encoding='utf-8')
                if "Current Wi-Fi Network" in res and ": " in res:
                    ssid = res.split(": ")[1].strip()
                    return ssid

            except Exception:
                # Si todo falla, devolvemos error para que se maneje abajo
                pass
                    
        elif sistema == "Linux":
            try:
                return subprocess.check_output(["iwgetid", "-r"], encoding='utf-8').strip()
            except:
                res = subprocess.check_output("nmcli -t -f active,ssid dev wifi | grep '^yes'", shell=True, encoding='utf-8')
                return res.split(":")[1].strip()
    except Exception:
        return "Manual"
    
    return "Desconocido"

def animacion_carga(proceso_hilo):
    """Muestra una barra de progreso mientras el hilo esté vivo"""
    chars = ["/", "—", "\\", "|"] 
    barra_width = 20
    i = 0
    tiempo_inicio = time.time()
    
    while proceso_hilo.is_alive():
        tiempo_transcurrido = time.time() - tiempo_inicio
        # Estimamos 35 segundos para el 100%
        porcentaje = min(int((tiempo_transcurrido / 35) * 100), 99)
        lleno = int(barra_width * porcentaje / 100)
        barra = "█" * lleno + "-" * (barra_width - lleno)
        
        char = chars[i % len(chars)]
        
        sys.stdout.write(f"\r⏳ Midiendo: [{barra}] {porcentaje}% {char}")
        sys.stdout.flush()
        time.sleep(0.1)
        i += 1

    sys.stdout.write(f"\r✅ Midiendo: [{'█'*barra_width}] 100%  \n")
    sys.stdout.flush()

def tarea_speedtest():
    """Ejecuta el speedtest en segundo plano"""
    global resultado_test, error_test
    try:
        # Usamos --secure para evitar el error de HTTP
        cmd = subprocess.run(
            ["speedtest-cli", "--json", "--secure"], 
            capture_output=True, 
            text=True
        )
        
        if cmd.returncode != 0:
            error_test = cmd.stderr
        else:
            resultado_test = json.loads(cmd.stdout)
            
    except Exception as e:
        error_test = str(e)

def guardar_y_mostrar(zona, wifi, datos):
    descarga = round(datos["download"] / 1_000_000, 2)
    subida = round(datos["upload"] / 1_000_000, 2)
    ping = round(datos["ping"], 2)
    fecha = datetime.now().strftime("%Y-%m-%d %H:%M:%S")

    print(f"\n📊 RESULTADO ACTUAL ({wifi}):")
    print(f"   ⬇️ Bajada: {descarga} Mbps")
    print(f"   ⬆️ Subida: {subida} Mbps")
    print(f"   ⚡ Ping:   {ping} ms")

    # Guardar en CSV
    existe = os.path.isfile(ARCHIVO_CSV)
    with open(ARCHIVO_CSV, mode='a', newline='', encoding='utf-8') as f:
        writer = csv.writer(f)
        if not existe:
            writer.writerow(["Fecha", "Zona", "WiFi", "Bajada(Mb)", "Subida(Mb)", "Ping(ms)"])
        writer.writerow([fecha, zona, wifi, descarga, subida, ping])

    # Mostrar Historial
    mostrar_historial()

def mostrar_historial():
    print("\n" + "="*90)
    print(f"📈 HISTORIAL DE MEDICIONES")
    print("="*90)
    
    formato = "{:<20} | {:<15} | {:<20} | {:<10} | {:<10} | {:<8}"
    
    if os.path.exists(ARCHIVO_CSV):
        with open(ARCHIVO_CSV, mode='r', encoding='utf-8') as f:
            reader = csv.reader(f)
            datos = list(reader)
            if datos:
                print(formato.format(*datos[0]))
                print("-" * 90)
                for fila in datos[1:]:
                    if len(fila) >= 6:
                        print(formato.format(fila[0], fila[1], fila[2], fila[3], fila[4], fila[5]))
    print("="*90 + "\n")

def main():
    print("\n" + "🚀"*5 + " SPEEDTEST MASTER " + "🚀"*5)
    
    print("🔎 Buscando red Wi-Fi...")
    wifi_ssid = detectar_wifi()
    
    # Si falla la detección automática, pedimos manual en lugar de dejar 'Desconocido'
    if wifi_ssid == "Desconocido" or "You are not associated" in wifi_ssid:
        print("⚠️ No se pudo detectar el nombre automáticamente.")
        wifi_ssid = input("✍️ Ingresa el nombre del Wi-Fi manualmente: ")
    else:
        print(f"✅ Conectado a: {wifi_ssid}")
    
    zona = input("📍 ¿En qué zona estás? (ej: Oficina, Pieza): ")
    
    hilo = threading.Thread(target=tarea_speedtest)
    hilo.start()
    
    animacion_carga(hilo)
    
    hilo.join()
    
    if error_test:
        print(f"\n❌ ERROR CRÍTICO:\n{error_test}")
        print("👉 Consejo: Revisa tu conexión a internet.")
    elif resultado_test:
        guardar_y_mostrar(zona, wifi_ssid, resultado_test)

if __name__ == "__main__":
    main()