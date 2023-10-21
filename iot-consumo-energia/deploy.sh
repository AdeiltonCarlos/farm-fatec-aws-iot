#!/bin/bash

echo "Passo 1 - Criar zip"
zip iot-consumo-energia.zip lambda.py requirements.txt

echo "Passo 2 - Exportando variáveis de ambiente"

export NOME_FUNCAO=iot-consumo-energia-lambda
export ARQUIVO_ZIP=iot-consumo-energia-lambda.zip
export ARN_DA_ROLE_PARA_PUBLICACAO=arn:aws:iam::721974128630:role/LabRole
export NOME_ARQUIVO=lambda
export METODO_DEFINIDO_NO_ARQUIVO_PYTHON=lambda_handler
export HANDLER=$NOME_ARQUIVO.$METODO_DEFINIDO_NO_ARQUIVO_PYTHON

echo "Passo 3 - Publicando a função lambda"

aws lambda create-function \
--function-name $NOME_FUNCAO \
--zip-file fileb://$ARQUIVO_ZIP \
--runtime python3.9 \
--role $ARN_DA_ROLE_PARA_PUBLICACAO \
--handler $HANDLER