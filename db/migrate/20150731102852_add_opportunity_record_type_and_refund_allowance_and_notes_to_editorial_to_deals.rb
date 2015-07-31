class AddOpportunityRecordTypeAndRefundAllowanceAndNotesToEditorialToDeals < ActiveRecord::Migration
  def change
    add_column :deals, :opportunity_record_type, :string
    add_column :deals, :refund_allowance, :float
    add_column :deals, :notes_to_editorial, :text
  end
end
