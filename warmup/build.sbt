lazy val root = (project in file("."))
  .enablePlugins(PlayScala, SbtWeb)
  .settings(
    name := "warmup",
    scalaVersion := "2.11.11",
    version := "1.0"
  )

resolvers += "DefaultMavenRepository" at "https://repo1.maven.org/maven2/"
resolvers += "Flyway" at "https://flywaydb.org/repo"
resolvers += "Sonatype OSS Public" at "https://oss.sonatype.org/content/repositories/public/"
resolvers += "Sonatype OSS Snapshots" at "https://oss.sonatype.org/content/repositories/snapshots"
resolvers += Resolver.sbtPluginRepo("releases")
resolvers += "jitpack.io" at "https://jitpack.io"

libraryDependencies ++= Seq(
  ehcache,
  guice,
  jdbc,
  ws,
  "com.github.detro" % "ghostdriver" % "2.1.0",
  "com.google.code.gson" % "gson" % "2.8.2",
  "com.google.inject" % "guice" % "4.1.0",
  "com.machinepublishers" % "jbrowserdriver" % "0.17.11",
  "com.sendgrid" % "sendgrid-java" % "3.2.1",
  "com.typesafe.play" %% "play-json" % "2.6.7",
  "org.flywaydb" % "flyway-core" % "4.2.0",
  "org.flywaydb" %% "flyway-play" % "4.0.0",
  "org.postgresql" % "postgresql" % "42.1.4",
  "org.scalatestplus.play" % "scalatestplus-play_2.11" % "3.1.2" % "test",
  "org.scalikejdbc" %% "scalikejdbc" % "3.1.0",
  "org.scalikejdbc" %% "scalikejdbc-config" % "3.1.0",
  "org.scalikejdbc" %% "scalikejdbc-jsr310" % "2.5.2",
  "org.scalikejdbc" %% "scalikejdbc-play-initializer" % "2.6.0-scalikejdbc-3.1",
  "org.scalikejdbc" %% "scalikejdbc-test" % "3.1.0" % "test",
  "org.webjars" %% "webjars-play" % "2.6.2",
  "org.webjars.bower" % "bootstrap-sass" % "3.3.7"
)
