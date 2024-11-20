#!/bin/sh

MODE=$1
if [ "$MODE" = "train" ]; then
    echo "train"
    # yolo detect train model=yolov8n.pt data="/app/dataset/data.yaml" epochs=20 imgsz=640 device='cpu' project="/app/output"
    # yolo export model="/app/output/weights/best.pt" format=tflite simplify half
elif [ "$MODE" = "test" ]; then
    echo "test"
else
    echo "Undefined mode"
fi
sleep infinity