def label = "kaniko-${UUID.randomUUID().toString()}"

podTemplate(name: 'kaniko', label: label, yaml: """
kind: Pod
metadata:
  name: kaniko
spec:
  containers:
  - name: kaniko
    image: gcr.io/kaniko-project/executor@sha256:5ae6cb6a35dfbd8d6a5829c33a25d2d883fc4960d6a84b4753bec0f374557ddb
    imagePullPolicy: Always
    command:
    - /busybox/cat
    tty: true
    volumeMounts:
      - name: jenkins-docker-cfg
        mountPath: /kaniko/.docker
  volumes:
  - name: jenkins-docker-cfg
    projected:
      sources:
      - secret:
          name: docker-credentials-two
          items:
            - key: .dockerconfigjson
              path: config.json
""") { 
  node(label) {
    stage('Build with Kaniko') {
       git 'https://github.com/richbg/docker-example.git'
        container(name: 'kaniko', shell: '/busybox/sh') {
           withEnv(['PATH+EXTRA=/busybox']) {
            sh '''#!/busybox/sh
            /kaniko/executor --context `pwd` --destination richbg/hello-kaniko
            '''
           }
        }
      }
    }
  }
