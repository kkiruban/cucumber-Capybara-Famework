#def getDataFrom_FieldPermission_YmlFile(yamlInfo)
#  yamlinput = "./config/FieldPermission.yml"
#  myoptions = YAML.load_file(yamlinput)
#  myoptions[yamlInfo]
#end
#
#def getDataFrom_FieldSection_YmlFile(yamlInfo)
#  yamlinput = "./config/FieldSection.yml"
#  myoptions = YAML.load_file(yamlinput)
#  myoptions[yamlInfo]
#end
#
#def getDataFrom_DataCreation_YmlFile(yamlInfo)
#  yamlinput = "./config/DataCreation.yml"
#  myoptions = YAML.load_file(yamlinput)
#  myoptions[yamlInfo]
#end
#
#def getDataFrom_Field_Appearance_YmlFile(yamlInfo)
#  yamlinput = "./config/Field_Appearance.yml"
#  myoptions = YAML.load_file(yamlinput)
#  myoptions[yamlInfo]
#end
#
#def getDataFrom_Field_Type_YmlFile(yamlInfo)
#  yamlinput = "./config/Field_Type.yml"
#  myoptions = YAML.load_file(yamlinput)
#  myoptions[yamlInfo]
#end
#
#def getDataFrom_Field_Appearing_Above_Or_Below_YmlFile(yamlInfo)
#  yamlinput = "./config/Field_Appearing_Above_Or_Below.yml"
#  myoptions = YAML.load_file(yamlinput)
#  myoptions[yamlInfo]
#end
#
#
#def get_PickList_Options(yamlInfo)
#	yamlinput = "./config/PickList_Options.yml"
#	myoptions = YAML.load_file(yamlinput)
#	myoptions[yamlInfo]
#end

#YAML.load_file("./config/Details.yml")[yamlInfo]
def getDataFrom_FieldPermission_YmlFile(yamlInfo)
  YAML.load_file("./config/FieldPermission.yml")[yamlInfo]
end

def getDataFrom_FieldSection_YmlFile(yamlInfo)
  YAML.load_file("./config/FieldSection.yml")[yamlInfo]  
end

def getDataFrom_DataCreation_YmlFile(yamlInfo)
  YAML.load_file("./config/DataCreation.yml")[yamlInfo]
end

def getDataFrom_Field_Appearance_YmlFile(yamlInfo)
  YAML.load_file("./config/Field_Appearance.yml")[yamlInfo]  
end

def getDataFrom_Field_Type_YmlFile(yamlInfo)
  YAML.load_file("./config/Field_Type.yml")[yamlInfo]  
end

def getDataFrom_Field_Appearing_Above_Or_Below_YmlFile(yamlInfo)
  YAML.load_file("./config/Field_Appearing_Above_Or_Below.yml")[yamlInfo]  
end


def get_PickList_Options(yamlInfo)
  YAML.load_file("./config/PickList_Options.yml")[yamlInfo]
end
