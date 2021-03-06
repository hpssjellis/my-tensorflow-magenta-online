#!/bin/bash  

#  only need to run this script with the command (do not type the #)
#  bash setup.sh



#commented out batch files are from another github site at https://github.com/hpssjellis/TensorFlow-Android-Camera-Demo-on-Cloud9
# or also at https://github.com/hpssjellis/my-google-magenta-installation
echo "Installs Magenta to a folder in your home directory called mymagenta"




mkdir /home/ubuntu/workspace

cd /home/ubuntu/workspace




echo "Now trying Bazel"




sudo apt-get  -y install software-properties-common
sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update
sudo apt-get -y install oracle-java8-installer pkg-config zip g++ zlib1g-dev unzip

mkdir /home/ubuntu/workspace/bazel
cd /home/ubuntu/workspace/bazel

#wget https://github.com/bazelbuild/bazel/releases/download/0.2.3/bazel-0.2.3-installer-linux-x86_64.sh -O /home/ubuntu/workspace/bazel/bazel-0.2.3-installer-linux-x86_64.sh
wget https://github.com/bazelbuild/bazel/releases/download/0.4.0/bazel-0.4.0-installer-linux-x86_64.sh -O /home/ubuntu/workspace/bazel/bazel-0.4.0-installer-linux-x86_64.sh

#chmod +x bazel-0.2.3-installer-linux-x86_64.sh


echo "Presently these next two commands not working well. May have to do from the command line"


sudo bash bazel-0.4.0-installer-linux-x86_64.sh --user

#sudo bash bazel-0.2.3-installer-linux-x86_64.sh --user
#bash bazel-0.2.3-installer-linux-x86_64.sh --user --bin=${IDEDIR}/bin

#export PATH=$PATH:~/bin
export PATH="$PATH:~/bin"
#rm bazel-0.2.3-installer-linux-x86_64.sh

echo "Just test if bazel is working"

bazel -h



echo "Needed if you open a new terminal to reset the path to bazel"
printf "\n\nexport PATH=\$PATH:~/bin"  >> ~/.profile

#printf "\n\nsource ./bin/bazel-complete.bash"  >> ~/.profile
echo ""
echo "Did bazel install? Should see the bazel help info"
#echo "Press enter, if issues press ctrl-C and find out the mistake, probably the path in ~/.profile"
#read



cd /home/ubuntu/workspace


echo "----------------Bazel Done----------------------------------------------"
echo ". "


echo "Install a bunch of needed files"

sudo apt-get -y install python-pip python-dev python-virtualenv libblas-dev liblapack-dev libatlas-base-dev gfortran


echo "make the tensorflow environment"

virtualenv --system-site-packages ~/virtual-tf

echo "--------------------------------------------------------------"
echo ". "



echo "Activate the environment use deactivate to get your cursor back"
source ~/virtual-tf/bin/activate 

printf "\n\nsource ~/virtual-tf/bin/activate "  >> ~/.profile
printf "\necho 'enter   deactivate    to get out of the virtual enviroment'"  >> ~/.profile




echo "Now get TensorFlow"

cd /home/ubuntu/workspace

#sudo pip install --upgrade http://ci.tensorflow.org/view/Nightly/job/nightly-matrix-cpu/TF_BUILD_CONTAINER_TYPE=CPU,TF_BUILD_IS_OPT=OPT,TF_BUILD_IS_PIP=PIP,TF_BUILD_PYTHON_VERSION=PYTHON2,label=cpu-slave/lastSuccessfulBuild/artifact/pip_test/whl/tensorflow-0.8.0-cp27-none-linux_x86_64.whl

#git clone --recurse-submodules https://github.com/tensorflow/tensorflow /home/ubuntu/workspace/tensorflow/tensorflow

#sudo pip install --upgrade https://storage.googleapis.com/tensorflow/linux/cpu/tensorflow-0.8.0-cp27-none-linux_x86_64.whl


#new version 0.9 needed for magenta


#sudo pip install https://storage.googleapis.com/tensorflow/linux/cpu/tensorflow-0.9.0rc0-cp27-none-linux_x86_64.whl


sudo pip install --upgrade https://storage.googleapis.com/tensorflow/linux/cpu/tensorflow-0.12.0rc1-cp27-none-linux_x86_64.whl





#echo "Now download the image sets this was needed for my tensorflow repository"


#wget https://storage.googleapis.com/download.tensorflow.org/models/inception5h.zip -O /tmp/inception5h.zip

#unzip /tmp/inception5h.zip -d /home/ubuntu/workspace/tensorflow/tensorflow/examples/android/assets/


#rm /tmp/inception5h.zip



#echo "exporting the Path to my .bashrc file so other terminals have the path"



# ????????????????? was working without this, check that ist still works ??????????????????

#printf "\n\nexport TENSORFLOW_HOME=/home/ubuntu/workspace/tensorflow/tensorflow\nexport PATH=\$PATH:\$TENSORFLOW_HOME/bin"  >> ~/.profile


#echo "exporting the path for this terminal so that commands work"


#export TENSORFLOW_HOME=/home/ubuntu/workspace/tensorflow/tensorflow
#export PATH=$PATH:$TENSORFLOW_HOME/bin





echo "-------------DONE TENSORFLOW-------------------------------------------------"
echo ". "





cd /home/ubuntu/workspace


echo "Now install Google Magenta"

git clone https://github.com/tensorflow/magenta.git


#broken link to tensorflow???

#ln -s ~/virtual-tf/lib/python2.7/site-packages/tensorflow /home/ubuntu/workspace/pip-tensorflow-link



echo "Move a few files from the main folder into the magneta folder"
cd /home/ubuntu/workspace


#git clone https://github.com/hpssjellis/my-tensorflow-magenta-online.git


#echo "copy the bash file a01-helloworld.sh to the magenta workspace folder"


#cd /home/ubuntu/workspace/google-magenta-midi-music-on-linux-hello-world

#cp a* /home/ubuntu/workspace/magenta

mv /home/ubuntu/workspace/a01-all.sh /home/ubuntu/workspace/magenta/magenta/a01-all.sh
mv /home/ubuntu/workspace/a02-just-primer.sh /home/ubuntu/workspace/magenta/magenta/a02-just-primer.sh
mv /home/ubuntu/workspace/a05-pre-trained-by-magenta.sh /home/ubuntu/workspace/magenta/magenta/a05-pre-trained-by-magenta.sh
mv /home/ubuntu/workspace/trained-magenta /home/ubuntu/workspace/magenta/magenta/trained-magenta





#mv /home/ubuntu/workspace/a03-extra-installs.sh /home/ubuntu/workspace/magenta/magenta/a03-extra-installs.sh
#mv /home/ubuntu/workspace/a04-midi-to-mp3 /home/ubuntu/workspace/magenta/magenta/a04-midi-to-mp3

#cd google-magenta-midi-music-on-linux-hello-world

#mv a01-helloworld.sh /home/ubuntu/workspace/magenta/a01-helloworld.sh



#echo "attempt to make the batch file a01-helloworld.sh runnable"

#chmod a+x /home/ubuntu/workspace/magenta/a01-helloworld.sh

#bash a01-rocksetta-checks.sh




echo "Now test if bazel is working and build ~1.5 Gb of files"

cd /home/ubuntu/workspace/magenta

#bazel test //magenta:all


echo "If it all worked try these scripts"

#echo "build //magenta:midi_io_test"
#echo "bazel build //magenta:midi_io"
#echo "bazel build //magenta:note_sequence_io"

# build your script (lots of midi files in a folder)
#echo "bazel build //magenta:convert_midi_dir_to_note_sequences"






# some forum stuff at
#https://groups.google.com/a/tensorflow.org/forum/#!searchin/magenta-discuss/magenta/magenta-discuss/R0YiSbM3v5c/dW2qtKM3BQAJ
#https://groups.google.com/a/tensorflow.org/forum/#!searchin/magenta-discuss/magenta/magenta-discuss/HC_squh5TbA/Gx7MCp4cBAAJ
#https://groups.google.com/a/tensorflow.org/forum/#!searchin/magenta-discuss/magenta/magenta-discuss/dtQUq6IVaXk/7Cg32SdPBAAJ





cd /home/ubuntu/workspace/magenta/magenta



echo "Might as well build the training file structure here"



#bazel build //magenta/scripts:convert_midi_dir_to_note_sequences
#bazel build //magenta/models/basic_rnn:basic_rnn_create_dataset
#bazel build //magenta/models/basic_rnn:basic_rnn_train
#bazel build //magenta/models/basic_rnn:basic_rnn_generate

echo "and setup a spot for temporary files"
echo "not sure if magenta can make the folders for you????"

mkdir /tmp/melody_rnn
#mkdir /tmp/basic_rnn/logdir
#mkdir /tmp/basic_rnn/logdir/run1

#mkdir /tmp/basic_rnn/run1
#mkdir /tmp/basic_rnn/run2
#mkdir /tmp/basic_rnn/run3
mkdir /tmp/melody_rnn/generated




echo "Add a few symlinks to make life easier"

cd /home/ubuntu/workspace


ln -s /home/ubuntu/workspace/magenta/magenta a00-magenta-workspace
ln -s /home/ubuntu/workspace/magenta/magenta/testdata a01-link-to-magenta-example-midi
ln -s /home/ubuntu/workspace/magenta/magenta/models/melody_rnn a02-link-to-primer-midi

ln -s /tmp/melody_rnn/generated a03-link-to-generated-midi
ln -s /tmp/melody_rnn a04-link-to-basic_rnn-run
ln -s /tmp a05-link-to-tmp



cd /home/ubuntu/workspace/bazel
ln -s v/home/ubuntu/.bazel/bin bazel-location














echo "Not sure if all these checks are really needed, but they can't hurt"
echo "First checking the Python version"
python --version

echo "--------------------------------------------------------------"
echo ". "


echo "Now checking where python is installed"
readlink -f $(which python)
echo ""
echo "--------------------------------------------------------------"


echo "Now checking if pip is installed"

pip list

echo "--------------------------------------------------------------"
echo ". "



echo "echo "Now checking where pip is installed"
readlink -f $(which pip)
echo ""
echo "--------------------------------------------------------------"
echo ". "
echo "Now checking if java is installed"
java -h
echo ""
javac
echo "--------------------------------------------------------------"
echo ". "
echo "Now checking where the jdk is installed"
readlink -f $(which java)
echo ""
readlink -f $(which javac)
echo "--------------------------------------------------------------"
echo ". "
echo ". "
echo "Now checking if Bazel is installed"
bazel -h
echo ""
echo "--------------------------------------------------------------"
echo ". "
echo "echo "Now checking where bazel is installed"
readlink -f $(which bazel)
echo ""
echo "--------------------------------------------------------------"
echo ". "


echo ""
echo "Now checking where gcc is installed"
readlink -f $(which gcc)
echo ""

echo "--------------------------------------------------------------"
echo ". "

cd /home/ubuntu/workspace

echo "next list this directory"
pwd
echo ""
ls -lah  

echo "--------------------------------------------------------------"
echo "Some other useful commands are cd     cd ..      dir    ls     pwd     "
echo "."

echo " To check paths for new terminals, I suggested to run:"
echo "nano ~/.profile"


echo "Next try the hello-world.sh bash files, might be able to run them from the GUI"
echo "If not just open a new folder and type bash <name of hello-world.sh program>"


echo "While we are at it lets load another tensorflow githu site https://github.com/hpssjellis/char-rnn-tensorflow-music-3dprinting.git"

cd /home/ubuntu/workspace/

git clone https://github.com/hpssjellis/char-rnn-tensorflow-music-3dprinting.git



cd /home/ubuntu/workspace/magenta/magenta



pip install matplotlib scipy IPython







cd cd /home/ubuntu/workspace/magenta

echo "get Bazel working well"
bazel clean
bazel shutdown
bazel fetch //magenta/...
bazel build //magenta/...
bazel test //magenta/...







echo "Lets be brave and try to run the hello music AI world bash file"
echo "a01-helloworld.sh should have been copied into the magenta workspace"

bash a01-all.sh

echo "Import your midi files from /tmp/basic_rnn_generated to https://onlinesequencer.net/"
echo""

echo "running tensorboard, open a new terminal to run the other programs"

echo "If port already in use to open the port then run"
echo "fuser 6006/tcp -k"
echo "fuser 8081/tcp -k"
echo ""
echo "tensorboard command is"
echo "tensorboard --logdir=/tmp/basic_rnn"
echo "If things don't seem correct ctrl-C to quit tensorboard, Note: this must be the last command in this batch file"

tensorboard --logdir=/tmp/basic_rnn --host $IP --port=8081

echo "tensorboard is probably at the url, click on it and 'Open'"
echo "http://$C9_HOSTNAME:8081"

#jupyter notebook --ip=0.0.0.0 --port=8080 --no-browser
#jupyter notebook --ip $IP --port $PORT --no-browser

#tensorboard --logdir=/home/ubuntu/workspace/tmp5 --host $IP --port=8081





