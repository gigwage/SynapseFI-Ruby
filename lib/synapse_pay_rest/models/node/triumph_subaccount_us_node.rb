module SynapsePayRest
  # Represents a Synapse node allowing any user to hold funds. You can use this
  # node as a wallet, an escrow account or something else along those lines.
  class TriumphSubaccountUsNode < BaseNode
    class << self
      private

      def payload_for_create(nickname:, **options)
        args = {
          type: 'TRIUMPH-SUBACCOUNT-US',
          nickname: nickname
        }.merge(options)
        super(args)
      end
    end
  end
end
