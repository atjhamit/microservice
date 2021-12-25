
echo "redis container for in-memory db"
docker run -d --name=redis redis

echo "postgres for persistant db"
docker run -d --name=db postgres:9.4 

echo "voting-app for python application to register votes"
docker run -d --name=vote -p 5000:80  --link redis voting-app

echo "node to show results of the voting procedure"
docker run -d --name=result -p 5001:80 --link db result-app

echo "worker to transfer data from memory to storage"
docker run -d --name=worker --link redis --link db worker
