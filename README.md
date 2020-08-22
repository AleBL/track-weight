[![Build Status](https://circleci.com/gh/AleBL/track-weight.svg?style=svg)](https://app.circleci.com/pipelines/github/AleBL/track-weight)

# Track Weight

Ruby on rails health control application, where the user registers diets and meals.

It is also possible to update your weight where changes will be shown in a graph.

### Heroku Deploy
[Track Weight App](https://track-weight.herokuapp.com/)

### Ruby version
```
2.7.1
```

### Rails version
```
6.0.3
```

### Configuration
```shell
bundle install
yarn install
```

### Database creation
```shell
bundle exec rails db:setup
or
bundle exec rails db:create
bundle exec rails db:migrate
```

#### For The Tests

```shell
bundle exec rails db:setup RAILS_ENV=test
or
bundle exec rails db:create
bundle exec rails db:migrate RAILS_ENV=test
bundle exec rails db:seed RAILS_ENV=test
```

### How to run the test suite
```shell
bundle exec rspec
```

### Run the server
```shell
bundle exec rails server
```

# Documentation
## Features
- chart of weights registered by the user
- creation of diets, meals and a weight to be conquered
- there are 4 kinds of meals: breakfast, lunch, dinner, supper
- there are 2 unities of weights: kilo (kg) and pound (lb)
- the user will only be able to see weights and diets created by him
- only logged in users will be able to view and create weights

## Pages
- Home: `http://localhost:3000`
- Create User: `http://localhost:3000/users/sign_up`
- Login: `http://localhost:3000/users/sign_in`
- Update Weight: `http://localhost:3000/weights/new`
- Create Diet: `http://localhost:3000/diets/new`
- Show All Diets; `http://localhost:3000/diets/`

### Author

[Alessandro Barros Leal](https://www.linkedin.com/in/alessandro-barros-4075a112b/)
