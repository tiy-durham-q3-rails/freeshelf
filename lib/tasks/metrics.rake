namespace :metrics do
  desc "Run Rails Best Practices"
  task :rbp do
    system("bundle exec rails_best_practices -f html --with-github tiy-durham-q3-rails/freeshelf")
    system("open rails_best_practices_output.html")
  end

  desc "Run Brakeman"
  task :brakeman do
    system("bundle exec brakeman . --github-repo tiy-durham-q3-rails/freeshelf -f html -o brakeman.html")
    system("open brakeman.html")
  end
end