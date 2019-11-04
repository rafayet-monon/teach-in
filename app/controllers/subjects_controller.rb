class SubjectsController < ApplicationController

  private

    def subject_params
      params.require(:subject).permit(:name, :tution_class_id)
    end

end
