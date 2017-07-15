require 'rubygems'
require 'rspec/expectations'
require 'Capybara'


def getCredentialInfo
  YAML.load_file("./config/Login.yml")[ENV['UserRole']]
end


def writeFailure(data)
  puts "<span style='color:red'>#{data}</span>"
end

def getTaskDetails(task_details)
  yamlinput = "./features/support/test_data/Alcon_Tasks.yml"
  myoptions = YAML.load_file(yamlinput)
  myoptions[task_details]
end

def getAccountsDetails(account_details)
  yamlinput = "./features/support/test_data/Alcon_Accounts.yml"
  myoptions = YAML.load_file(yamlinput)
  myoptions[account_details]
end


def getopportunitiesdetails(opportunity_details)
  yamlinput = "./config/Opportunity.yml"
  myoptions = YAML.load_file(yamlinput)
  myoptions[opportunity_details]
end

def getCaseDetails(yamlInfo)
  yamlinput = "./features/support/test_data/Alcon_Case.yml"
  myoptions = YAML.load_file(yamlinput)
  myoptions[yamlInfo]
end


def getContactDetails(contacts_details)
  yamlinput = "./features/support/test_data/Alcon_Contacts.yml"
  myoptions = YAML.load_file(yamlinput)
  myoptions[contacts_details]
end

def getGeneralDetails1(yamlInfo)
    yamlinput = "./features/support/test_data/Alcon_General.yml"
    myoptions = YAML.load_file(yamlinput)
    myoptions[yamlInfo]
end


def putstr(s)
   puts "<b><font color=red>#{s}</font></b>"
end

def getDetails(yamlInfo)
	YAML.load_file("./config/Details.yml")[yamlInfo]
end


def getGeneralDetails(yamlInfo)
  YAML.load_file("./config/General.yml")[yamlInfo]
end

def logIn_As_BA
  YAML.load_file("./config/Login.yml")["Admin"]
end

def getGeneralDetails(yamlInfo)
  YAML.load_file("./config/MacAfee_General.yml")[yamlInfo]
#  yamlinput = "./features/support/test_data/MacAfee_General.yml"
#  myoptions = YAML.load_file(yamlinput)
#  myoptions[yamlInfo]
end


