namespace :db do
    desc 'seed initiale datas'
    task :seed do
        run "cd #{current_path}; bundle exec rake db:seed RAILS_ENV=#{rails_env}"
    end
end