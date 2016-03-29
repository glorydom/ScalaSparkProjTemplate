@echo off

set host=${app.local.host}
set port=${app.local.port}
set user=${app.user.name}
set password=${app.user.password}
set baseDir=${app.local.basedir}
set home=${app.local.home}
set buildDir=${project.build.directory}
set binZip=${project.build.finalName}-bin.zip
set softLink=/usr/bin/${project.artifactId}

echo.
echo ***************************************************************************************
echo UPLOAD...
echo ***************************************************************************************

@echo on
PSCP -l %user% -pw %password% -P %port% "%buildDir%\\%binZip%" "%host%:/tmp/"
PLINK -l %user% -pw %password% -P %port% %host% -t "if [ ! -d '%baseDir%' ];then mkdir %baseDir%;fi"
PLINK -l %user% -pw %password% -P %port% %host% -t "if [ -d '%home%' ];then rm -rf %home%;fi"
PLINK -l %user% -pw %password% -P %port% %host% -t "unzip /tmp/%binZip% -d %baseDir%/"
PLINK -l %user% -pw %password% -P %port% %host% -t "if [ -L '%softLink%' ]; then rm -f %softLink%;fi"
::PLINK -l %user% -pw %password% -P %port% %host% -t "ln -s %home%/bin/${project.artifactId}.sh %softLink%"
@echo off

echo.
echo ***************************************************************************************
echo STARTUP...
echo ***************************************************************************************

@echo on
::PLINK -l %user% -pw %password% -P %port% %host% -t "%home%/bin/${project.artifactId}.sh restart"
@echo off
