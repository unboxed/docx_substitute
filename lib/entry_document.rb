class DocxSubstitute::EntryDocument

  attr :document

  def initialize(document)
    @document = document
  end

  def replace_with(replacements)
    replacements.each do |pattern, value|
      @document.gsub!(pattern, value)
    end
    @document
  end
  
end