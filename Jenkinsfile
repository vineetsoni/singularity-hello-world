pipeline {
    agent any
    // Launch Build on master node
    node('master') {
        stage('Build') {
            // Build Singularity container
            sh 'singularity build --fakeroot helloworld.sif helloworld.def'
            // Clean Singularity cache to save storage space
            sh 'singularity cache clean --force'
            // Stash the container to move to Kara for Test
            stash 'singularity-build'
        }
    }
    // Launch test on Kara
    node('kara-test') {
        stage('Test') {
            // Retrieve stashed container
            unstash 'singularity-build'
            // Run Singularity container
            sh './helloworld.sif'
        }
    }
}
