class CodeCommentPercent
  def self.count_lines(ext)

    o = 0 # Number of files
    n = 0 # Number of lines of code
    m = 0 # Number of lines of comments

    print './app/**/*.' + ext
    files = Dir.glob('./app/**/*.' + ext)

    files.each do |f|
      next if f.index('vendor')
      next if FileTest.directory?(f)
      o += 1
      i = 0
      File.new(f).each_line do |line|
        if line.strip[0] == '#'
          m += 1
          next
        end
        i += 1
      end
      n += i
    end

    code_ratio_percent = ((m.to_f/n.to_f)*100).round(2)
    puts "\n#{o.to_s} files."
    puts "#{n.to_s} lines of code."
    puts "#{(n.to_f/o.to_f).round(2)} LOC/file."
    puts "#{m.to_s} lines of comments."
    puts "#{code_ratio_percent.to_s} percent of code coverage"
  end
end