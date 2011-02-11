module Puffer
  class Base < ApplicationController
    unloadable

    pufferize!
    view_paths_fallbacks :puffer
    define_fields :index, :show, :form, :create, :update

    respond_to :html, :js

    def index
      @records = resource.collection
    end

    def show
      @record = resource.member
    end

    def new
      @record = resource.new_member
    end

    def edit
      @record = resource.member
    end

    def create
      @record = resource.new_member
      @record.save
      respond_with @record, :location => resource.collection_path
    end

    def update
      @record = resource.member
      @record.update_attributes resource.attributes
      respond_with @record, :location => resource.collection_path
    end

    def destroy
      @record = resource.member
      @record.destroy
      redirect_to (request.referrer || resource.collection_path)
    end

  end
end
