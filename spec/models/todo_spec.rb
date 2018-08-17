require 'rails_helper'

describe Todo, type: :model do
  describe '#completed?' do
    it 'returns true if completed is set'  do
      todo = Todo.new(completed_at: Time.current)

      expect(todo).to be_completed
    end

    it 'returns false if completed is nil' do
      todo = Todo.new

      expect(todo).not_to be_completed
    end
  end
end