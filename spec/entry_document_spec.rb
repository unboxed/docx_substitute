require_relative 'spec_helper'

describe DocxSubstitute::EntryDocument, '#substitude' do

  it 'subs the variables' do
    xml = %{<blah>VAR1</blah><foo>VAR1</foo>}
    doc = DocxSubstitute::EntryDocument.new(xml)
    replacements = {
      /VAR1/i => "Henry"
    }

    doc.replace_with(replacements)

    assert_equal %{<blah>Henry</blah><foo>Henry</foo>}, doc.document
  end
end