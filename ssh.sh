DEFAULT=secret
ALGORITHM=rsa
HOMEDIR=`echo ~`
SSHDIR="$HOMEDIR/.ssh"

FILE="/media/$USER/$KEYSTICK/nutshell.$DEFAULT"
if [ -e $FILE ]; then
  echo "Found special keystick w/ encrypted repository under $FILE"
else
  echo "Please insert keystick w/ encrypted repository and start script again. (FILE=$FILE)"
  exit
fi
./tools/cryptFile $DEFAULT -keep
if [ -d ./$DEFAULT ]; then
   if [ -e $SSHDIR/id_$ALGORITHM ]; then
      echo "Saving existing $ALGORITHM key under $SSHDIR/id_$ALGORITHM.$$"
      cp $SSHDIR/id_$ALGORITHM $SSHDIR/id_$ALGORITHM.$$
      cp $SSHDIR/id_$ALGORITHM.pub $SSHDIR/id_$ALGORITHM.$$.pub
   fi
   echo "cp ./$DEFAULT/id_$ALGORITHM $SSHDIR/"
   cp "./$DEFAULT/id_$ALGORITHM" "$SSHDIR/"
   cp "./$DEFAULT/id_$ALGORITHM.pub" "$SSHDIR/"
   touch -m "$SSHDIR/known_hosts"
   cat ./$DEFAULT/known_hosts/* >> "$SSHDIR/known_hosts"
else
   echo "Unable to find ./$DEFAULT. Assuming cryptFile did not complete sucessfully"
   exit
fi
