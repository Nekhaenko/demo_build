import subprocess

def handler(event, context):
    qq = subprocess.run(["Rscript", 'test.R'])
    return {
        "statusCode": 200,
        "body": {"message": "Hello from Lambda!", "array": qq},
    }