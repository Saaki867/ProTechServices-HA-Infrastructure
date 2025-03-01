echo "Testing load balancing across both sites..."

for i in {1..20}; do
  echo "Request $i:"
  curl -k -s https://192.168.21.10/ | grep -o "<h1>.*</h1>"
  sleep 1
done

echo "load balancing test completed"