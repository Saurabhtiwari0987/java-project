pipeline {
   environment {
     git_url = "https://github.com/Saurabhtiwari0987/java-project.git"
     git_branch = "master"
   }

  //agent {label 'dev'}
  agent any
  stages {
    stage('Pull Source') {
      steps {
        git credentialsId: '64a5d22c-72f7-4b5a-8e21-0e27c9501c84', branch: "${git_branch}", url: "${git_url}"
       
      }
     }
    
    stage('Maven Build') {
     steps { 
          sh "mvn clean package && cp target/*.jar . "
     }
    }
     
     stage('Docker Image Build') {     
        steps {
              sh 'sudo docker build -t myjava-image . '
               }
             }
        stage('Docker image push') {
           steps {
                 withCredentials([usernamePassword(credentialsId: '3a4fbd06-49fe-4e01-907f-900679abbcd1', passwordVariable: 'Password', usernameVariable: 'Username')]) {
                 sh "sudo docker login -u ${env.Username} -p ${env.Password}"
                 //sh "sudo docker image tag myjava-image saurabhtiwari09876/myjava-image:test"
                 sh "sudo docker image tag myjava-image saurabhtiwari09876/myjava-image:sunny12345"
                 sh "sudo docker image push saurabhtiwari09876/myjava-image:sunny12345" 
               } 
             }  
          }
      stage('Deploy app') {
         steps {
           sh 'ls -ltr'
           //sh 'kubectl apply -f app-deploy.yaml'
            sh 'sudo docker container run -d --name testcont saurabhtiwari09876/myjava-image:sunny12345'
        }
     }
    }

//  post {
//    always {
//      deleteDir() /* cleanup the workspace */
//    }
//  }
 }
