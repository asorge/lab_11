 module Contexts
    def create_towns
      # setting a sleep 1 to keep tests from hitting Google too fast and getting a penalty...
      @pgh = FactoryGirl.create(:town)
      sleep 1
      @stl = FactoryGirl.create(:town, name: 'St. Louis', state: 'MO')
      sleep 1
    end

    def destroy_towns
      @pgh.destroy
      @stl.destroy
    end

    def create_attractions
      @cmu = FactoryGirl.create(:attraction, town: @pgh)
      sleep 1
      @park = FactoryGirl.create(:attraction, name: 'PNC Park', street: '115 Federal Street', town: @pgh)
      sleep 1
    end

    def destroy_attractions
      @cmu.destroy
      @park.destroy
    end
  end
