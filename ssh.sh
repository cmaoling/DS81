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
   echo "copying identity from ./$DEFAULT/id_$ALGORITHM to $SSHDIR/"
   cp "./$DEFAULT/id_$ALGORITHM" "$SSHDIR/"
   cp "./$DEFAULT/id_$ALGORITHM.pub" "$SSHDIR/"
   echo "generate known_hosts file:"
   touch -m "$SSHDIR/known_hosts"
   cat ./$DEFAULT/known_hosts/* >> "$SSHDIR/known_hosts"
   echo "known_hosts file generated with "`wc -l $SSHDIR/known_hosts`" entries"
   echo "register identity"
   ssh-add $SSHDIR/id_$ALGORITHM
else
   echo "Unable to find ./$DEFAULT. Assuming cryptFile did not complete sucessfully"
   exit
fi
echo "setup complete"
