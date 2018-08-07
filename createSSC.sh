# All files output to root folder 

#Root Certificate Authorty 

# Create a password protected 2048 bit PRIVATE key
#Output to root folder 
openssl genrsa -des3 -out rootCA.key 2048

# Create the Root Certificate valid for 1024 days, using newly generated key. 
# Output to root folder
# Encrypt using sha256
# Configure using rootCA config file
openssl req -x509 -new -nodes -key rootCA.key -sha256 -days 1024 -out rootCA.pem -config rootCA.cnf

#Server Certificate

# Create a password protected 2048 bit PRIVATE key  
openssl genrsa -des3 -out server.key 2048

# Create Certificate Signing Request using newly created server key
openssl req -new -key server.key -out server.csr -config server.csr.cnf

# Create the Server's Certificate valid for 500 days
# Configure using server csr config file and version 3 extension
openssl x509 -req -in server.csr -CA rootCA.pem -CAkey rootCA.key -CAcreateserial -out server.crt -days 500 -sha256 -extfile v3.ext