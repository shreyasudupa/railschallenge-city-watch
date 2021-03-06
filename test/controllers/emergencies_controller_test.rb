require "test_helper"

class EmergenciesControllerTest < ActionController::TestCase

  def emergency
    @emergency ||= emergencies :one
  end

  def test_index
    get :index
    assert_response :success
    assert_not_nil assigns(:emergencies)
  end

  def test_new
    get :new
    assert_response :success
  end

  def test_create
    assert_difference('Emergency.count') do
      post :create, emergency: { code: emergency.code, fire_severity: emergency.fire_severity, medical_severity: emergency.medical_severity, police_severity: emergency.police_severity }
    end

    assert_redirected_to emergency_path(assigns(:emergency))
  end

  def test_show
    get :show, id: emergency
    assert_response :success
  end

  def test_edit
    get :edit, id: emergency
    assert_response :success
  end

  def test_update
    put :update, id: emergency, emergency: { code: emergency.code, fire_severity: emergency.fire_severity, medical_severity: emergency.medical_severity, police_severity: emergency.police_severity }
    assert_redirected_to emergency_path(assigns(:emergency))
  end

  def test_destroy
    assert_difference('Emergency.count', -1) do
      delete :destroy, id: emergency
    end

    assert_redirected_to emergencies_path
  end
end
