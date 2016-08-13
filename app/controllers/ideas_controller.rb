class IdeasController < ApplicationController

	before_action :set_idea, only: [:destroy,:show,:edit,:update]

	def new
		@idea=Idea.new
		load_categories
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
			 load_categories
			 render :new #new.html.erb calisir.
		 end
	end

	def edit
		load_categories
	end

	def update

		if @idea.update(strong_params)
			redirect_to idea_path(@idea)
		else
			load_categories
			render :edit
		end

	end


	def destroy
		@idea.destroy
		redirect_to ideas_path
	end


	private

	def load_categories
		@categories= Category.all.collect { |c| [c.title, c.id] }
	end

	def set_idea
		@idea=Idea.find(params[:id])

	end

	def strong_params
		params.require(:idea).permit(:title,:description,:planned_to,:category_id)
	end

end
