pipeline {
    agent any
    environment {
        IMAGE_NAME = 'my-git-hub-project'
    }
    stages {
        stage('Build') {
            steps {
				script {
					// Stop and remove the existing Docker container if it exists
					// sh 'docker stop ${IMAGE_NAME} || true'
					// sh 'docker rm ${IMAGE_NAME} || true'
					// Build the Docker image. Assumes Dockerfile includes 'npm install' and 'npm run test'.
					echo "Building Docker image including npm install and test."
					// sh 'DOCKER_BUILDKIT=1 docker build . -t ${IMAGE_NAME}'
					// sh 'docker run -d --name ${IMAGE_NAME} -p 8000:8000 ${IMAGE_NAME}'
                    echo "Maven clean package"
				}
            }
        }
        
        stage('Unit and Integration Tests') {
            steps {
				echo "Running unit and integration tests. Tool suggestion: JUnit for Java, Mockito for mocks, Jest or Mocha for Node.js."
                // Simulate test command
                echo "mvn test or npm test"
                script {
                        def result = currentBuild.currentResult
                        def jobName = env.JOB_NAME
                        def buildNumber = env.BUILD_NUMBER
                        def nodeName = env.NODE_NAME ?: 'Unknown Node'
                        def subject = "Build Result: ${result}, Job: '${jobName}', Build: #${buildNumber}"
                        def logFile = "${env.JENKINS_HOME}/jobs/${jobName}/builds/${buildNumber}/log"
                        def buildURL = env.BUILD_URL

                        emailext(
                            subject: "Unit and Integration Tests stage: ${result}",
                            body: """Hello,

This is an email from the Jenkins pipeline.
The 'Unit and Integration Tests stage' completed with status: ${result}.

- Build URL: ${buildURL}                            
- Job Name: ${jobName}
- Build Number: ${buildNumber}
- Node Name: ${nodeName}
- Result: ${result}

Best Regards,
Jenkins""",
to: 'sapre.dushyant@gmail.com',
attachmentsPattern: logFile
                        )                            
                            
                }
            }
        }
        stage('Code Analysis') {
            steps {
                echo "Analyzing code quality. Tool suggestion: SonarQube."
                // Simulate code analysis command
                echo "Integrate SonarQube scanning in your CI process."
            }
        }
        stage('Security Scan') {
            steps {
                echo "Performing security scans. Tool suggestion: OWASP ZAP for DAST or SonarQube for integrated security scanning."
                // Simulate security scan command
                echo "Running OWASP ZAP or SonarQube security scan"
                // mail bcc: '', body: 'Hello, This is an email from jenkins pipeline.', cc: '', from: '', 
                // replyTo: '', subject: 'Security Scan stage status', to: 'sapre.dushyant@gmail.com'
            }
            post {
                always {
                    script {
                        def result = currentBuild.currentResult
                        def jobName = env.JOB_NAME
                        def buildNumber = env.BUILD_NUMBER
                        def nodeName = env.NODE_NAME ?: 'Unknown Node'
                        def subject = "Build Result: ${result}, Job: '${jobName}', Build: #${buildNumber}"
                        def logFile = "${env.JENKINS_HOME}/jobs/${jobName}/builds/${buildNumber}/log"
                        def buildURL = env.BUILD_URL

                        mail bcc: '',
                            subject: "Security Scan stage: ${result}",
                            body: """Hello,

This is an email from the Jenkins pipeline.
The 'Security Scan stage' completed with status: ${result}.

- Build URL: ${buildURL}                            
- Job Name: ${jobName}
- Build Number: ${buildNumber}
- Node Name: ${nodeName}
- Result: ${result}


Best,
Jenkins""",
                            to: 'sapre.dushyant@gmail.com'                        
                    }
                }
            }
        }
        stage('Deploy to Staging') {
            steps {
                echo "Deploying application to a staging environment. Assuming usage of Docker and deployment scripts for AWS EC2."
                // Simulate deployment command
                echo "Running deploy_staging.sh for Docker deployment to AWS EC2 staging instance"
            }
        }
        stage('Integration Tests on Staging') {
            steps {
                echo "Running integration tests on the staging environment. Tool suggestion: Selenium for UI testing, Postman for API testing."
                // Simulate integration test command
                echo "Running Selenium tests or Postman collection against staging environment"
            }
        }
        stage('Deploy to Production') {
            steps {
                echo "Deploying application to the production environment. This can involve Docker for container management and AWS CLI or Ansible for deployment to AWS EC2."
                // Simulate deployment command
                echo "Running deploy_production.sh for Docker deployment to AWS EC2 production instance"
            }
        }
      
    }
}