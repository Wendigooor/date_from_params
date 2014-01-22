require 'spec_helper'

describe DateFromParams do
  describe '#date_from_date_select' do
    context 'with valid params' do
      subject(:params) do
        HashWithIndifferentAccess.new({
          "finished_at(1i)"=>"2010",
          "finished_at(2i)"=>"2",
          "finished_at(3i)"=>"3"
        })
      end

      it do
        DateFromParams.date_from_date_select(:finished_at, params).should eq Date.civil(2010, 2, 3)
      end
    end

    context 'with unvalid params' do
      subject(:params) do
        HashWithIndifferentAccess.new({
          "finished_at(1i)"=>"",
          "finished_at(2i)"=>"2",
          "finished_at(3i)"=>"3"
        })
      end

      it do
        DateFromParams.date_from_date_select(:finished_at, params).should be_nil
      end
    end
  end


  describe '#datetime_from_datetime_select' do
    context 'with valid params' do
      subject(:params) do
        HashWithIndifferentAccess.new({
          "finished_at(1i)"=>"2010",
          "finished_at(2i)"=>"2",
          "finished_at(3i)"=>"3",
          "finished_at(4i)"=>"12",
          "finished_at(5i)"=>"10"
        })
      end

      it do
        DateFromParams.datetime_from_datetime_select(:finished_at, params).should eq DateTime.civil(2010, 2, 3, 12, 10)
      end
    end

    context 'with unvalid params' do
      subject(:params) do
        HashWithIndifferentAccess.new({
          "finished_at(1i)"=>"2010",
          "finished_at(2i)"=>"2",
          "finished_at(3i)"=>"3",
          "finished_at(4i)"=>"12",
          "finished_at(5i)"=>""
        })
      end

      it do
        DateFromParams.datetime_from_datetime_select(:finished_at, params).should be_nil
      end
    end
  end

  describe '#date_from_select_date' do
    context 'with valid params' do
      subject(:params) do
        HashWithIndifferentAccess.new({
          "finished_at"=>
            {
              "year"=>"2010",
              "month"=>"1",
              "day"=>"2"
            }
        })
      end

      it do
        DateFromParams.date_from_select_date(:finished_at, params).should eq Date.civil(2010, 1, 2)
      end
    end

    context 'with unvalid params' do
      subject(:params) do
        HashWithIndifferentAccess.new({
          "finished_at"=>
            {
              "year"=>"",
              "month"=>"1",
              "day"=>"2"
            }
        })
      end

      it do
        DateFromParams.date_from_select_date(:finished_at, params).should be_nil
      end
    end
  end

  describe '#datetime_from_select_datetime' do
    context 'with valid params' do
      subject(:params) do
        HashWithIndifferentAccess.new({
          "finished_at"=>
            {
              "year"=>"2010",
              "month"=>"1",
              "day"=>"2",
              "hour"=>"12",
              "minute"=>"10"
            }
        })
      end

      it do
        DateFromParams.datetime_from_select_datetime(:finished_at, params).should eq DateTime.civil(2010, 1, 2, 12, 10)
      end
    end

    context 'with unvalid params' do
      subject(:params) do
        HashWithIndifferentAccess.new({
          "finished_at"=>
            {
              "year"=>"",
              "month"=>"1",
              "day"=>"2",
              "hour"=>"12",
              "minute"=>"10"
            }
        })
      end

      it do
        DateFromParams.datetime_from_select_datetime(:finished_at, params).should be_nil
      end
    end
  end
end
