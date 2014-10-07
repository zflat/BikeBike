Then(/^the page has resources content$/) do

  # check the header
  expect(page).to have_text("Bike!Bike! #{I18n.t('page.Resources')}")
  
  # check the links
  within('ul') do
    expect(page).to have_link 'Think tank sign up'
    expect(page).to have_link 'Bike Collective Wiki'
  end

  # check the text
  expect(page).to have_text I18n.t("resources.summary")
end
