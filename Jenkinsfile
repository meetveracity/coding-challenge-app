pipeline {
    agent {
        node {
            label 'ruby'
        }
    }
    parameters {
        string(name: 'releaseVersion', defaultValue: '', description: 'Provide the release version (leave blank for no release):')
        string(name: 'developmentVersion', defaultValue: '', description: 'Provide the next development version (leave blank for no release):')
    }
    stages {
        stage('Building Application') {
            steps {
                sh "mvn clean install"
                stash name: 'mavenOutput', includes: '**/target/*'
            }
            // post {
            //     always {
            //         junit '**/target/surefire-reports/*.xml'
            //     }
            // }
        }
        stage('Source Code Analysis') {
            steps {
                echo "TDB..."
            }
        }
        stage("Build Containers") {
            agent {
                node {
                    label 'docker'
                }
            }
            steps {
                unstash 'mavenOutput'
                script {
                    docker.withRegistry(env.DOCKER_REGISTRY_URL, "docker-registry") {
                        image = docker.build("meetveracity/coding-challenge-app")
                        image.push("${env.BRANCH_NAME}")
                    }
                }
            }
        }
        stage("Functional Testing") {
            steps {
                echo "TDB..."
            }
        }
        stage("Performance Testing") {
            steps {
                echo "TDB..."
            }
        }
        stage("Promote to Development") {
            agent {
                node {
                    label 'docker'
                }
            }
            steps {
                script {
                    docker.withRegistry(env.DOCKER_REGISTRY_URL, "docker-registry") {
                        docker.image("meetveracity/coding-challenge-app:${env.BRANCH_NAME}").push("development")
                    }
                }
            }
        }
    }
}