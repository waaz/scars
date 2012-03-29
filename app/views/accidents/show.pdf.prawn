
pdf.text " Car Accident Report", :size => 20, :style => :bold
pdf.move_down(30)
pdf.text "         First Name:#{@accident.first_name}"
pdf.move_down(5)
pdf.text "          Last Name: #{@accident.last_name}"
pdf.move_down(5)
pdf.text "     Address Line 1:" "#{@accident.address_line_1}"
pdf.move_down(5)
pdf.text "     Address Line 2: #{@accident.address_line_2}"
pdf.move_down(5)
pdf.text "           Postcode: #{@accident.postcode}"
pdf.move_down(5)
pdf.text "              Email: #{@accident.email}"
pdf.move_down(5)
pdf.text "              Phone: #{@accident.phone}"
pdf.move_down(5)
pdf.text "Registration Number: #{@car.reg}"
pdf.move_down(5)
pdf.text "      Damage Report: #{@accident.damage_report}"
pdf.move_down(5)
pdf.text "    Accident Report: #{@accident.accident_report}"
pdf.move_down(5)
pdf.text "          Last Name: #{@accident.last_name}"

