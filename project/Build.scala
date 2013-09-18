import sbt._
import Keys._
import play.Project._

object ApplicationBuild extends Build {

  val appName         = "playframework-neo4j-template"
  val appVersion      = "1.0"

  val appDependencies = Seq(
    javaCore,
    "javax.inject" % "javax.inject" % "1",
    "asm" % "asm" % "3.3.1",
    "org.springframework" % "spring-context" % "3.2.4.RELEASE",
    "org.springframework.data" % "spring-data-neo4j" % "2.3.1.RELEASE",
    "org.springframework.data" % "spring-data-neo4j-rest" % "2.3.1.RELEASE" excludeAll(
      ExclusionRule(organization = "org.neo4j", name="neo4j")
    ),

    "org.neo4j" % "neo4j" % "1.9.3" excludeAll(
      ExclusionRule(organization = "org.neo4j", name="neo4j-kernel")
    ),
    "org.neo4j" % "neo4j-kernel" % "1.9.3" % "test" classifier "tests" classifier "",
    "org.neo4j" % "neo4j-rest-graphdb" % "1.9.RC2"
  )

  val main = play.Project(appName, appVersion, appDependencies).settings(
    resolvers += "Spring releases" at "http://repo.springsource.org/release",
    resolvers += "Spring Data snapshot" at "http://repo.springsource.org/snapshot/",
    resolvers += "Neo4j" at "http://m2.neo4j.org/content/repositories/releases/"
  )

}
