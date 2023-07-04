class Api::V1::SleepRecordsController < ApplicationController 
  def clock_times
    user_id = params[:id] || current_user.id
    sleep_records = SleepRecord.includes(:user).where(user_id: user_id).order(created_at: :asc)

    clock_times = sleep_records.map do |record|
      "Record from user #{record.user.name}: clock-in: #{record.clock_in_time}, clock-out: #{record.clock_out_time}"
    end

    render json: { sleep_records: clock_times }
  end
end


