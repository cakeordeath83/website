module EntriesHelper
  def group
    @all_entries.group_by { |entry| entry.title.first.upcase }
  end
end
