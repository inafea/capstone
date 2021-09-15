node {
    def registry1 = 'ibrahimnafea/udacity-blue'
    def registry2 = 'ibrahimnafea/udacity-green'
    // stage('Checking out git repo') {
    //   echo 'Checkout...'
    //   checkout scm
    // }
    stage('Checking environment') {
      
      sh 'git --version'
      echo "Branch: ${env.BRANCH_NAME}"
      sh 'docker -v'
    }
    stage('Linting') {
     
      sh '/usr/bin/hlint src/blue/Dockerfile'
      sh '/usr/bin/hlint src/green/Dockerfile'
    }
    stage('Building image blue') {
  
      withCredentials([usernamePassword(credentialsId: 'dockerhub', passwordVariable: 'dockerHubPassword', usernameVariable: 'dockerHubUser')]) {
      sh "sudo docker login -u ${env.dockerHubUser} -p ${env.dockerHubPassword}"
      sh "sudo docker build -t ${registry1} src/blue/."
      sh "sudo docker tag ${registry1} ${registry1}"
      sh "sudo docker push ${registry1}"
      }
    }
    stage('Building image green') {
   
      withCredentials([usernamePassword(credentialsId: 'dockerhub', passwordVariable: 'dockerHubPassword', usernameVariable: 'dockerHubUser')]) {
      sh "sudo docker login -u ${env.dockerHubUser} -p ${env.dockerHubPassword}"
      sh "sudo docker build -t ${registry2} src/green/."
      sh "sudo docker tag ${registry2} ${registry2}"
      sh "sudo docker push ${registry2}"
      }
    }
    // stage('Aws Cluster')
    // {
    // withAWS(credentials: 'eksuser', region: 'eu-west-3') {
    //   sh 'eksctl create cluster \
    //         --name capstone-cluster \
    //         --version 1.21 \
    //         --nodegroup-name capstone-workers-ng \
    //         --node-type t2.micro \
    //         --nodes 2 \
    //         --nodes-min 1 \
    //         --nodes-max 4 '
    // }
    // }
    // stage('Deploying to AWS EKS') {
     
    //   dir ('./') {
    //     withAWS(credentials: 'eksuser', region: 'eu-west-3') {
    //         sh 'aws eks --region eu-west-3 update-kubeconfig --name capstone-cluster'
    //         sh 'kubectl apply -f src/blue/blue-controller.json'
    //        sh 'kubectl apply -f src/green/green-controller.json'
    //         sh 'kubectl apply -f ./blue-green-service.json'
    //         sh 'kubectl get nodes'
    //         sh 'kubectl get pods'
    //     }
    //   }
    // }
}
