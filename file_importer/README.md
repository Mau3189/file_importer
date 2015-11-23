# File Importer
## Description
Basic Ruby on Rails application with a simple interface to read, update, batch create, and batch delete marketing statistics data. 

## Requirements
Before you start make sure you have the following tools installed:
* Basic linux distro (ubuntu, fedora, centos, etc)
* Ruby: version >= 2.2.1
* Virtual Box 5.0.10
* Vagrant 1.7.4
* Ansible 1.9.4

## Getting Started
### Using Vagrant
Once you have all the requirements set, run the following steps to start the testing environment
```
$ cd /file_impoter
$ cd /dev_env/development/
$ vagrant up
```
This will trigger Vagrant to start a development instance in which the application server and the database will run. You will be able to access the application through the hosts web browser later on.

(*note this process might take a while, depending on your systems specs and internet connection bandwidth*)
#### Setup
Once Vagrant finishes the process, run the following comamands to start
```
$ vagrant ssh
$ cd /file_importer/file_importer/file_importer/ #shared folder between the guest and the host
$ bundle install
$ rake db:create
$ rake db:migrate
$ unicorn -p 3000
```
### Using other environment
If you don't want to install any particular tool and you already have Ruby, Bundler and MySQL/MariaDB installed in your system, you can run the following commands to get started
```
Inside MySQL/MariaDB console 
$ mysql: CREATE USER 'vagrant'@'localhost';
$ mysql: GRANT ALL PRIVILEGES ON *.* TO 'vagrant'@'localhost';
```
This will create the user that allows the application connect to the database.

#### Setup
Once the db user is created, run the following commands inside the root of the project:
```
$ bundle install
$ rake db:create
$ rake db:migrate
$ unicorn -p 3000
```

---
And that's it! The application can be accessed through your web browser at `localhost:3000`

### Tests
Rspec is the framework in use for test. Run the following command to see the output
```
rspec spec/ -f doc 
```

## Challenges
Having a code-generated testing environment probably was my biggest challenge. I wanted to provide a basic testing environment in which you could run the application hassle free. Just run a few commands and done.
I used the Vagrant-Ansible combo for accomplishing this but it was a time consuming process (troubleshooting missing packages, missing certificates, etc). In retrospect, I shouldn't have worried to much on this part.
I found this project particularly useful: [Railsbox](https://railsbox.io/)

## Design decisions
Probably the major design decision I made was related to how the data was going to be represented in the application.
I decided to create 2 different models to store both data and metadata. One model will serve as an auxiliary to store information related to a file (filename, when it was created or modified, status (if using a queues to process the upload, etc). The other one will hold all the data imported with a reference to the auxiliary table.

The benefit of having the data stored in a single table is that later on you can partion the table by id, easing the process of archiving and also allowing you to have different partitions at hand depending on your needs (like keeping the most recent records or on-demand records).

**Why not different tables for each file?** Because the file layout doesn't change, making the db schema consistent accross multiple tables. Thus, making a partitioned table a better option.

There are also benefits regarding query performance in some particular cases, because the partitions can work as a substitutes to column indexes, reducing index size and making it more likely that the heavily-used parts of the indexes fit in memory [^1].

## Future improvements you would make with more time
Some of the improvements I would make:

* Add a bulk upload feature that uses a raw database query and not active record (useful when the files are very big and uploaded in a non form/http way)
* Drag 'n Drop and syncing capabilities (a-la-dropbox) so the user would just move the file inside a folder and the data transfer would start
* Data transfers go directly to AWS S3 or Glacier (depending on data usage)
* Nicer interface, with better CSS styles and Javascript
* Add [Paperclip](https://github.com/thoughtbot/paperclip)
* many more...

[^1]:
    [PostgreSQL Partitioning](http://www.postgresql.org/docs/9.4/static/ddl-partitioning.html)