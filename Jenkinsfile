node {

    stage('Clone repository') {
        checkout scm
    }

    stage('publish'){
    script {
                docker.withRegistry('https://registry.hub.docker.com', 'docker1') {

                    def customImage = docker.build("denbicloud/mkdocswebhook")

                    /* Push the container to the custom Registry */
                    customImage.push("${env.BRANCH_NAME}")
                }
}
}
   
    stage('Deploy image') {
          sshagent (credentials : ['0c7c9e7c-2a69-4649-8061-a1e5510f6e66']) {
       sh 'ssh -o StrictHostKeyChecking=no ubuntu@129.70.163.135 uptime'
     
  }
    }
}
