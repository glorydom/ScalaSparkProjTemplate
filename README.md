************************************************************************************************************************************************
Author:         Huihui.zhang
Organization:   Accenture

************************************************************************************************************************************************

#Scala Spark project template

#usage

### setup project 
#### add a new profile in src/main/profiles/[profile id].propertites
#### add a new entry in pom.xml

<profile>
  <id>[profile id]</id>
  <properties>
    <profile.id>[profile id]</profile.id>
  </properties>
</profile>



### how to build project 
go to project folder and run ```release.bat [profile id] ``` 