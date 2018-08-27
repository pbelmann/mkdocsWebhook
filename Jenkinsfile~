node {
   
    stage('Clone repository') {
        checkout scm
    }

    stage('publish'){
    script {
                docker.withRegistry('https://registry.hub.docker.com', 'docker1') {

                    def customImage = docker.build("denbicloud/mkdocswebhook")

                    /* Push the container to the custom Registry */
                    customImage.push("feat_test_deployment")
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
