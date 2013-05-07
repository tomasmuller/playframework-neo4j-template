PlayFramework Spring Data Neo4j Template
--------------------------------------------
PlayFramework and Spring Data Neo4j skeleton project.

Server-side:
- Neo4j Graph Database
- Scala and Java integration
- Spring
- Spring Data
- Spring Data Neo4j
- CDI (javax.inject)

Front-end:
- Twitter Bootstrap
- JQuery
- HTML5 Shiv

Heroku Deployment
-----------------
You can easily deploy this app to your own servers using Capistrano, or use Heroku.
Deploying at Heroku requires less effort since you don't need to manage the server installation/configuration by your own.

To deploy at Heroku, first, create your application and add the Neo4j Add-on.

Before you do the `git push heroku master` read the comments at `conf/applicationContext.xml`, and adjust the Heroku Neo4j Add-on application environment variables.

When deploying at Heroku Platform, don't forget to delete the following files (otherwise your app will be considered a Ruby app):
- Capfile
- Gemfile
- Gemfile.lock
- conf/deploy.rb

You can see it live at: http://playframework-neo4j.herokuapp.com/

Resources:
https://devcenter.heroku.com/articles/neo4j
