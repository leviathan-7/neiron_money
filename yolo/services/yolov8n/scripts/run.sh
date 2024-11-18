#!/usr/bin/env sh

if [ $MODE = "TRAIN" ]; then
    yolo detect train model=yolov8n.pt data="/app/dataset/data.yaml" epochs=20 imgsz=640 device='cpu' project="/app/output"
    # yolo export model="/app/output/weights/best.pt" format=tflite simplify half
else
    echo "Undefined mode"
fi