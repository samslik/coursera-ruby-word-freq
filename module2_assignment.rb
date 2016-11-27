#Implement all parts of this assignment within (this) module2_assignment2.rb file

#Implement a class called LineAnalyzer.
class LineAnalyzer
  attr_reader :highest_wf_count, :highest_wf_words, :content, :line_number
  #Implement the following read-only attributes in the LineAnalyzer class. 
  #* highest_wf_count - a number with maximum number of occurrences for a single word (calculated)
  #* highest_wf_words - an array of words with the maximum number of occurrences (calculated)
  #* content          - the string analyzed (provided)
  #* line_number      - the line number analyzed (provided)
      def initialize(content, line_number)
        @content = content
        @line_number = line_number
        self.calculate_word_frequency
      end

      def calculate_word_frequency
        word_count = Hash.new(0)
        @content.split.each do |word|
          cunt = word_count[word.downcase]
          word_count[word.downcase] = cunt + 1
        end
       word_count.each do |word,freq|
         @highest_wf_count ||= 0
         if freq > @highest_wf_count
           @highest_wf_count = freq
           @highest_wf_words = [word]
         elsif freq == @highest_wf_count
           @highest_wf_words << word
         end
       end
      end
end

anal = LineAnalyzer.new('Ala ma kota ma ala, kota Kota kOta ', 0)
puts "#{anal.highest_wf_words.to_s}:#{anal.highest_wf_count}"

  #Add the following methods in the LineAnalyzer class.
  #* initialize() - taking a line of text (content) and a line number
  #* calculate_word_frequency() - calculates result

  #Implement the initialize() method to:
  #* take in a line of text and line number
  #* initialize the content and line_number attributes
  #* call the calculate_word_frequency() method.

  #Implement the calculate_word_frequency() method to:
  #* calculate the maximum number of times a single word appears within
  #  provided content and store that in the highest_wf_count attribute.
  #* identify the words that were used the maximum number of times and
  #  store that in the highest_wf_words attribute.

#  Implement a class called Solution. 
class Solution
  attr_reader :analyzers, :highest_count_across_lines, :highest_count_words_across_lines

  def analyze_file(text)
    @analyzers =[]
    File.open("test.txt", "r") do |text|
      i = 0
      text.each_line do |line|
        anal = LineAnalyzer.new(line, i)
        @analyzers << anal
        i += 1
      end
    end
  end
  analyze_file("test.txt")

  def calculate_line_with_highest_frequency()
      @analyzers
  end

  def print_highest_word_frequency_across_lines()
    puts @highest_count_words_across_lines
  end
  # Implement the following read-only attributes in the Solution class.
  #* analyzers - an array of LineAnalyzer objects for each line in the file
  #* highest_count_across_lines - a number with the maximum value for highest_wf_words attribute in the analyzers array.
  #* highest_count_words_across_lines - a filtered array of LineAnalyzer objects with the highest_wf_words attribute 
  #  equal to the highest_count_across_lines determined previously.

  # Implement the following methods in the Solution class.
  #* analyze_file() - processes 'test.txt' intro an array of LineAnalyzers and stores them in analyzers.
  #* calculate_line_with_highest_frequency() - determines the highest_count_across_lines and 
  #  highest_count_words_across_lines attribute values
  #* print_highest_word_frequency_across_lines() - prints the values of LineAnalyzer objects in 
  #  highest_count_words_across_lines in the specified format

  # Implement the analyze_file() method() to:
  #* Read the 'test.txt' file in lines 
  #* Create an array of LineAnalyzers for each line in the file

  # Implement the calculate_line_with_highest_frequency() method to:
  #* calculate the maximum value for highest_wf_count contained by the LineAnalyzer objects in analyzers array
  #  and stores this result in the highest_count_across_lines attribute.
  #* identifies the LineAnalyzer objects in the analyzers array that have highest_wf_count equal to highest_count_across_lines 
  #  attribute value determined previously and stores them in highest_count_words_across_lines.

  #Implement the print_highest_word_frequency_across_lines() method to
  #* print the values of objects in highest_count_words_across_lines in the specified format
end
