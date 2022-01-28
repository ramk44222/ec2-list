## Run steps

```bash
docker build -t aws:ec2-list .
```

```bash
docker run -it -p 8080:80 \
               -e AWS_ACCESS_KEY_ID=<provide aws access key id> \
               -e AWS_SECRET_ACCESS_KEY=<provide aws secret access key> \
               aws:ec2-list
```

Note: AWS user profile should have ec2 admin access
