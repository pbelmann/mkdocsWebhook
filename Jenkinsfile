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
          sshagent ( ['0c7c9e7c-2a69-4649-8061-a1e5510f6e66']) {
       sh 'ssh -o StrictHostKeyChecking=no -l ubuntu 129.70.163.135 uname -a'
  }
    }
}
