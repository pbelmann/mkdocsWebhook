
node {
        
    stage('Clone repository') {
        checkout scm
    }

    stage('publish'){
    script {
                       withDockerRegistry([ credentialsId: "docker1", url: "" ]) {

                    def customImage = docker.build("denbicloud/mkdocswebhook")

                    /* Push the container to the custom Registry */
                   customImage.push("dev")
                }
}
}
   
    stage('Deploy image') {
          sshagent (credentials : ['0c7c9e7c-2a69-4649-8061-a1e5510f6e66']) {
       sh 'ssh ubuntu@129.70.163.135 ./startup.sh'       
  }
    }
}
