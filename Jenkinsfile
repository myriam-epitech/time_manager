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
                sh 'cd ./timemanager'
                sh 'pwd'
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