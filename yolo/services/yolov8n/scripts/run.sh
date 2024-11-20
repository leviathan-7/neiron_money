#!/bin/sh

MODE=$1
if [ "$MODE" = "train" ]; then
    echo -e "Start training"
    echo -e "\n"
    yolo detect train model=yolov8n.pt data="/app/dataset/data.yaml" epochs=1 imgsz=640 device=0 project="/app/output"
    echo -e "\n"
    echo -e "Finish training"
    # yolo export model="/app/output/weights/best.pt" format=tflite simplify half
elif [ "$MODE" = "test" ]; then
    echo "test"
else
    echo "Undefined mode"
fi
sleep infinity