class TutionClassesController < ApplicationController

  private

    def tution_class_params
      params.require(:tution_class).permit(:name, :level)
    end

end
