class MotifsController < ApplicationController
    def create
        @motif = Motif.create!(
          reason: params['motif']['reason'])
            if @motif.save
    
              render json: @motif, statut: :created, location: @motif
    
            else
              render json: @motif.errors, statut: :unprocessable_entity
            end
     end


end
