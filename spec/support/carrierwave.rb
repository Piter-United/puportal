require 'carrierwave/test/matchers'

module CarrierwaveExamples
	def self.included(suite)
		suite.send :include, CarrierWave::Test::Matchers

		suite.around :each do |example|
			if example.metadata[:processing] == false
				example.metadata[:described_class].enable_processing = true
		    example.run
		    example.metadata[:described_class].enable_processing = false
		  else
		  	example.run
		  end
	  end
	end
end

RSpec.configure do |config|
	config.include CarrierwaveExamples, type: :uploader
end
