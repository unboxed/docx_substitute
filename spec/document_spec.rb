require_relative 'spec_helper'

describe DocxSubstitute::Document, '#paths' do
  it 'uses default paths if none given' do
    doc = DocxSubstitute::Document.new "", {}

    assert_equal DocxSubstitute::Document::DEFAULT_PATHS, doc.paths
  end
end

describe DocxSubstitute::Document, '#output' do
  it 'returns a tempfile' do
    puts "I NEED A DOCX FIXTURE!!!"
    puts "If you give me one I will pass."

    # doc = DocxSubstitute::Document.new File.expand_path(File.join(File.dirname(__FILE__), 'fixtures', 'template.docx'))

    # assert_equal Tempfile, doc.output.class
  end
end