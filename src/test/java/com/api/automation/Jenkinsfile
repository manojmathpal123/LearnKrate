pipeline
{

    agent any

    stages
    {

        stage('clean up stage')
        {

           steps
           {
               sh '''#!/bin/bash
                 echo "clean up stage"
         '''
               cleanWs notFailBuild: true
           }
        }
          stage('git checkout')
        {
              steps
           {
                sh '''#!/bin/bash
                 echo "git checkout"

         '''
         checkout([$class: 'GitSCM', branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/manojmathpal123/LearnKrate.git']]])
           }

        }
          stage('Restore package stage')
        {
              steps
           {
               sh '''#!/bin/bash
                 echo "Restore package stage"
         '''
           }

        }
          stage('Build stage')
        {
              steps
           {
                sh '''#!/bin/bash
                 echo "Build stage"
         '''
          sh '''#!/bin/bash
                mvn clean compile
         '''
           }

        }
          stage('Test Execution stage')
        {
               steps
           {
                sh '''#!/bin/bash
                 echo "Test Execution stage"
         '''
           sh '''#!/bin/bash
                mvn test
         '''
           }

        }
    }

    post {
  always {

      junit 'target/surefire-reports/*.xml'

  }
}
}

