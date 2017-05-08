
CAPABILITIES = YAML.load_file("#{Rails.root}/app/assets/constants/capabilities.yaml")
CAPABILITIES_FORMATTED = YAML.load_file("#{Rails.root}/app/assets/constants/formatted_capabilities.yaml")

def FORMATED_CAPABILITIES(key)
	key.nil? ? "" : CAPABILITIES_FORMATTED[key].html_safe
end
