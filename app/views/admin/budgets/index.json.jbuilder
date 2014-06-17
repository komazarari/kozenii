json.array!(@budgets) do |admin_budget|
  json.extract! admin_budget, :id, :title, :amount, :group_id
  json.url admin_budget_url(admin_budget, format: :json)
end
