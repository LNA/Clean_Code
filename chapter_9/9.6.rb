def get_state
  state = ""
  state += heater ? "H" : "h"
  state += blower ? "B" : "b"
  state += cooler ? "C" : "c"
  state += hi_temp_alarm ? "H" : "h"; 
  state += lo_temp_alarm  ? "L" : "l"; 
  state
end