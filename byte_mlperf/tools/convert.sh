#！bin/bash
if [ ! -d "tools/venv" ]; then
    python3 -m virtualenv tools/venv
    source tools/venv/bin/activate
    tools/venv/bin/pip3 install --upgrade pip
    tools/venv/bin/pip3 install -r tools/requirements.txt
else
    source tools/venv/bin/activate
fi

if [ "$3" == "pt2onnx" ];then
    python3 tools/torch_to_onnx.py --model_path $1 --output_path $2
elif [ "$3" == "saved2onnx" ];then
    python3 tools/saved_to_onnx.py --model_path $1 --output_path $2
elif [ "$3" == "saved2frozen" ];then
    python3 tools/saved_to_frozen.py --model_path $1 --output_path $2
fi
