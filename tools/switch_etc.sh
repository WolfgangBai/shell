pwd=`pwd`
n_etc=$pwd/$1

echo $n_etc
rm $pwd/etc -rf
ln -s $n_etc etc
ls -la etc
