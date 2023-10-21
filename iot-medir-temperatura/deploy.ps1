Remove-Item -Path .\iot-consumo-energia.zip -Force

Compress-Archive -Path .\lambda.py, .\requirements.txt -DestinationPath iot-consumo-energia.zip

$env:NOME_FUNCAO = "iot-medir-temperatura"
$env:ARQUIVO_ZIP = "iot-medir-temperatura.zip"
$env:ARN_DA_ROLE_PARA_PUBLICACAO = "arn:aws:iam::721974128630:role/LabRole"
$env:NOME_ARQUIVO = "lambda"
$env:METODO_DEFINIDO_NO_ARQUIVO_PYTHON = "lambda_handler"
$env:HANDLER = "$($env:NOME_ARQUIVO).$($env:METODO_DEFINIDO_NO_ARQUIVO_PYTHON)"

aws lambda create-function  --function-name $env:NOME_FUNCAO --zip-file "fileb://$($env:ARQUIVO_ZIP)" --runtime python3.9 --role $env:ARN_DA_ROLE_PARA_PUBLICACAO --handler $env:HANDLER
