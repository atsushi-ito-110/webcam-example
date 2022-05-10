import json
import logging
import boto3

from botocore.exceptions import ClientError

def lambda_handler(event, context):
    print(event['Records'])
    print(context)

    record = event['Records'][0]

    delete_object_except_latest('webcam-compare')
    copy_object(record['s3']['bucket']['name'],
                record['s3']['object']['key'],
                'webcam-compare',
                record['s3']['object']['key'])

    return {
        'statusCode': 200,
        'body': json.dumps('Hello from Lambda!')
    }

def delete_object_except_latest(bucket_name):
    s3 = boto3.client('s3')
    objects = s3.list_objects(
        Bucket=bucket_name
    )
    objects['Contents'].pop(-1)
    for c in objects['Contents']:
        print(c['Key'])
        s3.delete_object(
            Bucket=bucket_name,
            Key=c['Key']
        )

def copy_object(src_bucket_name, src_object_name,
                dest_bucket_name, dest_object_name=None):
    """Copy an Amazon S3 bucket object

    :param src_bucket_name: string
    :param src_object_name: string
    :param dest_bucket_name: string. Must already exist.
    :param dest_object_name: string. If dest bucket/object exists, it is
    overwritten. Default: src_object_name
    :return: True if object was copied, otherwise False
    """

    # Construct source bucket/object parameter
    copy_source = {'Bucket': src_bucket_name, 'Key': src_object_name}
    if dest_object_name is None:
        dest_object_name = src_object_name

    # Copy the object
    s3 = boto3.client('s3')
    try:
        s3.copy_object(CopySource=copy_source, Bucket=dest_bucket_name,
                       Key=dest_object_name)
    except ClientError as e:
        logging.error(e)
        return False
    return True
