require 'rails_helper'

RSpec.describe Message, type: :model do
  describe '#create' do
    context 'can save' do
      it 'is valid with content' do
        expect(build(:task)).to be_valid
      end
    end

    context 'can not save' do
      it 'is invalid without content' do
        task = build(:task, content: nil)
        task.valid?
        expect(task.errors[:content]).to include("を入力してください")
      end

      it 'is invalid without group_id' do
        task = build(:task, group_id: nil)
        task.valid?
        expect(task.errors[:group]).to include("を入力してください")
      end

      it 'is invaid without user_id' do
        task = build(:task, user_id: nil)
        task.valid?
        expect(task.errors[:user]).to include("を入力してください")
      end
    end
  end
end