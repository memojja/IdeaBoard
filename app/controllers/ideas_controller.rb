class IdeasController < ApplicationController

before_action :set_idea, only: [:destroy,:show,:edit,:update]

	def new
		@idea=Idea.new
	end

	def index
		@ideas = Idea.all
	end
	
	def show

	end

	def create
 		@idea=Idea.new(strong_params)
		 if @idea.save
			 flash[:warning]="bu islemi yapmauya yetkınız yok"
			 redirect_to idea_path(@idea) , notice: "kayit basari ile olusturuldu"
		 else
				 render :new #new.html.erb calisir.
		 end
	end

	def edit

	end

	def update

		if @idea.update(strong_params)
			redirect_to idea_path(@idea)
		else
			render :edit
		end

	end

	def destroy
		@idea.destroy
		redirect_to ideas_path
	end


	private

	def set_idea
		@idea=Idea.find(params[:id])

	end

	def strong_params
		params.require(:idea).permit(:title,:description,:planned_to)
	end

end
