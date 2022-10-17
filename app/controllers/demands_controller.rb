class DemandsController < ApplicationController

    def index
        @demands = Demande.all
        
      end

    
    def new
        @demande = Demande.new
    end
    
    def create
        @demande = Demande.new(demande_params)
        
        if @demande.save
    
          render json: @demande, statut: :created, location: @demande

        else
          render json: @demande.errors, statut: :unprocessable_entity
        end
    end  
      def update
        @demande = Demande.find(params[:id])
        if @demande.update(demande_params)
        render json: @demande, statut: :updated
        else 
          render :edit
        end
      
      end
    
      def destroy
        @demande = demande.find(params[:id])
        @demande.destroy
        render json: @demande, statut: :destroyed

      end
    
      private
    
      def demande_params
        params.permit(:status, :start_date, :end_date, :refustype, :user_id, :motif_id)
      end
    

    
end
