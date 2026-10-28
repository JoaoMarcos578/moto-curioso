from ultralytics import YOLO
import os
import torch

# Caminho do dataset
DATASET_PATH = "dataset/data.yaml"  # dataset exportado do Roboflow no formato YOLOv11
OUTPUT_PATH = "backend/model"
MODEL_PATH = "yolo11x.pt"  # pesos pré-treinados da Ultralytics

# Criar pasta de output se não existir
os.makedirs(OUTPUT_PATH, exist_ok=True)

# Carregar modelo pretrained
print("📥 Carregando modelo YOLO11x...")
print(f"Caminho: {MODEL_PATH}")
if not os.path.exists(MODEL_PATH):
    print(f"❌ Erro: arquivo não encontrado em {MODEL_PATH}")
    raise FileNotFoundError(f"Modelo não encontrado: {MODEL_PATH}")
model = YOLO(MODEL_PATH)
print("✅ Modelo carregado com sucesso!")

# Detectar dispositivo disponível
device = "cpu"  # Padrão
device_info = "CPU"

# Verificar CUDA (NVIDIA)
if torch.cuda.is_available():
    device = 0
    device_info = f"NVIDIA GPU: {torch.cuda.get_device_name(0)}"
# Verificar ROCm (AMD)
elif hasattr(torch.version, 'hip') and torch.version.hip is not None:
    device = 0
    device_info = "AMD GPU (ROCm)"
else:
    device = "cpu"
    device_info = "CPU (GPU não detectada)"

print(f"📱 Dispositivo de treinamento: {device_info}")

# Treinar
print("\n🚀 Iniciando treinamento...")
results = model.train(
    data=DATASET_PATH,
    epochs=100,
    imgsz=640,
    device=device,  # Auto-detecta GPU ou usa CPU
    patience=20,
    batch=16,
    workers=4,
    project=OUTPUT_PATH,
    name="royal_enfield",
    verbose=True,
)

# Validar
print("\n📊 Validando modelo...")
metrics = model.val()
print(f"mAP50: {metrics.box.map50:.4f}")
print(f"mAP50-95: {metrics.box.map:.4f}")

# Exportar
print("\n💾 Exportando modelo para ONNX...")
export_path = model.export(format="onnx")
print(f"✅ Modelo exportado: {export_path}")

print("\n✅ Concluído!")
