# Script to test failover capabilities

echo "Testing failover between sites..."

# initial response
echo "Initial state:"
curl -k -s https://192.168.21.10/ | grep -o "<h1>.*</h1>"

# stop application on Site 1
echo "Stopping app on Site 1..."
ssh root@192.168.12.21 "docker stop app1"

# test response after Site 1 down
echo "After Site 1 down:"
curl -k -s https://192.168.21.10/ | grep -o "<h1>.*</h1>"

# restart application on Site 1
echo "Restarting app on Site 1..."
ssh root@192.168.12.21 "docker start app1"

# test response after recovery
echo "After recovery:"
curl -k -s https://192.168.21.10/ | grep -o "<h1>.*</h1>"

echo "Failover test completed"