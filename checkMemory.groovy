def myVar = 'initial_value'

pipeline {
    agent {label 'worker'}

    stages {
        stage('Hello') {
            steps {
                sh '/home/jenkins/scripts/script.sh > var.txt'
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
