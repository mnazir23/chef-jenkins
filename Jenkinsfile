pipeline {
    agent any
    stages {
        stage('Update Ubuntu') {
            steps {
                sh 'sudo apt-get update'
            }    
        }
        stage('Install ChefDK') {
            steps {
                script {
                    def chefdkExists = fileExists '/usr/bin/chef-client'
                    if (chefdkExists) {
                        echo 'Skipping Chef install...already installed'
                    }else{
                        sh 'wget https://packages.chef.io/files/stable/chefdk/4.7.73/debian/9/chefdk_4.7.73-1_amd64.deb'
                        sh 'sudo dpkg -i chefdk_4.7.73-1_amd64.deb'
                    }
                }
            }
        }
        stage('Download Cookbook') {
            steps {
                git branch: 'master', url: 'https://github.com/mnazir23/chef-repo.git'
            }
        }
        stage('Upload Cookbook to Chef Server, Converge Nodes') {
            steps {
                withCredentials([zip(credentialsId: 'chef-server-creds', variable: 'CHEFREPO')]) {
                    sh "echo $CHEFREPO/chef-repo/"
                    sh "mkdir -p $CHEFREPO/chef-repo/"
                    sh "sudo rm -rf $WORKSPACE/Berksfile.lock"
                    sh "mv $WORKSPACE/* $CHEFREPO/chef-repo/"
                    sh "knife cookbook upload apache --force -o $CHEFREPO/chef-repo/cookbooks -c $CHEFREPO/chef-repo/.chef/knife.rb"
                }
            }
        }
    }
}
