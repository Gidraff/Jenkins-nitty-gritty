import jenkins.model.Jenkins

def slack = Jenkins.instance.getExtensionList('jenkins.plugins.slack.SlackNotifier$DescriptorImpl')[0]
slack.tokenCredentialId = 'KuZlgndNqTsm700O92vvs4aF'
slack.teamDomain = 'builtit-open'
slack.baseUrl = 'https://builtit-open.slack.com/services/hooks/jenkins-ci/'
slack.save()