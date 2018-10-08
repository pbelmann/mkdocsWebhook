node {
    def image
    stage('Clone repository') {
        checkout scm
    }

    stage('build image'){
    
                    sh 'docker build --no-cache denbicloud/mkdocswebhook .'
        }              
    stage('push image'){
    withDockerRegistry([ credentialsId: "docker1", url: "" ]) {
    sh 'docker push denbicloud/mkdocswebhook:dev'
   }
   }              
 }
