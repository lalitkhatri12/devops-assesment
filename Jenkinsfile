def gitInfo = {}

pipeline {
    agent {
        label 'master'
    }
    
    stages {
        stage('checkout'){
            steps {
                script {
                    gitInfo = checkout changelog: false, poll: false, scm: [$class: 'GitSCM', branches: [[name: '${BRANCH}']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[credentialsId: 'lalitkhatri', url: 'https://github.com/lalitkhatri12/one2onetool.git']]]
                    echo gitInfo.GIT_COMMIT
                    echo gitInfo.GIT_BRANCH
                    sh """
                    cd $WORKSPACE
                    ls -ltr
                    """
                }
            }
        }
        stage('NPM Build & Test') {
            steps {
                script {
                    sh """
                    npm config set registry https://registry.npmjs.org/
                    npm install
		    npm test
		    zip -r package.zip *
		    ls -ltr
                    """
                }
            }
        }
        
        stage('upload to Nexus') {
            steps {
                script {
                    sh "nexusArtifactUploader artifacts: [[artifactId: 'npm-stagingpkg', classifier: '', file: '$WORKSPACE/package.zip', type: 'zip']], credentialsId: 'nexusupload', groupId: 'com.company.npm', nexusUrl: 'nexus.com:8081', nexusVersion: 'nexus3', protocol: 'http', repository: 'npm_private', version: '0.1'"
                    //echo "skip upload"
                }
            }
        }
        stage('Docker Build') {
            steps {
                script {
                    sh 'docker build -t staging-image .'
                }
            }
        }
        stage('Upload Image to ECR') {
            steps {
                script {
            //Assuming aws cli is configured and ecr repository is already created
                    sh 'aws ecr get-login-password --region ap-southeast-1 | docker login --username root --password-stdin aws_account_id.dkr.ecr.ap-southeast-1.amazonaws.com'
                    sh 'docker tag staging-image:latest aws_account_id.dkr.ecr.ap-southeast-1.amazonaws.com/staging-image:latest'
                    sh 'docker push aws_account_id.dkr.ecr.amazonaws.com/staging-image:latest'
                }
            }
        }
    }
}
