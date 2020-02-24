module EasyFilter
  class FiltersController < ActionController::Base
    layout 'application'
    before_action :set_filters, only: %i[index]
    before_action :set_filter, only: %i[show destroy]

    def index
      @filter = Filter.new
    end

    def create
      @filter = Filter.new(filter_params)

      if @filter.save
        flash[:notice] = 'Filter saved'
      else
        flash[:notice] = @filter.errors.full_messages.join(', ')
      end

      redirect_to '/easy_filters/filters'
    end

    def show
      @filter_type = if @filter.sql_query.present?
                       'sql'
                     elsif @filter.products.present?
                       'products'
                     elsif @filter.events.present?
                       'events'
                     end

      if @filter_type == 'sql'
        @results = ActiveRecord::Base.connection.execute(@filter.sql_query)
      elsif @filter_type == 'products'
      elsif @filter_type == 'events'
      end

    end

    def destroy
      return unless @filter.destroy
      flash[:notice] = 'Filter was deleted'
      redirect_to '/easy_filters/filters'
    end

    private

    def filter_params
      params.require(:filter).permit(:products, :events, :sql_query)
    end

    def set_filters
      @filters = Filter.all
    end

    def set_filter
      @filter = Filter.find(params[:id])
    end
  end
end
