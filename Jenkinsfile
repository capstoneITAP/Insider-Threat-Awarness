pipeline {
    agent any
    options {
        skipDefaultCheckout(true)
    }

    stages {
        stage('Git Checkout') {
            steps {
                git branch: 'KAN-3-Push-Frontend-to-Github', url: 'https://github.com/capstoneITAP/Insider-Threat-Awarness.git'
            }
        }

        // stage('Unit Tests') {
        //     steps {
        //         script {
        //             bat 'C:\\Users\\Administrator\\AppData\\Local\\Programs\\Python\\Python310\\Scripts\\pytest'
        //         }
        //     }
        // }
        stage('Build Images') {
            steps {
                script {
                    bat 'docker build -t adityanaegi/insider-threat-awareness:code .'
                }
            }
        }

        stage('Push Images to Hub') {
            steps {
                withDockerRegistry([ credentialsId: "aditya-dockerhub", url: "" ]) {
                    bat 'docker push adityanaegi/insider-threat-awareness:code'
                }
            }
        }
    }
post {
        // always {
        //     // This block will always be executed, regardless of the build result
        //     bat 'docker logout'
        // }

        failure {
            emailext(
                attachLog: true,
                body: '''<html>
                        <p>The build failed. Please check the Jenkins console output for details.</p>
                        <p>Build URL: ${BUILD_URL}</p>
                        </html>''',
                subject: 'Build Failure',
                to: 'adarsh.mishra20@st.niituniversity.in, aditya.negi20@st.niituniversity.in',
                mimeType: 'text/html'
            )

        }

        success {
            emailext(
                attachLog: true,
                body: 'The build was successful.',
                subject: 'Build Success',
                to: 'adarsh.mishra20@st.niituniversity.in, aditya.negi20@st.niituniversity.in',
                mimeType: 'text/html'
            )

        }
    }
}
