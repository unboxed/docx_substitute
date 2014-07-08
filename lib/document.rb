require 'zip/zip'
require 'tempfile'

class DocxSubstitute::Document
  DEFAULT_PATHS = [
    'word/header1.xml',
    'word/document.xml',
    'word/footer1.xml'
  ]

  def initialize(document_path, replacements, specific_paths = nil)
    @document_path = document_path
    @replacements = replacements
    @specific_paths = specific_paths
  end

  def paths
    @specific_paths || DEFAULT_PATHS
  end

  def output
    tempfile = Tempfile.new("docxtempfile")
    Zip::ZipOutputStream.open(tempfile.path) do |zos|
      Zip::ZipFile.new(@document_path).entries.each do |e|
        
        zos.put_next_entry(e.name)

        content = e.get_input_stream.read

        if paths.include?(e.name)
          zos.print DocxSubstitute::EntryDocument.new(content).replace_with(@replacements)
        else
          zos.print content
        end
      end
    end
    tempfile
  end
end