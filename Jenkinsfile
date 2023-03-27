pipeline
{
	agent any
	tools
	{
	maven "maven"
	}
	stages{
		stage('Code Checkout'){
			steps{
				git branch: 'main', url: 'https://github.com/SShaikDevops/devops-web-apps.git'

			}
		}
		stage('Execute Maven'){
			steps{
				sh 'mvn package'
			}
		}

		stage('War Deploy into Nexus'){
			steps{
				sh 'mvn deploy'
			}
		}


		stage("Copying the War file to Job Location"){
			steps{
				sh 'cp /var/lib/jenkins/workspace/subahan-pipeline-project/target/*.war /var/lib/jenkins/workspace/subahan-pipeline-project'

		}
	}
	    stage("Docker Image Build"){
			steps{
			sh 'docker image build -t $JOB_NAME:v1.$BUILD_ID . '
			}
	             }
	   stage("Docker Image taging"){
			steps{
			sh 'docker image tag $JOB_NAME:v1.$BUILD_ID subahan786/$JOB_NAME:v1.$BUILD_ID'
			
		}

		}
		stage("push Image: DOCKERHUB"){
             steps{

                withCredentials([string(credentialsId: 'Dockerpassword', variable: 'Dockerpassword')]) {
                sh 'docker login -u narayanareddy143 -p ${Dockerpassword}'
                sh 'docker image push narayanareddy143/$JOB_NAME:v1.$BUILD_ID'
                
              }
         }
      }
	}
}



