module SynapsePayRest
    class IcDepositUsNode < BaseNode
      class << self
    
        private
        def payload_for_create(nickname:, **options)
          args = {
            nickname: nickname,
            type: 'IC-DEPOSIT-US'
          }.merge(options)
          super(args)
        end
      end 
    end
end