#! /bin/bash
echo 'jenkins, maven, git, tomcat,java'
printf 'enter the name of application on above list which you need to insatall\n==='
read app
case $app in
"git")
install_git(){
        yum install wget -y
		yum install git -y
		
}
git --version
if [ $? = 0 ]
then
        echo "git already installed"

else
        install_git
        echo "git installed successfull"
fi ;;
"java")
install_java(){
        cd /opt/
        wget https://www.dropbox.com/s/zw3p1ym52dv3sdv/jdk-8u181-linux-x64.tar.gz
        tar -xvzf jdk-8u181-linux-x64.tar.gz
        rm -rf jdk-8u181-linux-x64.tar.gz
        echo export JAVA_HOME=/opt/jdk1.8.0_181 >> /etc/profile.d/java.sh
        echo export JRE_HOME=/opt/jdk1.8.0_181/jre >> /etc/profile.d/java.sh
        echo PATH=${JAVA_HOME}/bin:${JRE_HOME}/bin:${PATH}
        source /etc/profile.d/java.sh
}
java -version
if [ $? = 0 ]
then
        echo "java already install"
else
        install_java
        echo "java installed successfull"
fi ;;
"jenkins")
install_jenkins(){
        cd /opt/
		sudo yum wget
		sudo wget https://pkg.jenkins.io/redhat/jenkins-2.177-1.1.noarch.rpm
		sudo rpm -ivh jenkins-2.177-1.1.noarch.rpm
                sudo yum install -y java
		sudo systemctl start jenkins.service  ##sentos
		## for linux------>>>>>>>>sudo /etc/init.d/jenkins start
}
jenkins --version
if [ $? = 0 ] 
then
        echo "jenkins already installed"
else
        install_jenkins
fi ;;
"tomcat")
install_tomcat(){
        cd /opt/
        wget https://www-eu.apache.org/dist/tomcat/tomcat-7/v7.0.94/bin/apache-tomcat-7.0.94.tar.gz
        tar xvf apache-tomcat-7.0.94.tar.gz
        rm -rf apache-tomcat-7.0.94.tar.gz
        sudo sh /opt/apache-tomcat-7.0.94/bin/startup.sh

}

sh /opt/apache-tomcat-7.0.94/bin/startup.sh
if [ $? = 0 ]
then
        echo "Tomcat started"
else
        install_tomcat
        sh /opt/apache-tomcat-7.0.94/bin/startup.sh
        echo "tomcat download successfull"
fi ;;
"maven")
install_maven(){
        cd /opt/
        wget https://www-eu.apache.org/dist/maven/maven-3/3.6.1/binaries/apache-maven-3.6.1-bin.tar.gz
        tar xvf apache-maven-3.6.1-bin.tar.gz
        rm -rf apache-maven-3.6.1-bin.tar.gz
        echo "export MAVEN_HOME=/opt/apache-maven-3.6.4" >> /etc/profile.d/maven.sh
        echo "export PATH=\$PATH:/opt/apache-maven-3.6.4/bin" >> /etc/profile.d/maven.sh
        source /etc/profile.d/maven.sh
}
mvn -version
if [ $? = 0 ]
then
        echo "maven already installed"
else
        install_maven
        echo "maven installed succesfull"
 fi ;;
*)
echo "invalid entry" ;;
esac


