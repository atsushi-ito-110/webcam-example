import json
import logging
import boto3
import numpy as np
# import cv2

def lambda_handler(event, context):
    print(event['Records'])
    print(context)

    record = event['Records'][0]
    bucket_name = record['s3']['bucket']['name']
    object_name = record['s3']['object']['key']
    print(bucket_name)
    print(object_name)

    s3 = boto3.client('s3')
    s3.download_file(bucket_name, object_name, '/tmp/current.jpg')

    before_object_name = None
    objects = s3.list_objects(
        Bucket=bucket_name
    )
    for c in objects['Contents']:
        if c['Key'] == object_name:
            continue
        before_object_name = c['Key']

    s3.download_file(bucket_name, before_object_name, '/tmp/current.jpg')

    return {
        'statusCode': 200,
        'body': json.dumps('Hello from Lambda!')
    }
