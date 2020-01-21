# Invoker
class Switch
	attr_reader :history

	def execute(cmd)
		@history ||= []
		@history << cmd.execute
	end
end

# Command interface
class Command
	attr_reader :obj

	def initialize(obj)
		@obj = obj
	end

	def execute
		raise NotImplementedError
	end
end

# Command for turning ON
class TurnOnCommand < Command
	def execute
		obj.turn_on
	end
end

# Command for turning OFF
class TurnOffCommand < Command
	def execute
		obj.turn_off
	end
end

# Receiver
class Light
	def turn_on
		'The light is on'
	end

	def turn_off
		'The light is off'
	end
end

# Client
class LightSwitchClient
	attr_reader :switch

	def initialize
		@lamp 	= Light.new
		@switch = Switch.new
	end

	def switch_for(cmd)
		case cmd
		when 'on' 	then @switch.execute(TurnOnCommand.new(@lamp))
		when 'off' 	then @switch.execute(TurnOffCommand.new(@lamp))
		else 'Sorry, I so sorry'
		end
	end
end

client = LightSwitchClient.new
client.switch_for('on')
client.switch_for('off')
puts client.switch.history