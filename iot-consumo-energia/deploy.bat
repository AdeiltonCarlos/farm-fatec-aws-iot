# Passo 1 - Criar zip
Compress-Archive -Path .\lambda.py, .\requirements.txt -DestinationPath iot-consumo-energia.zip

# Passo 2 - Exportando variáveis de ambiente
$env:NOME_FUNCAO = "iot-consumo-energia-lambda"
$env:ARQUIVO_ZIP = "iot-consumo-energia-lambda.zip"
$env:ARN_DA_ROLE_PARA_PUBLICACAO = "arn:aws:iam::721974128630:role/LabRole"
$env:NOME_ARQUIVO = "lambda"
$env:METODO_DEFINIDO_NO_ARQUIVO_PYTHON = "lambda_handler"
$env:HANDLER = "$($env:NOME_ARQUIVO).$($env:METODO_DEFINIDO_NO_ARQUIVO_PYTHON)"

# Passo 3 - Publicando a função lambda
aws lambda create-function `
  --function-name $env:NOME_FUNCAO `
  --zip-file "fileb://$($env:ARQUIVO_ZIP)" `
  --runtime python3.9 `
  --role $env:ARN_DA_ROLE_PARA_PUBLICACAO `
  --handler $env:HANDLER
