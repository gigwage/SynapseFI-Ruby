module SynapsePayRest
    class DummyTransaction < Transaction
      attr_reader :dummy_transactions
  
      class << self
        def create(node:, to_type:, to_id:, amount:, currency:, ip:, **options)
          raise ArgumentError, 'cannot create a transaction with an UnverifiedNode' if node.is_a?(UnverifiedNode)
          raise ArgumentError, 'node must be a type of BaseNode object' unless node.is_a?(BaseNode)
          raise ArgumentError, 'amount must be a Numeric (Integer or Float)' unless amount.is_a?(Numeric)
          [to_type, to_id, currency, ip].each do |arg|
            if options[arg] && !options[arg].is_a?(String)
              raise ArgumentError, "#{arg} must be a String"
            end
          end
  
          payload = payload_for_create(node: node, to_type: to_type, to_id: to_id,
            amount: amount, currency: currency, ip: ip, **options)
          response = node.user.client.dummy_transactions.create(
            user_id: node.user.id,
            node_id: node.id,
            payload: payload,
            idempotency_key: options[:idempotency_key],
          )
          from_response(node, response)
        end
      end
    end
  end
  