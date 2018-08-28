node {
    def image
    stage('Clone repository') {
        checkout scm
    }

    stage('build image'){
    
                    sh 'docker rmi denbicloud/mkdocswebhook'
                    image = docker.build("denbicloud/mkdocswebhook")
        }              
    stage('push image'){
    withDockerRegistry([ credentialsId: "docker1", url: "" ]) {
    image.push("dev")
   }
   }              
 }
