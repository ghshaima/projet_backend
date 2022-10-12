class DemandsController < ApplicationController

    def index
        @demands = Demande.all
      end

    
    def new
        @demande = Demande.new
    end
    
    def create
        @demande = Demande.new(demande_params)
        @demande.save
    end
    
      def edit
        @demande = Demande.find(params[:id])
      end
    
      def update
        @demande = Demande.find(params[:id])
    
        @demande.update(demande_params)
      end
    
      def destroy
        @demande = demande.find(params[:id])
        @demande.destroy
      end
    
      private
    
      def demande_params
        params.permit(:status, :start_date, :end_date, :refustype, :user_id, :motif_id)
      end
    

    
end
