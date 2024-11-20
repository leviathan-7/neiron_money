#!/bin/sh

MODE=$1
if [ "$MODE" = "train" ]; then
    echo -e "Start training"
    yolo detect train model=yolov8n.pt data="/app/dataset/data.yaml" epochs=1 imgsz=416 batch=16 device=0 project="/app/output" exist_ok=True
    echo -e "Finish training"
elif [ "$MODE" = "val" ]; then
    echo -e "Start validating"
    yolo detect val model="/app/output/train/weights/best.pt" data="/app/dataset/data.yaml" imgsz=416 batch=16 device=0 project="/app/output" exist_ok=True
    echo -e "Finish validating"
elif [ "$MODE" = "export" ]; then
    echo -e "Start exporting"
    yolo export model="/app/output/train/weights/best.pt" data="/app/dataset/data.yaml" half=True format=tflite int8=True
    echo -e "Finish exporting"
elif [ "$MODE" = "sleep" ]; then
    sleep infinity
else
    echo "Undefined mode"
fi