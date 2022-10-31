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
                dir('timemanager') {
                    sh 'mix deps.get'
                    sh 'mix test'
                }
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}
