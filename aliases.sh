# api
alias fn-api='docker-compose up api'
alias fn-api-b='docker-compose up --build api'
alias fn-api-bash='docker exec -it fn-api bash'
alias db-create='docker-compose run --rm api rails db:create'
alias db-migrate='docker-compose run --rm api rails db:migrate'

# front
alias fn-front='docker-compose up front'
alias fn-front-b='docker-compose up --build front'
alias fn-front-bash='docker exec -it fn-front sh'

#db
alias fn-db-bash='docker exec -it fn-db bash'