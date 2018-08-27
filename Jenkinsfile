node {
   
    stage('Clone repository') {
        checkout scm
    }

    stage('publish'){
    script {
                        withDockerRegistry([ credentialsId: "docker1", url: "" ]) {

                   sh 'docker build -t denbicloud/mkdocswebhook:dev .'

                    /* Push the container to the custom Registry */
                  sh 'docker push denbicloud/mkdocswebhook:dev'
                }
}
}
   
    stage('Deploy image') {
          sshagent (credentials : ['0c7c9e7c-2a69-4649-8061-a1e5510f6e66']) {
       sh 'ssh ubuntu@129.70.163.135 docker-compose -f cloud-metaportal/docker-compose.yml stop wp'
       sh 'ssh ubuntu@129.70.163.135 docker-compose -f cloud-metaportal/docker-compose.yml rm -f wp'     
       sh 'ssh ubuntu@129.70.163.135 docker-compose -f cloud-metaportal/docker-compose.yml up -d wp'       
  }
    }
}
