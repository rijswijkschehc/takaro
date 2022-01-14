# frozen_string_literal: true

class AdminController < PrivateController
  extend Memoist

  prepend_before_action :set_record_variable, only: %i[new create show update destroy]
  before_action { add_breadcrumb(_('Admin')) }

  def index; end

  def new; end

  def create
    if record.save
      flash[:info] = format(_('%<model_name>s created successfully'), model_name: model_name)
      redirect_to(action: :index)
    else
      render :new
    end
  end

  def show; end

  def update
    if record.update(safe_params)
      redirect_to(action: :index)
    else
      render :show
    end
  end

  def destroy
    record.destroy

    redirect_to(action: :index)
  end

  private

  def set_record_variable
    return if model.blank?

    instance_variable_set("@#{model.model_name.element}", record)
  end

  def model
    raise NotImplementedError
  end

  def record
    case action_name
    when 'new' then model.new
    when 'create' then model.new(safe_params)
    else
      model.find(params[:id]) if params[:id]
    end
  end
  memoize :record

  def model_name
    I18n.t("activerecord.models.#{record.model_name.i18n_key}", count: 1).upcase_first
  end

  def authorize_user
    authorize((record || model), policy_class: "Admin::#{model}Policy".constantize)
  end
end
