PlayFramework Spring Data Neo4j Template
--------------------------------------------
PlayFramework + Spring Data Neo4j skeleton project.

Server-side:
- SpringFramework
- Spring Data
- Spring Data Neo4j
- CDI (javax.inject)

Front-end:
- Twitter Bootstrap
- JQuery
- HTML5 Shiv

Heroku Deployment
-----------------
First, create your application and add the Neo4j Add-on.

Before you do the `git push heroku master` read the comments at `conf/applicationContext.xml`, and adjust the Heroku Neo4j Add-on application environment variables.

You can see it live at: http://playframework-neo4j.herokuapp.com/

Resources:
https://devcenter.heroku.com/articles/neo4j
