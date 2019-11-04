class TutionshipsController < InheritedResources::Base

  private

    def tutionship_params
      params.require(:tutionship).permit(:user_id, :tution_class_id)
    end

end
