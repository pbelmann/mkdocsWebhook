node {
    def app

    stage('Clone repository') {
        checkout scm
    }

    stage('Build image') {
        /* This builds the actual image; synonymous to
         * docker build on the command line */

        app = docker.build("mkdocs")
    }

    stage('Deploy image') {
          sshagent (credentials : ['0c7c9e7c-2a69-4649-8061-a1e5510f6e66']) {
       sh 'ssh -o StrictHostKeyChecking=no ubuntu@129.70.163.135 uptime'
       sh 'ssh -v ubuntu@129.70.163.135'
       sh 'ssh -v ubuntu@129.70.163.135 git clone git@github.com:deNBI/mkdocsWebhook.git'
       sh 'ssh -v ubuntu@129.70.163.135 cd mkdocsWebhook' 
       sh 'ssh -v ubuntu@129.70.163.135 docker build -t docs .'
  }
    }
}
