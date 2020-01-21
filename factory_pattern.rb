require 'json'

# Les classes a créer ont la meme methode format
class CsvFormatter
  def format(data)
    return "" if data.empty?

    result = data.keys.join(',') + "\n"
    result += data.values.join(',') + "\n"
  end
end

class JsonFormatter
  def format(data)
    return "" if data.empty?

    data.to_json
  end
end

# Factory
class Formatter
  def self.for(type)
    case type
    when 'csv'  then CsvFormatter.new
    when 'json' then JsonFormatter.new
    else raise 'Unsupported data type'
    end
  end
end

# Client
class ReportGenerator
  def self.generate(data, type)
    return "" if (data.empty?)

    Formatter.for(type).format(data)
  end
end

report_data = { foo_key: 'foo', bar_key: 'bar', baz_key: 'baz' }

value1 = ReportGenerator.generate(report_data, 'json')
value2 = ReportGenerator.generate(report_data, 'csv')

puts value1
puts value2
