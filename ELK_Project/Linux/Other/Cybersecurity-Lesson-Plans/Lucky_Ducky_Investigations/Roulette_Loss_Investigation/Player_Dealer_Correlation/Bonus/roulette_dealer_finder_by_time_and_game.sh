grep -i "$1" Dealer_Schedules_0310/$2_Dealer_schedule | awk -F" " '{print $(1), " ", $(2), " ", $('$3'), $('$4')}'
