class SchoolsController < ApplicationController

  private

    def school_params
      params.require(:school).permit(:name, :address)
    end

end
