# RENDEZVOUS
[http://rendezvous-meetapp.herokuapp.com/](http://rendezvous-meetapp.herokuapp.com/)

Rendezvous is a multilingual application for organizing meetings, walks and other events created using Ruby on Rails.

### To use on your local machine:
#### To clone the project:

```
git clone git<span></span>@github.com:Mike2022SPB/rendezvous.git
```

#### To run on your local machine

```
cd rendezvous
```

```
bundle
```

```
rails db:migrate
```

```
rails s
```

#### Rename .env.examples to .env and add environment variables.


Technologies:
1. Ruby on Rails
2. The functionality of adding images via: 
2.1. gem "aws-sdk-s3"
2.2. gem "image_processing"
2.3. gem "image_processing"
3. Registration via functionality of gem "devise"
4. HTML
5. CSS
6. PostgreSQL(heroku)
7. SQL(locally)
8. Email functionality via mailjet and letter-opener.

Deployed on [Heroku](https://dashboard.heroku.com/)
