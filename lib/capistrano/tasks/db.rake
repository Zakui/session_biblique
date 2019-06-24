namespace :db do
    desc 'seed initiale datas'
    task :seed do
        run "cd #{current_path}; bundle exec rake db:seed"
    end
end