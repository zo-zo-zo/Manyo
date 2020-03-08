require 'rails_helper'
RSpec.describe 'タスク管理機能', type: :system do
  before do
    @task = FactoryBot.create(:task)
  end

  describe 'タスク一覧画面' do
    context 'タスクを作成した場合' do
      it '作成済みのタスクが表示されること' do
        task = FactoryBot.create(:task, title: 'テスト',content:'焼肉')
        visit tasks_path
        expect(page).to have_content 'テスト','焼肉'
      end
    end
  end
  describe 'タスク登録画面' do
    context '必要項目を入力して、createボタンを押した場合' do
      it 'データが保存されること'do
        visit new_task_path
        fill_in 'task_title', with:'練習'
        click_on('Create Task')
        expect(page).to have_content '練習'
        click_on('登録する')
        # save_and_open_page
      end
    end
  end
  describe 'タスク詳細画面' do
    context '任意のタスク詳細画面に遷移した場合' do
      it '該当タスクの内容が表示されたページに遷移すること'do
        visit task_path(@task)
        # save_and_open_page
          # click_on('/tasks/21')
          # @tasks = Task.all
          # @tasks.each do |task|        
        find_link('詳細',href:'/tasks#{@task.id}').click
        expect(page).to　have_content @task.title
        expect(page).to　have_content @task.content
        end
      end
    end
  end
