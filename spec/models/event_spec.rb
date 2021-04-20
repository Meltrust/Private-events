RSpec.describe Event, type: :model do
  let(:name) { 'simple name' }
  user = User.create(name: 'user3')
  describe 'An event can be created by a user and if it has all the validations' do
    it 'belongs to a user' do
      event = Event.create(user_id: user.id, name: 'event name', date: Date.today, location: 'some location', description: 'description of the event')
      expect(event.user_id).to eq(user.id)
    end

    it 'event is not valid ' do
      event = Event.create(user_id: user.id, name: 'event name', date: Date.today, location: 'some location', description: 'description of the event')

      expect(event).to_not be_valid
    end
  end

  it '2 events not valid without user:name & Eventdate|User_ID' do
    user = User.create
      event = Event.create(name: 'event name', date: Date.today, location: 'some location', description: 'description of the event', user_id: nil)
      event2 = Event.create(name: 'event name', date: nil, location: 'some location', description: 'description of the event', user_id: user.id)

    expect(event).to_not be_valid
    expect(event2).to_not be_valid
  end

  it ': An Event can have many attendees' do
    creator = User.create(name: 'creator')
    attendee1 = User.create(name: 'attendee1')
    attendee2 = User.create(name: 'attendee2')

    event = Event.create(user_id: creator.id, name: 'event name', date: Date.today, location: 'some location', description: 'description of the event')
    event.attendees = [attendee1, attendee2]
    event.save

    saved_event = Event.find(event.id)
    expect(event.attendees.size).to eq(2)
  end
end