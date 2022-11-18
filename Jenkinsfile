pipeline {
    agent any
        stages {
          stage('Build') {
            steps {
                // Get code from a GitHub
                 git branch: 'main',
                    url: 'https://github.com/ROAAxAHMED/python-app-img'

            }
        }
        stage('CI') {
            steps {
                  withCredentials([usernamePassword(credentialsId: 'dockerhub_key', passwordVariable: 'PASSWORD', usernameVariable: 'USERNAME')])
                {
                    sh "docker login -u ${USERNAME} -p ${PASSWORD}"
                    sh "cd python-app-img/app/"
                    sh "docker docker build . -t app_img"
                    sh "docker tag roaaahmed1999/iti-app-img"
                    sh "docker push roaaahmed1999/iti-app-img"
                }
            } 
        }
         stage ('deployment application'){
            steps {
                sh """
                kubectl apply -f namespace-app.yml
                kubectl apply -f app-dep.yml
                kubectl apply -f load-balancer.yml

                echo Successful
            """
            }
        
        }
    }
}