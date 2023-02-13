pipeline{
    agent any
    stages{
        stage( "Clone repo" ){
            steps{
                git 'https://github.com/sai-harsha-dev/django-wedding-website.git'
            }
        }
        stage( "Build docker container" ){
            steps{
                sh 'sudo docker build -t djangoapp:v1 .'
                sh 'sudo docker images'
            }
        }
    }
}