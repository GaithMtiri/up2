this is a base appp

it will connect to a shared db who holds users


if the client is registred it can fetch a fle from S3 that it will use later to invoke an openfaas function that we can deploy 

to run this:

locally: docker-compose up --build


on kubernetes: 
  - docker-compose build
  - kubectl apply -f (all the kubernetes manifests)


this will generate 2 deployments and 2 services (shared DB and web app)

to deploy a new user 
