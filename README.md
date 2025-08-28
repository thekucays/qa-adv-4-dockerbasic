Main

How to run
docker run -p 8088:3000 -v ${PWD}:/app -v /app/node_modules sesi4:main  

When there is change in package.json 
docker exec -it <container_id> npm install

When there is change in code 
will be reflected automatically

Open the app by accessing localhost:8088, following line 4 above


Branches:
sesi 4: main