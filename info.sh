#!/bin/bash
handle_avi()
{
    file "$1"
}
handle_gz()
{
    gunzip -l "$1"
}
handle_zip()
{
    unzip -l "$1"
}
handle_pem()
{
	file "$1"
}

#
# Main
#
filename="$1"
extension=${filename##*.}
if declare -F handle_$extension > /dev/null
then
    handle_$extension "$filename"
else
    echo "No handler found for extension '$extension'"
fi

subject=$(openssl x509 -in "C:\Users\breetonia\Desktop\admin_test01\cert.pem" -noout -subject)
subject=$(echo $subject | awk -F' ' '{print $2,$3,$4}')
md5_fingerprint=$(openssl x509 -in "C:\Users\breetonia\Desktop\admin_test01\cert.pem" -noout -md5 -fingerprint)
md5_fingerprint=$(echo $md5_fingerprint | awk -F'=' '{print $2}')
echo -n "$md5_fingerprint   $subject"