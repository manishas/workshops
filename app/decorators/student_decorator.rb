class StudentDecorator < BaseDecorator
  def full_name
    "#{first_name} #{last_name}"
  end

  def avg_notes(subject_item)
    arr = SubjectItemNote.where(:student_id => self.id, :subject_item_id => subject_item.id)
    return '0.00' if arr.empty?
    arr = arr.collect { |n| n.value }
    avg = arr.inject(:+).to_f / arr.size
    "%.2f" % avg
  end
end
