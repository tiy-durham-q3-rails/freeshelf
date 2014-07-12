# Freeshelf

<a href="https://travis-ci.org/tiy-durham-q3-rails/freeshelf"><img src="https://travis-ci.org/tiy-durham-q3-rails/freeshelf.svg?branch=master"></a>
<a href="https://codeclimate.com/github/tiy-durham-q3-rails/freeshelf"><img src="https://codeclimate.com/github/tiy-durham-q3-rails/freeshelf.png"></a>

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

## Testing

You must have PhantomJS installed to run the tests. On OS X with Homebrew, run:

```sh
brew install phantomjs
```

## Contributing

If you are new to using git and GitHub, follow these directions:

1. Fork the project.
2. Clone _your_ copy.
3. Add another remote:  
   `git remote add upstream https://github.com/tiy-durham-q3-rails/freeshelf.git`
4. Make a local branch for your feature.
5. Write code.
6. Test it out.
7. Run `git fetch upstream` and then `git merge upstream/master` in your branch.
8. Test again.
9. Push your branch to your repo.
10. Make a pull request!