pipeline {
    agent none
    node('master') {
        stage('Build') {
            sh 'singularity build --fakeroot helloworld.sif helloworld.def'
            stash 'singuilarity-build'
        }
    }
    node('kara') {
        stage('Test') {
            unstash 'singularity-build'
            sh './helloworld.sif'
        }
    }
}
