require 'test_helper'

class BlastsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @blast = blasts(:one)
  end

  test "should get index" do
    get blasts_url
    assert_response :success
  end

  test "should get new" do
    get new_blast_url
    assert_response :success
  end

  test "should create blast" do
    assert_difference('Blast.count') do
      post blasts_url, params: { blast: { delivery_attempts: @blast.delivery_attempts, message_id: @blast.message_id, recipients: @blast.recipients, send_at: @blast.send_at } }
    end

    assert_redirected_to blast_url(Blast.last)
  end

  test "should show blast" do
    get blast_url(@blast)
    assert_response :success
  end

  test "should get edit" do
    get edit_blast_url(@blast)
    assert_response :success
  end

  test "should update blast" do
    patch blast_url(@blast), params: { blast: { delivery_attempts: @blast.delivery_attempts, message_id: @blast.message_id, recipients: @blast.recipients, send_at: @blast.send_at } }
    assert_redirected_to blast_url(@blast)
  end

  test "should destroy blast" do
    assert_difference('Blast.count', -1) do
      delete blast_url(@blast)
    end

    assert_redirected_to blasts_url
  end
end
