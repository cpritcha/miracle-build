Development Machine for MIRACLE
===============================

Configuration
-------------

First clone the repo and prepare everything

```bash
# go to the folder you plan to download
mkdir miracle_project
cd miracle_project
git clone https://github.com/cpritcha/miracle-build.git build
cd build
./download.sh

# make the directory structure for analyses, could also download data here
./make_analyses.sh
```

Create the virtual machine and ssh in

```bash
# assuming you are in the build/ repo
vagrant up
vagrant ssh mgmt
```

Once inside the `mgmt` node, prepare the `dev1` node

```bash
# vagrant@mgmt:~$ 
ssh-keyscan dev1 >> .ssh/known_hosts
cd /vagrant
ansible-playbook playbook.yml --ask-pass # password: vagrant
```

Prepare the `dev1` node by following the installation instructions for the 
*comses/miracle* project (first ssh into the `dev1` machine `vagrant ssh dev1`)

```bash
# vagrant@dev1:~$
. ./miracle_env/bin/activate
cd miracle
fab initdb # populate the database
```

Running the Django Web Server
-----------------------------

First, ssh into the `dev1` machine (`vagrant ssh dev1`). Then run the following

```bash
# vagrant@dev1:~$
. ./miracle_env/bin/activate
cd miracle

# Start the Web Server
./manage.py runserver 0.0.0.0:8000
```

Now open up your web browser at `localhost:8001` and you should see the miracle
website.

Running the DeployR and Radiant Servers
---------------------------------------

First, ssh into the `dev1` machine (`vagrant ssh dev1`). Then run the following

```bash
# vagrant@dev1:~$
# Start the DeployR Server
sudo docker run -d -p 7400:7400 deployr

# Start the Radiant Server
sudo docker run -d -p 3838:3838 radiant
```

Now open up your web broswer at `localhost:7400/revolution` and 
`localhost:3838` and you should see the DeployR and Radiant respectively

Notes
-----

Dependencies: `vagrant`

Making the docker images will take a while. To see the output of the docker
build you could build the images outside the playbook. In order to do that,
you need to run the following code before the playbook is run

```bash
# vagrant@dev1:~$
sudo docker build -t deployr deployr-docker
sudo docker build -t radiant radiant-docker
```
