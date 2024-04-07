pipeline {
    agent any
	
    environment {
        IMAGE_NAME = 'my-git-hub-project'
    }

    stages {
        stage('Build') {
            steps {
				script {
					// Commented the docker commands for this task. I will use them as part of 6.2HD task.
					// Stop and remove the existing Docker container if it exists
					// sh 'docker stop ${IMAGE_NAME} || true'
					// sh 'docker rm ${IMAGE_NAME} || true'
					// Build the Docker image. Assumes Dockerfile includes 'npm install' and 'npm run test'.
					// echo "Building Docker image including npm install and test."
					// sh 'DOCKER_BUILDKIT=1 docker build . -t ${IMAGE_NAME}'
					// sh 'docker run -d --name ${IMAGE_NAME} -p 8000:8000 ${IMAGE_NAME}'
                    echo "Executing Build stage."
                    echo "Tool Suggestion: Maven."
                    echo "Purpose: Maven is used for handling dependencies, & project building."
				}
            }
        }
        
        stage('Unit and Integration Tests') {
            steps {
				echo "Executing Unit and Integration Tests stage." 
                echo "Tool suggestion: JUnit for Java; Mockito for mocks; Jest or Mocha for Node.js; Maven for unit, integrations and other forms of automated tests."
                echo: "Purpose: Identifying and fixing issues in the development cycle."
                
                script {
                        def result = currentBuild.currentResult
                        def jobName = env.JOB_NAME
                        def buildNumber = env.BUILD_NUMBER
                        def nodeName = env.NODE_NAME ?: 'Unknown Node'
                        def subject = "Build Result: ${result}, Job: '${jobName}', Build: #${buildNumber}"
                        def buildURL = env.BUILD_URL
                        // Copy the log file into the current workspace
                        def buildLogPath = "/var/lib/jenkins/jobs/MyGitHubProject/builds/${env.BUILD_NUMBER}/log"
                        def workspaceLogPath = "${env.WORKSPACE}/build.log"
                        sh "cp ${buildLogPath} ${workspaceLogPath}"

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
attachmentsPattern: '**/build.log'
                    )                            
                            
                }
            }
        }

        stage('Code Analysis') {
            steps {
                echo "Executing Code Analysis stage." 
                echo "Tool suggestion: SonarQube."
                echo "Purpose: Integrate SonarQube scanning in your CI process to analyze the code quality and ensure it meets industry standards."
            }
        }

        stage('Security Scan') {
            steps {
                echo "Executing Security Scan stage." 
                echo "Tool suggestion: OWASP ZAP."
                echo "Purpose: Perform dynamic security scanning to identify potential security vulnerabilities in the application."
            
                script {
                        def result = currentBuild.currentResult
                        def jobName = env.JOB_NAME
                        def buildNumber = env.BUILD_NUMBER
                        def nodeName = env.NODE_NAME ?: 'Unknown Node'
                        def subject = "Build Result: ${result}, Job: '${jobName}', Build: #${buildNumber}"
                        def buildURL = env.BUILD_URL
                        // Copy the log file into the current workspace
                        def buildLogPath = "/var/lib/jenkins/jobs/MyGitHubProject/builds/${env.BUILD_NUMBER}/log"
                        def workspaceLogPath = "${env.WORKSPACE}/build.log"
                        sh "cp ${buildLogPath} ${workspaceLogPath}"

                        emailext(
                            subject: "Security Scan stage: ${result}",
                            body: """Hello,

This is an email from the Jenkins pipeline.
The 'Security Scan stage' completed with status: ${result}.

- Build URL: ${buildURL}                            
- Job Name: ${jobName}
- Build Number: ${buildNumber}
- Node Name: ${nodeName}
- Result: ${result}

Best Regards,
Jenkins""",
to: 'sapre.dushyant@gmail.com',
attachmentsPattern: '**/build.log'
                    )                            
                            
                }
            }
        }

        stage('Deploy to Staging') {
            steps {
                echo "Executing Deploy to Staging stage."
                echo "Tool suggestion: Docker with Docker Compose."
                echo "Purpose: Deploy the application to a staging environment using Docker containers to replicate the production environment as closely as possible for final testing and validation."
            }
        }

        stage('Integration Tests on Staging') {
            steps {
                echo "Executing Integration Tests on Staging stage."
                echo "Tool suggestion: Selenium."
                echo "Purpose: Run integration tests on the staging environment to ensure the application functions as expected in an environment that closely mirrors production."
            }
        }

        stage('Deploy to Production') {
            steps {
                echo "Executing Deploy to Production stage."
                echo "Tool suggestion: Kubernetes."
                echo "Purpose: Deploy the application to the production environment using Kubernetes to manage the deployment and ensure high availability and scalability."
            }
        }
    }
}