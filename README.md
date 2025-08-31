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


----------------------------------------------------------------------
run with compose
----------------------------------------------------------------------
docker compose up --build

----------------------------------------------------------------------
run Jenkins
----------------------------------------------------------------------
8087: host port
8080: container port
docker run -d --name jenkins -u root -p 8087:8080 -v jenkins_home:/var/jenkins_home -v /var/run/docker.sock:/var/run/docker.sock jenkins/jenkins:lts

docker run -d -p 8087:8080 -p 50000:50000 -u root -v //var/run/docker.sock:/var/run/docker.sock -v C:\jenkins_data:/var/jenkins_home jenkins/jenkins:lts

----------------------------------------------------------------------
get initial password
----------------------------------------------------------------------
docker exec -it <container-id> cat /var/jenkins_home/secrets/initialAdminPassword

----------------------------------------------------------------------
install docker plugin, by using bash on container
----------------------------------------------------------------------
docker exec -it <id> bash
apt-get update && apt-get install -y docker.io docker-compose

----------------------------------------------------------------------
Jenkins
----------------------------------------------------------------------
thekucays - admin123


----------------------------------------------------------------------
Working Example
----------------------------------------------------------------------
start docker like this 
docker run -d --name jenkins -u root -p 8087:8080 -v C:\jenkins_home:/var/jenkins_home -v C:\jenkins_temp_build:/c/jenkins_temp_build -v /var/run/docker.sock:/var/run/docker.sock jenkins/jenkins:lts

- notice mount volume nya /c/jenkins_temp_build
- ini buat bikin windows nya bisa kenalin mount volume nya 
- kalau pakai direktory yang linux like, contoh /tmp/build, somehow gabisa


pipeline script 
#!/bin/bash
set -e

# Copy Jenkins workspace to host folder
echo "Copying Jenkins workspace to host folder..."
cp -r $WORKSPACE/* /c/jenkins_temp_build/
cd /c/jenkins_temp_build

# Stop any old containers
echo "Stop any old containers"
docker-compose down --volumes --remove-orphans || true

# Run docker-compose attached, exit code from test-runner
docker-compose up --build --exit-code-from test-runner
