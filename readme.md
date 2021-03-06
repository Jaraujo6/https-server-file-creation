# This repo was designed to assist developers on how to run your development server on HTTPS.
The createSSC.sh contains step by step comments on exactly how the below certificates are created.
Once all steps have been followed, all files except for server.key and server.cert can be discarded if desired.

# Steps for creating and using your own Certificate Authority and Server Certificate for local HTTPS server development:

Note: Default configurations for root and server keys require passwords for the purpose of disallowing others to create CAs/certs without your consent. To remove the password requirement, remove the flag "-des3" from createRootKey.sh and createServerKey.sh. respectively.

1) git clone repository
2) replace the variables in rootCA.cnf to reflect the information you want shown in your Certificate Authority
3) replace the variables in server.csr.cnf to reflect the information you want shown in your Server Certificate
4) run sel-signed certificate script in terminal: 
```
sh createSSC.sh
```
5) follow terminal prompts
6) relocate newly created server.key & server.cert, passphrase into HTTPS server config
7) start server
8) import rootCA.pem to browser: This is your Certificate Authority!
	- chrome://settings/certificates -> authories -> import
	- check box saying "Trust this certificate for identifying websites"
9) navigate to server using https://localhost:PORT

If for some reason you need to the rootCA trusted by your local machine:

	ubuntu: 
	- Copy your CA rootCA.pem /usr/local/share/ca-certificates/ then, update CA store:  sudo update-ca-certificates

	mac: 
	- Open Keychain Access and import the rootCA.pem to your System keychain. Then mark the certificate as trusted.

sources:
http://turlucode.com/self-signed-certificates-by-your-own-ssl-certificate-authority-ca/
https://medium.freecodecamp.org/how-to-get-https-working-on-your-local-development-environment-in-5-minutes-7af615770eec
