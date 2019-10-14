#!/bin/bash
echo "START CHECKING -> Goolge STATUS"
STATUS=$(curl -I https://www.google.com --insecure 2>/dev/null | head -n 1 | cut -d$' ' -f2)
echo "Google status is: $STATUS"
if [ $STATUS -lt 400 ]
then
echo "Google server is fine."
else
echo "Google server need restart."
echo "Restaring Google server..."
$(/sbin/service nginx restart)
echo "Done"
fi
exit