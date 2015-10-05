# app/workers/count_up_worker.rb
class CountUpWorker
	include Sidekiq::Worker

	DURATION = 30

	def perform(start_mum)
		logger = Logger.new(Rails.root.join("log/count_up.log"))

		DURATION.times do
			logger.info(start_mum)
			start_mum += 1
			sleep 1
		end

		logger.close
		

	end
end

