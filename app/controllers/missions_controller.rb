class MissionsController < ApplicationController
  def index
    @mission_service = MissionService.new(current_user)
    @missions = @mission_service.today_missions
  end

  def claim
    user_mission = current_user.user_daily_missions.find(params[:id])

    if MissionService.new(current_user).claim_mission!(user_mission)
      redirect_to missions_path, notice: "Recompensa coletada!"
    else
      redirect_to missions_path, alert: "Não foi possível coletar a recompensa."
    end
  end
end
