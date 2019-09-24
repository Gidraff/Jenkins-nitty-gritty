import jenkins.model.Jenkins 
import jenkins.model.JenkinsLocationConfiguration

def env = System.getenv()

def jenkinsLocationConfiguration = JenkinsLocationConfiguration.get()

jenkinsLocationConfiguration.setUrl(env.JENKINS_URL)
jenkinsLocationConfiguration.setAdminAddress(env.JENKINS_EMAIL)
jenkinsLocationConfiguration.save()