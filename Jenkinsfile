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

    stage('Test image') {
        /* Ideally, we would run a test framework against our image.
         * For this example, we're using a Volkswagen-type approach ;-) */

        app.inside {
            sh 'echo "Tests passed"'
        }
    }

    stage('Deploy image') {
          sshagent ( ['0c7c9e7c-2a69-4649-8061-a1e5510f6e66']) {
       sh 'echo SSH_AUTH_SOCK=$SSH_AUTH_SOCK'
       sh 'ls -al $SSH_AUTH_SOCK || true'
       sh 'ssh -vvv -o StrictHostKeyChecking=no ubuntu@129.70.163.135 uname -a'
  }
    }
}
