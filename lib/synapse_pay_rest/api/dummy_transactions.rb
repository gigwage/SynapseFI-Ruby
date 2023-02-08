module SynapsePayRest
  class DummyTransactions < Transactions

    def create(user_id:, node_id:, payload:, idempotency_key: nil)
      path = create_transaction_path(user_id: user_id, node_id: node_id)
      client.get("#{path}?#{payload.to_query}")
    end

    private

    def create_transaction_path(user_id:, node_id:, trans_id: nil)
      path = "/users/#{user_id}/nodes/#{node_id}/dummy-tran"
      path += "/#{trans_id}" if trans_id
      path
    end
  end
end
