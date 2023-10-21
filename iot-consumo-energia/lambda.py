from datetime import datetime
import json
import logging
import boto3
#Estamos criando uma instância da classe Logger para 'melhorar' a forma de apresentar 'dados'
#para o usuário fazer a 'auditoria' das informações que são processadas no lambda.
logger = logging.getLogger()
logger.setLevel(logging.DEBUG)

#Tudo numa função LAMBDA começa pelo HANDLER.
# O HANDLER é responsável para 'iniciar' o processamento de uma função lambda.
# Geralmente em código python, podemos 'substituir' pelo método main(event, context)
#O evento que contém a informação relacionada ao 'recurso' que está enviando a mensagem
#Exemplo: uma SQS (fila), envia um JSON 'gigante' que está dentro da propriedade body
"""
Exemplo de um payload em SQS
{
  "Records": [
    {
      "messageId": "19dd0b57-b21e-4ac1-bd88-01bbb068cb78",
      "receiptHandle": "MessageReceiptHandle",
      "body": "{  
                       \"Message\":\"   {  
                            \\"ApplicationReference\\":2
                        }\"
                     }",
      "attributes": {
        "ApproximateReceiveCount": "1",
        "SentTimestamp": "1523232000000",
        "SenderId": "123456789012",
        "ApproximateFirstReceiveTimestamp": "1523232000001"
      },
      "messageAttributes": {},
      "md5OfBody": "7b270e59b47ff90a553787216d55d91d",
      "eventSource": "aws:sqs",
      "eventSourceARN": "arn:aws:sqs:eu-west-1:156445482446:TestQueue",
      "awsRegion": "eu-west-1"
    }
  ]
}
"""
def lambda_handler(event, context):

    #Nome da função com ARN (item identificador)
    logger.info(f"Lambda function ARN: {context.invoked_function_arn}")
    
    #Nome do grupo de log que é exibid no cloudwatch
    logger.info(f"CloudWatch log stream name: {context.log_stream_name}") 
    logger.info(f"CloudWatch log group name: {context.log_group_name}")
    
    #ID da requisição do lambda
    logger.info(f"Lambda Request ID: {context.aws_request_id}")
    
    #logger.info(f"Início processamento de dados do dispositivo nº {event['idDispositivo']}")
    
    #resultado = processar_dados(event, context)
    
    #logger.info(f"Fim processamento de dados do dispositivo nº {event['idDispositivo']}")    
    #logger.debug(resultado)
    
    return None