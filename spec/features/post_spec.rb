require 'rails_helper'

RSpec.feature 'post feature', type: :feature do

  scenario 'create new post' do
    visit '/posts'
    on_page_with :post_list, :top_ten_posts do |page|
        expect(page.posts_in_list.length).to eq(0)
        expect(page.posts_in_top_ten_list.length).to eq(0)
        page.new_post_link.click
        page.perform :fill_post, 'my first post', 'I wanna be the full-stack dev'
        page.create_post_button.click
        expect(page.notice_message).to eq('Post was successfully created.')

        page.back_link.click
        expect(page.posts_in_list.length).to eq(1)
        expect(page.posts_in_list[0].find('.title').text).to eq('my first post')
        expect(page.posts_in_list[0].find('.content').text).to eq('I wanna be the full-stack dev')

        expect(page.posts_in_top_ten_list.length).to eq(1)
        expect(page.posts_in_top_ten_list[0].text).to have_content('my first post')
        expect(page.posts_in_top_ten_list[0].text).to eq('my first post')
    end
  end
end
