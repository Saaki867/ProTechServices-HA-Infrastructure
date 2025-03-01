# script to deploy applications to both sites


docker pull 192.168.11.11:5000/app1:latest

# Deploy to Site 1
echo "Deploying to Site 1"
ssh root@192.168.12.21 "docker pull 192.168.11.11:5000/app1:latest && \
docker stop app1 || true && \
docker rm app1 || true && \
docker run -d --name app1 --restart always -p 80:80 192.168.11.11:5000/app1:latest"

# Deploy to Site 2
echo "Deploying to Site 2"
ssh root@192.168.22.21 "docker pull 192.168.11.11:5000/app1:latest && \
docker stop app1 || true && \
docker rm app1 || true && \
docker run -d --name app1 --restart always -p 80:80 192.168.11.11:5000/app1:latest"

echo "Deployment completed successfully"