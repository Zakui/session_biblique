namespace :db do
    desc 'seed initiale datas'
    task :seed do
      on roles(:all) do
        run_locally do
            execute :rake, "db:seed"
        end
      end
    end
end