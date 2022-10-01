username=$1
BUCKETNAME='upworkgaithproj'

JSON_STRING='{"name":"'"$1"'","db_name":"'"$1"'_db"}'


echo $JSON_STRING > $1.json

aws s3 ls s3://$BUCKETNAME --no-sign-request
aws s3 cp $1.json s3://$BUCKETNAME --acl public-read

rm $1.json

sed -i "s/NAMESPACE_TOCHANGE/$1/g" namespace.json 
kubectl apply -f ./new_user/namespace.json
kubectl apply -f ./new_user/db-deployment.yml -n $1
kubectl apply -f ./new_user/db-service.yml -n $1

