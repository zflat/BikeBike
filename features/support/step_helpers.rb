def locate(id)
	page.find('[id$="' + id.gsub(/\s+/, '_') + '"]')[:id]
end


def get_language_code(language)
	languages = {
		'english' => 'en',
		'french' => 'fr',
		'spanish' => 'es',
		'german' => 'de'
	}
	languages[language.downcase]
end
