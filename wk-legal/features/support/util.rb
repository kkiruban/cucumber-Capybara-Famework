require 'rubygems'
require 'rspec/expectations'
require 'Capybara'



def getCredentialInfo
  yamlinput = "./features/support/test_data/Login.yml"
  myoptions = YAML.load_file(yamlinput)
  myoptions[ENV['UserRole']]
end

def getCredentialInfo1
  yamlinput = "./features/support/test_data/Login.yml"
  myoptions = YAML.load_file(yamlinput)
  myoptions[ENV['UserRole']]
end

def updateYML_dat(blockNmae,fieldName,newData)
  yamlinput = "./features/support/test_data/DataFile.yml"
	config = YAML.load_file(yamlinput)
	puts config[fieldName] #in my file this is set to "some data"
	config[blockNmae][fieldName] = newData
	File.open(yamlinput,'w') do |h|
		h.write config.to_yaml
	end
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


def getOpportunitiesDetails(opportunity_details)
  yamlinput = "./features/support/test_data/Alcon_Opportunity.yml"
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
	yamlinput = "./features/support/test_data/Details.yml"
	myoptions = YAML.load_file(yamlinput)
	myoptions[yamlInfo]
end


def getGeneralDetails(yamlInfo)
  yamlinput = "./features/support/test_data/General.yml"
  myoptions = YAML.load_file(yamlinput)
  myoptions[yamlInfo]
end
