import jenkins.model.Jenkins
import java.util.ArrayList
import hudson.model.*;

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
                            Jenkins.instance.queue.clear()
                            def buildingJobs = Jenkins.instance.getAllItems(Job.class).findAll {
                                it.isBuilding()
                            }
                            buildingJobs.each {
                                def jobName = it.toString()
                                def val = jobName.split("\\[|\\]")
                                // 'param_cp' is the name of the job I have created, and I do not want it to abort itself.
                                if((val[1].trim())!='param_cp') {
                                    def job = Jenkins.instance.getItemByFullName(val[1].trim())
                                    for (build in job.builds) {
                                        if (build.isBuilding()) {
                                            println(build)
                                            build.doStop();
                                        }
                                    }
                                }
                            }
                        }
                        else 
                        {
                            echo "memory is above + ${alert}"
                        }
                }    
            }
        }
    }
}
