module SynapsePayRest
  class IcDepositUsNode < BaseNode
    class << self
      private
      def payload_for_create(nickname:, **options)
        args = {
          nickname: nickname
        }.merge(options)
        super(type: 'IC-DEPOSIT-US', **args)
      end
    end
  end
end