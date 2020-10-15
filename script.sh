rp=$(realpath $1)
gzip $rp

if [ -d "~/RECYCLE" ]
    then
    echo "Check folder - RECYCLE succesfully!"
  else
    echo "Folder RECYCLE not exist. Create..."
    /usr/bin/mkdir -p ~/RECYCLE
fi

mv $1.gz ~/RECYCLE
echo "Done!"
