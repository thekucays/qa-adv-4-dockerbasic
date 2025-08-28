Main

How to run
docker run -p 8088:3000 -v ${PWD}:/app -v /app/node_modules sesi4:main  

When there is change in package.json 
docker exec -it <container_id> npm install

When there is change in code 
will be reflected automatically

Open the app by accessing localhost:8088, following line 4 above


Build:
docker build -t sesi5 .

Run:
docker run --rm sesi5
-- rm flag is to auto-delete container if any

or with mounting (make sure node_modules are exists, even its empty folder)
docker run --rm -it -v ${PWD}:/app  sesi5 sh -lc "npm install && npm test"
