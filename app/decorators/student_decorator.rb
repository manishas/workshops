class StudentDecorator < BaseDecorator
  def full_name
    "#{first_name} #{last_name}"
  end

  def avg_notes(subject_item)
    arr = SubjectItemNote.where(:student_id => self.id, :subject_item_id => subject_item.id).to_a
    return '0.00' if arr.empty?
    avg = arr.inject { |sum,note| sum.value + note.value }.to_f / arr.size
    "%.2f" % avg
  end
end
