class SleepRecordsController < ApplicationController

  def clock_in_times
    clock_in_records = SleepRecord.order(created_at: :asc).pluck(:clock_in_time)
    render json: { clock_in_times: clock_in_records }
  end
end
