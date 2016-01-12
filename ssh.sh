DEFAULT=secret
ALGORITHM=rsa
FILE="/media/$USER/$KEYSTICK/nutshell.$DEFAULT"
if [ -e $FILE ]; then
  echo "Found special keystick w/ encrypted repository under $FILE"
else
  echo "Please insert keystick w/ encrypted repository and start script again. (FILE=$FILE)"
  exit
fi
./tools/cryptFile $DEFAULT
if [ -d ./$DEFAULT ]; then
   if [ -e ~/.ssh/id_$ALGORITHM ]; then
      echo "Saving existing $ALGORITHM key under ~/.ssh/id_$ALGORITHM.$$"
      cp ~/.ssh/id_$ALGORITHM ~/.ssh/id_$ALGORITHM.$$
      cp ~/.ssh/id_$ALGORITHM.pub ~/.ssh/id_$ALGORITHM.$$.pub
   fi
   cp ./$DEFAULT/id_$ALGORITHM ~/ssh/
   cp ./$DEFAULT/id_$ALGORITHM.pub ~/ssh/
else
   echo "Unable to find ./$DEFAULT. Assuming cryptFile did not complete sucessfully"
   exit
fi
