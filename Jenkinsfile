pipeline {
    agent any
    stages {
        // Launch Build on master node
        stage('Build') {
            node('master') {
                // Build Singularity container
                sh 'singularity build --fakeroot helloworld.sif helloworld.def'
                // Clean Singularity cache to save storage space
                sh 'singularity cache clean --force'
                // Stash the container to move to Kara for Test
                stash 'singularity-build'
            }
        }
        // Launch test on Kara
        stage('Test') {
            node('kara-test') {
                // Retrieve stashed container
                unstash 'singularity-build'
                // Run Singularity container
                sh './helloworld.sif'
            }
        }
    }
}
