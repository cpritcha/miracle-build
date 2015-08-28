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
ansible-playbook playbook.yml --ask-pass
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

Notes
-----

Dependencies: `vagrant`
