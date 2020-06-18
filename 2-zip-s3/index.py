import boto3
 
s3 = boto3.client('s3')

def handler(event, context):
    response = s3.list_buckets()
    buckets = [bucket['Name'] for bucket in response['Buckets']]
    print("Bucket List:  %s" % buckets)
    return buckets