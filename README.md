# Freeshelf

This Rails application provides a way to share and collect free programming books.

## Installation and usage

This application uses Postgres, so you will need it installed on your machine. If on Linux, use your package manager.
On OS X, if you have Homebrew, run `brew install postgresql`.

Once you have Postgres installed, edit `config/database.yml` -- or set up Postgres to have a database called 
`freeshelf_development` for your current user.

Next, install all required gems:

```sh
bundle install
```

Finally, set up the database:

```sh
rake db:create db:migrate db:seed
```

After that, you can run `rails server` to start the server or `rails console` for a REPL.

## Roadmap

* Allow users to add links to free programming books, along with covers for them and descriptions.
* The books can be tagged to help people explore.
* Users can comment on books and also thumbs-up them which we will use for sorting.