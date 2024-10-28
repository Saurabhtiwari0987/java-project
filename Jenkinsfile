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
        git credentialsId: '6f72a3b9-9fad-4ec1-b8b4-ada2b7e03f65', branch: "${git_branch}", url: "${git_url}"
       
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
                 withCredentials([usernamePassword(credentialsId: '1ede9e6c-2566-4387-a7b6-456eedf58bf7', passwordVariable: 'Password', usernameVariable: 'Username')]) {
                 sh "sudo docker login -u ${env.Username} -p ${env.Password}"
                 //sh "sudo docker image tag myjava-image saurabhtiwari09876/myjava-image:test"
                 sh "sudo docker image tag myjava-image saurabhtiwari09876/myjava-image:test"
                 sh "sudo docker image push saurabhtiwari09876/myjava-image:test" 
               } 
             }  
          }
      stage('Deploy app') {
         steps {
           sh 'ls -ltr'
           //sh 'kubectl apply -f app-deploy.yaml'
            // sh 'sudo docker container run -d --name testcont salilkul87/myjava-image:test'
        }
     }
    }

//  post {
//    always {
//      deleteDir() /* cleanup the workspace */
//    }
//  }
 }
