class CollegesController < ApplicationController

  private

    def college_params
      params.require(:college).permit(:name, :address)
    end

end
