require 'json'

class User
  attr_reader :email

  def initialiaze(email)
    @email = email
  end

  def send_notification
    UserMailer.send_email(email)
  end
end

class DataSource
  def data
    [
      { user: 'Jack Johson', email: 'jack@johson.com' },
      { user: 'Johson Jack', email: 'johson@jack.com' }
    ]
  end
end

class CsvDataFormatter
  def format(data)
    return "" if data.empty?

    csv = data.first.keys.join(',') + "\n"
    data.each { |hsh| csv += hsh.values.join(',') + "\n" }

    csv
  end
end

class JsonDataFormatter
  def format(data)
    return "" if data.empty?

    csv = data.to_json
  end
end

class ReportGenerator
  attr_reader :data_source, :formatter

  def initialize(formatter = CsvDataFormatter.new, data_source = DataSource.new)
    @formatter   = formatter
    @data_source = data_source
  end

  def generate
    formatter.format(data_source.data)
  end
end

report_generator = ReportGenerator.new
puts report_generator.generate
