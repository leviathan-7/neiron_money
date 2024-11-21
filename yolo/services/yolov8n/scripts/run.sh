#!/bin/sh

MODE=$1
data="/app/dataset/data.yaml"
default_file="yolov8n.pt"
output_file="/app/output/train/weights/best.pt"
imgsz=416
epochs=50
batch=12
device=0
project="/app/output"

if [ "$MODE" = "train" ]; then

    echo -e "Start training"
    yolo detect train model="$default_file" data="$data" imgsz="$imgsz" batch="$batch" device="$device" project="$project" epochs="$epochs" exist_ok=True
    echo -e "Finish training"
    
elif [ "$MODE" = "test" ]; then

    echo -e "Start validating"
    yolo detect val model="$output_file" data="$data" imgsz="$imgsz" batch="$batch" device="$device" project="$project" exist_ok=True
    echo -e "Finish validating"

elif [ "$MODE" = "export" ]; then

    echo -e "Start exporting"
    yolo export model="$output_file" data="$data" half=True format=tflite int8=True
    echo -e "Finish exporting"

elif [ "$MODE" = "sleep" ]; then
    sleep infinity
else
    echo "Undefined mode"
fi