import boto3 
import json
ec2_client = boto3.client('ec2', region_name="us-east-2")

regions = [region['RegionName'] for region in ec2_client.describe_regions()['Regions']]

for region_name in regions:
    ec2= boto3.resource('ec2', region_name=region_name)
    instances= ec2.meta.client.describe_instances()
    for instance in instances['Reservations']:
        print("Region: ", region_name)
        print("</br>")
        print("Instance ID: ", instance['Instances'][0]['InstanceId'])
        print("</br>")
        print("Instance Private IP: ", instance['Instances'][0]['PrivateIpAddress'])
        print("</br>")
        print("Instance Public IP: ", instance['Instances'][0]['PublicIpAddress'])
        print("</br>")
        try:
            print("Tags: \n", instance['Instances'][0]['Tags'])
        except:
            print("Tags: No Tags")    
        print("<hr>")
        print()    