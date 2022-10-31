pipeline {
    agent any

    stages {
        stage('Test front') {
            steps {
                echo 'Test front..'
            }
        }
        stage('Test Back') {
            steps {
                sh 'pwd'
                dir('timemanager') {
                    // sh 'pwd'
                    sh 'pwd'
                }
            // sh 'cd ./timemanager'
            // sh 'mix deps.get'
            // sh 'mix test'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}
