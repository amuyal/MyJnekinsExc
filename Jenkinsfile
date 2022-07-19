def myVar = 'initial_value'

pipeline {
    agent {label 'worker'}
    stages {
        stage('check') {
            steps {
                sh '/home/jenkins/scripts/script1.sh \"${alert}" > var.txt'
                script {
                    myVar = readFile('var.txt').trim()
                    if("${myVar}" == "kill")
                    {
                        echo "======IF======== + ${myVar}"
                    }
                    else 
                    {
                        echo "======ELSE======== + ${myVar}"
                    }
                }    
            }
        }
    }
}
