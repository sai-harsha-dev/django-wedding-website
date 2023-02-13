pipeline{
    agent any
    environment{
        DOCKER = credentials("Docker")
        REPO = "djangoapp" 
    }
    stages{
        stage( "Clone repo" ){
            steps{
                git 'https://github.com/sai-harsha-dev/django-wedding-website.git'
            }
        }
        stage( "Build docker container" ){
            steps{
                sh 'sudo docker build -t ${REPO} .'
                sh 'sudo docker images'
            }
        }
        stage ( "Push to registry" ){
            steps{
                sh 'echo ${DOCKER_PSW} |sudo docker login -u ${DOCKER_USR} --password-stdin'
                sh 'sudo docker push ${DOCKER_USR}/${REPO}'
            }
        }
    }

    post {
        success {
            build 'DJANGO CONTAINER RUN'
         }
    }
}