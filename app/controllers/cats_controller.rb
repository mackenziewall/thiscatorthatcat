class CatsController < ApplicationController
  # GET /cats
  # GET /cats.json
  def index

    @cat1, @cat2 = Cat.two_random_cats
    p @cat1
    p @cat2
    p @cat2
    @top_cat = Cat.top_cat
    @ugliest_cat = Cat.ugliest_cat
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @cats }
    end
  end
  # GET /cats/1
  # GET /cats/1.json
def yes_vote
    @cat1 = Cat.find(params[:cat1_id])
    @cat2 = Cat.find(params[:cat2_id])
    @cat1.totalvotes += 1    
    @cat1.yesvotes += 1
    @cat1.save
    @cat2.totalvotes += 1    
    @cat2.save
    redirect_to root_path
  end

  def show
    @cat = Cat.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @cat }
    end
  end

  # GET /cats/new
  # GET /cats/new.json
  def new
    @cat = Cat.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @cat }
    end
  end

  # GET /cats/1/edit
  def edit
    @cat = Cat.find(params[:id])
  end

  # POST /cats
  # POST /cats.json
  def create
    @cat = Cat.new(params[:cat])
    puts "*"*80
p @cat
    respond_to do |format|
      if @cat.save
        format.html { redirect_to @cat, notice: 'Cat was successfully created.' }
        format.json { render json: @cat, status: :created, location: @cat }
      else
        format.html { render action: "new" }
        format.json { render json: @cat.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /cats/1
  # PUT /cats/1.json
  def update
    @cat = Cat.find(params[:id])

    puts "*"*80
    p params[:cat]

    respond_to do |format|
      if @cat.update_attributes(params[:cat])
        format.html { redirect_to @cat, notice: 'Cat was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @cat.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cats/1
  # DELETE /cats/1.json
  def destroy
    @cat = Cat.find(params[:id])
    @cat.destroy

    respond_to do |format|
      format.html { redirect_to cats_url }
      format.json { head :no_content }
    end
  end
end
