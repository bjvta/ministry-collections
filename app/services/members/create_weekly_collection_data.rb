module Members
  class CreateWeeklyCollectionData
    attr_reader :weekly_collection, :member_list
    def initialize(weekly_collection, member_list)
      @weekly_collection = weekly_collection
      @member_list = member_list
    end

    def call
      member_list.each do |member|
        MemberWeeklyCollection.new(member: member, weekly_collection: weekly_collection, amount: weekly_collection.amount).save
      end
    end
  end
end