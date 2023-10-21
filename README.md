# Aula 20-10-2023

# FATEC

## Configuração ambiente AWS

## Deploy de função zip

### Criar nova função à partir de um zip

Para publição via CLI:

**Detalhe**
```shell
aws lambda create-function \
--function-name $NOME_FUNCAO \
--zip-file fileb://$ARQUIVO_ZIP.zip \
--runtime python3.9 \
--role $ARN_DA_ROLE_PARA_PUBLICACAO \
--handler $NOME_FUNCAO.$METODO_DEFINIDO_NO_ARQUIVO_PYTHON
```

**Detalhe para exportar dados como variável antes de executar o cli**
```shell
export NOME_FUNCAO=iot-consumo-energia-lambda
export ARQUIVO_ZIP=iot-consumo-energia-lambda.zip
export ARN_DA_ROLE_PARA_PUBLICACAO=arn:aws:iam::721974128630:role/LabRole
export NOME_ARQUIVO=lambda
export METODO_DEFINIDO_NO_ARQUIVO_PYTHON=lambda_handler
export HANDLER=$NOME_ARQUIVO.$METODO_DEFINIDO_NO_ARQUIVO_PYTHON
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

**Para usuários windows**
```shell
export NOME_FUNCAO=iot-consumo-energia-lambda
export ARQUIVO_ZIP=iot-consumo-energia-lambda.zip
export ARN_DA_ROLE_PARA_PUBLICACAO=arn:aws:iam::721974128630:role/LabRole
export NOME_ARQUIVO=lambda
export METODO_DEFINIDO_NO_ARQUIVO_PYTHON=lambda_handler
export HANDLER=%NOME_ARQUIVO%.%METODO_DEFINIDO_NO_ARQUIVO_PYTHON%
```
**Execução do método via cli windows**
```shell
aws lambda create-function \
--function-name %NOME_FUNCAO% \
--zip-file fileb://%ARQUIVO_ZIP% \
--runtime python3.9 \
--role %ARN_DA_ROLE_PARA_PUBLICACAO% \
--handler %HANDLER%
```

#### O comando executado sem variável está conforme exemplo abaixo

**Exemplo 1**
```shell
aws lambda create-function \
--function-name meu-app-python \
--zip-file fileb://meu-app-python.zip \
--runtime python3.9 \
--role arn:aws:iam::251822626625:role/LabRole \
--handler meu-app-python.lambda_handler
```

**Exemplo 2**
```shell
aws lambda create-function \
--function-name novaFuncao \
--runtime python3.9 z
--handler me-do-arquivo.lambda_handler \
--role arn:aws:iam::302614027063:role/LabRole \
--zip-file fileb://lambda_function.zip
```
#dTaBFso3
**Exemplo 3**
```shell
aws lambda create-function \
--function-name function01 \
--zip-file fileb://lambda_function.zip \
--runtime python3.9 \
--role arn:aws:iam::251822626625:role/LabRole \
--handler lambda_function.lambda_handler --profile aws_academy --region us-east-1
```
### Resultado

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