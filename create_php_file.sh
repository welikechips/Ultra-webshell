#!/bin/bash
base64string=$(base64 --w 0 < index.php)
echo "<?php /****/@null; /********/ /********/ /********/@eval/****/(\"?>\".base64_decode(\"${base64string}\")); ?>" > ultra.php