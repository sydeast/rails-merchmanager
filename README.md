# Rails-Merch Manager
[![license](https://img.shields.io/github/license/sydeast/Rails-MerchManager.svg?style=flat-square)](https://github.com/sydeast/Rails-MerchManager/blob/main/LICENSE)

Flatiron Rails Project Assessment - Somi's Merch Manager

With the ROR built project, you can track all of your PCs (that's PhotoCardS) collected from your favorite Korean albums and merch! No more excel spreadsheets. No more Twitter checks (I mean there is still a bit of that!). No more losing track of what or whom you have and what your need. With this web app, all your photocards are in one place. Create an account using your email or login via Google today. A community awaits with posts to create card trades (we are not held responsible for lost items or money!) and fellow k-poppers with whom to chat.

## Tools
Built using Ruby on Rails 6.1.3, Omniauth-Google, jquery, Bootstrap, and Gretel. Check the Gemfile and Gemlock for more.

## To Run for development or personal use
Clone the repo to your machine and run below command in your terminal to install all gems and their dependencies
```
$ bundle install
```

Next run the migration and seed files. If installing for personal use, run the second command as you will not need seeded data. Passwords for the accounts are in the seed file. Note: Rake Setup command will reset any data currently in the database if you have the database setup.

Development:

```
$ rails db:setup
```

Personal:
```
$ rails db:migration
```

Now start your local server to access the site in your web browser
```
$ rails s
```

Open your preferred web browser and in the address bar, navigate to the address as listed replacing the hashes for the port numbers given in your terminal
```
http://localhost:####
```

HAVE FUN!

## Contibuting
Currently this project is an assignment for my course. Once completed, the project will be open for collaboration. In the meantime, please feel free to open pull requests or contact me via a bug creation. PR approval will occur after assessment and if changes are valid.


## Future Work
* Allow users to upload profile images for self, artists, and photocards
* Add replies to comments
* Attach video playlist links in an iframe
* Track more merch including albums, lightsticks, magazines, clothing, and more

