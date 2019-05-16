mkdir -p CAs
mkdir -p server-cert/rsa
mkdir -p client-cert/rsa

for ((i=0;i<1;i++))
do
    if [[ $i -eq 0 ]];then
        name=keyserver
        peer=server
    else
        name=keyless
        peer=client
    fi

openssl genrsa -out CAs/testca-$name-key.pem 2048
openssl req -new -x509 \
    -key CAs/testca-$name-key.pem \
    -out CAs/testca-$name.pem \
    -days 3600 \
    -subj "/C=CN/ST=BJ/L=BJ/O=[图片]sina.com/OU=ssl.sina.com/CN=ssl.sina.com"

openssl genrsa -out $peer-cert/rsa/rsa-$peer-key.pem 2048
openssl req -new \
    -key $peer-cert/rsa/rsa-$peer-key.pem \
    -out $peer-cert/rsa/$peer.csr \
    -days 365 \
    -subj "/C=CN/ST=BJ/L=BJ/O=ssl.sina.com/OU=ssl.sina.com/CN=ssl.sina.com"

openssl x509 -req \
    -in $peer-cert/rsa/$peer.csr \
    -CA CAs/testca-$name.pem \
    -CAkey CAs/testca-$name-key.pem \
    -CAcreateserial \
    -extensions v3_usr \
    -out $peer-cert/rsa/rsa-$peer.pem \
    -days 365

done


