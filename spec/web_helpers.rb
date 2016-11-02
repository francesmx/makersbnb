def create_spaces
  Space.create(name: 'Beautiful Relaxing Space',
               description: 'have fun at our BnB',
               price: "50",
               available_from: '2017/01/01',
               available_to: '2017/07/07')

  Space.create(name: 'New Space',
               description: 'have fun at our BnB',
               price: "50",
               available_from: '2017/01/01',
               available_to: '2017/07/07')

  Space.create(name: 'Old Space',
              description: 'have fun at our BnB',
              price: "60",
              available_from: '2015/01/01',
              available_to: '2015/07/07')
end

def request_booking
  visit '/spaces/1'
  fill_in('date_required_from', with: '2016/11/01')
  fill_in('date_required_to', with: '2016/11/08')
  click_link 'request_booking'
  expect(current_path).to eq '/requests'
  expect(page).to have_content("Bookings I've made")
end
