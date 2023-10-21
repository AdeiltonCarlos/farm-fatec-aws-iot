# Passo a passo para publicação de uma lambda

## Passo 1 - Criar o zip
### Windows
Acessar o windows explorer e "zipar" os arquivos, neste exemplo, lambda.py e requirements.txt

### Linux
```shell
zip iot-consumo-energia.zip lambda.py requirements.txt
```

## Passo 2 - Setar as variáveis

### Windows

```shell
SET NOME_FUNCAO=iot-consumo-energia-lambda
SET ARQUIVO_ZIP=iot-consumo-energia.zip
SET ARN_DA_ROLE_PARA_PUBLICACAO=arn:aws:iam::978177253869:role/LabRole
SET NOME_ARQUIVO=lambda
SET METODO_DEFINIDO_NO_ARQUIVO_PYTHON=lambda_handler
SET HANDLER=%NOME_ARQUIVO%.%METODO_DEFINIDO_NO_ARQUIVO_PYTHON%
```

### Linux
```shell
export NOME_FUNCAO=iot-consumo-energia-lambda
export ARQUIVO_ZIP=iot-consumo-energia-lambda.zip
export ARN_DA_ROLE_PARA_PUBLICACAO=arn:aws:iam::721974128630:role/LabRole
export NOME_ARQUIVO=lambda
export METODO_DEFINIDO_NO_ARQUIVO_PYTHON=lambda_handler
export HANDLER=$NOME_ARQUIVO.$METODO_DEFINIDO_NO_ARQUIVO_PYTHON
```
## Passo 3 - Executar o cli para publicação

**Execução do método via cli - WINDOWS**

```shell
aws lambda create-function --function-name %NOME_FUNCAO% --zip-file fileb://%ARQUIVO_ZIP% --runtime python3.9 --role %ARN_DA_ROLE_PARA_PUBLICACAO% --handler %HANDLER%
```

**Execução do método via cli - LINUX**
```shell
aws lambda create-function \
--function-name $NOME_FUNCAO \
--zip-file fileb://$ARQUIVO_ZIP \
--runtime python3.9 \
--role $ARN_DA_ROLE_PARA_PUBLICACAO \
--handler $HANDLER
```

## Passo 4 - Você receberá um JSON de resultado com a função criada

### Exemplo
```json
{
    "FunctionName": "function03",
    "FunctionArn": "arn:aws:lambda:us-east-1:251822626625:function:function03",
    "Runtime": "python3.9",
    "Role": "arn:aws:iam::251822626625:role/LabRole",
    "Handler": "lambda_function.lambda_handler",
    "CodeSize": 563,
    "Description": "",
    "Timeout": 3,
    "MemorySize": 128,
    "LastModified": "2023-02-25T15:45:39.455+0000",
    "CodeSha256": "gXgyb3wmShcyS3rm2nBZnRF0Myr0e4/KuAR3MA2on+M=",
    "Version": "$LATEST",
    "TracingConfig": {
        "Mode": "PassThrough"
    },
    "RevisionId": "f320acf6-3673-41e9-8a26-21f52542bbb6",
    "State": "Pending",
    "StateReason": "The function is being created.",
    "StateReasonCode": "Creating",
    "PackageType": "Zip"
}

```

## Passo 5 - Atualização

**Execução do método via cli - WINDOWS (CMD)**

```shell
aws lambda update-function-code --function-name %NOME_FUNCAO% --zip-file fileb://%ARQUIVO_ZIP%
```

**Execução do método via cli - LINUX**
```shell
aws lambda update-function-code --function-name $NOME_FUNCAO --zip-file fileb://$ARQUIVO_ZIP
```